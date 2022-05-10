package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Component
public class ProductServiceImpl implements IProductService<ProductModel> {
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(ProductServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public ProductServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	@Cacheable(value = "products")
	public List<ProductModel> getsp() {
		String sql = "select MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai ";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}

	@Override
	@Cacheable(value = "productsNew")
	public List<ProductModel> getspmoi() {
		String sql = "select top(12) MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai order by NgayThem desc";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}

	@Override
	public List<ProductModel> get8spmoi() {
		String sql = "select top(8) MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai order by NgayThem desc";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}

	@Override
	@Cacheable(value = "productsHot")
	public List<ProductModel> getsphot() {
		String sql = "select top(12)MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai where GiamGia=25";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}

	@Override
	public List<ProductModel> get8sphot() {
		String sql = "select top(8) MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai where GiamGia=25";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}
	
	@Override
	@Cacheable(value = "productsCategory")
	public List<ProductModel> getCategory(String MaLoai) {
		String sql = "select MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai where sp.MaLoai='"+MaLoai+"'";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}
	
	@Override
	public List<ProductModel> get8Category(String MaLoai) {
		String sql = "select top(8)MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai where sp.MaLoai='"+MaLoai+"'";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}
	
	@Override
	@Cacheable(value = "products")
	public List<ProductModel> search(String Key) {
		String sql = "select MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai where TenSP like'%"+Key+"%'";
		List<ProductModel> ds = jdbcTemplate.query(sql, new RowMapper<ProductModel>() {
			@Override
			public ProductModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProductModel sp = new ProductModel();
				sp.setMaSP(rs.getString("MaSP"));
				sp.setAnhSP(rs.getString("AnhSP"));
				sp.setTenSP(rs.getString("TenSP"));
				Long dongia = rs.getLong("DonGia");
				sp.setDonGia(dongia);
				Integer giamgia = rs.getInt("GiamGia");
				sp.setGiamGia(giamgia);
				Long giasale = (long) (dongia - ( dongia *( (double)giamgia/(double)100)));
				sp.setGiaSale(giasale);
				sp.setMaLoai(rs.getString("MaLoai"));
				sp.setTenLoai(rs.getString("TenLoai"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}
	
	
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	@Override
	@Cacheable(value = "products", key = "#MaSP")
	public ProductModel get1sp(String MaSP) {
		ProductModel sp = new ProductModel();
		String sql="select MaSP, AnhSP, TenSP, DonGia, GiamGia, sp.MaLoai, TenLoai,NgayThem,MoTa from SanPham as sp inner join LoaiSP as lsp on sp.MaLoai = lsp.MaLoai where MaSP=?";
		sp =  (ProductModel) jdbcTemplate.queryForObject(sql, new Object[] {MaSP}, new BeanPropertyRowMapper(ProductModel.class));
		Long giasale = (long) (sp.getDonGia() - ( sp.getDonGia() *( (double)sp.getGiamGia()/(double)100)));
		sp.setGiaSale(giasale);
		return sp;
	}
	
	
	@SuppressWarnings("deprecation")
	@Override
	@CachePut(value = "products")
	public int addProduct(String MaSP,String AnhSP,String TenSP, Long DonGia ,Integer GiamGia, String MaLoai,java.util.Date NgayThem,String MoTa) {
		String sql = "select count(*) from SanPham where MaSP=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {MaSP}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("insert into SanPham (MaSP, AnhSP, TenSP, DonGia, GiamGia, MaLoai, NgayThem, MoTa) values (?,?,?,?,?,?,?,?)", 
					MaSP, AnhSP, TenSP, DonGia, GiamGia, MaLoai, new java.sql.Date(NgayThem.getTime()),MoTa);
		} else
			return 0;
	}
	
	@Override
	public int deleteProduct(String MaSP) {
		int kq = jdbcTemplate.update("Delete SanPham where MaSP=?", MaSP);
		return kq;
	}
	
	
	@Override
	public int editProductInfo(String MaSP,String AnhSP,String TenSP, Long DonGia ,Integer GiamGia, String MaLoai,java.util.Date NgayThem,String MoTa) {
		return jdbcTemplate.update("Update SanPham set TenSP=?, AnhSP=?,DonGia=?, GiamGia=?, MaLoai=?, NgayThem=?, MoTa=? where MaSP=?", 
				TenSP,AnhSP ,DonGia, GiamGia, MaLoai, new java.sql.Date(NgayThem.getTime()),MoTa,MaSP);
	}
	
	@Override
	public int editProductInfoNotImage(String MaSP,String TenSP, Long DonGia ,Integer GiamGia, String MaLoai,java.util.Date NgayThem,String MoTa) {
		System.out.print("edit product");
		return jdbcTemplate.update("Update SanPham set TenSP=?,DonGia=?, GiamGia=?, MaLoai=?, NgayThem=?, MoTa=? where MaSP=?", 
				TenSP,DonGia, GiamGia, MaLoai, new java.sql.Date(NgayThem.getTime()),MoTa,MaSP);
	}
	
	@Override
	@CacheEvict(value = "products", allEntries = true)
	public void clearCatche()
	{
	}
}
