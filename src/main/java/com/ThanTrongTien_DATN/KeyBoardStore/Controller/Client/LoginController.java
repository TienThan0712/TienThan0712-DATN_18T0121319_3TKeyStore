package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IAdminService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Controller
@RequestMapping("/home")
public class LoginController {

	@Autowired
	private ICustomerService<CustomerModel> customer;
	
	@Autowired
	private IAdminService<AdminModel> admin;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product; 
	
	@PostMapping("/login")
	public String Login(HttpServletRequest request,HttpServletResponse reponse,@Param("user")String user,@Param("pass")String pass,Model model)
	{
		HttpSession session = request.getSession();
		CustomerModel kh = customer.ktdn(user);
		AdminModel ad = admin.ktdn(user);
		if (user!=null)
		{
			if(kh!=null)
			{
				if (BCrypt.checkpw(pass, kh.getPass()))
				{
					session.setAttribute("kh", kh);
					return "redirect:/home";
				}
				else
				{
					request.setAttribute("tb","Tài khoản hoặc mật khẩu sai");
					List<CategoryModel> dsloai = category.getLoai();
					List<ProductModel> dsspmoi = product.get8spmoi();
					List<ProductModel> dssphot = product.get8sphot();
					model.addAttribute("dsloai", dsloai);
					model.addAttribute("dsspmoi", dsspmoi);
					model.addAttribute("dssphot", dssphot);
					return "client/index";
				}
			}
			if (ad!=null)
			{
				if (BCrypt.checkpw(pass, ad.getPassword()))
				{
					session.setAttribute("ad", ad);
					return "redirect:/admin";
				}
				else
				{
					request.setAttribute("tb","Tài khoản hoặc mật khẩu sai");
					List<CategoryModel> dsloai = category.getLoai();
					List<ProductModel> dsspmoi = product.get8spmoi();
					List<ProductModel> dssphot = product.get8sphot();
					model.addAttribute("dsloai", dsloai);
					model.addAttribute("dsspmoi", dsspmoi);
					model.addAttribute("dssphot", dssphot);
					return "admin/index";
				}
				
			}
		}
		return "client/index";
	}
	@PostMapping("/loginCart")
	public String LoginCart(HttpServletRequest request,HttpServletResponse reponse,@Param("user")String user,@Param("pass")String pass)
	{
		HttpSession session = request.getSession();
		CustomerModel kh = customer.ktdn(user);
		if (user!=null)
		{
			if(kh!=null)
			{
				if (BCrypt.checkpw(pass, kh.getPass()))
				{
					session.setAttribute("kh", kh);
					return "redirect:/home/cart";
				}
				else
				{
					request.setAttribute("tb","Tài khoản hoặc mật khẩu sai");
					return "redirect:/admin";
				}
			}
			else
			{
				request.setAttribute("tb","Tài khoản hoặc mật khẩu sai");
			}
		}
		return "client/cart";
	}
	@GetMapping("/password")
	public String PassWord(Model model)
	{
		List<CategoryModel> dsloai = category.getLoai();
		model.addAttribute("dsloai", dsloai);
		return "client/password";
	}
}
