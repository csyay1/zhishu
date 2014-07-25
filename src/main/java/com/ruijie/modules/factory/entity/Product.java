package com.ruijie.modules.factory.entity;

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

import com.ruijie.modules.sys.entity.User;
import com.ruijie.common.persistence.DataEntity;
import com.ruijie.common.persistence.IdEntity;


@Entity
@Table(name = "factory_product")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Product extends IdEntity<Product>{
	
	private static final long serialVersionUID = 1L;

	//columns START
    /**
     * 名称       db_column: name 
     */ 	
	private java.lang.String name;
    /**
     * 测试名字       db_column: other_test 
     */ 	
	private java.lang.String otherTest;
	//columns END
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	public java.lang.String getOtherTest() {
		return this.otherTest;
	}
	
	public void setOtherTest(java.lang.String value) {
		this.otherTest = value;
	}

	
	

	public Product(){
	}
	public Product(String id){
		this();
		this.id = id;
	}



	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("CreateBy",getCreateBy())
			.append("CreateDate",getCreateDate())
			.append("UpdateBy",getUpdateBy())
			.append("UpdateDate",getUpdateDate())
			.append("Remarks",getRemarks())
			.append("DelFlag",getDelFlag())
			.append("OtherTest",getOtherTest())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Product == false) return false;
		if(this == obj) return true;
		Product other = (Product)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
	


}