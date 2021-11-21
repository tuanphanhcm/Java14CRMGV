package cybersoft.javabackend.java14.crm.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cybersoft.javabackend.java14.crm.entity.User;
import cybersoft.javabackend.java14.crm.service.UserService;
import cybersoft.javabackend.java14.crm.util.UrlConst;
import cybersoft.javabackend.java14.crm.util.JspConst;

@WebServlet(
		name = "userServlet",
		urlPatterns = {
				UrlConst.USER_DASHBOARD,
				UrlConst.USER_ADD,
				UrlConst.USER_DELETE,
				UrlConst.USER_UPDATE
		}
)
public class UserServlet extends HttpServlet{
	private UserService service;
	private String action;
	
	@Override
	public void init() throws ServletException {
		super.init();
		service = new UserService();
		action = "";
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		action = req.getServletPath();
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		switch (action) {
		case UrlConst.USER_DASHBOARD:
			List<User> users = service.getUsers();
			req.setAttribute("users", users);
			req.getRequestDispatcher(JspConst.USER_DASHBOARD)
				.forward(req,resp);
			break;

		default:
			break;
		}
	}

}
