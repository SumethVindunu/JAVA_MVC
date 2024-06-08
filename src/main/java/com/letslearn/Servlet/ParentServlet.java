package com.letslearn.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.letslearn.DBcon.DbCon;
import com.letslearn.Dao.ParentDao;
import com.letslearn.Modal.Parent;

@WebServlet("/ParentServlet")
public class ParentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dis = null;
	String action = null;
	String fatherName;
	String motherName;
	String fatherNic;
	String motherNic;
	String telephone;
	String studentEmail;
	String city;
	String married;
	String id;

	private int result = 0;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		action = request.getParameter("action");
		if (action.equals("delete")) {
			id = request.getParameter("id");

			try {
				ParentDao parentDao = new ParentDao(DbCon.getConnection());
				result = parentDao.deleteParent(id);
				if (result != 0) {
					response.sendRedirect("parentManagement.jsp");

				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error . Please try again.');</script>");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		action = request.getParameter("action");
		
		fatherName = request.getParameter("fatherName");
		motherName = request.getParameter("motherName");
		fatherNic = request.getParameter("fatherNic");
		motherNic = request.getParameter("motherNic");
		telephone = request.getParameter("telephone");
		studentEmail = request.getParameter("studentEmail");
		city = request.getParameter("city");
		married = request.getParameter("married");
		id = request.getParameter("id");
		
		
		if(action.equals("addParent")) {
			try {
				Parent parent = new Parent("", "", "", fatherName, motherName, fatherNic, motherNic, telephone, studentEmail, city, married, "");
				ParentDao parentDao = new ParentDao(DbCon.getConnection());
				result = parentDao.addParent(parent);
				if (result != 0) {
					response.sendRedirect("parentManagement.jsp");
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error occurred. Please try again.');</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(action.equals("update")){
			try {
				Parent parent = new Parent("", "", "", fatherName, motherName, fatherNic, motherNic, telephone, studentEmail, city, married, id);
				ParentDao parentDao = new ParentDao(DbCon.getConnection());
				result = parentDao.updateParent(parent);
				if (result != 0) {
					response.sendRedirect("parentManagement.jsp");
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error  Please try again.');</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
