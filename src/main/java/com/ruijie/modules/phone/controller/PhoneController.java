package com.ruijie.modules.phone.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ruijie.common.utils.MyException;
import com.ruijie.modules.mgt.service.MessageService;
import com.ruijie.modules.mgt.service.SignService;
import com.ruijie.modules.mgt.service.TokenService;
import com.ruijie.modules.mgt.entity.Banji;
import com.ruijie.modules.mgt.entity.Sign;
import com.ruijie.modules.mgt.entity.Token;
import com.ruijie.modules.sys.entity.Dict;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.mgt.entity.Message;
import com.ruijie.modules.sys.service.SystemService;
import com.ruijie.modules.sys.utils.DictUtils;

/**
 * 用户Controller
 * @author xxxx
 * @version 2013-5-31
 */
@Controller
@RequestMapping(value = "${phonePath}")
public class PhoneController {
	
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private TokenService tokenService;
	@Autowired
	private SystemService systemService;
	@Autowired
	private SignService signService;
	@Autowired
	private MessageService messageService;
	
	
	
	@ResponseBody
	@RequestMapping(value = "access_token")
	public Map<String,Object> accessToken(HttpServletRequest request,HttpServletResponse response) {
		String username=StringUtils.clean(request.getParameter("username"));
		String password=StringUtils.clean(request.getParameter("password"));
		Map<String,Object> result=new HashMap<String,Object>();
		User user=tokenService.phoneLogin(username, password);
		if(user==null){
			result.put("success", false);
			result.put("errorCode", "10001");
			result.put("message", "帐号或密码错误，请联系管理员");
		}else{
			Token token=tokenService.accessToken(user.getId());
			result.put("success", true);
			result.put("token", token.getToken());
			result.put("user", user);
			//是否同时传入班级信息，以及班级可见的其他用户？
			result.put("banjiList", getBanjiUsers(user));
			
		}
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "all_dict")
	public Map<String,Object> getDict(HttpServletRequest request,HttpServletResponse response) {
		String token=StringUtils.clean(request.getParameter("token"));
		Map<String,Object> result=new HashMap<String,Object>();
		Token t=null;
		try {
			t=tokenService.authorizeToken(token);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			result.put("success", false);
			result.put("errorCode", e.getCode());
			result.put("message", e.getMessage());
		}
		if(t!=null){
			result.put("success", true);
			List<Dict> dictlist=DictUtils.getAllDictList();
			result.put("data",dictlist);
			result.put("size",dictlist.size());
		}
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "open_level")
	public Map<String,Object> updateOpen(HttpServletRequest request,HttpServletResponse response) {
		String token=StringUtils.clean(request.getParameter("token"));
		String level=StringUtils.clean(request.getParameter("level"));
		Map<String,Object> result=new HashMap<String,Object>();
		Token t=null;
		try {
			t=tokenService.authorizeToken(token);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			result.put("success", false);
			result.put("errorCode", e.getCode());
			result.put("message", e.getMessage());
		}
		if(t!=null){
			if(systemService.updateOpenLevel(t.getUserId(), level)){
				result.put("success", true);
			}else{
				result.put("success", false);
				result.put("errorCode", "10007");
				result.put("message","更新数据库出错，请检查输入参数");
			}
		}
		return result;
		
	}
	/*
	 * get all the opened user in the banji of login user
	 */
	@ResponseBody
	@RequestMapping(value = "banji_user")
	public Map<String,Object> banjiUser(HttpServletRequest request,HttpServletResponse response) {
		String token=StringUtils.clean(request.getParameter("token"));
		Map<String,Object> result=new HashMap<String,Object>();
		Token t=null;
		try {
			t=tokenService.authorizeToken(token);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			result.put("success", false);
			result.put("errorCode", e.getCode());
			result.put("message", e.getMessage());
		}
		if(t!=null){
			result.put("success", true);
			User user=systemService.getUser(t.getUserId());
			result.put("banjiList", getBanjiUsers(user));
		}
		return result;
		
	}
	
	/*
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "sign")
	public Map<String,Object> sign(HttpServletRequest request,HttpServletResponse response) {
		String token=StringUtils.clean(request.getParameter("token"));
		Map<String,Object> result=new HashMap<String,Object>();
		Token t=null;
		try {
			t=tokenService.authorizeToken(token);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			result.put("success", false);
			result.put("errorCode", e.getCode());
			result.put("message", e.getMessage());
		}
		if(t!=null){
			User user=systemService.getUser(t.getUserId());
			if(user.isTeacher()){
				String parentId=StringUtils.clean(request.getParameter("parentsId"));
				String type=StringUtils.clean(request.getParameter("type"));
				String value=StringUtils.clean(request.getParameter("value"));
				String remarks=StringUtils.clean(request.getParameter("remarks"));
				if(parentId==null||type==null||value==null){
					result.put("success", false);
					result.put("errorCode", "10011");
					result.put("message", "请求参数为空或错误");
				}else{
					Sign sign=new Sign();
					sign.setParents(new User(parentId));
					sign.setType(type);
					sign.setValue(value);
					sign.setCreateBy(user);
					sign.setUpdateBy(user);
					sign.setRemarks(remarks);
					signService.save(sign);
					//签到成功后，添加发消息记录
					//*************************
					String content="您家孩子"+DictUtils.getDictLabel(value, "mgt_sign_value", "")+"---老师："+user.getName()+",时间："+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					messageService.save(content, parentId, user.getId(), "1",remarks);
					result.put("success", true);
				}
			}else{
				result.put("success", false);
				result.put("errorCode", "10010");
				result.put("message", "只有老师角色才能给学生签到");
			}

		}
		return result;
		
	}
	
	/*
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "recieve_message")
	public Map<String,Object> recieveMessage(HttpServletRequest request,HttpServletResponse response) {
		String token=StringUtils.clean(request.getParameter("token"));
		Map<String,Object> result=new HashMap<String,Object>();
		Token t=null;
		try {
			t=tokenService.authorizeToken(token);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			result.put("success", false);
			result.put("errorCode", e.getCode());
			result.put("message", e.getMessage());
		}
		if(t!=null){
			User user=systemService.getUser(t.getUserId());
			//获得对应sendTo和status为1的message,发给响应
			List<Message> list=messageService.getNotReadMessage(user.getId(), "1");
			result.put("success", true);
			result.put("messageList", list);		
			//将这些message的status set为2，再调用save
			for(Message m:list){
				m.setStatus("2");
				messageService.save(m);
			}
		}
		return result;
		
	}
	
	/*
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "send_message")
	public Map<String,Object> sendMessage(HttpServletRequest request,HttpServletResponse response) {
		String token=StringUtils.clean(request.getParameter("token"));
		String content=StringUtils.clean(request.getParameter("content"));
		String sendTo=StringUtils.clean(request.getParameter("sendTo"));
		String remarks=StringUtils.clean(request.getParameter("remarks"));
		Map<String,Object> result=new HashMap<String,Object>();
		Token t=null;
		try {
			t=tokenService.authorizeToken(token);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			result.put("success", false);
			result.put("errorCode", e.getCode());
			result.put("message", e.getMessage());
		}
		if(t!=null){
			User user=systemService.getUser(t.getUserId());
			if(sendTo==null||content==null){
				result.put("success", false);
				result.put("errorCode", "10011");
				result.put("message", "请求参数为空或错误");
			}else{
				messageService.save(content, sendTo, user.getId(), "1",remarks);
				result.put("success", true);
			}
		}
		return result;
		
	}
	
	
	
	private List<Map<String,Object>> getBanjiUsers(User loginUser){
		List<Map<String,Object>> result=Lists.newArrayList();
		List<Banji> banjiList=loginUser.getBanjiList();
		for(Banji banji:banjiList){
			Map<String,Object> map=Maps.newHashMap();
			map.put("banji", banji);
			List<User> userList=banji.getUserList();
			List<User> teacherList=Lists.newArrayList();
			List<User> parentsList=Lists.newArrayList();
			logger.info(userList.size()+","+loginUser.isTeacher()+","+loginUser.isParents());
			if(loginUser.isTeacher()){
				//如果登录的人是老师，则返回班级里所有用户的信息
				for(User u:userList){
					if(u.isParents()){
						parentsList.add(u);
					}else if(u.isTeacher()){
						teacherList.add(u);
					}
				}
				map.put("teacherList", teacherList);
				map.put("parentsList", parentsList);
				
			}else if(loginUser.isParents()){
				//如果是家长，则返回所有的老师，以及open_level不是0的家长
				for(User u:userList){
					if(u.isParents()){
						parentsList.add(u);
					}else if(u.isTeacher()){
						teacherList.add(u);
					}
				}
                map.put("teacherList", teacherList);
				map.put("parentsList", parentsList);
				
			}
			result.add(map);
		}
		return result;
	}
	
	
	
	


}
