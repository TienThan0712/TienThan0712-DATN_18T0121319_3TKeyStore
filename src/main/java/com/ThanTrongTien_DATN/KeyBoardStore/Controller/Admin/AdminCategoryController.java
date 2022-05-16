package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;


@Controller
@RequestMapping("/admin")
public class AdminCategoryController {

	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product;
	
	@GetMapping("/category")
	public String CategoryView (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<CategoryModel> dsloai = category.getLoai();
			model.addAttribute("dsloai",dsloai);
			model.addAttribute("link", "category");
			model.addAttribute("linkCategory", "categoryList");
			return "admin/category";
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
	
	@RequestMapping(value = "/addCategory", method = {RequestMethod.GET, RequestMethod.POST})
	public String AddCategory (HttpServletRequest request, Model model, @Param("maloai") String maloai, @Param("tenloai") String tenloai) 
	{
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if (maloai!=null)
			{
				if (request.getParameter("btnThem")!=null)
				{
					int ktra = category.addCategory(maloai, tenloai);
					category.clearCatche();
					if (ktra == -1)
					{
						model.addAttribute("tb", "Mã thương hiệu đã tồn tại");
						return "admin/addCategory";
					}
					else if (ktra == 1)
					{
						List<CategoryModel> dsloai = category.getLoai();
						model.addAttribute("dsloai", dsloai);
						model.addAttribute("tb", "Thêm thương hiệu thành công");
						model.addAttribute("link", "category");
						model.addAttribute("linkCategory", "addCategory");
						return "admin/category";
					}
					else
					{
						model.addAttribute("tb", "Mã thương hiệu đã tồn tại");
						return "admin/addCategory";
					}
				}
			}
			model.addAttribute("link", "category");
			model.addAttribute("linkCategory", "addCategory");
			return "admin/addCategory";
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
	
	@GetMapping("/editCategory")
	public String EditCategoryView(HttpServletRequest request, Model model, @Param("maloai") String maloai, @Param("tenloai") String tenloai) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			CategoryModel CategoryModel = category.getMotLoai(maloai);
			model.addAttribute("CategoryModel", CategoryModel);
			return "admin/editCategory";
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
	
	@PostMapping("/editCategory")
	public String EditCategory(HttpServletRequest request, Model model, @Param("maloai") String maloai, @Param("tenloai") String tenloai) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if (maloai!=null)
			{
				int ktra = category.editCategory(maloai, tenloai);
				category.clearCatche();
				if (ktra == -1)
				{
					model.addAttribute("tb", "Tên thương hiệu đã tồn tại");
					CategoryModel CategoryModel = category.getMotLoai(maloai);
					model.addAttribute("CategoryModel", CategoryModel);
					return "admin/editCategory";
				}
				if (ktra == 1)
				{
					model.addAttribute("tb", "Sửa thương hiệu thành công");
					List<CategoryModel> dsloai = category.getLoai();
					model.addAttribute("dsloai", dsloai);
					model.addAttribute("link", "category");
					model.addAttribute("linkCategory", "categoryList");
					return "admin/category";
				}
				if (ktra == 0)
				{
					model.addAttribute("tb", "Sửa thương hiệu thất bại");
					CategoryModel CategoryModel = category.getMotLoai(maloai);
					model.addAttribute("CategoryModel", CategoryModel);
					return "admin/editCategory";
				}
			}
			CategoryModel CategoryModel = category.getMotLoai(maloai);
			model.addAttribute("CategoryModel", CategoryModel);
			return "admin/editCategory";
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
	
	@GetMapping("/deleteCategory")
	public String DeleteCategory (HttpServletRequest request, Model model, @Param("maloai") String maloai, @Param("name") String name) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if (maloai!=null)
			{
				int ktra = category.deleteCategory(maloai);
				category.clearCatche();
				if (ktra == -1)
				{
					model.addAttribute("tb", "Không thể xóa thương hiệu đã có sản phẩm");
				}
				else if (ktra == 1)
				{
					model.addAttribute("tb", "Xóa thương hiệu thành công");
					List<CategoryModel> dsloai = category.getLoai();
					model.addAttribute("dsloai",dsloai);
					model.addAttribute("link", "category");
					model.addAttribute("linkCategory", "categoryList");
					return "admin/category";
				}
				else 
				{
					model.addAttribute("tb", "Xóa thương hiệu thất bại");
				}
			}
			List<CategoryModel> dsloai = category.getLoai();
			model.addAttribute("dsloai",dsloai);
			model.addAttribute("link", "category");
			model.addAttribute("linkCategory", "categoryList");
			return "admin/category";
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
