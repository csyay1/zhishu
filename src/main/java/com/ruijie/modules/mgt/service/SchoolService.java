package com.ruijie.modules.mgt.service;



/**
 * school service.
 */
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ruijie.common.persistence.Page;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.CacheUtils;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.modules.mgt.entity.Banji;
import com.ruijie.modules.mgt.entity.School;
import com.ruijie.modules.mgt.dao.SchoolDao;

/**
 * 业务操作类
 * @author yuzhongyuan
 * @version 2014-07-25
 */

@Component
@Transactional(readOnly = true)
public class SchoolService extends BaseService {

	@Autowired
	private SchoolDao schoolDao;
	
	public static String ALL_SCHOOL_CACHE="allSchoolCache";
	
	public School get(String id) {
		return schoolDao.get(id);
	}
	
	public Page<School> find(Page<School> page, School school) {
		DetachedCriteria dc = schoolDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(school.getName())){
			dc.add(Restrictions.like("name", "%"+school.getName()+"%"));
		}
		dc.add(Restrictions.eq(School.FIELD_DEL_FLAG, School.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return schoolDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(School school) {
		schoolDao.save(school);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id) {
		schoolDao.deleteById(id);
	}
	
	public List<School> findAllWithCache() {
		if(CacheUtils.get(ALL_SCHOOL_CACHE)!=null){
			return (List<School>) CacheUtils.get(ALL_SCHOOL_CACHE);
		}
		List<School> schoolList=schoolDao.findAll();
		CacheUtils.put(ALL_SCHOOL_CACHE, schoolList);
		return schoolList;

	}
	
	
	
	
}