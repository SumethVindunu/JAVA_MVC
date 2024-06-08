package com.letslearn.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.letslearn.Modal.Teacher;

public class TeacherDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public TeacherDao(Connection con) {
		this.con = con;
	}
	
	public int addTeacher(Teacher teacher) {
		int result = 0;
  		try {
  			query="INSERT INTO teacher (name,subject,email,city,nic,tel)\r\n"
  					+ "VALUES (?,?,?,?,?,?);";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,  teacher.getName());
            pst.setString(2, teacher.getSubject());
            pst.setString(3, teacher.getEmail());
            pst.setString(4, teacher.getCity());
            pst.setString(5, teacher.getNic());
            pst.setString(6, teacher.getTel());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
	}
	//get coupon id name
	public List<Teacher> getAllTeachers(){
  		List<Teacher> teacher = new ArrayList<Teacher>();
  		try {
  			query="select * from teacher";
  			pst=this.con.prepareStatement(query);
  			rs=pst.executeQuery();
  			while(rs.next()) {
  				Teacher cpn = new Teacher("","","");
  				cpn.setCity(rs.getString("city"));
  				cpn.setName(rs.getString("name"));
  				cpn.setNic(rs.getString("nic"));
  				cpn.setEmail(rs.getString("email"));
  				cpn.setSubject(rs.getString("subject"));
  				cpn.setTel(rs.getString("tel"));
  				teacher.add(cpn);
  				
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return teacher;
  		
  	}
	
	public int deleteTeacher(String email) {
  		int result=0;
  		try {
  			query="DELETE FROM teacher WHERE email=?;";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,email);
      
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}
	
	//updating coupons
  	public int updateTeacher(Teacher teacher) {
  		int result=0;
  		try {
  			query="UPDATE teacher\r\n"
  					+ "SET name = ?, subject= ? , city=?,nic=?,tel=?\r\n"
  					+ "WHERE email = ?;";
  			pst = this.con.prepareStatement(query);
  			 pst.setString(1,  teacher.getName());
             pst.setString(2, teacher.getSubject());
             pst.setString(3, teacher.getCity());
             pst.setString(4, teacher.getNic());
             pst.setString(5, teacher.getTel());
             pst.setString(6, teacher.getEmail());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}
}
