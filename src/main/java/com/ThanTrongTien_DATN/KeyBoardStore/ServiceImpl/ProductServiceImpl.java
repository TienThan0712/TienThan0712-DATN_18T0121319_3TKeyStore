package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
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
		String sql = "select MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n"
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		System.out.print("lay ds \n");
		Collections.shuffle(ds);
		return ds;
	}

	@Override
	@Cacheable(value = "productsNew")
	public List<ProductModel> getspmoi() {
		String sql = "select top(12) MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n"
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch order by NgayThem desc";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}

	@Override
	public List<ProductModel> get8spmoi() {
		String sql = "select top(8) MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n "
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch order by NgayThem desc";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
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
		String sql = "select top(12) MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n"
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch where GiamGia=25";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}

	@Override
	public List<ProductModel> get8sphot() {
		String sql = "select top(8) MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n "
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch where GiamGia=25";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
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
		String sql = "select MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n "
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch where sp.MaLoai='"+MaLoai+"'";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}
	
	@Override
	public List<ProductModel> get8Category(String MaLoai) {
		String sql = "select top(8) MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n "
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch where sp.MaLoai='"+MaLoai+"'";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
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
		String sql = "select MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n "
				+ "from SanPham as sp inner join freetexttable(SanPham,TenSP,'"+Key+"') as KEY_TBL on sp.MaSP = KEY_TBL.[KEY] inner join LoaiSP on sp.MaLoai = LoaiSP.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch\r\n"
				+ "order by KEY_TBL.RANK DESC\r\n"
				+ "";
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
				sp.setMaSwitch(rs.getString("MaSwitch"));
				sp.setTenSwitch(rs.getString("TenSwitch"));
				sp.setNgayThem(rs.getDate("NgayThem"));
				sp.setMoTa(rs.getString("MoTa"));
				return sp;
			}
		});
		return ds;
	}
	
	@Override
	public List<ProductModel> searchBuFilter (List<ProductModel> product, String maThuongHieu, String maSwitch, String giaSP)
	{
		List<ProductModel> result= null;
		Predicate<ProductModel> MaThuongHieu = pt -> pt.getMaLoai().equals(maThuongHieu);
		Predicate<ProductModel> MaLoaiSwitch = pt -> pt.getMaSwitch().equals(maSwitch);
		Predicate<ProductModel> GiaDuoi1Trieu = pt -> pt.getGiaSale() < 1000000;
		Predicate<ProductModel> GiaTu1Den2Trieu = pt -> pt.getGiaSale()>= 1000000 && pt.getGiaSale()<= 2000000;
		Predicate<ProductModel> GiaTu2Den3Trieu = pt -> pt.getGiaSale()>= 2000000 && pt.getGiaSale()<= 3000000;
		Predicate<ProductModel> GiaTren3Trieu = pt -> pt.getGiaSale()> 3000000;
		if(maThuongHieu!=null && maSwitch!=null)
		{
			if (maThuongHieu.length()>1&&maSwitch.length()>1)
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(MaLoaiSwitch).filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
			else if (maThuongHieu.length()>1&&maSwitch.equals(""))
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					filter(MaThuongHieu).collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(MaThuongHieu).filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
			else if (maThuongHieu.equals("")&&maSwitch.length()>1)
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					filter(MaLoaiSwitch).collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(MaLoaiSwitch).filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
			else if (maThuongHieu.equals("")&&maSwitch.equals(""))
			{
				switch(giaSP)
				{
				case "":
					result = product.stream().
					collect(Collectors.toList());
					break;
				case "duoi-1-trieu":
					result = product.stream().
					filter(GiaDuoi1Trieu).collect(Collectors.toList());
					break;
				case "1-trieu-toi-2-trieu":
					result = product.stream().
					filter(GiaTu1Den2Trieu).collect(Collectors.toList());
					break;
				case "2-trieu-toi-3-trieu":
					result = product.stream().
					filter(GiaTu2Den3Trieu).collect(Collectors.toList());
					break;
				case "tren-3-trieu":
					result = product.stream().
					filter(GiaTren3Trieu).collect(Collectors.toList());
					break;
				}
			}
		}
		return result;
	}
	
	
	@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
	@Override
	@Cacheable(value = "products", key = "#MaSP")
	public ProductModel get1sp(String MaSP) {
		ProductModel sp = new ProductModel();
		String sql="select MaSP,AnhSP,TenSP,DonGia,GiamGia,sp.MaLoai,sp.MaSwitch, NgayThem, SoLuong, MoTa, TenLoai, TenSwitch \r\n "
				+ "from SanPham as sp inner join LoaiSP as l on sp.MaLoai = l.MaLoai inner join Switch as s on sp.MaSwitch=s.MaSwitch where MaSP=?";
		sp =  (ProductModel) jdbcTemplate.queryForObject(sql, new Object[] {MaSP}, new BeanPropertyRowMapper(ProductModel.class));
		Long giasale = (long) (sp.getDonGia() - ( sp.getDonGia() *( (double)sp.getGiamGia()/(double)100)));
		sp.setGiaSale(giasale);
		System.out.print("lay ctds \n");
		return sp;
	}
	
	
	@SuppressWarnings("deprecation")
	@Override
	@CachePut(value = "products", key = "#MaSP")
	public int addProduct(String MaSP,String AnhSP,String TenSP, Long DonGia ,Integer GiamGia, String MaLoai,String MaSwitch,java.util.Date NgayThem,String MoTa) {
		String sql = "select count(*) from SanPham where MaSP=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {MaSP}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("insert into SanPham (MaSP, AnhSP, TenSP, DonGia, GiamGia, MaLoai,MaSwitch, NgayThem, MoTa) values (?,?,?,?,?,?,?,?,?)", 
					MaSP, AnhSP, TenSP, DonGia, GiamGia, MaLoai,MaSwitch ,new java.sql.Date(NgayThem.getTime()),MoTa);
		} else
			return 0;
	}
	
	@Override
	@CacheEvict(value = "products", key = "#MaSP")
	public int deleteProduct(String MaSP) {
		int kq = jdbcTemplate.update("Delete SanPham where MaSP=?", MaSP);
		return kq;
	}
	
	
	@Override
	@CachePut(value = "products", key = "#MaSP")
	public int editProductInfo(String MaSP,String AnhSP,String TenSP, Long DonGia ,Integer GiamGia, String MaLoai,String MaSwitch,java.util.Date NgayThem,String MoTa) {
		return jdbcTemplate.update("Update SanPham set TenSP=?, AnhSP=?,DonGia=?, GiamGia=?, MaLoai=?,MaSwitch=?, NgayThem=?, MoTa=? where MaSP=?", 
				TenSP,AnhSP ,DonGia, GiamGia, MaLoai,MaSwitch ,new java.sql.Date(NgayThem.getTime()),MoTa,MaSP);
	}
	
	@Override
	@CachePut(value = "products", key = "#MaSP")
	public int editProductInfoNotImage(String MaSP,String TenSP, Long DonGia ,Integer GiamGia, String MaLoai,String MaSwitch,java.util.Date NgayThem,String MoTa) {
		System.out.print("edit product");
		return jdbcTemplate.update("Update SanPham set TenSP=?,DonGia=?, GiamGia=?, MaLoai=?,MaSwitch=? ,NgayThem=?, MoTa=? where MaSP=?", 
				TenSP,DonGia, GiamGia, MaLoai,MaSwitch, new java.sql.Date(NgayThem.getTime()),MoTa,MaSP);
	}
	
	@Override
	@CacheEvict(value = "products", allEntries = true)
	public void clearCatche()
	{
	}
}
