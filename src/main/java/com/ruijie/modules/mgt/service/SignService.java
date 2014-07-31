package com.ruijie.modules.mgt.service;



/**
 * sign service.
 */
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ruijie.common.persistence.Page;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.Collections3;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.modules.mgt.entity.Sign;
import com.ruijie.modules.mgt.dao.SignDao;

/**
 * 业务操作类
 * @author yuzhongyuan
 * @version 2014-07-31
 */

@Component
@Transactional(readOnly = true)
public class SignService extends BaseService {

	@Autowired
	private SignDao signDao;
	
	public Sign get(String id) {
		return signDao.get(id);
	}
	
	public Page<Sign> find(Page<Sign> page, Sign sign) {
		DetachedCriteria dc = signDao.createDetachedCriteria();
		if(sign.getParents()!=null&&!Collections3.isEmpty(sign.getParents().getBanjiList())){
			dc.createAlias("parents", "p");
			dc.createAlias("p.banjiList", "b");
			dc.add(Restrictions.in("b.id", Collections3.extractToList(sign.getParents().getBanjiList(), "id")));
		}
		dc.add(Restrictions.eq(Sign.FIELD_DEL_FLAG, Sign.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return signDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(Sign sign) {
		signDao.save(sign);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id) {
		signDao.deleteById(id);
	}
	
}