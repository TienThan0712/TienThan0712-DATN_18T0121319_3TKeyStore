package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Controller
@RequestMapping("/admin")
public class AdminCustomerController {
	
	@Autowired
	private ICustomerService<CustomerModel> customer;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> products;
	
	@GetMapping("/customer")
	public String CustomerView (HttpServletRequest request, Model model, @Param("makh") String makh, @Param("name") String name) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<CustomerModel> dskh = customer.getKH();
			if(makh!=null)
			{
				if(name.equals("btnXoa"))
				{
					customer.Xoa(Long.parseLong(makh));
					dskh = customer.getKH();
					model.addAttribute("dskh",dskh);
					model.addAttribute("tb", "Xóa thành công");
					model.addAttribute("link", "customer");
					return "admin/customer";
				}
			}
			model.addAttribute("dskh",dskh);
			model.addAttribute("link", "customer");
			return "admin/customer";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = products.get8spmoi();
			List<ProductModel> dssphot = products.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "Bạn cần đăng nhập");
			return "client/index";
		}
	}
}
