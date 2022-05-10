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

import com.ThanTrongTien_DATN.KeyBoardStore.Model.BrandModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IBrandService;

@Component
public class BrandServiceImpl implements IBrandService<BrandModel> {
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(BrandServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public BrandServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<BrandModel> getThuonghieu() {
		String sql = "select * from ThuongHieu";
		List<BrandModel> sps = jdbcTemplate.query(sql, new RowMapper<BrandModel>() {
			@Override
			public BrandModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				BrandModel th = new BrandModel();
				th.setMath(rs.getString("MaThuongHieu"));
				th.setTenth(rs.getString("TenThuongHieu"));
				return th;
			}
		});
		return sps;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public int addBrand(String math, String tenth) {
		String sql = "select count(*) from ThuongHieu where MaThuongHieu=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {math}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("insert into ThuongHieu (MaThuongHieu,TenThuongHieu) values (?,?)", math, tenth);
		} else
			return 0;
	}
	@SuppressWarnings({ "deprecation" })
	@Override
	public int deleteBrand(String math) {
		String sql = "select count(*) from ThuongHieu inner join SanPham on ThuongHieu.MaThuongHieu = SanPham.MaThuongHieu where ThuongHieu.MaThuongHieu = ? ";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {math}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("Delete ThuongHieu where MaThuongHieu=?", math);
		} else
			return 0;
	}
	
	@SuppressWarnings({ "deprecation" })
	@Override
	public int editBrand(String math, String tenth) {
		String sql = "select count(*) from ThuongHieu where TenThuongHieu=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {tenth}, Integer.class);
		if (count >= 1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("Update ThuongHieu SET TenThuongHieu =? WHERE MaThuongHieu = ?", tenth,math);
		} else
			return 0;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes", "unchecked" })
	@Override
	public BrandModel getMotTH (String math) {
		BrandModel th = new BrandModel();
		String sql="select * from ThuongHieu where MaThuongHieu=?";
		th= (BrandModel) jdbcTemplate.queryForObject(sql, new Object[]{math}, new BeanPropertyRowMapper(CategoryModel.class));
		return th;
	}
}
