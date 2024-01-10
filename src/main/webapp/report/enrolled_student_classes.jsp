<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Report a 1</title>
  </head>
  <body>
  	<h1>Display the classes currently taken by student</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <%
    Connection connection = null;
    ResultSet rs = null;
	PreparedStatement pstmt = null;
	String ssn = null;
    try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	connection = DriverManager.getConnection("jdbc:postgresql:m3_prepared?user=postgres&password=88921621xzy");
    	//connection = DriverManager.getConnection("jdbc:postgresql:cse132b?user=postgres&password=7815");
    }catch(Exception e){
    	out.println(e.getMessage());
    }
    
    
    %>
    <% try{
    	
    	
    	
    	/*=========current student list======*/
    	String action = request.getParameter("action");
    	Statement statement = connection.createStatement();
    	
    %>
    <%
    	if(action ==null){
    		connection.setAutoCommit(false);
			pstmt = connection.prepareStatement("select SSN, FIRSTNAME, MIDDLENAME, LASTNAME from student NATURAL JOIN attendance NATURAL JOIN term WHERE year=2018 and quarter='spring'");
			
			rs = pstmt.executeQuery();
			
			
			connection.commit();
			connection.setAutoCommit(true);
	%>	
			<form action="enrolled_student_classes.jsp" method="POST">
        
			<%
                if(rs.isBeforeFirst()) {
                %>
                	<select name="SSN">
				<%
				if (rs.isBeforeFirst())
				{
					while(rs.next()){
						//System.out.println(rs.getString("SSN"));
						%>
						<option value=<%=rs.getString("SSN")%>> <%=rs.getString("FIRSTNAME")%> <%=rs.getString("MIDDLENAME").equals("NULL")? " " : rs.getString("MIDDLENAME")%> <%=rs.getString("LASTNAME")%> - <%=rs.getString("SSN")%></option>
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
		
		pstmt = connection.prepareStatement("Select course.course_num , class.title , student_class.units, student_class.grade_option from student NATURAL JOIN student_section NATURAL JOIN section NATURAL JOIN student_class NATURAL JOIN class NATURAL JOIN  course NATURAL JOIN term where SSN= ? AND year=2018 and quarter='spring'");
		//System.out.println(request.getParameter("SSN"));
		pstmt.setString(1, request.getParameter("SSN"));
		rs = pstmt.executeQuery();
		connection.commit();
		connection.setAutoCommit(true);
    	%>	
    	<table>
    		<tr>
	    		<th>course_num</th>
	    		<th>title</th>
	    		<th>units</th>
	    		<th>grade_option</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
     			<td><input value = "<%= rs.getString("course_num") %>" name = "course_num" size="15" readonly></td>
    			<td><input value = "<%= rs.getString("title") %>" name = "title" size="15"></td>
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