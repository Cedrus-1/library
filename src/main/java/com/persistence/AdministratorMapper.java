package com.persistence;

import java.util.List;

import com.bean.Administrator;

public interface AdministratorMapper {
	
	Administrator getAdminByUserName(String userName);

	Administrator getAdminByID(int adminID);

	List<Administrator> getAdminsByPage(int start, int num);
	
	int getAdminsCount();

	int updateAdmin(Administrator admin);

	int addAdmin(Administrator admin);

	int login(Administrator admin);

	int deleteAdmin(String userName);

}
