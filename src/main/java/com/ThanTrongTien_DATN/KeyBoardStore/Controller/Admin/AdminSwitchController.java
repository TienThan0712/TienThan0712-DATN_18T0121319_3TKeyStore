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
import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

@Controller
@RequestMapping("/admin")
public class AdminSwitchController {

	@Autowired
	private ISwitchService<SwitchModel> switchkey;
	
	@Autowired
	private IProductService<ProductModel> product;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@GetMapping("/switch")
	public String Switch(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<SwitchModel> dsswitch = switchkey.getSwitch();
			model.addAttribute("dsswitch",dsswitch);
			model.addAttribute("link", "switch");
			model.addAttribute("linkSwitch", "switchList");
			return "admin/switch";
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
	@RequestMapping(value = "/addSwitch", method = {RequestMethod.GET, RequestMethod.POST})
	public String addSwitch(HttpServletRequest request, Model model, @Param("maswitch") String maswitch, @Param("tenswitch") String tenswitch) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if (maswitch!=null)
			{
				if (request.getParameter("btnThem")!=null)
				{
					int ktra = switchkey.addSwitch(maswitch, tenswitch);
					switchkey.deletecache();
					if (ktra == -1)
					{
						model.addAttribute("tb", "M?? switch ???? t???n t???i");
						return "admin/addSwitch";
					}
					else if (ktra == 1)
					{
						List<SwitchModel> dsswitch = switchkey.getSwitch();
						model.addAttribute("dsswitch", dsswitch);
						model.addAttribute("tb", "Th??m Switch th??nh c??ng");
						model.addAttribute("link", "switch");
						model.addAttribute("linkSwitch", "addSwitch");
						return "admin/switch";
					}
					else
					{
						model.addAttribute("tb", "M?? switch ???? t???n t???i");
						return "admin/addSwitch";
					}
				}
			}
			model.addAttribute("link", "switch");
			model.addAttribute("linkSwitch", "addSwitch");
			return "admin/addSwitch";
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
	@GetMapping("/editSwitch")
	public String EditCategoryView(HttpServletRequest request, Model model, @Param("maswitch") String maswitch, @Param("tenswitch") String tenswitch) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			SwitchModel SwitchModel = switchkey.getMotSwitch(maswitch);
			model.addAttribute("SwitchModel", SwitchModel);
			return "admin/editSwitch";
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
	
	@PostMapping("/editSwitch")
	public String EditSwitch(HttpServletRequest request, Model model, @Param("maswitch") String maswitch, @Param("tenswitch") String tenswitch) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if (maswitch!=null)
			{
				int ktra = switchkey.editSwitch(maswitch, tenswitch);
				switchkey.deletecache();
				if (ktra == -1)
				{
					model.addAttribute("tb", "T??n Switch ???? t???n t???i");
					SwitchModel SwitchModel = switchkey.getMotSwitch(maswitch);
					model.addAttribute("SwitchModel", SwitchModel);
					return "admin/editSwitch";
				}
				if (ktra == 1)
				{
					model.addAttribute("tb", "S???a Switch th??nh c??ng");
					List<SwitchModel> dsswitch = switchkey.getSwitch();
					model.addAttribute("dsswitch", dsswitch);
					model.addAttribute("link", "switch");
					model.addAttribute("linkSwitch", "SwitchList");
					return "admin/switch";
				}
				if (ktra == 0)
				{
					model.addAttribute("tb", "S???a Switch th???t b???i");
					SwitchModel SwitchModel = switchkey.getMotSwitch(maswitch);
					model.addAttribute("SwitchModel", SwitchModel);
					return "admin/editSwitch";
				}
			}
			SwitchModel SwitchModel = switchkey.getMotSwitch(maswitch);
			model.addAttribute("SwitchModel", SwitchModel);
			return "admin/editSwitch";
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
	
	@GetMapping("/deleteSwitch")
	public String DeleteSwitch (HttpServletRequest request, Model model, @Param("maswitch") String maswitch, @Param("name") String name) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if (maswitch!=null)
			{
				int ktra = switchkey.deleteSwitch(maswitch);
				switchkey.deletecache();
				if (ktra == -1)
				{
					model.addAttribute("tb", "Kh??ng th??? x??a switch ???? c?? s???n ph???m");
				}
				else if (ktra == 1)
				{
					model.addAttribute("tb", "X??a switch th??nh c??ng");
					List<SwitchModel> dsswitch = switchkey.getSwitch();
					model.addAttribute("dsswitch", dsswitch);
					model.addAttribute("link", "switch");
					model.addAttribute("linkSwitch", "SwitchList");
					return "admin/switch";
				}
				else 
				{
					model.addAttribute("tb", "X??a switch th???t b???i");
				}
			}
			List<SwitchModel> dsswitch = switchkey.getSwitch();
			model.addAttribute("dsloai", dsswitch);
			model.addAttribute("link", "switch");
			model.addAttribute("linkSwitch", "SwitchList");
			return "admin/switch";
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
