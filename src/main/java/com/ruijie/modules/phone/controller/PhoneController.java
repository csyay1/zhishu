package com.ruijie.modules.phone.controller;


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

import com.ruijie.common.utils.MyException;
import com.ruijie.modules.mgt.service.TokenService;
import com.ruijie.modules.mgt.entity.Token;
import com.ruijie.modules.sys.entity.Dict;
import com.ruijie.modules.sys.entity.User;
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
			result.put("token", token);
			result.put("user", user);
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


}
