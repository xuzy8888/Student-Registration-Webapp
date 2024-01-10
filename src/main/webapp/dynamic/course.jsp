<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>course Page</title>
  </head>
  <body>
  	<h1>course page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from course";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO course VALUES (?,?,?,?)");
    		pstmt.setString(1, request.getParameter("course_num"));
    		pstmt.setString(2, request.getParameter("department"));
    		pstmt.setString(3, request.getParameter("has_lab"));
    		pstmt.setString(4, request.getParameter("grading_opt"));
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>course_num</th>
	    		<th>department</th>
	    		<th>has_lab</th>
	    		<th>grading_opt</th>
    		</tr>
    		<tr>
    			<form action = "course.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "course_num" size="15"></th>
    				<th><input value = "" name = "department" size="15"></th>
    				<th><input value = "" name = "has_lab" size="15"></th>
    				<th><input value = "" name = "grading_opt" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("course_num") %></td>
    			<td><%= rs.getString("department") %></td>
    			<td><%= rs.getString("has_lab") %></td>
    			<td><%= rs.getString("grading_opt") %></td>
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
    
    
    <p>if course need consent <a href = "course_consent.jsp"> click here</a></p>
    <p>To update course pre-requisite <a href = "course_prereq.jsp"> click here</a></p>
    <p>To update course units options <a href = "course_units.jsp"> click here</a></p>
    <p>To update name change records <a href = "course_change.jsp"> click here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>