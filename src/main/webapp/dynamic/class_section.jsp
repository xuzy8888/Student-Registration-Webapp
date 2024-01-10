<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>class_section Page</title>
  </head>
  <body>
  	<h1>class_section Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_class_section_QUERY = "select * from class_section";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO class_section VALUES (?,?,?,?)");
    		pstmt.setString(1, request.getParameter("course_num"));
    		pstmt.setString(2, request.getParameter("term"));
    		pstmt.setString(3, request.getParameter("faculty_name"));
    		pstmt.setString(4, request.getParameter("section_id"));
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_class_section_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>course_num</th>
	    		<th>term</th>
	    		<th>faculty_name</th>
	    		<th>section_id</th>
    		</tr>
    		<tr>
    			<form action = "class_section.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				
    				<th><input value = "" name = "course_num" size="15"></th>
    				<th><input value = "" name = "term" size="15">
    				<th><input value = "" name = "faculty_name" size="15"></th>
    				<th><input value = "" name = "section_id" size="15"></th>
    				
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("course_num") %></td>
    			<td><%= rs.getString("term") %></td>
    			<td><%= rs.getString("faculty_name") %></td>
    			<td><%= rs.getString("section_id") %></td>
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