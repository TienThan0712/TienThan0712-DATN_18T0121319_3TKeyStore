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
			@RequestParam(value = "g-recaptcha-response") String capChaResponse, @Param("user") String user,
			@Param("pass") String pass, @Param("check") String check, Model model) {
		HttpSession session = request.getSession();
		CustomerModel kh = customer.ktdn(user);
		AdminModel ad = admin.ktdn(user);
		if (user != null) {
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
					session.setAttribute("kh", kh);
					if (check != null && check.equals("on")) {
						Cookie username = new Cookie("username", kh.getUserName());
						username.setMaxAge(7 * 24 * 60 * 60);
						username.setSecure(true);
						username.setHttpOnly(true);
						reponse.addCookie(username);
					}
					return "redirect:/home";
				} else {
					request.setAttribute("tb", "Tài khoản hoặc mật khẩu sai");
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
					request.setAttribute("tb", "Tài khoản hoặc mật khẩu sai");
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
	public String LoginCart(HttpServletRequest request, HttpServletResponse reponse, @Param("user") String user,
			@Param("pass") String pass,@RequestParam(value = "g-recaptcha-response") String capChaResponse, Model model) {
		HttpSession session = request.getSession();
		CustomerModel kh = customer.ktdn(user);
		if (user != null) {
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
					request.setAttribute("tb", "Tài khoản hoặc mật khẩu sai");
					return "redirect:/admin";
				}
			} else {
				request.setAttribute("tb", "Tài khoản hoặc mật khẩu sai");
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
	public String ResetPass(HttpServletRequest request, HttpServletResponse reponse, @Param("user") String user,
			@Param("email") String email, Model model) throws MessagingException {
		int count = customer.CheckUser(user, email);
		if (count >= 1) {
			customer.ResetPassword(user, email);
			MimeMessage message = emailSender.createMimeMessage();
			message.setContent(message, "text/plain; charset=UTF-8");
			MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
			String html = " <h4>Mật khẩu của bạn đã được đặt lại thành công</h4>\r\n" + "    <h4>Tên tài khoản: " + user
					+ "</h4>\r\n" + "    <h4>Mật khẩu: 123456</h4>\r\n"
					+ "    <h4>Chú ý thay đổi sang mật khẩu khác sau khi đăng nhập vào website</h4>\r\n"
					+ "    <h4>-----THANK YOU-----</h4>";
			message.setContent(html, "text/html; charset=UTF-8");

			helper.setTo(email);

			helper.setSubject("XÁC NHẬN QUÊN MẬT KHẨU");

			this.emailSender.send(message);
		} else {
			request.setAttribute("tb", "Tên đăng nhập hoặc Email bị sai");
		}
		List<CategoryModel> dsloai = category.getLoai();
		model.addAttribute("dsloai", dsloai);
		return "client/password";
	}
}
