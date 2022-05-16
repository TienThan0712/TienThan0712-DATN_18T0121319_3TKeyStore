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
import org.springframework.web.bind.annotation.RequestMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;



@Controller
@RequestMapping("/home")
public class CustomerInfoController {

	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private ICustomerService<CustomerModel> customer;
	
	@Autowired
	private IProductService<ProductModel> product; 
	
	@GetMapping("/customerDetail")
	public String CustomerDetail(HttpServletRequest request, HttpServletResponse response,Model model, @Param("HoTen") String HoTen, @Param("DiaChi") String DiaChi,@Param("SoDT") String SoDT,
			@Param("Email") String Email,@Param("PassCu") String PassCu,@Param("PassMoi") String PassMoi) throws Exception{
		HttpSession session = request.getSession();
		List<CategoryModel> dsloai = category.getLoai();
		request.setAttribute("dsloai", dsloai);
		CustomerModel kh = (CustomerModel)session.getAttribute("kh");
		if(request.getParameter("btnUpdate")!=null)
		{
			customer.SuaThongTin(kh.getMaKH(), HoTen, DiaChi, SoDT, Email);
			CustomerModel khbean = customer.LayThongTin(kh.getMaKH());
			session.setAttribute("kh", khbean);
			request.setAttribute("tb", "Sửa thông tin thành công");
		}
		if(request.getParameter("btnUpdateCart")!=null)
		{
			customer.SuaThongTin(kh.getMaKH(), HoTen, DiaChi, SoDT, Email);
			CustomerModel kh1 = customer.LayThongTin(kh.getMaKH());
			session.setAttribute("kh", kh1);
			request.setAttribute("tb", "Sửa thông tin thành công");
			return "client/cart";
		}
		if(request.getParameter("btnDoiMK")!=null)
		{
			String passwordMoi = BCrypt.hashpw(PassMoi, BCrypt.gensalt(10));
			if (BCrypt.checkpw(PassCu, kh.getPass()))
			{
				session.removeAttribute("kh");
				customer.DoiMK(kh.getMaKH(),  passwordMoi);
				request.setAttribute("tb", "Đổi mật khẩu thành công. Vui lòng đăng nhập lại");
				List<ProductModel> dsspmoi = product.get8spmoi();
				List<ProductModel> dssphot = product.get8sphot();
				model.addAttribute("dsloai", dsloai);
				model.addAttribute("dsspmoi", dsspmoi);
				model.addAttribute("dssphot", dssphot);
				return "client/index";
				
			}
			else
			{
				request.setAttribute("tb", "Mật khẩu không hợp lệ");
				session.setAttribute("kh", kh);
				return "client/customerDetail";
			}
		}
		return "client/customerDetail";
	}
}
