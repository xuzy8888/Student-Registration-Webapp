<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>phd_degree_course Page</title>
  </head>
  <body>
  	<h1>phd_degree_course Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_phd_degree_course_QUERY = "select * from phd_degree_course";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO phd_degree_course VALUES (?,?)");
    		pstmt.setInt(1,Integer.parseInt(request.getParameter("degree_id")));
    		pstmt.setString(2, request.getParameter("course_req"));
    		
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_phd_degree_course_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>degree_id</th>
	    		<th>course_name</th>
	    		
    		</tr>
    		<tr>
    			<form action = "phd_degree_course.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "degree_id" size="15"></th>
    				<th><input value = "" name = "course_req" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getInt("degree_id") %></td>
    			<td><%= rs.getString("course_req") %></td>
    			  			
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