package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IRevenueProductService;

@Component
public class RevenueProductServiceImpl implements IRevenueProductService<RevenueProductModel> {
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(RevenueProductServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public RevenueProductServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<RevenueProductModel> getRevenueProduct(){
		String sql="select distinct sp.MaSP, sp.TenSP, sp.AnhSP, count(cthd.MaSP) as SoLuong, sum(cthd.SoLuong*cthd.ThanhTien) as TongTien\r\n"
				+ "from SanPham as sp inner join ChiTietHoaDon as cthd on sp.MaSP=cthd.MaSP\r\n"
				+ "group by sp.MaSP, sp.TenSP, sp.AnhSP";
		List<RevenueProductModel> RPlist = jdbcTemplate.query(sql, new RowMapper<RevenueProductModel>() {
			@Override
			public RevenueProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				RevenueProductModel rd = new RevenueProductModel();
				rd.setMaSP(rs.getString("MaSP"));
				rd.setTenSP(rs.getString("TenSP"));
				rd.setAnhSP(rs.getString("AnhSP"));
				rd.setSoLuong(rs.getInt("SoLuong"));
				rd.setTongTien(rs.getLong("TongTien"));
				return rd;
			}
		});
		return RPlist;
	}


}
