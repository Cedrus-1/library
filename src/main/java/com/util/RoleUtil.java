package com.util;

import javax.servlet.http.HttpSession;

import org.springframework.util.Assert;


public class RoleUtil {
	
	public static final String ADMIN_ROLE_NAME = "admin";
	
	public static final String READER_ROLE_NAME = "reader";

	public static final String ROLE_NAME_KEY = "role";
	
	public static boolean isAdmin(HttpSession session){
		Object admin = session.getAttribute(ADMIN_ROLE_NAME);
		if(admin == null)
			return false;
		else
			return true;
	}
	
	public static boolean isReader(HttpSession session){
		Object reader = session.getAttribute(READER_ROLE_NAME);
		if(reader == null)
			return false;
		else
			return true;
	}

	public static void addAdminRole(HttpSession session, Object admin){
		Assert.notNull(admin, "the teacher must not be null");
		
		addRole(session, admin, ADMIN_ROLE_NAME);
	}
	
	public static void addReaderRole(HttpSession session, Object reader){
		Assert.notNull(reader, "the student must not be null");
		
		addRole(session, reader, READER_ROLE_NAME);
	}
	
	private static void addRole(HttpSession session, Object obj, String roleName){
		session.setAttribute(roleName, obj);
		session.setAttribute(ROLE_NAME_KEY, roleName);
	}
	
	
}
