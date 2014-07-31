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

import com.ruijie.common.persistence.IdEntity;
import com.ruijie.common.utils.excel.annotation.ExcelField;
import com.ruijie.modules.sys.entity.User;

/**
 * 数据库实体类
 * @author yuzhongyuan
 * @version 2014-07-31
 */

@Entity
@Table(name = "mgt_sign")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Sign extends IdEntity<Sign>{
	
	private static final long serialVersionUID = 1L;

	//columns START
    /**
     * 被通知家长       db_column: user_id 
     */ 	
	private User parents;
    /**
     * 记录类型       db_column: type 
     */ 	
	private java.lang.String type;
    /**
     * 记录状态       db_column: value 
     */ 	
	private java.lang.String value;
	//columns END

	public java.lang.String getType() {
		return this.type;
	}
	
	public void setType(java.lang.String value) {
		this.type = value;
	}
	public java.lang.String getValue() {
		return this.value;
	}
	
	public void setValue(java.lang.String value) {
		this.value = value;
	}

	
	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull(message="学生家长不能为空")
	public User getParents() {
		return parents;
	}

	public void setParents(User parents) {
		this.parents = parents;
	}

	public Sign(){
	}
	public Sign(String id){
		this();
		this.id = id;
	}



	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("UserId",getParents().getId())
			.append("Type",getType())
			.append("Value",getValue())
			.append("Remarks",getRemarks())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Sign == false) return false;
		if(this == obj) return true;
		Sign other = (Sign)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
	


}