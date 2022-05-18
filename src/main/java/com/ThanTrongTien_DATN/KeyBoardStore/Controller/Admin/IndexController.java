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
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

@Controller
public class IndexController {
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product;
	
	@Autowired
	private ISwitchService<SwitchModel> switchkey;
	
	@Autowired
	private ICustomerService<CustomerModel> customer;
	
	@Autowired 
	private IOrderService<OrderModel> order;
	
	
	@GetMapping("/admin")
	public String AdminIndex(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			model.addAttribute("product",product.getsp().size());
			model.addAttribute("category", category.getLoai().size());
			model.addAttribute("switchkey", switchkey.getSwitch().size());
			model.addAttribute("customer", customer.getKH().size());
			model.addAttribute("orderwaiting", order.DonHangChoXN().size());
			model.addAttribute("orderpayment", order.DonHangChoTT().size());
			model.addAttribute("orderdone", order.DonHangDaTT().size());
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
