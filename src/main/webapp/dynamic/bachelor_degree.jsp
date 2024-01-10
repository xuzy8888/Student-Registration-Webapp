<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>bachelor_degree Page</title>
  </head>
  <body>
  	<h1>bachelor_degree Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_bachelor_degree_QUERY = "select * from bachelor_degree";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO bachelor_degree VALUES (?,?,?,?,?,?,?)");
    		pstmt.setInt(1,Integer.parseInt(request.getParameter("degree_id")));
    		pstmt.setString(2, request.getParameter("major_or_minor"));
    		pstmt.setInt(3,Integer.parseInt(request.getParameter("upper_units")));
    		pstmt.setInt(4,Integer.parseInt(request.getParameter("lower_units")));
    		pstmt.setString(5, request.getParameter("transfer"));
    		pstmt.setString(6, request.getParameter("department"));
    		pstmt.setString(7, request.getParameter("min_grade"));
    		
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
	    		<th>major_or_minor</th>
	    		<th>upper_units</th>
	    		<th>lower_units</th>
	    		<th>transfer</th>
	    		<th>department</th>
	    		<th>min_grade</th>
    		</tr>
    		<tr>
    			<form action = "bachelor_degree.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "degree_id" size="15"></th>
    				<th><input value = "" name = "major_or_minor" size="15"></th>
    				<th><input value = "" name = "upper_units" size="15"></th>
    				<th><input value = "" name = "lower_units" size="15"></th>
    				<th><input value = "" name = "transfer" size="15"></th>
    				<th><input value = "" name = "department" size="15"></th>
    				<th><input value = "" name = "min_grade" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getInt("degree_id") %></td>
    			<td><%= rs.getString("major_or_minor") %></td>
    			<td><%= rs.getInt("upper_units") %></td>
    			<td><%= rs.getInt("lower_units") %></td>
    			<td><%= rs.getString("transfer") %></td>
    			<td><%= rs.getString("department") %></td>
    			<td><%= rs.getString("min_grade") %></td>
    			
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
    
    <p>enter lower division required courses <a href = "bachelor_degree_lower_req.jsp"> here</a></p>
    <p>enter upper division core courses <a href = "bachelor_degree_upper_core.jsp"> here</a></p>
    <p>enter upper division elective courses <a href = "bachelor_degree_upper_elect.jsp"> here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>