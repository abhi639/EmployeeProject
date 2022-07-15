package com.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.employee.dbconnection.MyDbconnection;
import com.employee.entity.Employee;

public class EmployeeDao {

	MyDbconnection mydb = new MyDbconnection();
	Connection con;
	PreparedStatement pre;

	public int saveEmployee(Employee emp) {
		int db = 3;
		con = mydb.getMyconnection();
		try {
			pre = con.prepareStatement("insert into employee(Eid,Ename,dateof_join,yearof_exp,Designation) values(?,?,?,?,?)");
			pre.setString(1, emp.getEmpid());
			pre.setString(2, emp.getEmpName());
			pre.setDate(3, emp.getDateOf_joining());
			pre.setInt(4, emp.getYearOf_experience());
			pre.setString(5, emp.getDesignation());
			pre.executeUpdate();
			db = 1;
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		}

		return db;
	}

	@SuppressWarnings("unused")
	public boolean searchEmp(String Eid) {
		boolean b = false;
		Employee emp = null;
		con = mydb.getMyconnection();
		try {
			pre = con.prepareStatement("select * from employee where Eid=?");
			pre.setString(1, Eid);
			ResultSet set = pre.executeQuery();
			System.out.println(set);
			while (set.next()) {
				emp = new Employee();
				emp.setEmpid(set.getString("Eid"));
				emp.setEmpName(set.getString("Ename"));
				emp.setDateOf_joining(set.getDate("dateof_join"));
				emp.setYearOf_experience(set.getInt("yearof_exp"));
				emp.setDesignation(set.getString("Designation"));

			}
			if (emp == null) {
				b = true;
			}
		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;
	}

	public ArrayList<Employee> viewEmp(String query) {
		ArrayList<Employee> data = new ArrayList<Employee>();
		con = mydb.getMyconnection();
		try {
			if(query==null) {
				pre = con.prepareStatement("select * from employee");
				
			}else {
			pre = con.prepareStatement("select * from employee where (Eid LIKE '%"+query+"%' OR Ename LIKE '%"+query+"%' OR Designation LIKE '%"+query+"%')");
			}
			
			ResultSet set = pre.executeQuery();
			while (set.next()) {
				Employee emp = new Employee();
				emp.setEmpid(set.getString("Eid"));
				emp.setEmpName(set.getString("Ename"));
				emp.setDateOf_joining(set.getDate("dateof_join"));
				emp.setYearOf_experience(set.getInt("yearof_exp"));
				emp.setDesignation(set.getString("Designation"));
				data.add(emp);
              
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}

}
