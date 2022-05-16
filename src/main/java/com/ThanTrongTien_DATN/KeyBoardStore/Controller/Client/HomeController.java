package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Controller
public class HomeController {
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product; 
	
	@Autowired
	private ICustomerService<CustomerModel> customer;
	
	@SuppressWarnings("unused")
	@GetMapping("/home")
	public String Home(Model model,HttpServletRequest request) throws Exception {
			Cookie  cookie = null;
			Cookie[] cookies = null;
			cookies = request.getCookies();
			if (cookies != null)
			{
				for (int i=0;i<cookies.length;i++)
				{
					cookie = cookies[i];
					if((cookie.getName( )).compareTo("username") == 0 ){
						HttpSession session = request.getSession();
						CustomerModel kh=  customer.ktdn(cookie.getValue());;
						session.setAttribute("kh", kh);
			         }
				}
			}
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			List<ProductModel> dssp = product.getsp();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
		return "client/index";
	}
}
