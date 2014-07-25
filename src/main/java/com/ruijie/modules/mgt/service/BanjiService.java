package com.ruijie.modules.mgt.service;



/**
 * banji service.
 */
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ruijie.common.persistence.Page;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.modules.mgt.entity.Banji;
import com.ruijie.modules.mgt.dao.BanjiDao;

/**
 * 业务操作类
 * @author yuzhongyuan
 * @version 2014-07-25
 */

@Component
@Transactional(readOnly = true)
public class BanjiService extends BaseService {

	@Autowired
	private BanjiDao banjiDao;
	
	public Banji get(String id) {
		return banjiDao.get(id);
	}
	
	public Page<Banji> find(Page<Banji> page, Banji banji) {
		DetachedCriteria dc = banjiDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(banji.getName())){
			dc.add(Restrictions.like("name", "%"+banji.getName()+"%"));
		}
		dc.add(Restrictions.eq(Banji.FIELD_DEL_FLAG, Banji.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return banjiDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(Banji banji) {
		banjiDao.save(banji);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id) {
		banjiDao.deleteById(id);
	}
	
}