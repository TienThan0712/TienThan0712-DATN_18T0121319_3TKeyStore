package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderDetailModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderDetailService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;


@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	
	@Autowired
	private IOrderService<OrderModel> order;
	
	@Autowired
	private IOrderDetailService<OrderDetailModel> orderDetail;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> product;
	
	@Autowired
	public JavaMailSender emailSender;
	
	@GetMapping("/orderWaiting")
	public String OrderWaitingView (HttpServletRequest request, Model model, @Param("mahd")String mahd, @Param("name") String name) throws MessagingException {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		Locale localeEN = new Locale("en", "EN");
		NumberFormat en = NumberFormat.getInstance(localeEN);
		if (ad!=null)
		{
			List<OrderModel> dsdh = order.DonHangChoXN();
			model.addAttribute("dsdh",dsdh);
			if(mahd!=null)
			{
				if(name.equals("btnHuyDon"))
				{
					order.HuyDon(Long.parseLong(mahd));
					dsdh = order.DonHangChoXN();
					MimeMessage message = emailSender.createMimeMessage();
					message.setContent(message, "text/plain; charset=UTF-8");
					MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
					String html = " <h4>Đơn hàng của bạn đã được huỷ theo yêu cầu</h4>\r\n"
							+ "    <h4>Đơn hàng của bạn có mã:"+mahd+"</h4>\r\n"
							
							+ "    <h4>----THANK YOU----</h4>\r\n";
					message.setContent(html, "text/html; charset=UTF-8");
			        
			        helper.setTo("thanlong776@gmail.com");
			        
			        helper.setSubject("ĐƠN HÀNG ĐÃ ĐƯỢC HỦY");

			        this.emailSender.send(message);
					model.addAttribute("dsdh",dsdh);
					model.addAttribute("link", "order");
					model.addAttribute("linkorder", "orderWaitingList");
					return "admin/orderWaiting";
				}
				if(name.equals("btnXacNhan"))
				{
					order.XacNhan(Long.parseLong(mahd));
					OrderModel dh = order.getDonHang(Long.parseLong(mahd));
					dsdh = order.DonHangChoXN();
					MimeMessage message = emailSender.createMimeMessage();
					message.setContent(message, "text/plain; charset=UTF-8");
					MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
					List<OrderDetailModel> dsctdh = orderDetail.getCTDH(Long.parseLong(mahd));
					String html = " <h4>Đơn hàng của bạn đã được xác nhận</h4>\r\n"
							+ "    <h4>Đơn hàng của bạn có mã:"+mahd+"</h4>\r\n"
							+ "    <h4>Chi tiết đơn hàng:</h4>\r\n"
							+ "    <table style=\" border:1px solid black;\">\r\n"
							+ "        <tr style=\" border:1px solid black;\">\r\n"
							+ "            <th class=\"center\" style=\" border:1px solid black;\">Tên sản phẩm</th>\r\n"
							+ "            <th class=\"center\" style=\" border:1px solid black;\">Số lượng</th>\r\n"
							+ "            <th class=\"center\" style=\" border:1px solid black;\">Thành tiền</th>\r\n"
							+ "        </tr>" ;
					for (OrderDetailModel ctdh : dsctdh) 
					{  
						String html1 =" <tr>\r\n"
								+ "            <td class=\"center\" style=\" border:1px solid black;\"> "+ctdh.getTenSP()+"</td>\r\n"
								+ "            <td class=\"center\" style=\" border:1px solid black;\"> "+ctdh.getSoLuong()+"</td>\r\n"
								+ "            <td class=\"center\" style=\" border:1px solid black;\"> "+en.format(ctdh.getThanhTien())+" đ</td>\r\n"
								+ "        </tr>\r\n" ;
						html +=html1;
					}
					html += "    </table>\r\n"
							+ "    <h4>Họ tên khách hàng: "+dh.getHoTen()+"</h4>\r\n"
							+ "    <h4>Ngày mua: "+dh.getNgayMua()+"</h4>\r\n"
							+ "    <h4>Tổng số tiền: "+en.format(dh.getTongTien())+" đ</h4>\r\n"
							+ "    <h4>Thông tin chuyển khoản: 123456789</h4>\r\n"
							+ "    <h4>Ngân hàng: VietinBank chi nhánh Huế</h4>\r\n"
							+ "    <h4>Nội dung chuyển khoản: [Mã hóa đơn] + [Họ tên khách hàng]</h4>\r\n"
							+ "    <h4>Đơn hàng sẽ được giao đến bạn trong 5-7 ngày</h4>\r\n"
							+ "    <h4>-----THANK YOU-----</h4>";
					message.setContent(html, "text/html; charset=UTF-8");
			        
			        helper.setTo("thanlong776@gmail.com");
			        
			        helper.setSubject("ĐƠN HÀNG ĐÃ ĐƯỢC XÁC NHẬN");

			        this.emailSender.send(message);
			        
					model.addAttribute("dsdh",dsdh);
					model.addAttribute("link", "order");
					model.addAttribute("linkorder", "orderWaitingList");
					return "admin/orderWaiting";
				}
			}
			model.addAttribute("link", "order");
			model.addAttribute("linkorder", "orderWaitingList");
			return "admin/orderWaiting";
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
	
	@GetMapping("/orderPayment")
	public String OrderPaymentView (HttpServletRequest request, Model model, @Param("mahd")String mahd, @Param("name") String name) throws MessagingException {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		Locale localeEN = new Locale("en", "EN");
		NumberFormat en = NumberFormat.getInstance(localeEN);
		if (ad!=null)
		{
			List<OrderModel> dsdh = order.DonHangChoTT();
			model.addAttribute("dsdh",dsdh);
			if(mahd!=null)
			{
				if(name.equals("btnXNTT"))
				{
					order.ThanhToan(Long.parseLong(mahd));
					dsdh = order.DonHangChoTT();
					OrderModel dh = order.getDonHang(Long.parseLong(mahd));
					MimeMessage message = emailSender.createMimeMessage();
					message.setContent(message, "text/plain; charset=UTF-8");
					MimeMessageHelper helper = new MimeMessageHelper(message,"UTF-8");
					String html=" <h4>Đơn hàng của bạn đã được thanh toán</h4>\r\n"
							+ "    <h4>Thông tin đơn hàng mã: "+dh.getMaHD()+"</h4>\r\n"
							+ "    <h4>Họ tên khách hàng: "+dh.getHoTen()+"</h4>\r\n"
							+ "    <h4>Ngày mua: "+dh.getNgayMua()+"</h4>\r\n"
							+ "    <h4>Tổng số tiền: "+en.format(dh.getTongTien())+" đ</h4>\r\n"
							+ "    <h4>Đơn hàng sẽ được giao đến bạn trong 5-7 ngày</h4>\r\n"
							+ "    <h4>-----THANK YOU-----</h4>";
					message.setContent(html, "text/html; charset=UTF-8");
			        
			        helper.setTo("thanlong776@gmail.com");
			        
			        helper.setSubject("ĐƠN HÀNG ĐÃ ĐƯỢC THANH TOÁN");

			        this.emailSender.send(message);
					model.addAttribute("dsdh",dsdh);
					model.addAttribute("link", "order");
					model.addAttribute("linkorder", "orderPaymentList");
					return "admin/orderPayment";
				}
			}
			model.addAttribute("link", "order");
			model.addAttribute("linkorder", "orderPaymentList");
			return "admin/orderPayment";
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
	
	@GetMapping("/orderDone")
	public String OrderDoneView (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<OrderModel> dsdh = order.DonHangDaTT();
			model.addAttribute("dsdh",dsdh);
			model.addAttribute("link", "order");
			model.addAttribute("linkorder", "orderDoneList");
			return "admin/orderDone";
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
	
	@GetMapping("/orderCancel")
	public String OrderCancelView (HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<OrderModel> dsdh = order.DonHangDaHuy();
			model.addAttribute("dsdh",dsdh);
			model.addAttribute("link", "order");
			model.addAttribute("linkorder","orderCancelList");
			return "admin/orderCancel";
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
	
	@GetMapping("/orderDetail")
	public String OrderDetail(HttpServletRequest request, Model model, @Param("mahd")String mahd, @Param("name") String name) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			if(mahd!=null)
			{
				if(name.equals("btnChiTiet"))
				{
					List<OrderDetailModel> dsdonhang = orderDetail.getCTDH(Long.parseLong(mahd));
					model.addAttribute("dsdonhang", dsdonhang);
					return "admin/orderDetail";
				}
			}
			return "admin/orderDetail";
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


