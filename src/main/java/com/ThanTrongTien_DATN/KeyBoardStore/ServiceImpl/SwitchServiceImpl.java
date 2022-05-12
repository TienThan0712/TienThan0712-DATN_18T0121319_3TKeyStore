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

import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

@Component
public class SwitchServiceImpl implements ISwitchService<SwitchModel> {
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(SwitchServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public SwitchServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<SwitchModel> getSwitch() {
		String sql = "select * from Switch";
		List<SwitchModel> sps = jdbcTemplate.query(sql, new RowMapper<SwitchModel>() {
			@Override
			public SwitchModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				SwitchModel th = new SwitchModel();
				th.setMasw(rs.getString("MaSwitch"));
				th.setTensw(rs.getString("TenSwitch"));
				return th;
			}
		});
		return sps;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public int addSwitch(String math, String tenth) {
		String sql = "select count(*) from Switch where MaSwitch=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {math}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("insert into Switch (MaSwitch,TenSwitch) values (?,?)", math, tenth);
		} else
			return 0;
	}
	@SuppressWarnings({ "deprecation" })
	@Override
	public int deleteSwitch(String math) {
		String sql = "select count(*) from Switch inner join SanPham on Switch.MaSwitch = SanPham.MaSwitch where Switch.MaSwitch = ? ";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {math}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("Delete Switch where MaSwitch=?", math);
		} else
			return 0;
	}
	
	@SuppressWarnings({ "deprecation" })
	@Override
	public int editSwitch(String math, String tenth) {
		String sql = "select count(*) from Switch where TenSwitch=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {tenth}, Integer.class);
		if (count >= 1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("Update Switch SET TenSwitch =? WHERE MaSwitch = ?", tenth,math);
		} else
			return 0;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes", "unchecked" })
	@Override
	public SwitchModel getMotSwitch (String math) {
		SwitchModel th = new SwitchModel();
		String sql="select * from Switch where MaSwitch=?";
		th= (SwitchModel) jdbcTemplate.queryForObject(sql, new Object[]{math}, new BeanPropertyRowMapper(CategoryModel.class));
		return th;
	}
}
