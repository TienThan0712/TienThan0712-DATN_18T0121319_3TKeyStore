package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

@Controller
@RequestMapping("/home")
public class ProductController {
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product; 
	
	@Autowired
	private ISwitchService<SwitchModel> switchs;
	
	@GetMapping("/productNew")
	public String productNew(Model model) throws Exception {
		List<CategoryModel> dsloai = category.getLoai();
		List<ProductModel> dssp = product.getspmoi();
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("dssp", dssp);
		return "client/productNew";
	};
	
	@GetMapping("/v1/product")
	public List<ProductModel> productv1(Model model) throws Exception {
		List<ProductModel> dssp = product.getsp();
		return dssp;
		
	};
	
	@GetMapping("/productHot")
	public String productHot(Model model) throws Exception {
		List<CategoryModel> dsloai = category.getLoai();
		List<ProductModel> dssp = product.getsphot();
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("dssp", dssp);
		return "client/productHot";
	};

	@GetMapping("/product")
	public String product(Model model, HttpServletRequest request, RedirectAttributes redirect) throws Exception {
		request.getSession().setAttribute("productList", null);
		if (request.getParameter("ml")!=null)
		{
			request.getSession().setAttribute("category", request.getParameter("ml"));
		}
		return "redirect:/home/product/page/1";
	};
	
	@PostMapping("/product")
	public String product(@Param("thuonghieu") String thuonghieu, @Param("loai") String loai,@Param("gia") String gia,Model model,HttpServletRequest request) {
		request.getSession().setAttribute("productList", null);
		request.getSession().setAttribute("thuonghieu", thuonghieu);
		request.getSession().setAttribute("loai", loai);
		request.getSession().setAttribute("gia", gia);
		return "redirect:/home/product/page/1";
	}
	
	@GetMapping("/product/page/{pageNumber}")
	public String productPage(HttpServletRequest request, @PathVariable int pageNumber, Model model) {
		PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
		int pagesize = 20;
		List<CategoryModel> dsloai = category.getLoai();
		List<SwitchModel> dsswitch = switchs.getSwitch();
		List<ProductModel> list = null;
		if (request.getSession().getAttribute("category")!=null)
		{
			String maloai = (String) request.getSession().getAttribute("category");
			list = (List<ProductModel>) product.getCategory(maloai);
			request.getSession().removeAttribute("category");
		}
		else if (request.getSession().getAttribute("thuonghieu")!=null
				&& request.getSession().getAttribute("loai")!=null
				&& request.getSession().getAttribute("gia")!=null)
		{
			String thuonghieu = (String) request.getSession().getAttribute("thuonghieu");
			String loai = (String) request.getSession().getAttribute("loai");
			String gia = (String) request.getSession().getAttribute("gia");
			list = (List<ProductModel>) product.searchBuFilter(product.getsp(),thuonghieu , loai, gia);
			request.getSession().removeAttribute("thuonghieu");
			request.getSession().removeAttribute("loai");
			request.getSession().removeAttribute("gia");
		}
		else 
		{
			list = (List<ProductModel>) product.getsp();
		}
		
		if (pages == null)
		{
			pages = new PagedListHolder<>(list);
			pages.setPageSize(pagesize);
		}
		else
		{
			final int gotoPage = pageNumber - 1;
			if (gotoPage <= pages.getPageCount() && gotoPage >= 0)
			{
				pages.setPage(gotoPage);
			}
		}
		request.getSession().setAttribute("productList", pages);
		int current = pages.getPage() + 1;
		int begin = Math.max(1, current - list.size());
		int end = Math.min(begin + 5, pages.getPageCount());
		int totalPageCount = pages.getPageCount();
		
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("dsswitch", dsswitch);
		model.addAttribute("beginProduct", begin);
		model.addAttribute("endProduct", end);
		model.addAttribute("currentProduct", current);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("products", pages);
		return "client/product";
	}
	
	@GetMapping("/search")
	public String search(Model model, HttpServletRequest request, RedirectAttributes redirect,@Param("key") String key) throws Exception {
		HttpSession session = request.getSession();
		request.getSession().setAttribute("productList", null);
		session.setAttribute("key", key);
		
		return "redirect:/home/search/page/1";
	};
	
	@GetMapping("/search/page/{pageNumber}")
	public String searchPage(HttpServletRequest request, @PathVariable int pageNumber, Model model) {
		HttpSession session = request.getSession();
		PagedListHolder<?> pages = (PagedListHolder<?>) request.getSession().getAttribute("productList");
		int pagesize = 20;
		String key = (String) session.getAttribute("key");
		List<CategoryModel> dsloai = category.getLoai();
		List<ProductModel> list = (List<ProductModel>) product.search(key);
		if (pages == null)
		{
			pages = new PagedListHolder<>(list);
			pages.setPageSize(pagesize);
		}
		else
		{
			final int gotoPage = pageNumber - 1;
			if (gotoPage <= pages.getPageCount() && gotoPage >= 0)
			{
				pages.setPage(gotoPage);
			}
		}
		request.getSession().setAttribute("productList", pages);
		int current = pages.getPage() + 1;
		int begin = Math.max(1, current - list.size());
		int end = Math.min(begin + 5, pages.getPageCount());
		int totalPageCount = pages.getPageCount();
		
		model.addAttribute("key", key);		
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("beginProduct", begin);
		model.addAttribute("endProduct", end);
		model.addAttribute("currentProduct", current);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("products", pages);
		return "client/search";
	}
	
	@GetMapping("/productDetail")
	public String productDetail(Model model,@Param("masp")String masp) throws Exception {
		List<CategoryModel> dsloai = category.getLoai();
		ProductModel sp = product.get1sp(masp);
		List<ProductModel> dssp = product.getCategory(sp.getMaLoai());
		model.addAttribute("sp", sp);
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("dssp", dssp);
		return "client/productDetail";
	};
}
