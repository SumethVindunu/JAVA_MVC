package com.letslearn.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.letslearn.Modal.Student;

public class StudentDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public StudentDao(Connection con) {
		this.con = con;
	}
	
	public int addStudent(Student student) {
		int result = 0;
  		try {
  			query="INSERT INTO student (name,email,nic,city,grade,tel)\r\n"
  					+ "VALUES (?,?,?,?,?,?);";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,  student.getName());
            pst.setString(2, student.getEmail());
            pst.setString(3, student.getNic());
            pst.setString(4, student.getCity());
            pst.setString(5, student.getGrade());
            pst.setString(6, student.getTel());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
	}
	//get coupon id name
	public List<Student> getAllStudents(){
  		List<Student> student = new ArrayList<Student>();
  		try {
  			query="select * from student";
  			pst=this.con.prepareStatement(query);
  			rs=pst.executeQuery();
  			while(rs.next()) {
  				Student cpn = new Student("","","");
  				cpn.setCity(rs.getString("city"));
  				cpn.setName(rs.getString("name"));
  				cpn.setNic(rs.getString("nic"));
  				cpn.setEmail(rs.getString("email"));
  				cpn.setGrade(rs.getString("grade"));
  				cpn.setTel(rs.getString("tel"));
  				student.add(cpn);
  				
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return student;
  		
  	}
	
	public int deleteStudent(String email) {
  		int result=0;
  		try {
  			query="DELETE FROM student WHERE email=?;";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,email);
      
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}
	
	//updating coupons
  	public int updateStudent(Student student) {
		System.out.print(student.getEmail());
  		int result=0;
  		try {
  			query="UPDATE student SET name = ?, grade= ? , city=?,nic=?,tel=? WHERE email = ?;";
  			pst = this.con.prepareStatement(query);
  			 pst.setString(1,  student.getName());
             pst.setString(2, student.getGrade());
             pst.setString(3, student.getCity());
             pst.setString(4, student.getNic());
             pst.setString(5, student.getTel());
             pst.setString(6, student.getEmail());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}

}
