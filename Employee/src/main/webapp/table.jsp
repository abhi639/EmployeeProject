<%@page import="com.employee.entity.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.employee.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<table class="table table-bordered" id="refresh-section" >
  <thead class="thead-dark">
    <tr>
      <th scope="col">Eid</th>
      <th scope="col">Employee Name</th>
      <th scope="col">Date of Joining</th>
      <th scope="col">Year of Experience</th>
      <th scope="col">Designation</th>
    </tr>
  </thead>
  <tbody id="employee_table" >
  <%
  EmployeeDao dao=new EmployeeDao();
  String data = request.getParameter("data");
  ArrayList<Employee> data1=dao.viewEmp(data);
  for(Employee emp:data1){
  %>
    <tr>
      <td scope="row"><%=emp.getEmpid() %></td>
       <td scope="row"><%=emp.getEmpName() %></td>
        <td scope="row"><%=emp.getDateOf_joining()%></td>
         <td scope="row"><%=emp.getYearOf_experience() %></td>
          <td scope="row"><%=emp.getDesignation()%></td>
          <%} %>
    </tr>
</tbody>
</table>
