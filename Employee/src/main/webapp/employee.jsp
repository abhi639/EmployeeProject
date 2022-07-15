<%@page import="com.employee.entity.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.employee.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light bg-light">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search"name="search" id="search" placeholder="Search" aria-label="Search">
 <!--   <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> --> 
  </form>
    <button id="text" class="btn btn-primary " data-toggle="modal" data-target="#exampleModal" type="submit">Add Student</button>
</nav>
<!-- End of NavBar -->

<!-- Start of Modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Employee details</h5>
       
      </div>
      <div class="modal-body">
     
       <form id="form_submit" action="EmployeeServlet"method="POST">
         <div id="error_msg" ></div>
         <table class="table">
          
         
         
         
         <tr>
         <td>Employee ID</td>
         <td><input type="text"class="form-control" name="EID" required></td>
         </tr>
          <tr>
         <td>Employee Name</td>
         <td><input type="text"class="form-control" name="Ename" required></td>
         </tr>
          <tr>
         <td>Date of joining</td>
         <td><input type="date"class="form-control" name="DOJ" required></td>
         </tr>
          <tr>
         <td>Year of Experience</td>
         <td><input type="text"class="form-control" name="YOE" required></td>
         </tr>
          <tr>
         <td>Designation</td>
         <td><input type="text"class="form-control" name="Designation" required></td>
         </tr>
         </table>
          <div class="modal-footer">
         <button  id="form_button" type="submit" class="btn btn-primary">Save</button>
          <button type="button"  class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
          </form>
      
      </div>
        </div>
  </div>
  </div>

<!-- End Of Modal -->
<div class="container" >

</div>


<!-- Script tag -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script>
 
         $(document).ready(function(){
        	 console.log("done");
        	 $("#form_submit").on("submit",function(event){
        		 
        		 event.preventDefault();
        		 $('#error_msg').html('     ');
        		 console.log("click buton");
        		 	var f=$(this).serialize(); 
        		 	console.log(f);
        		 $.ajax({
        			 url:'EmployeeServlet',
        			type:'POST',
        			data: f,
        			 
        			 success:function(data,textStatus,jqXHR){
        				 
        				 console.log("Submited buton");
        				 console.log(data);
        				
        				 if(data==1)
     			 		{
     			 			     			 			 
     			 			$('#form_submit').trigger("reset");
     			 			$('#refresh-section').load (location.href + "#refresh-section");
     			 			$('#exampleModal').modal('hide'); 
     			 		}
     			 		else if (data==2)
    			 			{
    			 			
     			 			$('#error_msg').html('DUPLICATE Emp ID');
     			 	
     			 			$("#error_msg").addClass('bg-danger text-white');
    			 			}
     			 		else if(data==3)
    			 			{
    			 				$('#error_msg').html('DB ERROR , TRY AGAIN');
    			 				$('#error_msg').addClass('bg-danger text-white');
    			 				
    			 			}
        			 },
        			 
        		 error:function(jqXHR,textStatus,errorThrown){
        			 
        			 console.log("not Submited buton");
        			 
        		 },
        			
        		 })
        		
        		 
        	 }) 
        	 
        	 
         })
        	 $("#text").click(function(){
        		 $('#error_msg').html('  ');
        		 $('#error_msg').addClass('text-white');
        		 $('#form_submit').trigger("reset");
        	 })
        	 
        	 
        	 
         
              </script>
              <script type="text/javascript">
              $(document).ready(function(){  
                  $('#search').on("keyup",function(){  
                   var value=$(this).val().toLowerCase();
                   
                   
                   $.ajax({
          			 url:'table.jsp?data='+value,
          			type:'POST',
          			data: '',
          			 
          			 success:function(data){
          				 //alert(data);
          				 $(".container").html(data);
          			 }
                   })
                	 
                         
                  })
              })
              show();
               function show()
              {
            	  
            	  
            	  $.ajax({
           			 url:'table.jsp?data=',
           			type:'POST',
           			data: '',
           			 
           			 success:function(data){
           				 //alert(data);
           				 $(".container").html(data);
           			 }
                    })
              }
              </script>
</body>
</html>