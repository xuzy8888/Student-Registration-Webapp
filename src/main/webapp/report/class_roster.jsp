<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Report a 2</title>
  </head>
  <body>
  	<h1>Display the class roster</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <%
    Connection connection = null;
    ResultSet rs = null;
	PreparedStatement pstmt = null;
	
    try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	connection = DriverManager.getConnection("jdbc:postgresql:m3_prepared?user=postgres&password=88921621xzy");
    	//connection = DriverManager.getConnection("jdbc:postgresql:cse132b?user=postgres&password=7815");
    }catch(Exception e){
    	out.println(e.getMessage());
    }
    
    
    %>
    <% try{
    	
    	
    	
    	/*=========enrolled student list======*/
    	String action = request.getParameter("action");
    	Statement statement = connection.createStatement();
    	
    %>
    <%
    	if(action ==null){
    		connection.setAutoCommit(false);
			pstmt = connection.prepareStatement("select class.title, course.course_num, term.year, term.quarter from class natural join course natural join term");

			
			rs = pstmt.executeQuery();
			
			
			connection.commit();
			connection.setAutoCommit(true);
	%>	
			<form action="class_roster.jsp" method="POST">
        
			<%
                if(rs.isBeforeFirst()) {
                %>
                	<select name="class_title">
				<%
				if (rs.isBeforeFirst())
				{
					while(rs.next()){
						%>
						<option value=<%=rs.getString("title")%>> <%=rs.getString("title")%> ( <%=rs.getString("course_num")%> ) <%=rs.getInt("year")%> / <%=rs.getString("quarter")%></option>
						<%
					}
				}
				%>
			</select>
                	
                	
                	
                	
                	
                 <%
                }
                 %>	
			
            <button type="submit" name="action" value="submit">GET</button>
            </form>
        <%
		}else{
		connection.setAutoCommit(false);
		
		pstmt = connection.prepareStatement("select SSN, FIRSTNAME, MIDDLENAME, LASTNAME, RESIDENCY, ENROLLMENT, student_class.units, student_class.grade_option from student_class natural join student natural join class where class.title = ?;");
		//System.out.println(request.getParameter("SSN"));
		pstmt.setString(1, request.getParameter("class_title"));
		rs = pstmt.executeQuery();
		connection.commit();
		connection.setAutoCommit(true);
    	%>	
    	<table>
    		<tr>
	    		<th>SSN</th>
	    		<th>first name</th>
	    		<th>middle name</th>
	    		<th>last name</th>
	    		<th>residence</th>
	    		<th>enrollment</th>
	    		<th>units</th>
	    		<th>grading option</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
     			<td><input value = "<%= rs.getString("SSN") %>" name = "SSN" size="15" readonly></td>
    			<td><input value = "<%= rs.getString("FIRSTNAME") %>" name = "FIRSTNAME" size="15"></td>
    			<td><input value = "<%= rs.getString("MIDDLENAME").equals("NULL")? " " : rs.getString("MIDDLENAME") %>" name = "MIDDLENAME" size="15"></td>
    			<td><input value = "<%= rs.getString("LASTNAME") %>" name = "LASTNAME" size="15"></td>
    			<td><input value = "<%= rs.getString("RESIDENCY") %>" name = "RESIDENCY" size="15"></td>
    			<td><input value = "<%= rs.getString("ENROLLMENT") %>" name = "ENROLLMENT" size="15"></td>
    			<td><input value = "<%= rs.getInt("units") %>" name = "units" size="15"></td>
    			<td><input value = "<%= rs.getString("grade_option") %>" name = "grade_option" size="15"></td>

    		</tr>
    		
    		<%}%>
    	</table>
    	<%
 		}
		%>
    	

    
    
    <%
    } catch (SQLException sqle){
    	connection.rollback();
    	out.println(sqle.getMessage());
    } catch (Exception e) {
    	connection.rollback();
    	out.println(e.getMessage());
    }
    %>
    <%
	if (connection != null)
		connection.close();
	if (pstmt!=null)
		pstmt.close();
	%>
    

   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>