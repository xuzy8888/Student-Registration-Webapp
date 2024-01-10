<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Report b 1</title>
  </head>
  <body>
  	<h1>Display the course/class/section with schedule conflicts</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <%
    Connection connection = null;
    ResultSet rs = null;
	PreparedStatement pstmt = null;
	String ssn = null;
    try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	//----------------------------connection 要改------------------------------------
    	connection = DriverManager.getConnection("jdbc:postgresql:milestone3?user=postgres&password=88921621xzy");
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
    		//----------------------------query里的spring 要改------------------------------------
			pstmt = connection.prepareStatement("select SSN, FIRSTNAME, MIDDLENAME, LASTNAME from student NATURAL JOIN attendance NATURAL JOIN term WHERE year=2022 and quarter='spring'");
			
			rs = pstmt.executeQuery();
			
			
			connection.commit();
			connection.setAutoCommit(true);
	%>	
			<form action="conflict_classes.jsp" method="POST">
        
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
		
		//----------------------------query里的year/quarter要改------------------------------------
		pstmt = connection.prepareStatement("select distinct all_info.course_num, all_info.title as class_title, all_info.label as section_num from (course natural join class natural join section) all_info, section_weekly where all_info.idsection = section_weekly.idsection and section_weekly.idmeeting_weekly in (select distinct all_meetings.idmeeting_weekly from (select course_num, class.title as class_title, section.label as section_num, meeting_weekly.idmeeting_weekly, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time from course natural join class natural join term natural join section natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly where term.year = 2022 and term.quarter='spring') all_meetings, (select course_num, class.title as class_title, section.label as section_num, meeting_weekly.label as meeting_type, day_of_week, start_time, end_time from student natural join student_section natural join section natural join class natural join term natural join course natural join section_weekly join meeting_weekly on section_weekly.idmeeting_weekly = meeting_weekly.idmeeting_weekly where term.year = 2022 and term.quarter='spring' and ssn = ?) student_meetings where all_meetings.day_of_week = student_meetings.day_of_week and (all_meetings.start_time >= student_meetings.start_time and all_meetings.start_time <= student_meetings.end_time) or (all_meetings.end_time >= student_meetings.start_time and all_meetings.end_time <= student_meetings.end_time) or (all_meetings.end_time >= student_meetings.end_time and all_meetings.start_time <= student_meetings.start_time));");
		//System.out.println(request.getParameter("SSN"));
		pstmt.setString(1, request.getParameter("SSN"));
		rs = pstmt.executeQuery();
		connection.commit();
		connection.setAutoCommit(true);
    	%>	
    	<table>
    		<tr>
	    		<th>course_num</th>
	    		<th>class_title</th>
	    		<th>section_id</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs.next()){
     		%>	
     		<tr>
     			<td><input value = "<%= rs.getString("course_num") %>" name = "course_num" size="15" readonly></td>
    			<td><input value = "<%= rs.getString("class_title") %>" name = "class_title" size="15"></td>
    			<td><input value = "<%= rs.getString("section_num") %>" name = "section_num" size="15"></td>

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