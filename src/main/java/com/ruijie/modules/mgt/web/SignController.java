

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
import com.ruijie.modules.mgt.entity.Sign;
import com.ruijie.modules.mgt.service.SignService;

/**
 * 视图控制类
 * @author yuzhongyuan
 * @version 2014-07-31
 */

@Controller
@RequestMapping(value = "${adminPath}/mgt/sign")
public class SignController extends BaseController {

	@Autowired
	private SignService signService;
	
	@ModelAttribute
	public Sign get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return signService.get(id);
		}else{
			return new Sign();
		}
	}
	
	@RequiresPermissions("mgt:sign:view")
	@RequestMapping(value = {"list", ""})
	public String list(Sign sign, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			sign.setCreateBy(user);
		}
        Page<Sign> page = signService.find(new Page<Sign>(request, response), sign); 
        model.addAttribute("page", page);
		return "modules/mgt/signList";
	}

	@RequiresPermissions("mgt:sign:view")
	@RequestMapping(value = "form")
	public String form(Sign sign, Model model) {
		model.addAttribute("sign", sign);
		return "modules/mgt/signForm";
	}

	@RequiresPermissions("mgt:sign:edit")
	@RequestMapping(value = "save")
	public String save(Sign sign, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sign)){
			return form(sign, model);
		}
		signService.save(sign);
		addMessage(redirectAttributes, "保存记录成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/sign/?repage";
	}
	
	@RequiresPermissions("mgt:sign:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		signService.delete(id);
		addMessage(redirectAttributes, "删除记录成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/sign/?repage";
	}

}
