package com.ruijie.modules.mgt.service;



/**
 * message service.
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
import com.ruijie.modules.mgt.entity.Message;
import com.ruijie.modules.mgt.dao.MessageDao;

/**
 * 业务操作类
 * @author yuzhongyuan
 * @version 2014-08-08
 */

@Component
@Transactional(readOnly = true)
public class MessageService extends BaseService {

	@Autowired
	private MessageDao messageDao;
	
	public Message get(String id) {
		return messageDao.get(id);
	}
	
	public Page<Message> find(Page<Message> page, Message message) {
		DetachedCriteria dc = messageDao.createDetachedCriteria();
		
		dc.add(Restrictions.eq(Message.FIELD_DEL_FLAG, Message.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return messageDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(Message message) {
		messageDao.save(message);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id) {
		messageDao.deleteById(id);
	}
	
}