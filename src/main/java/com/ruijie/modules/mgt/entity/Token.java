package com.ruijie.modules.mgt.entity;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruijie.common.config.Global;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.utils.UserUtils;

@Entity
@Table(name = "mgt_token")
public class Token {
	
	private String token;
	private String userId;
	private String scope;
	private Date expireDate;
	private Date createDate;
	private Date updateDate;
	
	public Token(String token, String userId, String scope, Date expireDate,
			Date createDate, Date updateDate) {
		super();
		this.token = token;
		this.userId = userId;
		this.scope = scope;
		this.expireDate = expireDate;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}

	public Token() {

	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getScope() {
		return scope;
	}

	public void setScope(String scope) {
		this.scope = scope;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
	@PrePersist
	public void prePersist(){
		this.updateDate = new Date();
		this.createDate = this.updateDate;
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_YEAR, Integer.parseInt(Global.getTokenTime()));  
		
	}
	
	@PreUpdate
	public void preUpdate(){
		this.updateDate = new Date();
	}
	
	
	
	
	

}
