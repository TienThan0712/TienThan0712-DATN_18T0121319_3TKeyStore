package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueDayModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueMonthModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IRevenueDayService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IRevenueMonthService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IRevenueProductService;

import io.lettuce.core.dynamic.annotation.Param;

@Controller
@RequestMapping("/admin")
public class AdminRevenueController {
	
	@Autowired
	private IRevenueMonthService<RevenueMonthModel> rm;
	
	@Autowired
	private IRevenueDayService<RevenueDayModel> rd;
	
	@Autowired
	private IRevenueProductService<RevenueProductModel> rp;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product;
	
	@GetMapping("/revenueMonth")
	public String RevenueMonth(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<RevenueMonthModel> revenueMonth = rm.getRevenueMonth();
			model.addAttribute("revenueMonth",revenueMonth);
			model.addAttribute("link", "revenue");
			model.addAttribute("linkRevenue", "revenueTimeList");
			return "admin/revenueMonth";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "Bạn cần đăng nhập");
			return "client/index";
		}
	}
	@GetMapping("/revenueDay")
	public String RevenueDay(HttpServletRequest request, Model model,@Param("month") String month) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<RevenueDayModel> revenueDay = rd.getRevenueDay(month);
			model.addAttribute("revenueDay",revenueDay);
			model.addAttribute("link", "revenue");
			model.addAttribute("linkRevenue", "revenueTimeList");
			return "admin/revenueDay";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "Bạn cần đăng nhập");
			return "client/index";
		}
	}
	
	@GetMapping("/revenueProduct")
	public String RevenueProduct(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<RevenueProductModel> revenueProduct = rp.getRevenueProduct();
			model.addAttribute("revenueProduct",revenueProduct);
			model.addAttribute("link", "revenue");
			model.addAttribute("linkRevenue", "revenueProductList");
			return "admin/revenueProduct";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "Bạn cần đăng nhập");
			return "client/index";
		}
	}
	
}
