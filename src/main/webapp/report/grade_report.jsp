<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Report a 3</title>
  </head>
  <body>
  	<h1>Display the grade report</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <%
    Connection connection = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	
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
			pstmt = connection.prepareStatement("select distinct SSN, FIRSTNAME, MIDDLENAME, LASTNAME from student NATURAL JOIN attendance");

			
			rs = pstmt.executeQuery();
			
			
			connection.commit();
			connection.setAutoCommit(true);
	%>	
			<form action="grade_report.jsp" method="POST">
        
			<%
                if(rs.isBeforeFirst()) {
                %>
                	<select name="SSN">
				<%
				if (rs.isBeforeFirst())
				{
					while(rs.next()){
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
		
		pstmt = connection.prepareStatement("select year, quarter, title, course_num, grade, number_grade from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade where SSN = ? order by year, quarter;");
		pstmt.setString(1, request.getParameter("SSN"));
		rs = pstmt.executeQuery();
		
		pstmt2 = connection.prepareStatement("select  year, quarter, sum(number_grade*units)/sum(units) as quarter_gpa from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade where number_grade > 0 and SSN = ? group by year,quarter;");
		pstmt2.setString(1, request.getParameter("SSN"));
		rs2 = pstmt2.executeQuery();
		
		pstmt3 = connection.prepareStatement("select sum(quarter_gpa*quarter_units)/sum(quarter_units) as cumulative_gpa from ( select  year, quarter, sum(number_grade*units)/sum(units) as quarter_gpa , sum(units) as quarter_units from student natural join student_class natural join class natural join course natural join term left join grade_conversion on grade = letter_grade where number_grade > 0 and SSN = ? group by year,quarter ) term_gpa;");
		pstmt3.setString(1, request.getParameter("SSN"));
		rs3 = pstmt3.executeQuery();
		
		connection.commit();
		connection.setAutoCommit(true);
    	%>	
    	<h2>All classes with grade</h2>
    	<table>
    		<tr>
	    		
	    		<th>year</th>
	    		<th>quarter</th>
	    		<th>course_title</th>
	    		<th>course_number</th>
	    		<th>letter_grade</th>
	    		<th>number_grade</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
     			
    			<td><input value = "<%= rs.getInt("year") %>" name = "year" size="15"></td>
    			<td><input value = "<%= rs.getString("quarter") %>" name = "quarter" size="15"></td>
    			<td><input value = "<%= rs.getString("title") %>" name = "title" size="15"></td>
    			<td><input value = "<%= rs.getString("course_num") %>" name = "course_num" size="15"></td>
    			<td><input value = "<%= rs.getString("grade") %>" name = "grade" size="15"></td>
    			<td><input value = "<%= rs.getDouble("number_grade") %>" name = "number_grade" size="15"></td>

    		</tr>
    		
    		<%}%>
    	</table>
    	
    	<br>
    	<h2>GPA by Quarter</h2>
    	<table>
    		<tr>
	    		
	    		<th>year</th>
	    		<th>quarter</th>
	    		<th>quarter_gpa</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs2.next()){
     		%>	
     		<tr>
     			
    			<td><input value = "<%= rs2.getInt("year") %>" name = "year" size="15"></td>
    			<td><input value = "<%= rs2.getString("quarter") %>" name = "quarter" size="15"></td>
    			<td><input value = "<%= rs2.getDouble("quarter_gpa") %>" name = "quarter_gpa" size="15"></td>

    		</tr>
    		
    		<%}%>
    	</table>
    	
    	
    	<br>
    	<h2>Cumulative GPA</h2>
    	<table>
    		<tr>
	    		
	    		
	    		<th>cumulative_gpa</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs3.next()){
     		%>	
     		<tr>
     		
    			<td><input value = "<%= rs3.getDouble("cumulative_gpa") %>" name = "cumulative_gpa" size="15"></td>

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