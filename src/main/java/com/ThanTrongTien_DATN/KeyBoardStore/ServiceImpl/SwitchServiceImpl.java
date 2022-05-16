package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.SwitchModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ISwitchService;

@Component
@Repository
@EnableCaching
public class SwitchServiceImpl implements ISwitchService<SwitchModel> {
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(SwitchServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public SwitchServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public static final String HASH_KEY = "switch";
	
    @SuppressWarnings("rawtypes")
	@Autowired
    private RedisTemplate template;
	
	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	public List<SwitchModel> getSwitch() {
		String sql = "select * from Switch";
		List<SwitchModel> sps = jdbcTemplate.query(sql, new RowMapper<SwitchModel>() {
			@Override
			public SwitchModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				SwitchModel th = new SwitchModel();
				th.setMaSwitch(rs.getString("MaSwitch"));
				th.setTenSwitch(rs.getString("TenSwitch"));
				SwitchModel s = th;
				template.opsForHash().put(HASH_KEY,s.getMaSwitch(),s);
				return th;
			}
		});
		return template.opsForHash().values(HASH_KEY);
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public int addSwitch(String masw, String tensw) {
		String sql = "select count(*) from Switch where MaSwitch=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {masw}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("insert into Switch (MaSwitch,TenSwitch) values (?,?)", masw, tensw);
		} else
			return 0;
	}
	@SuppressWarnings({ "deprecation" })
	@Override
	public int deleteSwitch(String masw) {
		String sql = "select count(*) from Switch inner join SanPham on Switch.MaSwitch = SanPham.MaSwitch where Switch.MaSwitch = ? ";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {masw}, Integer.class);
		if (count >=1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("Delete Switch where MaSwitch=?", masw);
		} else
			return 0;
	}
	
	@SuppressWarnings({ "deprecation" })
	@Override
	public int editSwitch(String masw, String tensw) {
		String sql = "select count(*) from Switch where TenSwitch=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {tensw}, Integer.class);
		if (count >= 1){
			return -1;
		} else if (count == 0) {
			return jdbcTemplate.update("Update Switch SET TenSwitch =? WHERE MaSwitch = ?", tensw,masw);
		} else
			return 0;
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes", "unchecked" })
	@Override
	public SwitchModel getMotSwitch (String masw) {
		SwitchModel th = new SwitchModel();
		String sql="select * from Switch where MaSwitch=?";
		th= (SwitchModel) jdbcTemplate.queryForObject(sql, new Object[]{masw}, new BeanPropertyRowMapper(SwitchModel.class));
		System.out.print(th.getMaSwitch());
		System.out.print(th.getTenSwitch());
		return th;
	}
	
	@Override
	@CacheEvict(value = "switch", allEntries = true)
	public void clearCatche()
	{
	}
}
