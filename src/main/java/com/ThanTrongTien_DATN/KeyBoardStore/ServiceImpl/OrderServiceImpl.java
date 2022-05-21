package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderService;

@Component
public class OrderServiceImpl implements IOrderService<OrderModel> {
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);
	private JdbcTemplate jdbcTemplate;

	public OrderServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<OrderModel> getDonHangChoXN(long makh) {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where kh.MaKH="+makh+" and hd.TrangThai=0\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> DonHangChoXN() {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where hd.TrangThai=0\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> getDonHangChoTT(long makh) {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where kh.MaKH="+makh+" and hd.TrangThai=1\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> DonHangChoTT() {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where hd.TrangThai=1\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.NgayGiaoHang,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> getDonHangDaTT(long makh) {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT,hd.NgayGiaoHang\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where kh.MaKH="+makh+" and hd.TrangThai=2 or hd.TrangThai=3\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.NgayGiaoHang,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT order by hd.MaHD DESC";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setNgayGiaoHang(rs.getDate("NgayGiaoHang"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> DonHangDaTT() {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT, hd.NgayGiaoHang\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where hd.TrangThai=2 or hd.TrangThai=3 \r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.NgayGiaoHang,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setNgayGiaoHang(rs.getDate("NgayGiaoHang"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> getDonHangDaHuy(long makh) {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where kh.MaKH="+makh+" and hd.TrangThai=-1\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@Override
	public List<OrderModel> DonHangDaHuy() {
		String sql = "select hd.MaHD ,kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "	inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n" + "where hd.TrangThai=-1\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.TrangThai, hd.PTTT,kh.HoTen,kh.SoDT";
		List<OrderModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderModel>() {
			@Override
			public OrderModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderModel dh = new OrderModel();
				dh.setMaHD(rs.getLong("MaHD"));
				dh.setHoTen(rs.getString("HoTen"));
				dh.setSoDT(rs.getString("SoDT"));
				dh.setTongTien(rs.getLong("TongTien"));
				dh.setNgayMua(rs.getDate("NgayMua"));
				dh.setTrangThai(rs.getInt("TrangThai"));
				dh.setPTTT(rs.getString("PTTT"));
				return dh;
			}
		});
		return ds;
	}
	
	@SuppressWarnings({ "rawtypes", "deprecation", "unchecked" })
	@Override
	public OrderModel getDonHang(long madh) {
		OrderModel dh = new OrderModel();
		String sql="select hd.MaHD, kh.Email, kh.HoTen,kh.SoDT,sum(cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0)))) as TongTien,hd.NgayMua, hd.TrangThai, hd.PTTT\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "inner join SanPham as sp on cthd.MaSP=sp.MaSP\r\n"
				+ "inner join KhachHang as kh on kh.MaKH=hd.MaKH\r\n"
				+ "where hd.MaHD=?\r\n"
				+ "group by hd.MaHD,hd.NgayMua,hd.TrangThai, hd.PTTT,kh.Email,kh.HoTen,kh.SoDT";
		dh = (OrderModel) jdbcTemplate.queryForObject(sql, new Object[]{madh}, new BeanPropertyRowMapper(OrderModel.class));
		return dh;
	}
	
	@Override
	public int HuyDon(long madh) {
		return jdbcTemplate.update("update HoaDon set TrangThai='-1' where MaHD=?",madh);
	}
	
	@Override
	public int XacNhan(long madh) {
		return jdbcTemplate.update("update HoaDon set TrangThai='1' where MaHD=?",madh);
	}
	
	@Override
	public int ThanhToan(long madh) {
		return jdbcTemplate.update("update HoaDon set TrangThai='3' where MaHD=?",madh);
	}
	
	@Override
	public int NhanHang(long madh) {
		return jdbcTemplate.update("update HoaDon set TrangThai='2',NgayGiaoHang=GETDATE()  where MaHD=?",madh);
	}
}
