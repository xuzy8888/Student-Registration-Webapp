<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Previous Education Records Page</title>
  </head>
  <body>
  	<h1>Previous Education Records Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from previous_edu";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO previous_edu VALUES (?,?,?,?,?)");
    		pstmt.setString(1, request.getParameter("student_id"));
    		pstmt.setString(2, request.getParameter("institution"));
    		pstmt.setString(3, request.getParameter("degree"));
    		pstmt.setString(4, request.getParameter("start_date"));
    		pstmt.setString(5, request.getParameter("end_date"));
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
	    		<th>institution</th>
	    		<th>degree</th>
	    		<th>start_date</th>
	    		<th>end_date</th>
    		</tr>
    		<tr>
    			<form action = "previous_edu.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "student_id" size="15"></th>
    				<th><input value = "" name = "institution" size="15"></th>
    				<th><input value = "" name = "degree" size="15"></th>
    				<th><input value = "" name = "start_date" size="15"></th>
    				<th><input value = "" name = "end_date" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("student_id") %></td>
    			<td><%= rs.getString("institution") %></td>
    			<td><%= rs.getString("degree") %></td>
    			<td><%= rs.getString("start_date") %></td>
    			<td><%= rs.getString("end_date") %></td>
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