<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>section Page</title>
  </head>
  <body>
  	<h1>section Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_section_QUERY = "select * from section";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO section VALUES (?,?,?,?,?,?,?)");
    		pstmt.setString(1, request.getParameter("section_id"));
    		pstmt.setString(2, request.getParameter("section_type"));
    		pstmt.setString(3, request.getParameter("section_day"));
    		pstmt.setString(4, request.getParameter("section_date"));
    		pstmt.setString(5, request.getParameter("section_time"));
    		pstmt.setString(6, request.getParameter("building"));
    		pstmt.setString(7, request.getParameter("room"));
    		
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_section_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>section_id</th>
	    		<th>section_type</th>
	    		<th>section_day</th>
	    		<th>section_date</th>
	    		<th>section_time</th>
	    		<th>building</th>
	    		<th>room</th>
    		</tr>
    		<tr>
    			<form action = "section.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "section_id" size="15"></th>
    				<th><input value = "" name = "section_type" size="15"></th>
    				<th><input value = "" name = "section_day" size="15"></th>
    				<th><input value = "" name = "section_date" size="15"></th>
    				<th><input value = "" name = "section_time" size="15"></th>
    				<th><input value = "" name = "building" size="15"></th>
    				<th><input value = "" name = "room" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("section_id") %></td>
    			<td><%= rs.getString("section_type") %></td>
    			<td><%= rs.getString("section_day") %></td>
    			<td><%= rs.getString("section_date") %></td>
    			<td><%= rs.getString("section_time") %></td>
    			<td><%= rs.getString("building") %></td>
    			<td><%= rs.getString("room") %></td>
    			
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
    
    <p>link section to a course <a href = "class_section.jsp"> here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>