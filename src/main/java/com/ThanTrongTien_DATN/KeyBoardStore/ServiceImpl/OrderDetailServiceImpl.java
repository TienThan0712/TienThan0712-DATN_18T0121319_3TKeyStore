package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.OrderDetailModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IOrderDetailService;

@Component
public class OrderDetailServiceImpl implements IOrderDetailService<OrderDetailModel> {

	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(OrderDetailServiceImpl.class);
	private JdbcTemplate jdbcTemplate;

	public OrderDetailServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<OrderDetailModel> getCTDH(long mahd) {
		String sql = "select hd.MaHD,cthd.MaCTHD , sp.TenSP, cthd.SoLuong, cthd.SoLuong * (sp.DonGia-(sp.DonGia*(sp.GiamGia/100.0))) as ThanhTien\r\n"
				+ "from HoaDon as hd inner join ChiTietHoaDon as cthd on hd.MaHD=cthd.MaHD\r\n"
				+ "	inner join SanPham as sp on sp.MaSP=cthd.MaSP\r\n"
				+ "where hd.MaHD="+mahd;
		List<OrderDetailModel> ds = jdbcTemplate.query(sql, new RowMapper<OrderDetailModel>() {
			@Override
			public OrderDetailModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderDetailModel ctdh = new OrderDetailModel();
				ctdh.setMaHD(rs.getLong("MaHD"));
				ctdh.setCTHD( rs.getLong("MaCTHD"));
				ctdh.setTenSP(rs.getString("TenSP"));
				ctdh.setSoLuong(rs.getInt("SoLuong"));
				ctdh.setThanhTien( rs.getLong("ThanhTien"));
				return ctdh;
			}
		});
		return ds;
	}
}
