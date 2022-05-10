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

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CustomerModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICustomerService;

@Component
public class CustomerServiceImpl implements ICustomerService<CustomerModel>{
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(CustomerServiceImpl.class);
	private JdbcTemplate jdbcTemplate;

	public CustomerServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@SuppressWarnings({ "deprecation" })
	@Override
	public CustomerModel ktdn(String tendn) {
		CustomerModel kh = new CustomerModel();
		String sql = "Select count(*) from KhachHang where UserName=? ";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {tendn}, Integer.class);
		if (count >= 1)
		{
			String query = "Select * from KhachHang where UserName=?";
			kh =(CustomerModel) jdbcTemplate.queryForObject(query, new Object[] { tendn}, new BeanPropertyRowMapper<CustomerModel>(CustomerModel.class));
			return kh;
		}
		else return null;
	}

	@Override
	@SuppressWarnings({ "unused", "deprecation" })
	public boolean isisAccountExists(String tendn) {
		String sql = "select count(*) from KhachHang where UserName=?";
		int count= jdbcTemplate.queryForObject(sql,new Object[] {tendn}, Integer.class);
		if (count >= 1)
		{
			return true;
		}
		return false;
	}

	@Override
	public int ktdk(String hoten, String diachi, String sodt, String email, String tendn, String mk) {
		
		 if(isisAccountExists(tendn) == true) 
		 { return -1; } 
		 else if(isisAccountExists(tendn) == false) {
			 return jdbcTemplate.update("insert into KhachHang (HoTen,DiaChi,SoDT,Email,UserName,Pass) values (?,?,?,?,?,?)",
				hoten, diachi, sodt, email, tendn, mk);
		 } else return 0;
		 
	}

	@Override
	public int SuaThongTin(long makh, String hoten, String diachi, String sodt, String email) {
		return jdbcTemplate.update("Update KhachHang SET HoTen =?, DiaChi=?, SoDT= ?, Email=? WHERE MaKH = ?", hoten,
				diachi, sodt, email, makh);
	}

	@SuppressWarnings("deprecation")
	@Override
	public CustomerModel LayThongTin(long makh) {
		CustomerModel kh = new CustomerModel();
		String sql = "Select * from KhachHang where MaKH=?";
		kh = (CustomerModel) jdbcTemplate.queryForObject(sql, new Object[] { makh },
				new BeanPropertyRowMapper<CustomerModel>(CustomerModel.class));
		return kh;
	}

	@SuppressWarnings({ "deprecation" })
	@Override
	public int DoiMK(long makh, String mkmoi) {
		String sql = "select count(*) from KhachHang where MaKH=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {makh}, Integer.class);
		if (count >=1){
			return jdbcTemplate.update("Update KhachHang SET Pass = ? WHERE MaKH = ?", mkmoi, makh);
		} else if (count == 0) {
			return -1;
		} else
			return 0;
	}
	
	@Override
	public List<CustomerModel> getKH() {
		String sql = "select * from KhachHang";
		List<CustomerModel> ds = jdbcTemplate.query(sql, new RowMapper<CustomerModel>() {
			@Override
			public CustomerModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				CustomerModel kh = new CustomerModel();
				kh.setMaKH(rs.getLong("MaKH"));
				kh.setHoTen(rs.getString("HoTen"));
				kh.setDiaChi(rs.getString("DiaChi"));
				kh.setSoDT(rs.getString("SoDT"));
				kh.setEmail(rs.getString("Email"));
				kh.setUserName(rs.getString("UserName"));
				kh.setPass(rs.getString("Pass"));
				return kh;
			}
		});
		return ds;
	}
	
	@Override
	public int Xoa (long makh) {
		return jdbcTemplate.update("Delete KhachHang where MaKH=?",makh);
	}
}
