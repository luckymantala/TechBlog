package io.tech.blog.servlet;

import java.io.IOException;

import io.tech.blog.dao.LikeDao;
import io.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LikeServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
		int pid = Integer.parseInt(req.getParameter("pid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		String operation = req.getParameter("operation");
		
		if(operation.equals("like")) {
			resp.getWriter().println(likeDao.addLike(pid, uid));
		
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
}
