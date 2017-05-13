package com.test;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.bean.Administrator;
import com.persistence.AdministratorMapper;
import com.service.AdministratorService;
import com.service.LoginService;
import com.util.Page;
import com.util.Utils;

public class AdminTest extends BaseTest{
	@Autowired
	private AdministratorMapper adminMapper;
	
	@Test
	public void TestLogin(){
		Administrator admin = new Administrator();
		admin.setPassword("admin");
		admin.setUserName("admin");
		admin.setAdminID(1);
		List<Administrator> admins = adminMapper.getAdminsByPage(1,6);
		for(Administrator ad:admins){
			System.out.println("admin:"+ad.getAdminID() + " ,"+ad.getUserName());
		}
		//System.out.println(admins.getTotalRecords());
		//adminService.updateAdmin(admin);
//		System.out.println(adminService.addAdmin(admin));
//		System.out.println(adminService.login(admin));
		
	}

}
