package com.letslearn.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.letslearn.Modal.Parent;

public class ParentDao {
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;

	public ParentDao(Connection con) {
		this.con = con;
	}
	
	public int addParent(Parent parent) {
		int result = 0;
  		try {
  			query="INSERT INTO parent (fatherName,motherName,fatherNic,motherNic,telephone,studentEmail,city,married)\r\n"
  					+ "VALUES (?,?,?,?,?,?,?,?);";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,  parent.getFatherName());
            pst.setString(2, parent.getMotherName());
            pst.setString(3, parent.getFatherNic());
            pst.setString(4, parent.getMotherNic());
            pst.setString(5, parent.getTelephone());
            pst.setString(6, parent.getStudentEmail());
            pst.setString(7, parent.getCity());
            pst.setString(8, parent.getMarried());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
	}
	//get coupon id name
	public List<Parent> getAllParents(){
  		List<Parent> parent = new ArrayList<Parent>();
  		try {
  			query="select * from parent";
  			pst=this.con.prepareStatement(query);
  			rs=pst.executeQuery();
  			while(rs.next()) {
  				Parent cpn = new Parent("","","");
  				cpn.setId(rs.getString("id"));
  				cpn.setFatherName(rs.getString("fatherName"));
  				cpn.setMotherName(rs.getString("motherName"));
  				cpn.setFatherNic(rs.getString("fatherNic"));
  				cpn.setMotherNic(rs.getString("motherNic"));
  				cpn.setTelephone(rs.getString("telephone"));
  				cpn.setStudentEmail(rs.getString("studentEmail"));
  				cpn.setCity(rs.getString("city"));
  				cpn.setMarried(rs.getString("married"));
  				parent.add(cpn);
  				
  			}
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return parent;
  		
  	}
	
	public int deleteParent(String id) {
  		int result=0;
  		try {
  			query="DELETE FROM parent WHERE id=?;";
  			pst = this.con.prepareStatement(query);
            pst.setString(1,id);
      
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}
	
	//updating coupons
  	public int updateParent(Parent parent) {
		System.out.print(parent.getEmail());
  		int result=0;
  		try {
  			query="UPDATE parent SET fatherName = ?, motherName= ? , fatherNic=?,motherNic=?,telephone=?,studentEmail=?,city=?,married=? WHERE id = ?;";
  			pst = this.con.prepareStatement(query);
  			 pst.setString(1,  parent.getFatherName());
             pst.setString(2, parent.getMotherName());
             pst.setString(3, parent.getFatherNic());
             pst.setString(4, parent.getMotherNic());
             pst.setString(5, parent.getTelephone());
             pst.setString(6, parent.getStudentEmail());
             pst.setString(7, parent.getCity());
             pst.setString(8, parent.getMarried());
             pst.setString(9, parent.getId());
            result=pst.executeUpdate();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  		return result;
  	}
}
