package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ThanTrongTien_DATN.KeyBoardStore.Model.AdminModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.CategoryModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductCommentModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Model.ProductModel;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.ICategoryService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductCommentService;
import com.ThanTrongTien_DATN.KeyBoardStore.Service.IProductService;

@Controller
@RequestMapping("/admin")
public class AdminProductCommentController {

	@Autowired
	private ICategoryService<CategoryModel> category;
	
	@Autowired
	private IProductService<ProductModel> products;
	
	@Autowired
	private IProductCommentService<ProductCommentModel> productComment;
	
	@GetMapping("/productComment")
	public String CommentView (HttpServletRequest request, Model model, @Param("maComment") String maComment, @Param("name") String name) {
		HttpSession session = request.getSession();
		AdminModel ad = (AdminModel)session.getAttribute("ad");
		if (ad!=null)
		{
			List<ProductCommentModel> dsComment = productComment.getComment();
			if(maComment!=null)
			{
				if(name.equals("btnXoa"))
				{
					productComment.Delete(Long.parseLong(maComment));
					productComment.deletecache();
					dsComment = productComment.getComment();
					model.addAttribute("dsComment",dsComment);
					model.addAttribute("tb", "Xóa thành công");
					model.addAttribute("link", "productComment");
					return "admin/productComment";
				}
			}
			model.addAttribute("dsComment",dsComment);
			model.addAttribute("link", "productComment");
			return "admin/productComment";
		}
		else
		{
			List<CategoryModel> dsloai = category.getLoai();
			List<ProductModel> dsspmoi = products.get8spmoi();
			List<ProductModel> dssphot = products.get8sphot();
			model.addAttribute("dsloai", dsloai);
			model.addAttribute("dsspmoi", dsspmoi);
			model.addAttribute("dssphot", dssphot);
			model.addAttribute("tb", "Bạn cần đăng nhập");
			return "client/index";
		}
	}
}
