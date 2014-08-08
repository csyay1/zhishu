

package com.ruijie.modules.mgt.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ruijie.common.config.Global;
import com.ruijie.common.persistence.Page;
import com.ruijie.common.web.BaseController;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.utils.UserUtils;
import com.ruijie.modules.mgt.entity.Message;
import com.ruijie.modules.mgt.service.MessageService;

/**
 * 视图控制类
 * @author yuzhongyuan
 * @version 2014-08-08
 */

@Controller
@RequestMapping(value = "${adminPath}/mgt/message")
public class MessageController extends BaseController {

	@Autowired
	private MessageService messageService;
	
	@ModelAttribute
	public Message get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return messageService.get(id);
		}else{
			return new Message();
		}
	}
	
	@RequiresPermissions("mgt:message:view")
	@RequestMapping(value = {"list", ""})
	public String list(Message message, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			message.setCreateBy(user);
		}
        Page<Message> page = messageService.find(new Page<Message>(request, response), message); 
        model.addAttribute("page", page);
		return "modules/mgt/messageList";
	}

	@RequiresPermissions("mgt:message:view")
	@RequestMapping(value = "form")
	public String form(Message message, Model model) {
		model.addAttribute("message", message);
		return "modules/mgt/messageForm";
	}

	@RequiresPermissions("mgt:message:edit")
	@RequestMapping(value = "save")
	public String save(Message message, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, message)){
			return form(message, model);
		}
		messageService.save(message);
		addMessage(redirectAttributes, "保存Message成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/message/?repage";
	}
	
	@RequiresPermissions("mgt:message:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		messageService.delete(id);
		addMessage(redirectAttributes, "删除Message成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/message/?repage";
	}

}
