package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductCommentModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductCommentService;

@Component
public class ProductCommentServiceImpl implements IProductCommentService<ProductCommentModel> {

	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(ProductCommentServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public ProductCommentServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	@Cacheable(value="productComment")
	public List<ProductCommentModel> getComment() {
		String sql = "select * from DanhGia as dg inner join KhachHang as kh on dg.MaKhachHang=kh.MaKH";
		List<ProductCommentModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductCommentModel>() {
			@Override
			public ProductCommentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductCommentModel comment = new ProductCommentModel();
				comment.setMaDanhGia(rs.getLong("MaDanhGia"));
				comment.setMaSP(rs.getString("MaSP"));
				comment.setMaKhachHang(rs.getLong("MaKhachHang"));
				comment.setHoTen(rs.getString("HoTen"));
				comment.setNoiDung(rs.getString("NoiDung"));
				comment.setNgayThem(rs.getDate("NgayThem"));
				return comment;
			}
		});
		return ds;
	}
	
	@Override
	@Cacheable(value="productComment", key = "#maSP")
	public List<ProductCommentModel> getCommentProduct( String maSP) {
		String sql = "select * from DanhGia as dg inner join KhachHang as kh on dg.MaKhachHang=kh.MaKH where MaSP='" + maSP +"'";
		List<ProductCommentModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductCommentModel>() {
			@Override
			public ProductCommentModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductCommentModel comment = new ProductCommentModel();
				comment.setMaDanhGia(rs.getLong("MaDanhGia"));
				comment.setMaSP(rs.getString("MaSP"));
				comment.setMaKhachHang(rs.getLong("MaKhachHang"));
				comment.setHoTen(rs.getString("HoTen"));
				comment.setNoiDung(rs.getString("NoiDung"));
				comment.setNgayThem(rs.getDate("NgayThem"));
				return comment;
			}
		});
		return ds;
	}
	
	@SuppressWarnings({ "deprecation"})
	@Override
	@CachePut(value = "productComment")
	public int addComment(String MaSP,Long MaKhachHang,String NoiDung) {
		String sql = "select count(*) from DanhGia where MaKhachHang=? and MaSP=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {MaKhachHang,MaSP}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("insert into DanhGia (MaSP, MaKhachHang, NoiDung, NgayThem) values (?,?,?,GETDATE())", 
					MaSP,MaKhachHang,NoiDung );
		} else
			return 0;
	}
	
	@Override
	public int Delete (long maComment) {
		return jdbcTemplate.update("Delete DanhGia where MaDanhGia=?",maComment);
	}
	
	@Override
	@CacheEvict(value = "productComment", allEntries = true)
	public void deletecache()
	{
	}
}
