/**
 * Copyright &copy; 2012-2013 
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.ruijie.modules.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ruijie.common.persistence.BaseDao;
import com.ruijie.common.persistence.Parameter;
import com.ruijie.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author xxxx
 * @version 2013-8-23
 */
@Repository
public class DictDao extends BaseDao<Dict> {

	public List<Dict> findAllList(){
		return find("from Dict where delFlag=:p1 order by sort", new Parameter(Dict.DEL_FLAG_NORMAL));
	}

	public List<String> findTypeList(){
		return find("select type from Dict where delFlag=:p1 group by type", new Parameter(Dict.DEL_FLAG_NORMAL));
	}
}
