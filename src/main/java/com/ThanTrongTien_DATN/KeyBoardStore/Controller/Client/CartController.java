package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CartModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICartService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl.CartServiceImpl;

@Controller
@RequestMapping("/home")
public class CartController {
	
	@Autowired
	private ICartService<CartModel> cart;
	
	@Autowired
	public JavaMailSender emailSender;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@GetMapping("/cart")
	public String Cart(Model model) throws Exception {
		List<CategoryModel> dsloai = category.getLoai();
		model.addAttribute("dsloai", dsloai);
		return "client/cart";
	}
	
	@RequestMapping(value = "/cartDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String CartDetail(HttpServletRequest request, HttpServletResponse response,@Param("masp")String masp, @Param("anhsp")String anhsp, @Param("tensp")String tensp, @Param("gia")String gia,
			@Param("maspham")String maspham, @Param("name")String name, @Param("soluong")String soluong, @Param("sl")String sl, Model model) 
					throws Exception {
		HttpSession session = request.getSession();
		if(masp!=null)
		{
			CartServiceImpl gh= null;
			if(session.getAttribute("gh")==null)
			{
				gh = new CartServiceImpl(null);
				session.setAttribute("gh", gh); 
			}
			gh=(CartServiceImpl)session.getAttribute("gh");
			if(soluong!=null)
			{
				gh.Them(masp, anhsp, tensp, Long.parseLong(gia),(long)Long.parseLong(soluong));
			}
			else 
			{
				gh.Them(masp, anhsp, tensp, Long.parseLong(gia),(long)1);
			}
			session.setAttribute("count", gh.SoSP());
			session.setAttribute("gh", gh);
			return "redirect:/home/cart";
		}
		else if(maspham!=null)
		{
			CartServiceImpl gh=(CartServiceImpl)session.getAttribute("gh");
			if(request.getParameter("btnXoa")!=null)
			{
				gh.Xoa(maspham);
				if(gh.ds.size()==0) session.removeAttribute("gh");
				return "redirect:/home/cart";
			}
			if(request.getParameter("btnSua")!=null)
			{
				if (Long.parseLong(sl) <= 0)
				{
					request.setAttribute("tb", "Số lượng không hợp lệ");
					return "redirect:/home/cart";
				}
				else gh.Sua(maspham, Long.parseLong(sl));
			}
			 if(gh.ds.size()==0) 
				 session.removeAttribute("gh"); else
			 session.setAttribute("gh", gh); session.setAttribute("count", gh.SoSP());
			return "redirect:/home/cart";
		}
		else
		{
			if(name.equals("btnXoaAll"))
			{
				CartServiceImpl gh=(CartServiceImpl)session.getAttribute("gh");
				gh.XoaALL();
				session.removeAttribute("gh");
				session.setAttribute("count", gh.SoSP());
				return "redirect:/home/cart";
			}
		}
		return "redirect:/home/cart";
	}
	
	@RequestMapping(value = "/cartSubmit", method = {RequestMethod.GET, RequestMethod.POST})
	public String CartSubmit(HttpServletRequest request, HttpServletResponse respone) throws MessagingException {
		HttpSession session = request.getSession();
		CustomerModel kh = (CustomerModel) session.getAttribute("kh");
		if (kh!=null)
		{
			if(request.getParameter("btnXacNhan")!=null)
			{
				MimeMessage message = emailSender.createMimeMessage();
				message.setContent(message, "text/plain; charset=UTF-8");
				MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
				String html=" <h4>Đơn hàng của bạn đã được đặt thành công</h4>\r\n"
						+ "    <h4>Chúng tôi sẽ xác nhận và đơn hàng sẽ giao đến bạn trong 5-7 tới</h4>\r\n"
						+ "    <h4>-----THANK YOU-----</h4>";
				message.setContent(html, "text/html; charset=UTF-8");
		        
		        helper.setTo(kh.getEmail());
		        
		        helper.setSubject("ĐƠN HÀNG ĐÃ ĐƯỢC ĐẶT THÀNH CÔNG");

		        this.emailSender.send(message);
				CartServiceImpl gh = (CartServiceImpl) session.getAttribute("gh");
				List<CartModel> giohang = gh.ds;
				cart.themHoaDondao(kh.getMaKH());
				long maHD = cart.maHDVuaTao();
				cart.themCTHD(giohang, maHD);
				request.setAttribute("tb", "Đặt mua thành công");
				session.removeAttribute("gh");
				session.setAttribute("count", 0);
				return "client/cart";
			}
			else return "redirect:/home/cart";
		}
		return "redirect:/home/cart";
	}
	
}
