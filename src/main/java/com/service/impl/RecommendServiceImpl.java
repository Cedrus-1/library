package com.service.impl;

import com.bean.Book;
import com.bean.Reader;
import com.bean.Record;
import com.persistence.BookMapper;
import com.persistence.ReaderMapper;
import com.persistence.RecordMapper;
import com.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by Cedrus on 2017/5/8.
 */
@Service
public class RecommendServiceImpl implements RecommendService{
    @Autowired
    private RecordMapper recordMapper;
    @Autowired
    private ReaderMapper readerMapper;
    @Autowired
    private BookMapper bookMapper;

    @Override
    public List<Book> getRecommendBookByID(int id) {
        List<Record> userRecords = recordMapper.getRecordsByUserID(id);//当前读者借阅信息
        //判断是否有借阅记录，如果没有，则推荐借阅次数较多的图书，和评分高的图书
        Set<Book> bookSet = new HashSet<>();//结果数据集
        List<Book> bookResult = new ArrayList<>();

        if(userRecords==null || userRecords.size()==0){
            if(Math.random()>0.5){
                return bookMapper.getHotBooksByBorrowTimes(10);
            }else {
                return bookMapper.getHotBooksByRating(10);
            }
        }

        List<Reader> readers = readerMapper.getAllReaders();//所有读者信息
        int readerNum = readers.size();

        List<Record> tempRecord = null;
        User[] users= new User[readerNum];
        double userAvg = 0;
        for(Record r : userRecords){
            userAvg += r.getRating();
        }
        userAvg /= userRecords.size();
        for (int i=0; i<readerNum; i++){
            User user = new User();
            user.id = readers.get(i).getReaderID();
            tempRecord = recordMapper.getRecordsByUserID(user.id);
            List<Rating> temp = new ArrayList<>();
            for(Record r1 : tempRecord){
                for(Record r2 : userRecords){
                    if(r1.getBookID() == r2.getBookID()){
                        Rating rating = new Rating();
                        rating.id = r1.getReaderID();
                        rating.userRating = r2.getRating();
                        rating.anotherRating = r1.getRating();
                        temp.add(rating);
                    }
                }
            }

            if(temp!=null && temp.size()>0){
                for( Rating r: temp){
                    user.avg +=r.anotherRating;
                }
                user.avg /= tempRecord.size();
                double fenzi = 0,fenmu =0;
                for( Rating r: temp){
                    fenzi +=  (r.userRating - userAvg) * (r.anotherRating - user.avg);
                    fenmu += Math.pow(r.userRating - userAvg,2) * Math.pow(r.anotherRating - user.avg,2);
                }
                if(fenmu == 0){
                    user.sim = 0;
                }else {
                    user.sim = fenzi/Math.sqrt(fenmu);
                }
            }
            users[i] = user;
        }
        //上面计算出了所以用户的sim
        //下面根据sim得到前10名用户，根据他们的借阅信息得到推荐图书信息
        Arrays.sort(users);


        //获得sim最大的5位用户的所有借阅记录
        List<Record> recommendRecords = new ArrayList<>();
        if(users!=null && users.length>6){
            for(int i=users.length-1; i>users.length-7; i--){
                //去掉自己
                if(users[i].id == id){
                    continue;
                }else {
                    List<Record> records = recordMapper.getRecordsByUserID( users[i].id);//取其中一位的借阅记录
                    recommendRecords.addAll(records);
                }
            }
        }else {
            for(int i=0; i<users.length; i++){
                if(users[i].id == id){
                    continue;
                }
                List<Record> records = recordMapper.getRecordsByUserID( users[i].id);//取其中一位的借阅记录
                recommendRecords.addAll(records);
            }
        }


        List<BookTemp> recommendBooks = new ArrayList<>();


        for(Record r:recommendRecords){
            BookTemp bookTemp = new BookTemp();
            bookTemp.bookID = r.getBookID();
            if(!recommendBooks.contains(bookTemp)){
                bookTemp.allRating.add((double)r.getRating());
                recommendBooks.add(bookTemp);
            }else {
                bookTemp = recommendBooks.get(recommendBooks.indexOf(bookTemp));
                bookTemp.allRating.add((double)r.getRating());
            }
        }


        for(BookTemp bookTemp:recommendBooks){
            for(double d : bookTemp.allRating){
                bookTemp.pingfen += d;
            }
            bookTemp.pingfen /= bookTemp.allRating.size();
        }

        Collections.sort(recommendBooks);

        //取后10条数据
        if(recommendBooks!=null && recommendBooks.size()>10){
            List<BookTemp> bookTemps = recommendBooks.subList(recommendBooks.size()-11,recommendBooks.size()-1);
            for(BookTemp bookTemp: bookTemps){
                Book book = bookMapper.getBookByID(bookTemp.bookID);
                bookSet.add(book);
            }
        }else {
            for(BookTemp bookTemp: recommendBooks){
                Book book = bookMapper.getBookByID(bookTemp.bookID);
                bookSet.add(book);
            }
        }
        if(bookSet.size()<10){
            if(Math.random()>0.5){
                List<Book> bookList = bookMapper.getHotBooksByBorrowTimes(10);
                bookSet.addAll(bookList);
            }else {
                List<Book> bookList = bookMapper.getHotBooksByRating(10);
                bookSet.addAll(bookList);
            }
        }
        bookResult.addAll(bookSet);
        Collections.shuffle(bookResult);
        return bookResult;
    }
}



class User implements Comparable{
    int id=0;
    double avg=0;
    double sim=0;

    @Override
    public int compareTo(Object o) {
        if(this.sim>((User) o).sim){
            return 1;
        }else if (this.sim == ((User) o).sim){
            return 0;
        }else {
            return -1;
        }
    }
}

class Rating{
    int id;
    double userRating;
    double anotherRating;
}

class BookTemp implements Comparable{
    int bookID;
    List<Double> allRating = new ArrayList<>();
    double pingfen;

    BookTemp(){

    }

    BookTemp(int bookID){
        this.bookID = bookID;
    }

    @Override
    public int compareTo(Object o) {
        if(this.pingfen>((BookTemp) o).pingfen){
            return 1;
        }else if (this.pingfen == ((BookTemp) o).pingfen){
            return 0;
        }else {
            return -1;
        }
    }

    @Override
    public boolean equals(Object obj) {
        return this.bookID==((BookTemp)obj).bookID;
    }
}
