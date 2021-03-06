package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Autowired
	private IProductService<ProductModel> product;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private ISwitchService<SwitchModel> switchkey;
	
	@GetMapping("/product")
	public String ProductView (Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<ProductModel> dssp = product.getsp();
			model.addAttribute("dssp",dssp);
			model.addAttribute("link", "product");
			model.addAttribute("linkProduct", "productList");
			return "admin/product";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "B???n c???n ????ng nh???p");
			return "client/index";
		}
	}
	
	@GetMapping("/addProduct")
	public String AddProductView (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<SwitchModel> dsswitch = switchkey.getSwitch();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsswitch",dsswitch);
			model.addAttribute("link", "product");
			model.addAttribute("linkProduct", "addProduct");
			return "admin/addProduct";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "B???n c???n ????ng nh???p");
			return "client/index";
		}
	}
	
	@PostMapping("/addProduct")
	public String AddProduct (HttpServletRequest request, HttpServletResponse response, Model model, @Param("masp") String masp,@Param("anhsp") MultipartFile anhsp,@Param("tensp") String tensp,
			@Param("dongia") String dongia, @Param("giamgia") String giamgia,@Param("maloai") String maloai,@Param("maswitch") String maswitch,@Param("mota") String mota,
			@Param("ngaythem") String ngaythem) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if(anhsp.isEmpty())
			{
				model.addAttribute("tb", "Th??m s???n ph???m th???t b???i");
				List<ProductModel> dssp = product.getsp();
				model.addAttribute("dssp",dssp);
				model.addAttribute("link", "product");
				model.addAttribute("linkProduct", "productList");
				return "admin/product";
			}
			Path path = Paths.get("src/main/resources/static/image_sp/");
			try {
				String anhUrl = null;
				try {
					InputStream inputStream = anhsp.getInputStream();
					Files.copy(inputStream, path.resolve(anhsp.getOriginalFilename()),StandardCopyOption.REPLACE_EXISTING);
					anhUrl = "image_sp/" +anhsp.getOriginalFilename().toLowerCase();
				} catch (Exception e) {
					e.printStackTrace();
				}
				Date ngay = new java.util.Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				ngay = format.parse(ngaythem);
				int kt = product.addProduct(masp, anhUrl, tensp, Long.parseLong(dongia), Integer.parseInt(giamgia), maloai,maswitch, ngay, mota);
				product.deletecache();
				if (kt==-1)
				{
					model.addAttribute("tb", "M?? s???n ph???m ???? t???n t???i");
					List<ProductModel> dssp = product.getsp();
					model.addAttribute("dssp",dssp);
					model.addAttribute("link", "product");
					model.addAttribute("linkProduct", "productList");
					return "admin/product";
				}
				else if (kt==1)
				{
					model.addAttribute("tb", "Th??m s???n ph???m th??nh c??ng");
					List<ProductModel> dssp = product.getsp();
					model.addAttribute("dssp",dssp);
					model.addAttribute("link", "product");
					model.addAttribute("linkProduct", "productList");
					return "admin/product";
				}
				if (kt==0)
				{
					model.addAttribute("tb", "Th??m s???n ph???m th???t b???i");
					List<ProductModel> dssp = product.getsp();
					model.addAttribute("dssp",dssp);
					model.addAttribute("link", "product");
					model.addAttribute("linkProduct", "productList");
					return "admin/product";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			ProductModel spbean = product.get1sp(masp);
			List<CategoryModel> dsloai = category.getLoai();
			model.addAttribute("spbean", spbean);
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("link", "product");
			model.addAttribute("linkProduct", "addProduct");
			return "admin/addProduct";	
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "B???n c???n ????ng nh???p");
			return "client/index";
		}
	}
	
	@GetMapping("/editProductInfo")
	public String EditInfoProductView (HttpServletRequest request, Model model, @Param("masp") String masp) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			ProductModel spbean = product.get1sp(masp);
			List<CategoryModel> dsloai = category.getLoai();
			List<SwitchModel> dsswitch = switchkey.getSwitch();
			model.addAttribute("spbean", spbean);
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsswitch",dsswitch);
			model.addAttribute("link", "product");
			model.addAttribute("linkProduct", "productList");
			return "admin/editProduct";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "B???n c???n ????ng nh???p");
			return "client/index";
		}
	}
	
	@PostMapping("/editProductInfo")
	public String EditInfoProduct (HttpServletRequest request, Model model, @Param("masp") String masp, @Param("tensp") String tensp,
			@Param("anhsp") MultipartFile anhsp,@Param("dongia") String dongia, @Param("giamgia") String giamgia,@Param("maloai") String maloai,@Param("maswitch") String maswitch,@Param("mota") String mota,
			@Param("ngaythem") String ngaythem) throws ParseException {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			Date ngay = new java.util.Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			ngay = format.parse(ngaythem);
			if (masp!=null)
			{
				if(anhsp.isEmpty())
				{
					product.editProductInfoNotImage(masp, tensp, Long.parseLong(dongia), Integer.parseInt(giamgia), maloai,maswitch, ngay, mota);
					product.deletecache();
					List<ProductModel> dssp = product.getsp();
					model.addAttribute("tb", "S???a th??ng tin s???n ph???m th??nh c??ng");
					model.addAttribute("dssp",dssp);
					model.addAttribute("link", "product");
					model.addAttribute("linkProduct", "productList");
					return "admin/product";
				}
				Path path = Paths.get("src/main/resources/static/image_sp/");
				try {
					String anhUrl = null;
					try {
						InputStream inputStream = anhsp.getInputStream();
						Files.copy(inputStream, path.resolve(anhsp.getOriginalFilename()),StandardCopyOption.REPLACE_EXISTING);
						anhUrl = "image_sp/" +anhsp.getOriginalFilename().toLowerCase();
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				product.editProductInfo(masp,anhUrl ,tensp, Long.parseLong(dongia), Integer.parseInt(giamgia), maloai,maswitch, ngay, mota);
				product.deletecache();
				List<ProductModel> dssp = product.getsp();
				model.addAttribute("tb", "S???a th??ng tin s???n ph???m th??nh c??ng");
				model.addAttribute("dssp",dssp);
				model.addAttribute("link", "product");
				model.addAttribute("linkProduct", "productList");
				return "admin/product";
			} catch (Exception e) {
				e.printStackTrace();
			}}
			return "admin/editProduct";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "B???n c???n ????ng nh???p");
			return "client/index";
		}
	}
		
	@GetMapping("/deleteProduct")
	public String DeleteProduct (HttpServletRequest request, Model model, @Param("masp") String masp)
	{
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			product.deleteProduct(masp);
			product.deletecache();
			List<ProductModel> dssp = product.getsp();
			model.addAttribute("dssp",dssp);
			model.addAttribute("link", "product");
			model.addAttribute("linkProduct", "productList");
			model.addAttribute("tb", "Xo?? s???n ph???m th??nh c??ng");
			return "admin/product";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "B???n c???n ????ng nh???p");
			return "client/index";
		}
	}
}
