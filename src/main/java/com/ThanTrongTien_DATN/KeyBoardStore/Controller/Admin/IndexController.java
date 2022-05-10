package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;

@Controller
public class IndexController {
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@GetMapping("/admin")
	public String AdminIndex(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			model.addAttribute("link", "index");
			return "admin/index";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("tb", "Bạn cần đăng nhập");
			return "client/index";
		}

	}
}
