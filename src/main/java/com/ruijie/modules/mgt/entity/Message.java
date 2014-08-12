package com.ruijie.modules.mgt.entity;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ruijie.common.persistence.IdEntity;
import com.ruijie.modules.sys.entity.User;

/**
 * 数据库实体类
 * @author yuzhongyuan
 * @version 2014-08-08
 */

@Entity
@Table(name = "mgt_message")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Message extends IdEntity<Message>{
	
	private static final long serialVersionUID = 1L;

	//columns START
    /**
     * 消息内容       db_column: content 
     */ 	
	private java.lang.String content;
    /**
     * 消息接收者       db_column: send_to 
     */ 	
	private User sendTo;
    /**
     * 消息状态       db_column: status 
     */ 	
	private java.lang.String status;
	//columns END
	public java.lang.String getContent() {
		return this.content;
	}
	
	public void setContent(java.lang.String value) {
		this.content = value;
	}

	@ManyToOne
	@JoinColumn(name="send_to")
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull(message="接受人不能为空")
	@JsonIgnore
	public User getSendTo() {
		return sendTo;
	}

	public void setSendTo(User sendTo) {
		this.sendTo = sendTo;
	}
	
	public User getSendBy() {
		return createBy;
	}

	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String value) {
		this.status = value;
	}

	
	

	public Message(){
	}
	public Message(String id){
		this();
		this.id = id;
	}



	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Content",getContent())
			.append("SendTo",getSendTo())
			.append("Status",getStatus())
			.append("Remarks",getRemarks())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Message == false) return false;
		if(this == obj) return true;
		Message other = (Message)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
	


}