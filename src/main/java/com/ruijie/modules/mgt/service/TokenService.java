package com.ruijie.modules.mgt.service;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ruijie.common.config.Global;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.Identities;
import com.ruijie.common.utils.MyException;
import com.ruijie.modules.mgt.dao.TokenDao;
import com.ruijie.modules.mgt.entity.Token;
import com.ruijie.modules.sys.dao.UserDao;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.service.SystemService;

/**
 * @author yuzhongyuan
 *
 */
@Component
@Transactional(readOnly = true)
public class TokenService extends BaseService{

	
	@Autowired
	private TokenDao tokenDao;
	@Autowired
	private UserDao userDao;
	
	
	public Token get(String id) {
		return tokenDao.get(id);
	}
	public User phoneLogin(String username,String password){
		User user=userDao.findByLoginName(username);
		if(user==null)return null;
		if(SystemService.validatePassword(password, user.getPassword())){
			return user;
		}else{
			return null;
		}
	}
    /*
     * if user token exsists in database,refresh a new token and expireDate
     * if user token is null,create a new token 
     */
	@Transactional(readOnly = false)
	public Token accessToken(String userId){
		Token token=tokenDao.getByUserId(userId);
		Calendar cal = Calendar.getInstance();
		Date date=cal.getTime();
		if(token==null){
			token=new Token();
			token.setUserId(userId);
			token.setToken(Identities.uuid2());
			token.setCreateDate(date);
		}else{
			token.setToken(Identities.uuid2());
		}
		token.setUpdateDate(date);
		cal.add(Calendar.DAY_OF_YEAR, Integer.parseInt(Global.getTokenTime()));  
		token.setExpireDate(cal.getTime());
		
		tokenDao.save(token);
		return token;
	}
	
	public Token authorizeToken(String token) throws MyException{
		Token t=tokenDao.getByToken(token);
		if(t==null){
			throw new MyException("tokenException","1002","no token record,please login and access token");
		}else{
			Date date=new Date();
			if(date.after(t.getExpireDate())){
				throw new MyException("tokenException","1003","token expired,please login and access a new token");
			}else{
				Date updateDate=userDao.getUserUpdateDate(t.getUserId());
				if(updateDate==null){
					throw new MyException("tokenException","1005","system error,query user info updateDate error ");
				}else{
					if(updateDate.after(t.getUpdateDate())){
						throw new MyException("tokenException","1004","user info changed,please login and access a new token");
					}
				}
			}
		}
		return t;
		
	}
	

}
