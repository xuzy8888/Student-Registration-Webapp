<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>student Page</title>
  </head>
  <body>
  	<h1>Student page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO student VALUES (?,?,?,?,?,?,?)");
    		pstmt.setString(1, request.getParameter("student_id"));
    		pstmt.setString(2, request.getParameter("ssn"));
    		pstmt.setString(3, request.getParameter("firstname"));
    		pstmt.setString(4, request.getParameter("middlename"));
    		pstmt.setString(5, request.getParameter("lastname"));
    		pstmt.setString(6, request.getParameter("residency"));
    		pstmt.setString(7, request.getParameter("enrollment"));
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	if (action != null && action.equals("update")){
    		connection.setAutoCommit (false);
    		PreparedStatement pstmt_2 = connection.prepareStatement("UPDATE student SET ssn=?, firstname =?, middlename = ?, lastname = ?, residency = ? enrollment = ? WHERE student_id = ?");
    		
    		pstmt_2.setString(1, request.getParameter("ssn"));
    		pstmt_2.setString(2, request.getParameter("firstname"));
    		pstmt_2.setString(3, request.getParameter("middlename"));
    		pstmt_2.setString(4, request.getParameter("lastname"));
    		pstmt_2.setString(5, request.getParameter("residency"));
    		pstmt_2.setString(6, request.getParameter("enrollment"));
    		pstmt_2.setString(7, request.getParameter("student_id"));
    		
    		pstmt_2.executeUpdate();
    		connection.setAutoCommit (false);
    		connection.setAutoCommit (true);
    	}
    	
    	if (action != null && action.equals("delete")){
    		connection.setAutoCommit (false);
    		PreparedStatement pstmt_3 = connection.prepareStatement(
    				"DELETE FROM student WHERE student_id=?");
    		
    		pstmt_3.setString(1, request.getParameter("student_id"));
    		pstmt_3.executeUpdate();
    		
    		connection.setAutoCommit (false);
    		connection.setAutoCommit (true);
    	}
    	
    	String GET_STUDENT_QUERY = "select * from student";
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>student_id</th>
	    		<th>SSN</th>
	    		<th>first name</th>
	    		<th>middle name</th>
	    		<th>last name</th>
	    		<th>residency</th>
	    		<th>enrollment</th>
    		</tr>
    		<tr>
    			<form action = "student.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "student_id" size="15"></th>
    				<th><input value = "" name = "ssn" size="15"></th>
    				<th><input value = "" name = "firstname" size="15"></th>
    				<th><input value = "" name = "middlename" size="15"></th>
    				<th><input value = "" name = "lastname" size="15"></th>
    				<th><input value = "" name = "residency" size="15"></th>
    				<th><input value = "" name = "enrollment" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
     			<form action="student.jsp" method="get">
     				<input type = "hidden" value="update" name="action">
     				<td><input value ="<%= rs.getString("student_id") %>" name ="student_id" ></td>
    				<td><input value ="<%= rs.getString("ssn") %>" name ="ssn"></td>
    				<td><input value ="<%= rs.getString("firstname") %>" name ="firstname"></td>
    				<td><input value ="<%= rs.getString("middlename") %>" name ="middlename"></td>
    				<td><input value ="<%= rs.getString("lastname") %>" name ="lastname"></td>
    				<td><input value ="<%= rs.getString("residency") %>" name ="residency"></td>
    				<td><input value ="<%= rs.getString("enrollment") %>" name ="enrollment"></td>
    				<td><input type="submit" value = "Update"></td>
     			</form>
     			<form action="student.jsp" method="get">
     				<input type = "hidden" value="delete" name="action">
     				<input type = "hidden" value="<%= rs.getString("student_id") %> name="action">
     				<td><input type="submit" value = "Delete"></td>
     			</form>
    			
    		</tr>
    		
    		<%}%>
    		
    	</table>
    
    
    <%
    rs.close();
    stmt.close();
    connection.close();
    } catch (SQLException sqle){
    	out.println(sqle.getMessage());
    } catch (Exception e) {
    	out.println(e.getMessage());
    }
    %>
    
    
    <p>if you are undergraduate student <a href = "undergraduates.jsp"> click here</a></p>
    <p>if you are graduate student <a href = "graduates.jsp"> click here</a></p>
    <p>update enrolled records <a href = "class_enrolled.jsp"> click here</a></p>
    <p>update class taken records <a href = "class_taken.jsp"> click here</a></p>
    <p>update attendance records <a href = "attendance.jsp"> click here</a></p>
    <p>update probation records <a href = "probation.jsp"> click here</a></p>
    <p>update previous education records <a href = "previous_edu.jsp"> click here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>