package com.ruijie.modules.mgt.dao;

import java.util.Calendar;

import org.springframework.stereotype.Repository;

import com.ruijie.common.persistence.BaseDao;
import com.ruijie.common.persistence.Parameter;
import com.ruijie.modules.mgt.entity.Token;



@Repository
public class TokenDao extends BaseDao<Token>{
	
	
	public Token getByToken(String token){
		return getByHql("from Token where token = :p1", new Parameter(token));
	}
	
	public Token getByUserId(String userId){
		return getByHql("from Token where userId = :p1", new Parameter(userId));
	}
	
	
	
	

}
