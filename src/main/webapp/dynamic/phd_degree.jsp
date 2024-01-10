<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>phd_degree Page</title>
  </head>
  <body>
  	<h1>phd_degree Page</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <% try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	String GET_phd_degree_QUERY = "select * from phd_degree";
    	Connection connection = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");
    
    	String action = request.getParameter("action");
    	if (action != null && action.equals("insert")){
    		connection.setAutoCommit(false);
    		PreparedStatement pstmt = connection.prepareStatement("INSERT INTO phd_degree VALUES (?,?,?,?,?,?,?)");
    		pstmt.setInt(1,Integer.parseInt(request.getParameter("degree_id")));
    		pstmt.setString(2, request.getParameter("dissertation"));
    		pstmt.setString(3, request.getParameter("time_limit"));
    		pstmt.setString(4, request.getParameter("research_exam"));
    		pstmt.setString(5, request.getParameter("qualify_exam"));
    		pstmt.setString(6, request.getParameter("min_grade"));
    		pstmt.setString(7, request.getParameter("TA_req"));
    		
    		pstmt.executeUpdate();
    		connection.commit();
    		connection.setAutoCommit(true);
    	}
    	
    	Statement stmt = connection.createStatement();
    	ResultSet rs = stmt.executeQuery(GET_phd_degree_QUERY);
    	%>
    	<table>
    		<tr>
	    		<th>degree_id</th>
	    		<th>dissertation</th>
	    		<th>time_limit</th>
	    		<th>research_exam</th>
	    		<th>qualify_exam</th>
	    		<th>min_grade</th>
	    		<th>TA_req</th>
    		</tr>
    		<tr>
    			<form action = "phd_degree.jsp" method = "get">
    				<input type="hidden" value="insert" name="action">
    				<th><input value = "" name = "degree_id" size="15"></th>
    				<th><input value = "" name = "dissertation" size="15"></th>
    				<th><input value = "" name = "time_limit" size="15"></th>
    				<th><input value = "" name = "research_exam" size="15"></th>
    				<th><input value = "" name = "qualify_exam" size="15"></th>
    				<th><input value = "" name = "min_grade" size="15"></th>
    				<th><input value = "" name = "TA_req" size="15"></th>
    				<th><input type="submit" value = "Insert"></th>
    			</form>
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
    			<td><%= rs.getInt("degree_id") %></td>
    			<td><%= rs.getString("dissertation") %></td>
    			<td><%= rs.getString("time_limit") %></td>
    			<td><%= rs.getString("research_exam") %></td>
    			<td><%= rs.getString("qualify_exam") %></td>
    			<td><%= rs.getString("min_grade") %></td>
    			<td><%= rs.getString("TA_req") %></td>    			
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
    
    
    <p>update phd degree courses <a href = "phd_degree_course.jsp"> here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>