package com.service;

import com.bean.Administrator;
import com.util.Page;

public interface AdministratorService {
	
	Administrator getAdminByUserName(String name);

	Administrator getAdminByID(int adminID);
	
	Page<Administrator> getAdminsByPage(int pageNum, int pageSize);
	
	boolean updateAdmin(Administrator admin);
	
	boolean addAdmin(Administrator admin);
	
	boolean login(Administrator admin);
	
	boolean deleteAdmin(String userName);
}
