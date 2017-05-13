package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Administrator;
import com.persistence.AdministratorMapper;
import com.service.AdministratorService;
import com.util.Page;

@Service
public class AdministratorServiceImpl implements AdministratorService{
	
	@Autowired
	private AdministratorMapper adminMapper;

	@Override
	public Administrator getAdminByUserName(String name) {
		return adminMapper.getAdminByUserName(name);
	}

	@Override
	public Administrator getAdminByID(int adminID) {
		return adminMapper.getAdminByID(adminID);
	}

	@Override
	public Page<Administrator> getAdminsByPage(int pageNum, int pageSize) {
		pageNum = (pageNum>0)?pageNum:1;
		List<Administrator> list = adminMapper.getAdminsByPage((pageNum-1)*pageSize,pageSize);
		int count = adminMapper.getAdminsCount();
		Page<Administrator> result = new Page<Administrator>();
		result.setPageIndex(pageNum);
		result.setPageSize(pageSize);
		result.setTotalRecords(count);
		result.setPageDatas(list);
			
		return result;
	}

	@Override
	public boolean updateAdmin(Administrator admin) {
		if(adminMapper.updateAdmin(admin)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean addAdmin(Administrator admin) {
		Administrator admin1 = adminMapper.getAdminByUserName(admin.getUserName());
		if(admin1==null){
			if(adminMapper.addAdmin(admin)>0){
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean login(Administrator admin) {
		if(adminMapper.login(admin)>0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteAdmin(String userName) {
		Administrator admin = adminMapper.getAdminByUserName(userName);
		if(admin.getAdminID()>2){
			if(adminMapper.deleteAdmin(userName)>0){
				return true;
			}
		}
		return false;
	}

}
