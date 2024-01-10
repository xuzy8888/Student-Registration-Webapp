<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>prerequisite Page</title>
  </head>
  <body>
  	<h1>prerequisite page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from course_prereq";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO course_prereq VALUES (?,?)");
    		pstmt.setString(1, request.getParameter("course_num"));
    		pstmt.setString(2, request.getParameter("pre_requisite"));
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
	    		<th>prerequisite</th>
    		</tr>
    		<tr>
    			<form action = "course_prereq.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "course_num" size="15"></th>
    				<th><input value = "" name = "pre_requisite" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("course_num") %></td>
    			<td><%= rs.getString("pre_requisite") %></td>
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