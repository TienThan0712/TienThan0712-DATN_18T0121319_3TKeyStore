package com.ThanTrongTien_DATN.KeyBoardStore.Controller.Client;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class LogoutController {

	@GetMapping("/logout")
	public String Logout(HttpServletRequest request,HttpServletResponse response, @Param("name") String name) {
		HttpSession session = request.getSession();
		if (name.equals("logoutkh"))
		{
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies)
			{
				if((cookie.getName( )).compareTo("username") == 0 ){
					cookie.setMaxAge(0);
					cookie.setSecure(true);
					cookie.setHttpOnly(true);
					response.addCookie(cookie);
				}
			}
			session.removeAttribute("kh");
		}
		if (name.equals("logoutadmin"))
		{
			session.removeAttribute("ad");
		}
		return "redirect:/home";
	}
}
