package com.letslearn.Modal;

public class Parent extends User {
	private String fatherName;
	private String motherName;
	private String fatherNic;
	private String motherNic;
	private String telephone;
	private String studentEmail;
	private String city;
	private String married;
	private String id;

	public Parent(String name, String email, String nic, String fatherName, String motherName, String fatherNic,
			String motherNic, String telephone, String studentEmail, String city, String married,String id) {
		super(name, email, nic);
		this.fatherName = fatherName;
		this.motherName = motherName;
		this.fatherNic = fatherNic;
		this.motherNic = motherNic;
		this.telephone = telephone;
		this.studentEmail = studentEmail;
		this.city = city;
		this.married = married;
		this.id = id;
	}

	public Parent(String name, String email, String nic) {
		super(name, email, nic);
		// TODO Auto-generated constructor stub
	}

	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getFatherNic() {
		return fatherNic;
	}

	public void setFatherNic(String fatherNic) {
		this.fatherNic = fatherNic;
	}

	public String getMotherNic() {
		return motherNic;
	}

	public void setMotherNic(String motherNic) {
		this.motherNic = motherNic;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getStudentEmail() {
		return studentEmail;
	}

	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getMarried() {
		return married;
	}

	public void setMarried(String married) {
		this.married = married;
	}

}
