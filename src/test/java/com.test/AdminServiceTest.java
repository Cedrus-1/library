package com.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bean.Administrator;
import com.service.AdministratorService;
import com.util.Page;

public class AdminServiceTest extends BaseTest{
	@Autowired
	private AdministratorService administratorService;
	
	@Test
	public void AdminTest(){
		Administrator admin = new Administrator();
		admin.setPassword("admin");
		admin.setUserName("admin");
		admin.setAdminID(1);
		Page<Administrator> admins = administratorService.getAdminsByPage(1, 20);
		for(Administrator ad:admins.getPageDatas()){
			System.out.println("admin:"+ad.getAdminID() + " ,"+ad.getUserName());
		}
	}

}
