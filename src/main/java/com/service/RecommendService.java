package com.service;

import com.bean.Book;

import java.util.List;
import java.util.Set;

/**
 * Created by Cedrus on 2017/5/8.
 */
public interface RecommendService {
    List<Book> getRecommendBookByID(int id);
}
