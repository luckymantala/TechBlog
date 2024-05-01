package io.tech.blog.servlet;

import java.io.File;
import java.io.IOException;

import io.tech.blog.dao.UserDao;
import io.tech.blog.entities.Message;
import io.tech.blog.entities.User;
import io.tech.blog.helper.ConnectionProvider;
import io.tech.blog.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class UpdateUserdetailsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		User user = (User) session.getAttribute("user");
		user.setName(req.getParameter("update-name"));
		user.setEmail(req.getParameter("update-email"));
		user.setAbout(req.getParameter("update-about"));
		Part newProfile = req.getPart("update-profile");
		String oldProfileName = user.getProfile();
		String newProfileName = null;
		if(newProfile.getSize() != 0) {
			newProfileName = Helper.getProfileName(newProfile.getSubmittedFileName(), user.getId());
			user.setProfile(newProfileName);
		} 
		
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		
		if (userDao.updateUser(user)) {
			String ppFolder = getServletContext().getRealPath("/")+"img"+File.separator+"profile"+File.separator;
			String oldPPPath = ppFolder+oldProfileName;
			if(!oldProfileName.equals("default.png") && newProfileName!=null) {
				Helper.deleFile(oldPPPath);
			}
			if(newProfileName != null) {
				String newPPPath = ppFolder+newProfileName;
				Helper.saveFile(newProfile.getInputStream(), newPPPath);
			}
			session.setAttribute("user", user);
			Message msg = new Message("Profile details updated successfully", "success", "alert-success");
			session.setAttribute("msg", msg);
			resp.sendRedirect("profile.jsp");
		} else {
			Message msg = new Message("Profile not updated. Something went wrong", "error", "alert-danger");
			session.setAttribute("msg", msg);
			resp.sendRedirect("profile.jsp");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	
}
