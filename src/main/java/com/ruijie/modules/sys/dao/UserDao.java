/**
 * Copyright &copy; 2012-2013 
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.ruijie.modules.sys.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ruijie.modules.sys.entity.User;
import com.ruijie.common.persistence.BaseDao;
import com.ruijie.common.persistence.Parameter;

/**
 * 用户DAO接口
 * @author xxxx
 * @version 2013-8-23
 */
@Repository
public class UserDao extends BaseDao<User> {
	
	public List<User> findAllList() {
		return find("from User where delFlag=:p1 order by id", new Parameter(User.DEL_FLAG_NORMAL));
	}
	
	public User findByLoginName(String loginName){
		return getByHql("from User where loginName = :p1 and delFlag = :p2", new Parameter(loginName, User.DEL_FLAG_NORMAL));
	}

	public int updatePasswordById(String newPassword, String id){
		return update("update User set password=:p1 where id = :p2", new Parameter(newPassword, id));
	}
	
	public int updateOpenLevel(String userId,String level){
		return update("update User set openLevel=:p1 where id = :p2", new Parameter(level, userId));
	}
	
	public int updateLoginInfo(String loginIp, Date loginDate, String id){
		return update("update User set loginIp=:p1, loginDate=:p2 where id = :p3", new Parameter(loginIp, loginDate, id));
	}
	
	public Date getUserUpdateDate(String userId){
		String qlString = "select updateDate from User where id = :p1";  

        Query query = createQuery(qlString, new Parameter(userId));
        List<Object> list = query.list();
        if (list.size() > 0){
        	return (Date) list.get(0);
        }else{
        	return null;
        }
	}
	
}
