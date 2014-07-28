package com.ruijie.modules.phone.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ruijie.common.utils.Identities;

/**
 * 用户Controller
 * @author xxxx
 * @version 2013-5-31
 */
@Controller
@RequestMapping(value = "${phonePath}/token")
public class TokenController {
	
	/**
	 * 日志对象
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "access")
	public String accessToken(HttpServletRequest request,HttpServletResponse response) {
		return Identities.uuid2();
		
	}
	
	@ResponseBody
	@RequestMapping(value = "refresh")
	public String refreshToken(HttpServletRequest request,HttpServletResponse response) {
		return null;
		
	}


}
