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
    	String GET_STUDENT_QUERY = "select * from student";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO student VALUES (?,?,?)");
    		pstmt.setInt(1,Integer.parseInt(request.getParameter("id")));
    		pstmt.setInt(2,Integer.parseInt(request.getParameter("age")));
    		pstmt.setString(3, request.getParameter("name"));
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_STUDENT_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>id</th>
	    		<th>age</th>
	    		<th>name</th>
    		</tr>
    		<tr>
    			<form action = "student.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "id" size="15"></th>
    				<th><input value = "" name = "age" size="15"></th>
    				<th><input value = "" name = "name" size="20"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getInt("id") %></td>
    			<td><%= rs.getInt("age") %></td>
    			<td><%= rs.getString("name") %></td>
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