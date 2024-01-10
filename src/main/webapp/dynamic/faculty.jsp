<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Faculty Page</title>
  </head>
  <body>
  	<h1>faculty page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from faculty";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO faculty VALUES (?,?,?)");
    		pstmt.setString(1, request.getParameter("faculty_name"));
    		pstmt.setString(2, request.getParameter("faculty_title"));
    		pstmt.setString(3, request.getParameter("department"));
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>faculty name</th>
	    		<th>title</th>
	    		<th>department</th>
    		</tr>
    		<tr>
    			<form action = "faculty.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "faculty_name" size="15"></th>
    				<th><input value = "" name = "faculty_title" size="15"></th>
    				<th><input value = "" name = "department" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("faculty_name") %></td>
    			<td><%= rs.getString("faculty_title") %></td>
    			<td><%= rs.getString("department") %></td>
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
    
	<p>to update teaching records<a href = "faculty_teach.jsp"> click here</a></p>
	<p>update committee of same department<a href = "committee_same_dept.jsp"> click here</a></p>
    <p>update committee of different department<a href = "committee_diff_dept.jsp"> click here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>