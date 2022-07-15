package com.employee.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employee.dao.EmployeeDao;
import com.employee.entity.Employee;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String employeeId = request.getParameter("EID");

		String employeeName = request.getParameter("Ename");
		String dateOfjoinig = request.getParameter("DOJ");

		
		try {
			SimpleDateFormat formater = new SimpleDateFormat("yyy-MM-dd");
			java.util.Date doj;
			doj = formater.parse(dateOfjoinig);
			long ms = doj.getTime();
			java.sql.Date doj1 = new java.sql.Date(ms);
			System.out.println("sql date= " + doj1);
			int YearofExperiece = Integer.parseInt(request.getParameter("YOE"));
			String designation = request.getParameter("Designation");

			Employee employee = new Employee(employeeId, employeeName, doj1, YearofExperiece, designation);

			EmployeeDao dao = new EmployeeDao();

			if (dao.searchEmp(employeeId) == false) {

				out.print(2);
			} else {
				int value = dao.saveEmployee(employee);
				out.print(value);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
	}

}
