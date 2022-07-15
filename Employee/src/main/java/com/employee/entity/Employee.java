package com.employee.entity;

import java.sql.Date;

public class Employee {

	private String empid;
	private String empName;
	private Date dateOf_joining;
	private int yearOf_experience;
	private String designation;

	public Employee(String empid, String empName, Date dateOf_joining, int yearOf_experience, String designation) {

		this.empid = empid;
		this.empName = empName;
		this.dateOf_joining = dateOf_joining;
		this.yearOf_experience = yearOf_experience;
		this.designation = designation;
	}

	public Employee() {

	}

	public String getEmpid() {
		return empid;
	}

	public void setEmpid(String empid) {
		this.empid = empid;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Date getDateOf_joining() {
		return dateOf_joining;
	}

	public void setDateOf_joining(Date sqldate) {
		this.dateOf_joining = sqldate;
	}

	public int getYearOf_experience() {
		return yearOf_experience;
	}

	public void setYearOf_experience(int date) {
		this.yearOf_experience = date;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

}
