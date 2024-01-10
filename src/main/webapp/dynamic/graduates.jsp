<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>graduate student Page</title>
  </head>
  <body>
  	<h1>graduate page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_STUDENT_QUERY = "select * from graduates";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO graduates VALUES (?,?)");
    		pstmt.setString(1, request.getParameter("student_id"));
    		pstmt.setString(2, request.getParameter("department"));
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
	    		<th>department</th>
	    		
    		</tr>
    		<tr>
    			<form action = "graduates.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "student_id" size="15"></th>
    				<th><input value = "" name = "department" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getString("student_id") %></td>
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
    
   <p>if you are MS student <a href = "MS_graduate.jsp"> click here</a></p> 
   <p>if you are PhD student <a href = "PhD_graduate.jsp"> click here</a></p>  
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>