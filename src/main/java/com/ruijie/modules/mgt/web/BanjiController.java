

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

import com.google.common.cache.Cache;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ruijie.common.config.Global;
import com.ruijie.common.persistence.Page;
import com.ruijie.common.web.BaseController;
import com.ruijie.common.utils.CacheUtils;
import com.ruijie.common.utils.Collections3;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.modules.sys.entity.Menu;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.utils.UserUtils;
import com.ruijie.modules.mgt.entity.Banji;
import com.ruijie.modules.mgt.entity.School;
import com.ruijie.modules.mgt.service.BanjiService;
import com.ruijie.modules.mgt.service.SchoolService;

/**
 * 视图控制类
 * @author yuzhongyuan
 * @version 2014-07-25
 */

@Controller
@RequestMapping(value = "${adminPath}/mgt/banji")
public class BanjiController extends BaseController {

	@Autowired
	private BanjiService banjiService;
	
	@ModelAttribute
	public Banji get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return banjiService.get(id);
		}else{
			return new Banji();
		}
	}
	
	@RequiresPermissions("mgt:banji:view")
	@RequestMapping(value = {"list", ""})
	public String list(Banji banji, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			banji.setCreateBy(user);
		}
        Page<Banji> page = banjiService.find(new Page<Banji>(request, response), banji); 
        model.addAttribute("page", page);
		return "modules/mgt/banjiList";
	}

	@RequiresPermissions("mgt:banji:view")
	@RequestMapping(value = "form")
	public String form(Banji banji, Model model) {
		model.addAttribute("banji", banji);
		return "modules/mgt/banjiForm";
	}

	@RequiresPermissions("mgt:banji:edit")
	@RequestMapping(value = "save")
	public String save(Banji banji, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, banji)){
			return form(banji, model);
		}
		banjiService.save(banji);
		CacheUtils.remove(BanjiService.ALL_BANJI_CACHE);
		addMessage(redirectAttributes, "保存Banji'" + banji.getName() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/banji/?repage";
	}
	
	@RequiresPermissions("mgt:banji:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		banjiService.delete(id);
		CacheUtils.remove(BanjiService.ALL_BANJI_CACHE);
		addMessage(redirectAttributes, "删除Banji成功");
		return "redirect:"+Global.getAdminPath()+"/mgt/banji/?repage";
	}
	
	@RequiresUser
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Banji> list = banjiService.findAllWithCache();
		Map<String,School> schoolMap=Maps.newHashMap();
		for (int i=0; i<list.size(); i++){
			Banji e = list.get(i);
			if(!schoolMap.containsKey(e.getSchool().getId())){
				schoolMap.put(e.getSchool().getId(), e.getSchool());
				Map<String, Object> map1 = Maps.newHashMap();
				map1.put("id", "school"+e.getSchool().getId());
				map1.put("pId",0);
				map1.put("name", "学校："+e.getSchool().getName());
				mapList.add(map1);
			}
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", e.getId());
			map.put("pId", "school"+schoolMap.get(e.getSchool().getId()).getId());
			map.put("name", e.getName());
			mapList.add(map);
			
		}
		return mapList;
	}

}
