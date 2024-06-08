package com.letslearn.Modal;

public class Teacher extends User{
	
	private String subject;
	private String city;
	private String tel;
	
		
	
	public Teacher(String name, String email, String nic) {
		super(name, email, nic);
	}
	
	public Teacher(String name, String email, String nic, String subject, String city, String tel) {
		super(name, email, nic);
		this.subject = subject;
		this.city = city;
		this.tel = tel;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

	

}
