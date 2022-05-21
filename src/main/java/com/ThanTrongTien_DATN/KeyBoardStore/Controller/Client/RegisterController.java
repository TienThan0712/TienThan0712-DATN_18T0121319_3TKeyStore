package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.GoogleCapchaService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Controller
@RequestMapping("/home")
public class RegisterController {
	
	@Autowired
	private ICustomerService<CustomerModel> customer;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product; 
	
	@Autowired
	private GoogleCapchaService capchaService;
	
	@PostMapping("/register")
	public String Register(Model model,HttpServletRequest request,@Param("pass") String pass,@Param("name") String name,
			@Param("diachi") String diachi,@Param("sdt") String sdt,@Param("email") String email,@RequestParam(value = "g-recaptcha-response") String capChaResponse) {
		if(email!=null)
		{
			if (!capchaService.verifyGoogleCapcha(capChaResponse)) {
				request.setAttribute("tb", "Google Capcha Fail");
				List<CategoryModel> dsloai = category.getLoai();
				List<ProductModel> dsspmoi = product.get8spmoi();
				List<ProductModel> dssphot = product.get8sphot();
				model.addAttribute("dsloai", dsloai);
				model.addAttribute("dsspmoi", dsspmoi);
				model.addAttribute("dssphot", dssphot);
				return "client/index";
			}
			String password = BCrypt.hashpw(pass, BCrypt.gensalt());
			int test = customer.ktdk(name, diachi, sdt, email,password);
			if(test == -1)
			{
				model.addAttribute("tb","Tên tài khoản đã tồn tại");
				List<CategoryModel> dsloai = category.getLoai();
				List<ProductModel> dsspmoi = product.get8spmoi();
				List<ProductModel> dssphot = product.get8sphot();
				model.addAttribute("dsloai", dsloai);
				model.addAttribute("dsspmoi", dsspmoi);
				model.addAttribute("dssphot", dssphot);
				return "client/index";
			}
			else if (test == 1){
				model.addAttribute("tb","Đăng ký thành công");
				List<CategoryModel> dsloai = category.getLoai();
				List<ProductModel> dsspmoi = product.get8spmoi();
				List<ProductModel> dssphot = product.get8sphot();
				model.addAttribute("dsloai", dsloai);
				model.addAttribute("dsspmoi", dsspmoi);
				model.addAttribute("dssphot", dssphot);
				return "client/index";
			}
			else {
				model.addAttribute("tb","Đăng ký thất bại");
				List<CategoryModel> dsloai = category.getLoai();
				List<ProductModel> dsspmoi = product.get8spmoi();
				List<ProductModel> dssphot = product.get8sphot();
				model.addAttribute("dsloai", dsloai);
				model.addAttribute("dsspmoi", dsspmoi);
				model.addAttribute("dssphot", dssphot);
				return "client/index";
			}
		}
		return "client/index";
	}
	@PostMapping("/registerCart")
	public String RegisterCart(Model model,@Param("pass") String pass,@Param("name") String name,
			@Param("diachi") String diachi,@Param("sdt") String sdt,@Param("email") String email) {
		if(email!=null)
		{
			int test = customer.ktdk(name, diachi, sdt, email, pass);
			if(test == -1)
			{
				model.addAttribute("tb","Tên tài khoản đã tồn tại");
				return "redirect:/home/cart";
			}
			else if (test == 1){
				model.addAttribute("tb","Đăng ký thành công");
				return "redirect:/home/cart";
			}
			else {
				model.addAttribute("tb","Đăng ký thất bại");
			}
		}
		return "redirect:/home/cart";
	}

}
