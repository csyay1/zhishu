package com.ruijie.modules.mgt.entity;



import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.hibernate.annotations.Where;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.collect.Lists;
import com.ruijie.common.persistence.IdEntity;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.common.utils.excel.annotation.ExcelField;

/**
 * 数据库实体类
 * @author yuzhongyuan
 * @version 2014-07-25
 */

@Entity
@Table(name = "mgt_banji")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Banji extends IdEntity<Banji>{
	
	private static final long serialVersionUID = 1L;

	//columns START
    /**
     * 班级编号       db_column: no 
     */ 	
	private java.lang.String no;
    /**
     * 名称       db_column: name 
     */ 	
	private java.lang.String name;
    /**
     * 年级       db_column: grade 
     */ 	
	private java.lang.String grade;
    /**
     * 年份       db_column: year 
     */ 	
	private java.lang.String year;
    /**
     * 类型       db_column: type 
     */ 	
	private java.lang.String type;
    /**
     * 所在学校       db_column: school_id 
     */ 	
	
	
	private School school;
	
	private List<User> userList = Lists.newArrayList(); // 拥有用户列表
	
	public Banji(){
	}
	public Banji(String id){
		this();
		this.id = id;
	}

	public java.lang.String getNo() {
		return this.no;
	}
	
	public void setNo(java.lang.String value) {
		this.no = value;
	}
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String value) {
		this.name = value;
	}
	public java.lang.String getGrade() {
		return this.grade;
	}
	
	public void setGrade(java.lang.String value) {
		this.grade = value;
	}
	public String getYear() {
		return this.year;
	}
	
	public void setYear(String value) {
		this.year = value;
	}
	public java.lang.String getType() {
		return this.type;
	}
	
	public void setType(java.lang.String value) {
		this.type = value;
	}
	
	@ManyToOne
	@JoinColumn(name="school_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@NotNull(message="所属班级不能为空")
	@ExcelField(title="归属部门", align=2, sort=25)
	public School getSchool() {
		return this.school;
	}
	
	public void setSchool(School value) {
		this.school = value;
	}
	
	@Transient
	@JsonIgnore
	public String getSchoolName() {
		return this.school.getName();
	}
	
	@Transient
	@JsonIgnore
	public String getSchoolNo() {
		return this.school.getNo();
	}
	
	@Transient
	@JsonIgnore
	public String getFullName() {
		return this.getName()+"/"+this.school.getName();
	}
	
	@ManyToMany(mappedBy = "banjiList", fetch=FetchType.LAZY)
	@Where(clause="del_flag='"+DEL_FLAG_NORMAL+"'")
	@OrderBy("id") @Fetch(FetchMode.SUBSELECT)
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	@JsonIgnore
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("No",getNo())
			.append("Name",getName())
			.append("Grade",getGrade())
			.append("Year",getYear())
			.append("Type",getType())
			.append("School",getSchool())
			.append("Remarks",getRemarks())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof Banji == false) return false;
		if(this == obj) return true;
		Banji other = (Banji)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}
	


}