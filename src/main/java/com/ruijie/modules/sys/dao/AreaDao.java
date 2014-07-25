package com.ruijie.modules.sys.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ruijie.modules.sys.entity.Area;
import com.ruijie.common.persistence.BaseDao;
import com.ruijie.common.persistence.Parameter;

/**
 * 区域DAO接口
 * @author xxxx
 * @version 2014-8-23
 */
@Repository
public class AreaDao extends BaseDao<Area> {
	
	public List<Area> findByParentIdsLike(String parentIds){
		return find("from Area where parentIds like :p1", new Parameter(parentIds));
	}

	public List<Area> findAllList(){
		return find("from Area where delFlag=:p1 order by code", new Parameter(Area.DEL_FLAG_NORMAL));
	}
	
	public List<Area> findAllChild(Long parentId, String likeParentIds){
		return find("from Area where delFlag=:p1 and (id=:p2 or parent.id=:p2 or parentIds like :p3) order by code", 
				new Parameter(Area.DEL_FLAG_NORMAL, parentId, likeParentIds));
	}
}
