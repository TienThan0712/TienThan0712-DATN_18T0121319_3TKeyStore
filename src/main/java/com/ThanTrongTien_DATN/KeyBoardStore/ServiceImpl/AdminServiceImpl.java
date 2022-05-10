package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IAdminService;

@Component
public class AdminServiceImpl implements IAdminService<AdminModel> {
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	private JdbcTemplate jdbcTemplate;

	public AdminServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@SuppressWarnings({ "deprecation" })
	@Override
	public AdminModel ktdn(String UserName) {
		AdminModel ad = new AdminModel();
		String sql = "Select count(*) from Admin where UserName=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[] {UserName}, Integer.class);
		if (count >= 1)
		{
			String query = "Select * from Admin where UserName=?";
			ad =(AdminModel) jdbcTemplate.queryForObject(query, new Object[] {UserName}, new BeanPropertyRowMapper<AdminModel>(AdminModel.class));
			return ad;
		}
		else return null;
	}
}
