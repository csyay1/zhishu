/**
 * Copyright &copy; 2012-2013 
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.ruijie.modules.sys.utils;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;

import com.google.common.collect.Maps;
import com.ruijie.modules.sys.dao.AreaDao;
import com.ruijie.modules.sys.dao.MenuDao;
import com.ruijie.modules.sys.dao.RoleDao;
import com.ruijie.modules.sys.dao.UserDao;
import com.ruijie.modules.sys.entity.Area;
import com.ruijie.modules.sys.entity.Menu;
import com.ruijie.modules.sys.entity.Role;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.CacheUtils;
import com.ruijie.common.utils.SpringContextHolder;

/**
 * 用户工具类
 * @author xxxx
 * @version 2013-5-29
 */
public class UserUtils extends BaseService {

	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
	private static RoleDao roleDao = SpringContextHolder.getBean(RoleDao.class);
	private static MenuDao menuDao = SpringContextHolder.getBean(MenuDao.class);
	private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);

	public static final String LOGIN_USER = "loginUser";
	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	
	public static User getUser(){
		return (User) getCache(LOGIN_USER);
		 
	}
	
	public static List<Role> getRoleList(){
		@SuppressWarnings("unchecked")
		List<Role> list = (List<Role>)getCache(CACHE_ROLE_LIST);
		if (list == null){
			//User user = getUser();
			DetachedCriteria dc = roleDao.createDetachedCriteria();
			dc.createAlias("userList", "userList", JoinType.LEFT_OUTER_JOIN);
			dc.add(Restrictions.eq(Role.FIELD_DEL_FLAG, Role.DEL_FLAG_NORMAL));
			dc.addOrder(Order.asc("id"));
			list = roleDao.find(dc);
			putCache(CACHE_ROLE_LIST, list);
		}
		return list;
	}
	
	public static List<Menu> getMenuList(){
		@SuppressWarnings("unchecked")
		List<Menu> menuList = (List<Menu>)getCache(CACHE_MENU_LIST);
		if (menuList == null){
			User user = getUser();
			if (user.isAdmin()){
				menuList = menuDao.findAllList();
			}else{
				menuList = menuDao.findByUserId(user.getId());
			}
			putCache(CACHE_MENU_LIST, menuList);
		}
		return menuList;
	}
	
	public static List<Area> getAreaList(){
		@SuppressWarnings("unchecked")
		List<Area> areaList = (List<Area>)CacheUtils.get(CACHE_AREA_LIST);
		if (areaList == null){
//			User user = getUser();
//			if (user.isAdmin()){
				areaList = areaDao.findAllList();
//			}else{
//				areaList = areaDao.findAllChild(user.getArea().getId(), "%,"+user.getArea().getId()+",%");
//			}
				CacheUtils.put(CACHE_AREA_LIST, areaList);
		}
		return areaList;
	}
	
	

	public static User getUserById(String id){
		if(StringUtils.isNotBlank(id)) {
			return userDao.get(id);
		} else {
			return null;
		}
	}
	
	// ============== User Cache ==============
	
	public static Object getCache(String key) {
		return SecurityUtils.getSubject().getSession().getAttribute(key);
	}
	
	

	public static void putCache(String key, Object value) {
		SecurityUtils.getSubject().getSession().setAttribute(key, value);
	}

	public static void removeCache(String key) {
		SecurityUtils.getSubject().getSession().removeAttribute(key);
	}
	
	
	
}
