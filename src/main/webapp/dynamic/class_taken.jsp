<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>class taken Page</title>
  </head>
  <body>
  	<h1>class taken Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from class_taken";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO class_taken VALUES (?,?,?,?)");
    		pstmt.setString(1, request.getParameter("student_id"));
    		pstmt.setString(2, request.getParameter("term"));
    		pstmt.setString(3, request.getParameter("course_num"));
    		pstmt.setString(4, request.getParameter("grade"));
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>student_id</th>
	    		<th>time</th>
	    		<th>course name</th>
	    		<th>grade</th>
    		</tr>
    		<tr>
    			<form action = "class_taken.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "student_id" size="15"></th>
    				<th><input value = "" name = "term" size="15"></th>
    				<th><input value = "" name = "course_num" size="15"></th>
    				<th><input value = "" name = "grade" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("student_id") %></td>
    			<td><%= rs.getString("term") %></td>
    			<td><%= rs.getString("course_num") %></td>
    			<td><%= rs.getString("grade") %></td>
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
    

   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>