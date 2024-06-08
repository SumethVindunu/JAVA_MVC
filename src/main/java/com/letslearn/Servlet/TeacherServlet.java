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
import com.letslearn.Dao.TeacherDao;
import com.letslearn.Modal.Teacher;

@WebServlet("/TeacherServlet")
public class TeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int result = 0;
	RequestDispatcher dis = null;
	String action = null;
	String nic = null;
	String city = null;
	String tel = null;
	String subject = null;
	String fname = null;
	String emailString = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		action = request.getParameter("action");
		if(action.equals("delete")){
			emailString = request.getParameter("email");
			nic = request.getParameter("nic");
			city = request.getParameter("city");
			tel = request.getParameter("tel");
			subject = request.getParameter("subject");
			fname = request.getParameter("fname");
			
			try {
				TeacherDao teacherDao = new TeacherDao(DbCon.getConnection());
				result = teacherDao.deleteTeacher(emailString);
				if (result != 0) {
					response.sendRedirect("teacherManagement.jsp");
					
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error occurred. Please try again.');</script>");
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		action = request.getParameter("action");
		
		emailString = request.getParameter("email");
		nic = request.getParameter("nic");
		city = request.getParameter("city");
		tel = request.getParameter("tel");
		subject = request.getParameter("subject");
		fname = request.getParameter("fname");
		
		
		if(action.equals("addTeacher")) {
			try {
				Teacher teacher = new Teacher(fname, emailString, nic, subject, city, tel);
				TeacherDao teacherDao = new TeacherDao(DbCon.getConnection());
				result = teacherDao.addTeacher(teacher);
				if (result != 0) {
					response.sendRedirect("teacherManagement.jsp");
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error occurred. Please try again.');</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(action.equals("update")){
			try {
				Teacher teacher = new Teacher(fname, emailString, nic, subject, city, tel);
				TeacherDao teacherDao = new TeacherDao(DbCon.getConnection());
				result = teacherDao.updateTeacher(teacher);
				if (result != 0) {
					response.sendRedirect("teacherManagement.jsp");
				} else {
					// Send a JavaScript alert for an error
					out.write("<script>alert('An error occurred. Please try again.');</script>");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
