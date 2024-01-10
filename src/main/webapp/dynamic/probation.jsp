<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Probation Records Page</title>
  </head>
  <body>
  	<h1>Probation Records Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from probation";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO probation VALUES (?,?,?,?)");
    		pstmt.setString(1, request.getParameter("student_id"));
    		pstmt.setString(2, request.getParameter("start_time"));
    		pstmt.setString(3, request.getParameter("end_time"));
    		pstmt.setString(4, request.getParameter("reason"));
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
	    		<th>start</th>
	    		<th>end</th>
	    		<th>reason</th>
    		</tr>
    		<tr>
    			<form action = "probation.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "student_id" size="15"></th>
    				<th><input value = "" name = "start_time" size="15"></th>
    				<th><input value = "" name = "end_time" size="15"></th>
    				<th><input value = "" name = "reason" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("student_id") %></td>
    			<td><%= rs.getString("start_time") %></td>
    			<td><%= rs.getString("end_time") %></td>
    			<td><%= rs.getString("reason") %></td>
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