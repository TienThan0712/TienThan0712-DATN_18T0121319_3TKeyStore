package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminBrandController {

	@GetMapping("/brand")
	public String Brand() {
		return "admin/brand";
	}
	@GetMapping("/addbrand")
	public String addBrand() {
		return "admin/addBrand";
	}
	@GetMapping("/editbrand")
	public String editBrand() {
		return "admin/editBrand";
	}
}
