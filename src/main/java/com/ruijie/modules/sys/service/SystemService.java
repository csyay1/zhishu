/**
 * Copyright &copy; 2012-2013 
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package com.ruijie.modules.sys.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.shiro.SecurityUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ruijie.modules.sys.dao.MenuDao;
import com.ruijie.modules.sys.dao.RoleDao;
import com.ruijie.modules.sys.dao.UserDao;
import com.ruijie.modules.sys.entity.Menu;
import com.ruijie.modules.sys.entity.Role;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.security.SystemAuthorizingRealm;
import com.ruijie.modules.sys.utils.UserUtils;
import com.ruijie.common.persistence.Page;
import com.ruijie.common.security.Digests;
import com.ruijie.common.service.BaseService;
import com.ruijie.common.utils.Collections3;
import com.ruijie.common.utils.Encodes;
import com.ruijie.common.utils.StringUtils;

/**
 * 系统管理，安全相关实体的管理类,包括用户、角色、菜单.
 * @author xxxx
 * @version 2013-5-15
 */
@Service
@Transactional(readOnly = true)
public class SystemService extends BaseService  {
	
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8;
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private MenuDao menuDao;

	

	//-- User Service --//
	
	public User getUser(String id) {
		return userDao.get(id);
	}
	
	public Page<User> findUser(Page<User> page, User user) {
		DetachedCriteria dc = userDao.createDetachedCriteria();
		User currentUser = UserUtils.getUser();
//		dc.createAlias("company", "company");
//		if (user.getCompany()!=null && StringUtils.isNotBlank(user.getCompany().getId())){
//			dc.add(Restrictions.or(
//					Restrictions.eq("company.id", user.getCompany().getId()),
//					Restrictions.like("company.parentIds", "%,"+user.getCompany().getId()+",%")
//					));
//		}
		
		// 如果不是超级管理员，则不显示超级管理员用户
		if (!currentUser.isAdmin()){
			dc.add(Restrictions.ne("id", "1")); 
		}

		if (StringUtils.isNotEmpty(user.getLoginName())){
			dc.add(Restrictions.like("loginName", "%"+user.getLoginName()+"%"));
		}
		if (StringUtils.isNotEmpty(user.getName())){
			dc.add(Restrictions.like("name", "%"+user.getName()+"%"));
		}
		if (StringUtils.isNotEmpty(user.getNo())){
			dc.add(Restrictions.eq("no", user.getNo()));
		}
		dc.add(Restrictions.eq(User.FIELD_DEL_FLAG, User.DEL_FLAG_NORMAL));
		
		
		if (!StringUtils.isNotEmpty(page.getOrderBy())){
			dc.addOrder(Order.desc("name"));
		}
		return userDao.find(page, dc);
	}
	
	public Page<User> findUserByRoleId(Page<User> page, User user,String[] roleIds) {
		DetachedCriteria dc = userDao.createDetachedCriteria();
		User currentUser = UserUtils.getUser();
		
//		dc.createAlias("company", "company");
//		if (user.getCompany()!=null && StringUtils.isNotBlank(user.getCompany().getId())){
//			dc.add(Restrictions.or(
//					Restrictions.eq("company.id", user.getCompany().getId()),
//					Restrictions.like("company.parentIds", "%,"+user.getCompany().getId()+",%")
//					));
//		}
//下面是三级关联的例子。
//	    DetachedCriteria dc = DetachedCriteria.forClass(Student.class);   
//	    dc.createAlias("team", "t");   
//	    dc.createAlias("t.school", "s");   
//	    dc.add(Restrictions.like("s.schoolName", schoolName, MatchMode.ANYWHERE));  

		
		// 如果不是超级管理员，则不显示超级管理员用户
		if (!currentUser.isAdmin()){
			dc.add(Restrictions.ne("id", "1")); 
		}

		if(!Collections3.isEmpty(roleIds)){
			dc.createAlias("roleList", "roleList");
			dc.add(Restrictions.in("roleList.id", roleIds));
			//dc.add(Restrictions.eq("roleList.id", 5));
		}
		
		if(!Collections3.isEmpty(user.getBanjiList())){
			dc.createAlias("banjiList", "list");
			dc.add(Restrictions.in("list.id", Collections3.extractToList(user.getBanjiList(), "id")));
		}
		
		if(StringUtils.isNotEmpty(user.getStudentName())){
			dc.add(Restrictions.like("studentName", "%"+user.getStudentName()+"%"));
		}
		
		if(StringUtils.isNotEmpty(user.getStudentNo())){
			dc.add(Restrictions.eq("studentNo", user.getStudentNo()));
		}
		
		if (StringUtils.isNotEmpty(user.getLoginName())){
			dc.add(Restrictions.like("loginName", "%"+user.getLoginName()+"%"));
		}
		if (StringUtils.isNotEmpty(user.getName())){
			dc.add(Restrictions.like("name", "%"+user.getName()+"%"));
		}
		if (StringUtils.isNotEmpty(user.getNo())){
			dc.add(Restrictions.eq("no", user.getNo()));
		}
		dc.add(Restrictions.eq(User.FIELD_DEL_FLAG, User.DEL_FLAG_NORMAL));
		
		
		if (!StringUtils.isNotEmpty(page.getOrderBy())){
			dc.addOrder(Order.desc("name"));
		}
		return userDao.find(page, dc);
	}

	
	public User getUserByLoginName(String loginName) {
		return userDao.findByLoginName(loginName);
	}
	
	public List<Menu> getMenuListByUser(User user){
		if (user == null)return null;
		List<Menu> menuList=new ArrayList<Menu>();
		if (user.isAdmin()){
			menuList = menuDao.findAllList();
		}else{
			menuList = menuDao.findByUserId(user.getId());
		}
		return menuList;
	}


	@Transactional(readOnly = false)
	public void saveUser(User user) {
		userDao.clear();
		userDao.save(user);
	}

	@Transactional(readOnly = false)
	public void deleteUser(String id) {
		userDao.deleteById(id);
	}
	
	@Transactional(readOnly = false)
	public void updatePasswordById(String id, String loginName, String newPassword) {
		userDao.updatePasswordById(entryptPassword(newPassword), id);
	}
	
	@Transactional(readOnly = false)
	public void updateUserLoginInfo(String id) {
		userDao.updateLoginInfo(SecurityUtils.getSubject().getSession().getHost(), new Date(), id);
	}
	
	/**
	 * 生成安全的密码，生成随机的16位salt并经过1024次 sha-1 hash
	 */
	public static String entryptPassword(String plainPassword) {
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
		return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
	}
	
	/**
	 * 验证密码
	 * @param plainPassword 明文密码
	 * @param password 密文密码
	 * @return 验证成功返回true
	 */
	public static boolean validatePassword(String plainPassword, String password) {
		byte[] salt = Encodes.decodeHex(password.substring(0,16));
		byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
		return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
	}
	
	//-- Role Service --//
	
	public Role getRole(String id) {
		return roleDao.get(id);
	}

	public Role findRoleByName(String name) {
		return roleDao.findByName(name);
	}
	
	public List<Role> findAllRole(){
		return UserUtils.getRoleList();
	}
	
	public List<Role> findTeacherRole(){
		List<Role> all= UserUtils.getRoleList();
		List<Role> roleList = Lists.newArrayList();
		for (Role r : all){
			if (r.getId().equals("3")||r.getId().equals("4")){
				roleList.add(r);
			}
		}
		return roleList;
	}
	
	@Transactional(readOnly = false)
	public void saveRole(Role role) {
		roleDao.clear();
		roleDao.save(role);
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
	}

	@Transactional(readOnly = false)
	public void deleteRole(String id) {
		roleDao.deleteById(id);
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
	}
	
	@Transactional(readOnly = false)
	public Boolean outUserInRole(Role role, String userId) {
		User user = userDao.get(userId);
		List<String> roleIds = user.getRoleIdList();
		List<Role> roles = user.getRoleList();
		// 
		if (roleIds.contains(role.getId())) {
			roles.remove(role);
			saveUser(user);
			return true;
		}
		return false;
	}
	
	@Transactional(readOnly = false)
	public User assignUserToRole(Role role, String userId) {
		User user = userDao.get(userId);
		List<String> roleIds = user.getRoleIdList();
		if (roleIds.contains(role.getId())) {
			return null;
		}
		user.getRoleList().add(role);
		saveUser(user);		
		return user;
	}

	//-- Menu Service --//
	
	public Menu getMenu(String id) {
		return menuDao.get(id);
	}

	public List<Menu> findAllMenu(){
		return UserUtils.getMenuList();
	}
	
	@Transactional(readOnly = false)
	public void saveMenu(Menu menu) {
		menu.setParent(this.getMenu(menu.getParent().getId()));
		String oldParentIds = menu.getParentIds(); // 获取修改前的parentIds，用于更新子节点的parentIds
		menu.setParentIds(menu.getParent().getParentIds()+menu.getParent().getId()+",");
		menuDao.clear();
		menuDao.save(menu);
		// 更新子节点 parentIds
		List<Menu> list = menuDao.findByParentIdsLike("%,"+menu.getId()+",%");
		for (Menu e : list){
			e.setParentIds(e.getParentIds().replace(oldParentIds, menu.getParentIds()));
		}
		menuDao.save(list);
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);

	}

	@Transactional(readOnly = false)
	public void deleteMenu(String id) {
		menuDao.deleteById(id, "%,"+id+",%");
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);

	}
	
	@Transactional(readOnly = false)
	public boolean updateOpenLevel(String userId,String level) {
		if(StringUtils.isNotBlank(level)&&level.length()==1){
			userDao.updateOpenLevel(userId,level);
			return true;
		}
		return false;
	}

	
	


	

	

	
	
}
