package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CartModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICartService;

@Component
public class CartServiceImpl implements ICartService<CartModel> {
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(CartServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public CartServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public ArrayList<CartModel> ds = new ArrayList<CartModel>();

	@Override
	public void Them(String masp, String anhsp, String tensp, Long gia, Long soLuong) {
		for (CartModel g : ds) {
			if (g.getMaSP().equals(masp)) {
				g.setSoLuong(g.getSoLuong() + soLuong);
				return;
			}
		}
		ds.add(new CartModel(masp, anhsp, tensp, gia, soLuong));
	}

	@Override
	public void Sua(String masp, long sl) {
		for (CartModel g : ds) {
			if (g.getMaSP().equals(masp)) {
				g.setSoLuong(sl);
				return;
			}
		}
	}

	@Override
	public Long TongTien() {
		long s = 0;
		for (CartModel g : ds)
			s = s + g.getThanhTien();
		return s;
	}

	@SuppressWarnings("unused")
	@Override
	public Long SoSP() {
		long s = 0;
		for (CartModel g : ds)
			s++;
		return s;
	}

	@Override
	public void Xoa(String masp) {
		for (CartModel g : ds) {
			if (g.getMaSP().equals(masp)) {
				ds.remove(g);
				return;
			}
		}
	}

	@Override
	public void XoaALL() {
		ds.removeAll(ds);
		return;
	}

	@Override
	public int themHoaDondao(Long makh){
		return jdbcTemplate.update("INSERT dbo.HoaDon (MaKH, NgayMua, TrangThai) VALUES (?, GETDATE(), 0)",makh);
	}
	
	@Override
	public int themCTHDdao(String masp, long soluong, long mahd) {
		return jdbcTemplate.update("INSERT dbo.ChiTietHoaDon (MaHD, MaSP, SoLuong)  VALUES (?,?,?)",mahd,masp,soluong);
	}

	public void themCTHD (List<CartModel> dsgiohang, long maHD)
	{
		for (CartModel hang:dsgiohang)
		{
			themCTHDdao(hang.getMaSP(), hang.getSoLuong(), maHD);
		}
	}
	
	@Override
	public long maHDVuaTao() {
		long maHDVuaTao = 0;
		String sql = "SELECT MAX(MaHD) MaHD FROM dbo.HoaDon";
		@SuppressWarnings("deprecation")
		OrderModel dh = (OrderModel) jdbcTemplate.queryForObject(sql, new Object[] {}, new BeanPropertyRowMapper<OrderModel>(OrderModel.class));
		maHDVuaTao = dh.getMaHD();
		return maHDVuaTao;
	}
}
