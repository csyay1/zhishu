package com.ruijie.modules.factory.service;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ruijie.modules.factory.dao.ProductDao;
import com.ruijie.modules.factory.entity.Product;
import com.ruijie.common.persistence.Page;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.StringUtils;

@Component
@Transactional(readOnly = true)
public class ProductService extends BaseService {

	@Autowired
	private ProductDao productDao;
	protected final Log log = LogFactory.getLog(getClass());
	
	public Product get(String id) {
		return productDao.get(id);
	}
	
	public Page<Product> find(Page<Product> page, Product product) {
		DetachedCriteria dc = productDao.createDetachedCriteria();
		if (StringUtils.isNotEmpty(product.getName())){
			dc.add(Restrictions.like("name", "%"+product.getName()+"%"));
		}
		dc.add(Restrictions.eq(Product.FIELD_DEL_FLAG, Product.DEL_FLAG_NORMAL));
		dc.addOrder(Order.desc("id"));
		return productDao.find(page, dc);
	}
	
	@Transactional(readOnly = false)
	public void save(Product product) {
		productDao.save(product);
	}
	
	@Transactional(readOnly = false)
	public void delete(String id) {
		productDao.deleteById(id);
	}
	
}
