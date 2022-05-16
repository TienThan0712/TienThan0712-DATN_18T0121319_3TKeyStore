package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueDayModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IRevenueDayService;

@Component
public class RevenueDayServiceImpl implements IRevenueDayService<RevenueDayModel> {
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(RevenueDayServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public RevenueDayServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<RevenueDayModel> getRevenueDay(String month){
		String sql="DECLARE @t MONEY\r\n"
				+ "EXEC dbo.proc_SummaryByDate @month = "+month+", @year = 2022, @SumofMonth = @t OUTPUT";
		List<RevenueDayModel> RMlist = jdbcTemplate.query(sql, new RowMapper<RevenueDayModel>() {
			@Override
			public RevenueDayModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				RevenueDayModel rm = new RevenueDayModel();
				rm.setDay(rs.getDate("Day"));
				rm.setTotalPrice(rs.getLong("TotalPrice"));
				return rm;
			}
		});
		return RMlist;
	}

}
