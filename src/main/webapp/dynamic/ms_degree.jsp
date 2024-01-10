<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>ms_degree Page</title>
  </head>
  <body>
  	<h1>ms_degree Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_bachelor_degree_QUERY = "select * from ms_degree";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO ms_degree VALUES (?,?,?,?,?,?)");
    		pstmt.setInt(1,Integer.parseInt(request.getParameter("degree_id")));
    		pstmt.setString(2, request.getParameter("department_id"));
    		pstmt.setString(3, request.getParameter("concentration"));
    		pstmt.setInt(4,Integer.parseInt(request.getParameter("concentration_units")));
    		pstmt.setString(5, request.getParameter("min_grade"));
    		pstmt.setString(6, request.getParameter("thesis"));
    		
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_bachelor_degree_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>degree_id</th>
	    		<th>department</th>
	    		<th>concentration</th>
	    		<th>concentration units</th>
	    		<th>min_grade</th>
	    		<th>thesis</th>
    		</tr>
    		<tr>
    			<form action = "ms_degree.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "degree_id" size="15"></th>
    				<th><input value = "" name = "department_id" size="15"></th>
    				<th><input value = "" name = "concentration" size="15"></th>
    				<th><input value = "" name = "concentration_units" size="15"></th>
    				<th><input value = "" name = "min_grade" size="15"></th>
    				<th><input value = "" name = "thesis" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getInt("degree_id") %></td>
    			<td><%= rs.getString("department_id") %></td>
    			<td><%= rs.getString("concentration") %></td>
    			<td><%= rs.getInt("concentration_units") %></td>
    			<td><%= rs.getString("min_grade") %></td>
    			<td><%= rs.getString("thesis") %></td>
    			
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