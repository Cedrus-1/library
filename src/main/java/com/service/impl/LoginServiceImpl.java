package com.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Administrator;
import com.bean.Reader;
import com.persistence.AdministratorMapper;
import com.persistence.ReaderMapper;
import com.service.LoginService;
import com.util.RoleUtil;

@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	private AdministratorMapper adminMapper;
	@Autowired
	private ReaderMapper readerMapper;

	@Override
	public boolean adminLogin(String userName, String password, HttpServletRequest request) {
		Administrator admin = new Administrator();
		admin.setUserName(userName);
		admin.setPassword(password);
		if(adminMapper.login(admin)>0){
			admin=adminMapper.getAdminByUserName(userName);
			RoleUtil.addAdminRole(request.getSession(), admin);
			return true;
		}
		return false;
	}

	@Override
	public boolean readerLogin(String userName, String password, HttpServletRequest request) {
		if(readerMapper.login(userName, password)>0){
			Reader reader = readerMapper.getReaderByName(userName);
			RoleUtil.addReaderRole(request.getSession(), reader);
			return true;
		}
		return false;
	}

}
