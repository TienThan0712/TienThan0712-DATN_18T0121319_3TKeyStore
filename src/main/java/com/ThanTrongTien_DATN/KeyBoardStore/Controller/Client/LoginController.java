package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.GoogleCapchaService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IAdminService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Controller
@RequestMapping("/home")
public class LoginController {

	@Autowired
	private ICustomerService<CustomerModel> customer;

	@Autowired
	private IAdminService<AdminModel> admin;

	@Autowired
	private ICategoryService<CategoryModel> category;

	@Autowired
	private IProductService<ProductModel> product;

	@Autowired
	public JavaMailSender emailSender;

	@Autowired
	private GoogleCapchaService capchaService;

	@GetMapping("/login")
	public String Login(HttpServletRequest request, HttpServletResponse reponse,
			@RequestParam(value = "g-recaptcha-response") String capChaResponse, @Param("email") String email,
			@Param("pass") String pass, @Param("check") String check, Model model) {
		HttpSession session = request.getSession();
		CustomerModel kh = customer.ktdn(email);
		AdminModel ad = admin.ktdn(email);
		if (email != null) {
			if (kh != null) {
				if (!capchaService.verifyGoogleCapcha(capChaResponse)) {
					request.setAttribute("tb", "Google Capcha Fail");
					List<CategoryModel> dsloai = category.getLoai();
					List<ProductModel> dsspmoi = product.get8spmoi();
					List<ProductModel> dssphot = product.get8sphot();
					model.addAttribute("dsloai", dsloai);
					model.addAttribute("dsspmoi", dsspmoi);
					model.addAttribute("dssphot", dssphot);
					return "client/index";
				}
				if (BCrypt.checkpw(pass, kh.getPass())) {
					if (kh.getTrangThai() == 1)
					{
						session.setAttribute("kh", kh);
						if (check != null && check.equals("on")) {
							Cookie username = new Cookie("username", kh.getEmail());
							username.setMaxAge(7 * 24 * 60 * 60);
							username.setSecure(true);
							username.setHttpOnly(true);
							reponse.addCookie(username);
						}
						return "redirect:/home";
					}
					else 
					{
						request.setAttribute("tb", "T??i kho???n c???a b???n ???? b??? kh??a");
						List<CategoryModel> dsloai = category.getLoai();
						List<ProductModel> dsspmoi = product.get8spmoi();
						List<ProductModel> dssphot = product.get8sphot();
						model.addAttribute("dsloai", dsloai);
						model.addAttribute("dsspmoi", dsspmoi);
						model.addAttribute("dssphot", dssphot);
						return "client/index";
					}
				} else {
					request.setAttribute("tb", "T??i kho???n ho???c m???t kh???u sai");
					List<CategoryModel> dsloai = category.getLoai();
					List<ProductModel> dsspmoi = product.get8spmoi();
					List<ProductModel> dssphot = product.get8sphot();
					model.addAttribute("dsloai", dsloai);
					model.addAttribute("dsspmoi", dsspmoi);
					model.addAttribute("dssphot", dssphot);
					return "client/index";
				}
			}
			if (ad != null) {
				if (!capchaService.verifyGoogleCapcha(capChaResponse)) {
					model.addAttribute("YOu have failed in Google Capcha");
					return "client/index";
				}
				if (BCrypt.checkpw(pass, ad.getPassword())) {
					session.setAttribute("ad", ad);
					return "redirect:/admin";
				} else {
					request.setAttribute("tb", "T??i kho???n ho???c m???t kh???u sai");
					List<CategoryModel> dsloai = category.getLoai();
					List<ProductModel> dsspmoi = product.get8spmoi();
					List<ProductModel> dssphot = product.get8sphot();
					model.addAttribute("dsloai", dsloai);
					model.addAttribute("dsspmoi", dsspmoi);
					model.addAttribute("dssphot", dssphot);
					return "client/index";
				}

			}
		}
		List<CategoryModel> dsloai = category.getLoai();
		List<ProductModel> dsspmoi = product.get8spmoi();
		List<ProductModel> dssphot = product.get8sphot();
		model.addAttribute("dsloai", dsloai);
		model.addAttribute("dsspmoi", dsspmoi);
		model.addAttribute("dssphot", dssphot);
		return "client/index";
	}

	@PostMapping("/loginCart")
	public String LoginCart(HttpServletRequest request, HttpServletResponse reponse, @Param("email") String email,
			@Param("pass") String pass,@RequestParam(value = "g-recaptcha-response") String capChaResponse, Model model) {
		HttpSession session = request.getSession();
		CustomerModel kh = customer.ktdn(email);
		if (email != null) {
			if (!capchaService.verifyGoogleCapcha(capChaResponse)) {
				request.setAttribute("tb", "Google Capcha Fail");
				List<CategoryModel> dsloai = category.getLoai();
				List<ProductModel> dsspmoi = product.get8spmoi();
				List<ProductModel> dssphot = product.get8sphot();
				model.addAttribute("dsloai", dsloai);
				model.addAttribute("dsspmoi", dsspmoi);
				model.addAttribute("dssphot", dssphot);
				return "client/index";
			}
			if (kh != null) {
				if (BCrypt.checkpw(pass, kh.getPass())) {
					session.setAttribute("kh", kh);
					return "redirect:/home/cart";
				} else {
					request.setAttribute("tb", "T??i kho???n ho???c m???t kh???u sai");
					return "redirect:/home/cart";
				}
			} else {
				request.setAttribute("tb", "T??i kho???n ho???c m???t kh???u sai");
			}
		}
		return "client/cart";
	}

	@GetMapping("/password")
	public String PassWord(Model model) {
		List<CategoryModel> dsloai = category.getLoai();
		model.addAttribute("dsloai", dsloai);
		return "client/password";
	}

	@PostMapping("/resetPassword")
	public String ResetPass(HttpServletRequest request, HttpServletResponse reponse,
			@Param("email") String email, Model model) throws MessagingException {
		int count = customer.CheckUser(email);
		if (count >= 1) {
			customer.ResetPassword(email);
			MimeMessage message = emailSender.createMimeMessage();
			message.setContent(message, "text/plain; charset=UTF-8");
			MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
			String html = " <h4>M???t kh???u c???a b???n ???? ???????c ?????t l???i th??nh c??ng</h4>\r\n"
					+ "</h4>\r\n" + "    <h4>M???t kh???u: 123456</h4>\r\n"
					+ "    <h4>Ch?? ?? thay ?????i sang m???t kh???u kh??c sau khi ????ng nh???p v??o website</h4>\r\n"
					+ "    <h4>-----THANK YOU-----</h4>";
			message.setContent(html, "text/html; charset=UTF-8");
			helper.setTo(email);
			helper.setSubject("X??C NH???N QU??N M???T KH???U");
			this.emailSender.send(message);
			request.setAttribute("tb", "X??c nh???n qu??n m???t kh???u. Vui l??ng ki???m tra Email");
			List<ProductModel> dsspmoi = product.get8spmoi();
			List<ProductModel> dssphot = product.get8sphot();
			List<CategoryModel> dsloai = category.getLoai();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			return "client/index";
			
		} else {
			request.setAttribute("tb", "Email b??? sai");
		}
		List<CategoryModel> dsloai = category.getLoai();
		model.addAttribute("dsloai", dsloai);
		return "client/password";
	}
}
