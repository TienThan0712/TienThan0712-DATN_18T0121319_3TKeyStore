package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderDetailModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderDetailService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderService;

@Controller
@RequestMapping("/home")
public class OrderController {

	@Autowired
	private IOrderService<OrderModel> order;
	
	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IOrderDetailService<OrderDetailModel> oderDetail;
	
	@RequestMapping(value = "/order", method = {RequestMethod.GET, RequestMethod.POST})
	public String Order(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		List<CategoryModel> dsloai = category.getLoai();
		request.setAttribute("dsloai", dsloai);
		CustomerModel kh = (CustomerModel)session.getAttribute("kh");
		List<OrderDetailModel> dsdonhang = null;
		String mahd = request.getParameter("mahd");
		if (mahd!=null)
		{
			if(request.getParameter("btnHuyDon")!=null)
			{
				order.HuyDon(Long.parseLong(mahd));
				request.setAttribute("tb", "Hủy đơn thành công");
			}
			if(request.getParameter("btnChiTiet")!=null)
			{
				String mahdon = mahd;
				dsdonhang = oderDetail.getCTDH(Long.parseLong(mahd));
				request.setAttribute("dsdonhang", dsdonhang);
				request.setAttribute("mahd", mahdon);
				return "client/orderDetail";
			}
			if(request.getParameter("btnNhanHang")!=null)
			{
				order.NhanHang(Long.parseLong(mahd));
				request.setAttribute("tb", "Xác nhận thành công");
			}
		}
		List<OrderModel> dsChoXN = order.getDonHangChoXN(kh.getMaKH());
		request.setAttribute("dsChoXN", dsChoXN);
		List<OrderModel> dsChoTT = order.getDonHangChoTT(kh.getMaKH());
		request.setAttribute("dsChoTT", dsChoTT);
		List<OrderModel> dsDaTT = order.getDonHangDaTT(kh.getMaKH());
		request.setAttribute("dsDaTT", dsDaTT);
		List<OrderModel> dsDaHuy = order.getDonHangDaHuy(kh.getMaKH());
		request.setAttribute("dsDaHuy", dsDaHuy);
		return "client/orderInfo";
	}
}
