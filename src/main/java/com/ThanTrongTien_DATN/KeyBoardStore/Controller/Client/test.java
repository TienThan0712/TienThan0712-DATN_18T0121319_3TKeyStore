package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

import io.lettuce.core.dynamic.annotation.Param;

@Controller
public class test {

	@Autowired
	private IProductService<ProductModel> p;
	
	@Autowired
	private ICategoryService<CategoryModel> category; 
	
	@Autowired
	private ISwitchService<SwitchModel> switchs;
	
	@GetMapping("/test")
	public String test(@Param("thuonghieu") String thuonghieu, @Param("loai") String loai,@Param("gia") String gia,Model model) {
		List<ProductModel> product = p.getsp();
		String maThuongHieu=thuonghieu;
		String maSwitch=loai;
		String giaSP=gia;
		System.out.print(maThuongHieu +" ");
		System.out.print(maSwitch + " ");
		System.out.print(giaSP + "\n");
		List<ProductModel> result= null;
		Predicate<ProductModel> MaThuongHieu = pt -> pt.getMaLoai().equals(maThuongHieu);
		Predicate<ProductModel> MaLoaiSwitch = pt -> pt.getMaSwitch().equals(maSwitch);
		Predicate<ProductModel> GiaDuoi1Trieu = pt -> pt.getGiaSale() < 1000000;
		Predicate<ProductModel> GiaTu1Den2Trieu = pt -> pt.getGiaSale()>= 1000000 && pt.getGiaSale()<= 2000000;
		Predicate<ProductModel> GiaTu2Den3Trieu = pt -> pt.getGiaSale()>= 2000000 && pt.getGiaSale()<= 3000000;
		Predicate<ProductModel> GiaTren3Trieu = pt -> pt.getGiaSale()> 3000000;
		if(maThuongHieu!=null && maSwitch!=null)
		{
			if (maThuongHieu.length()>1&&maSwitch.length()>1)
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					filter(MaThuongHieu).collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
			else if (maThuongHieu.length()>1&&maSwitch.equals(""))
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					filter(MaThuongHieu).collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
			else if (maThuongHieu.equals("")&&maSwitch.length()>1)
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					filter(MaLoaiSwitch).collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
			else if (maThuongHieu.equals("")&&maSwitch.equals(""))
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
		}
		List<CategoryModel> dsloai = category.getLoai();
		List<SwitchModel> dsswitch = switchs.getSwitch();
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("dsswitch", dsswitch);
		if(result!=null)
		{
			for(ProductModel p:result)
			{
				System.out.print(p.getMaSP() + " " + p.getMaLoai() + " " + p.getMaSwitch() + " " + p.getGiaSale()+"\n");
			}
		}
		return "client/test";
	}
}
