package com.ThanTrongTien_DATN.KeyBoardStore.ServiceImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;

@Component
public class CategoryServiceImpl implements ICategoryService<CategoryModel> {
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(CategoryServiceImpl.class);
	private JdbcTemplate jdbcTemplate;

	public CategoryServiceImpl(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public static final String HASH_KEY = "category";

	@SuppressWarnings("rawtypes")
	@Autowired
	private RedisTemplate template;

	@SuppressWarnings({ "unchecked", "unused" })
	@Override
	@Cacheable(value = "category")
	public List<CategoryModel> getLoai() {
		String sql = "select * from LoaiSP";
		List<CategoryModel> sps = jdbcTemplate.query(sql, new RowMapper<CategoryModel>() {
			@Override
			public CategoryModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				CategoryModel sp = new CategoryModel();
				sp.setMaloai(rs.getString("MaLoai"));
				sp.setTenloai(rs.getString("TenLoai"));
				template.opsForHash().put(HASH_KEY,sp.getMaloai(),sp);
				return sp;
			}
		});
		return template.opsForHash().values(HASH_KEY);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	@CachePut(value="category")
	public int addCategory(String maloai, String tenloai) {
		String sql = "select count(*) from LoaiSP where MaLoai=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] { maloai }, Integer.class);
		if (count >= 1) {
			return -1;
		} else if (count == 0) {
			CategoryModel sp = new CategoryModel();
			sp.setMaloai(maloai);
			sp.setTenloai(tenloai);
			template.opsForHash().put(HASH_KEY,sp.getMaloai(),sp);
			return jdbcTemplate.update("insert into LoaiSP (MaLoai,TenLoai) values (?,?)", maloai, tenloai);
		} else
			return 0;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	@CacheEvict(value = "category", key = "#maloai")
	public int deleteCategory(String maloai) {
		String sql = "select count(*) from LoaiSP inner join SanPham on LoaiSP.MaLoai = SanPham.MaLoai where LoaiSP.MaLoai = ? ";
		int count = jdbcTemplate.queryForObject(sql, new Object[] { maloai }, Integer.class);
		if (count >= 1) {
			return -1;
		} else if (count == 0) {
			template.opsForHash().delete(HASH_KEY,maloai);
			return jdbcTemplate.update("Delete LoaiSP where MaLoai=?", maloai);
		} else
			return 0;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	@CachePut(value="category")
	public int editCategory(String maloai, String tenloai) {
		String sql = "select count(*) from LoaiSP where TenLoai=?";
		int count = jdbcTemplate.queryForObject(sql, new Object[] { tenloai }, Integer.class);
		if (count >= 1) {
			return -1;
		} else if (count == 0) {
			CategoryModel sp = new CategoryModel();
			sp.setMaloai(maloai);
			sp.setTenloai(tenloai);
			template.opsForHash().put(HASH_KEY,sp.getMaloai(),sp);
			return jdbcTemplate.update("Update LoaiSP SET TenLoai =? WHERE MaLoai = ?", tenloai, maloai);
		} else
			return 0;
	}

	@SuppressWarnings({ "deprecation", "rawtypes", "unchecked" })
	@Override
	@Cacheable(value = "category", key = "#maloai")
	public CategoryModel getMotLoai(String maloai) {
		CategoryModel loai = new CategoryModel();
		String sql = "select * from LoaiSP where MaLoai=?";
		loai = (CategoryModel) jdbcTemplate.queryForObject(sql, new Object[] { maloai },
				new BeanPropertyRowMapper(CategoryModel.class));
		return (CategoryModel) template.opsForHash().get(HASH_KEY, loai.getMaloai());
	}
	@Override
	@CacheEvict(value = "category", allEntries = true)
	public void deletecache()
	{
	}
}
