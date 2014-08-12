package com.ruijie.modules.mgt.service;



/**
 * message service.
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
import com.ruijie.modules.mgt.entity.Message;
import com.ruijie.modules.mgt.dao.MessageDao;
import com.ruijie.modules.sys.entity.User;

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
		if(message.getSendTo()!=null&&!Collections3.isEmpty(message.getSendTo().getBanjiList())){
			dc.createAlias("sendTo", "p");
			dc.createAlias("p.banjiList", "b");
			dc.add(Restrictions.in("b.id", Collections3.extractToList(message.getSendTo().getBanjiList(), "id")));
		}
		if (message.getCreateDate() != null){
			Date beginDate = message.getCreateDate();
			Date endDate = DateUtils.parseDate(DateUtils.formatDate(beginDate, "yyyy-MM-dd")+" 23:59:59");
			logger.info(DateUtils.formatDate(beginDate, "yyyy-MM-dd HH:mm:ss")+","+DateUtils.formatDate(endDate, "yyyy-MM-dd HH:mm:ss"));
			dc.add(Restrictions.between("createDate", beginDate, endDate));
		}
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
	
	@Transactional(readOnly = false)
	public void save(String content,String sendToId,String sendById,String status,String remarks) {
		Message message=new Message();
		message.setContent(content);
		message.setCreateBy(new User(sendById));
		message.setSendTo(new User(sendToId));
		message.setStatus(status);
		message.setRemarks(remarks);
		messageDao.save(message);
	}
	
}