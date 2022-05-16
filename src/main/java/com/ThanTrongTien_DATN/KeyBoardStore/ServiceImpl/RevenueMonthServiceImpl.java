package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.RevenueMonthModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IRevenueMonthService;

@Component
public class RevenueMonthServiceImpl implements IRevenueMonthService<RevenueMonthModel> {


	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(RevenueMonthServiceImpl.class);
	private JdbcTemplate jdbcTemplate;
	
	public RevenueMonthServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<RevenueMonthModel> getRevenueMonth(){
		String sql="DECLARE @t MONEY\r\n"
				+ "EXEC dbo.proc_SummaryByMonth @year = 2022, @SummaryOfYear = @t OUTPUT";
		List<RevenueMonthModel> RMlist = jdbcTemplate.query(sql, new RowMapper<RevenueMonthModel>() {
			@Override
			public RevenueMonthModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				RevenueMonthModel rm = new RevenueMonthModel();
				rm.setMonth(rs.getInt("Month"));
				rm.setTotalPrice(rs.getLong("TotalPrice"));
				return rm;
			}
		});
		return RMlist;
	}
}
