package com.service;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	
	 boolean adminLogin(String userName, String password, HttpServletRequest request);
	
	 boolean readerLogin(String userName, String password, HttpServletRequest request);

}
