package com.ruijie.modules.factory.web;

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

import com.ruijie.modules.factory.entity.Product;
import com.ruijie.modules.factory.service.ProductService;
import com.ruijie.modules.sys.entity.User;
import com.ruijie.modules.sys.utils.UserUtils;
import com.ruijie.common.config.Global;
import com.ruijie.common.persistence.Page;
import com.ruijie.common.utils.StringUtils;
import com.ruijie.common.web.BaseController;


@Controller
@RequestMapping(value = "${adminPath}/factory/product")
public class ProductController extends BaseController {

	@Autowired
	private ProductService productService;
	
	@ModelAttribute
	public Product get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return productService.get(id);
		}else{
			return new Product();
		}
	}
	
	@RequiresPermissions("factory:product:view")
	@RequestMapping(value = {"list", ""})
	public String list(Product product, HttpServletRequest request, HttpServletResponse response, Model model) {
		logger.debug("in");
		User user = UserUtils.getUser();
		if (!user.isAdmin()){
			product.setCreateBy(user);
		}
        Page<Product> page = productService.find(new Page<Product>(request, response), product); 
        model.addAttribute("page", page);
		return "modules/factory/productList";
	}

	@RequiresPermissions("factory:product:view")
	@RequestMapping(value = "form")
	public String form(Product product, Model model) {
		model.addAttribute("product", product);
		return "modules/factory/productForm";
	}

	@RequiresPermissions("factory:product:edit")
	@RequestMapping(value = "save")
	public String save(Product product, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, product)){
			return form(product, model);
		}
		productService.save(product);
		addMessage(redirectAttributes, "保存产品'" + product.getName() + "'成功");
		return "redirect:"+Global.getAdminPath()+"/factory/product/?repage";
	}
	
	@RequiresPermissions("factory:product:edit")
	@RequestMapping(value = "delete")
	public String delete(String id, RedirectAttributes redirectAttributes) {
		productService.delete(id);
		addMessage(redirectAttributes, "删除产品成功");
		return "redirect:"+Global.getAdminPath()+"/factory/product/?repage";
	}

}
