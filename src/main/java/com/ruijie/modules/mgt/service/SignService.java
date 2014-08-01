package com.ruijie.modules.mgt.service;



/**
 * sign service.
 */
import java.util.Date;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.ruijie.common.persistence.Page;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.Collections3;
import com.ruijie.common.utils.DateUtils;
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
		
//		Date endDate = DateUtils.parseDate(paramMap.get("endDate"));
//		if (endDate == null){
//			endDate = DateUtils.addDays(DateUtils.addMonths(beginDate, 1), -1);
//			paramMap.put("endDate", DateUtils.formatDate(endDate, "yyyy-MM-dd"));
//		}
//		dc.add(Restrictions.between("createDate", beginDate, endDate));
		if (sign.getCreateDate() != null){

			Date beginDate = sign.getCreateDate();
			Date endDate = DateUtils.parseDate(DateUtils.formatDate(beginDate, "yyyy-MM-dd")+" 23:59:59");
			logger.info(DateUtils.formatDate(beginDate, "yyyy-MM-dd HH:mm:ss")+","+DateUtils.formatDate(endDate, "yyyy-MM-dd HH:mm:ss"));
			dc.add(Restrictions.between("createDate", beginDate, endDate));
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