package io.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import io.tech.blog.dao.PostDao;
import io.tech.blog.entities.Post;
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
public class PostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		int pCatID = Integer.parseInt(req.getParameter("post-catergory"));
		String pTitle = req.getParameter("post-title");
		String pContent = req.getParameter("post-content");
		String pCode = req.getParameter("post-code");
		Part part = req.getPart("post-img");
		String pTags = req.getParameter("post-tags");
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		int uID = user.getId();
		
		Post post;
		String path = "";
		if(part.getSize()!=0) {
			String pThumbnailName = Helper.getPostThumbnailName(part.getSubmittedFileName(), new SimpleDateFormat("dd-MM-yyyy-hh-mm-ssa").format(new Date()));
			path = getServletContext().getRealPath("/")+"img"+File.separator+"thumbnails"+File.separator+pThumbnailName;
			post = new Post(pCatID, uID, pTitle, pContent, pCode, pTags, pThumbnailName);
		} else {
			post = new Post(pCatID, uID, pTitle, pContent, pCode, pTags, null);
		}
		
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		
		if(postDao.addPost(post)) {
			if(part.getSize()!=0) {
				Helper.saveFile(part.getInputStream(), path);
			}
			out.println("done");
		} else {
			out.println("error");
		}
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	
	}
	
}
