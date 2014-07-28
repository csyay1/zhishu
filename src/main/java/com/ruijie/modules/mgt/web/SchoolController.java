

package com.ruijie.modules.mgt.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ruijie.common.config.Global;
import com.ruijie.common.persistence.Page;
import com.ruijie.common.web.BaseController;
import com.ruijie.common.utils.CacheUtils;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.utils.UserUtils;
import com.ruijie.modules.mgt.entity.School;
import com.ruijie.modules.mgt.service.BanjiService;
import com.ruijie.modules.mgt.service.SchoolService;


/**
 * 视图控制类
 * @author yuzhongyuan
 * @version 2014-07-25
 */

@Controller
@RequestMapping(value = "${adminPath}/mgt/school")
public class SchoolController extends BaseController {

	@Autowired
	private SchoolService schoolService;
	
	@ModelAttribute
	public School get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return schoolService.get(id);
		}else{
			return new School();
		}
	}
	
	@RequiresPermissions("mgt:school:view")
	@RequestMapping(value = {"list", ""})
	public String list(School school, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			school.setCreateBy(user);
		}
        Page<School> page = schoolService.find(new Page<School>(request, response), school); 
        model.addAttribute("page", page);
		return "modules/mgt/schoolList";
	}

	@RequiresPermissions("mgt:school:view")
	@RequestMapping(value = "form")
	public String form(School school, Model model) {
		model.addAttribute("school", school);
		return "modules/mgt/schoolForm";
	}

	@RequiresPermissions("mgt:school:edit")
	@RequestMapping(value = "save")
	public String save(School school, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, school)){
			return form(school, model);
		}
		schoolService.save(school);
		removeSchoolandBanjiCache();
		addMessage(redirectAttributes, "保存School'" + school.getName() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/school/?repage";
	}
	
	@RequiresPermissions("mgt:school:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		schoolService.delete(id);
		removeSchoolandBanjiCache();
		addMessage(redirectAttributes, "删除School成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/school/?repage";
	}
	
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
//		User user = UserUtils.getUser();
		List<School> list = schoolService.findAllWithCache();
		for (int i=0; i<list.size(); i++){
			School e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("name", e.getName());
			mapList.add(map);
		}
		return mapList;
	}
	
	private void removeSchoolandBanjiCache(){
		CacheUtils.remove(SchoolService.ALL_SCHOOL_CACHE);
		CacheUtils.remove(BanjiService.ALL_BANJI_CACHE);
	}

}
