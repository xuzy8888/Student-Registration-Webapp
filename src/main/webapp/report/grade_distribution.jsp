<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Report c</title>
  </head>
  <body>
  	<h1>Display the grade distribution</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <%
    Connection connection = null;
    ResultSet rs_c = null;
    ResultSet rs_f = null;
    ResultSet rs_q = null;
	PreparedStatement pstmt_c = null;
	PreparedStatement pstmt_f = null;
	PreparedStatement pstmt_q = null;
	
	int grade[];
	int units[];
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	int idcourse,idfaculty,idterm;
	
    try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	connection = DriverManager.getConnection("jdbc:postgresql:milestone3?user=postgres&password=88921621xzy");
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
			pstmt_c = connection.prepareStatement("select idcourse, course_num from course;");
			pstmt_f= connection.prepareStatement("select idfaculty, faculty_name from faculty;");
			pstmt_q = connection.prepareStatement("select idterm, year, quarter from term;");

			
			rs_c = pstmt_c.executeQuery();
			rs_f = pstmt_f.executeQuery();
			rs_q = pstmt_q.executeQuery();
			
			
			
			connection.commit();
			connection.setAutoCommit(true);
	%>	
			<form action="grade_distribution.jsp" method="POST">
        
			<%
                if(rs_c.isBeforeFirst()) {
                %>
                	<select name="idcourse">
				<%
				if (rs_c.isBeforeFirst())
				{
					while(rs_c.next()){
						%>
						<option value=<%=rs_c.getInt("idcourse")%>> <%=rs_c.getInt("idcourse")%> <%=rs_c.getString("course_num")%> </option>
						<%
					}
				}
				%>
			</select>
                 <%
                }
                 %>	
                 
                 
                <%
                if(rs_f.isBeforeFirst()) {
                %>
                	<select name="idfaculty">
                		<option value=0> null </option>
				<%
				if (rs_f.isBeforeFirst())
				{
					while(rs_f.next()){
						%>
						<option value=<%=rs_f.getInt("idfaculty")%>> <%=rs_f.getInt("idfaculty")%> <%=rs_f.getString("faculty_name")%> </option>
						<%
					}
				}
				%>
			</select>
                	<%
                }
                 %>	
                 
                 
                 
                 <%
                if(rs_q.isBeforeFirst()) {
                %>
                	<select name="idterm">
                		<option value=0> null </option>
				<%
				if (rs_q.isBeforeFirst())
				{
					while(rs_q.next()){
						%>
						<option value=<%=rs_q.getInt("idterm")%>> <%=rs_q.getInt("year")%> <%=rs_q.getString("quarter")%> </option>
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
		idcourse = Integer.parseInt(request.getParameter("idcourse"));
		idfaculty = Integer.parseInt(request.getParameter("idfaculty"));
		idterm = Integer.parseInt(request.getParameter("idterm"));
		grade = new int[5];
		
		if(idfaculty != 0 && idterm != 0){
			pstmt = connection.prepareStatement("select grade, count(*) from term natural join course natural join class natural join faculty_class natural join student_class where idterm = ? and idcourse = ? and idfaculty = ? group by grade;");
			pstmt.setInt(1, idterm);
			pstmt.setInt(2, idcourse);
			pstmt.setInt(3, idfaculty);
			rs = pstmt.executeQuery();
			
			
			connection.commit();
			connection.setAutoCommit(true);
			
			
    		while (rs.next()){
    			
    			if(rs.getString("grade").equals("A")){
    				grade[0]=rs.getInt("count");
    			}
    			else if(rs.getString("grade").equals("B")){
    				grade[1]=rs.getInt("count");
    			}
    			else if(rs.getString("grade").equals("C")){
    				grade[2]=rs.getInt("count");
    			}
    			else if(rs.getString("grade").equals("D")){
    				grade[3]=rs.getInt("count");
    			}
    			else{
    				grade[4]=grade[4]+rs.getInt("count");
    			}
     		
    		}
	    	%>	
	    	<h2>grade distribution with given course, faculty and term</h2>
	    	<table>
	    		<tr>
		    		
		    		<th>Grade</th>
		    		<th>Number</th>
		    		
	    		</tr>
	    		
	    		
	     		<tr>
	     			
	    			<td><input value = "A" name = "grade" size="15"></td>
	    			<td><input value = "<%= grade[0] %>" name = "number" size="15"></td>
	
	    		</tr>
	    		
	    		<tr>
	     			
	    			<td><input value = "B" name = "grade" size="15"></td>
	    			<td><input value = "<%= grade[1] %>" name = "number" size="15"></td>
	
	    		</tr>
	    		
	    		<tr>
	     			
	    			<td><input value = "C" name = "grade" size="15"></td>
	    			<td><input value = "<%= grade[2] %>" name = "number" size="15"></td>
	
	    		</tr>
	    		
	    		<tr>
	     			
	    			<td><input value = "D" name = "grade" size="15"></td>
	    			<td><input value = "<%= grade[3] %>" name = "number" size="15"></td>
	
	    		</tr>
	    		<tr>
	     			
	    			<td><input value = "other" name = "grade" size="15"></td>
	    			<td><input value = "<%= grade[4] %>" name = "number" size="15"></td>
	
	    		</tr>
	    		</table>
	    		<%
	    	}else if (idfaculty != 0 && idterm == 0){
	    		grade = new int[11];
	    		units = new int[11];
	    		pstmt = connection.prepareStatement("select grade, count(*), sum(units) as total_units from course natural join class natural join faculty_class natural join student_class where idcourse = ? and idfaculty = ? group by grade;");
				
				pstmt.setInt(1, idcourse);
				pstmt.setInt(2, idfaculty);
				rs = pstmt.executeQuery();
				
				
				connection.commit();
				connection.setAutoCommit(true);
				
				
	    		while (rs.next()){
	    			
	    			if(rs.getString("grade").equals("A")){
	    				grade[0]=rs.getInt("count");
	    				units[0]=rs.getInt("total_units");
	    			}
	    			else if(rs.getString("grade").equals("B")){
	    				grade[1]=rs.getInt("count");
	    				units[1]=rs.getInt("total_units");
	    			}
	    			else if(rs.getString("grade").equals("C")){
	    				grade[2]=rs.getInt("count");
	    				units[2]=rs.getInt("total_units");
	    			}
	    			else if(rs.getString("grade").equals("D")){
	    				grade[3]=rs.getInt("count");
	    				units[3]=rs.getInt("total_units");
	    			}
	    			
	    			else{
	    				grade[4]=grade[4]+rs.getInt("count");
	    				
	    				if(rs.getString("grade").equals("A+")){
	    					grade[5]=rs.getInt("count");
	    					units[5]=rs.getInt("total_units");
	    				}
	    				if(rs.getString("grade").equals("A-")){
	    					grade[6]=rs.getInt("count");
	    					units[6]=rs.getInt("total_units");
	    				}
	    				if(rs.getString("grade").equals("B+")){
	    					grade[7]=rs.getInt("count");
	    					units[7]=rs.getInt("total_units");
	    				}
	    				if(rs.getString("grade").equals("B-")){
	    					grade[8]=rs.getInt("count");
	    					units[8]=rs.getInt("total_units");
	    				}
	    				if(rs.getString("grade").equals("C+")){
	    					grade[9]=rs.getInt("count");
	    					units[9]=rs.getInt("total_units");
	    				}
	    				if(rs.getString("grade").equals("C-")){
	    					grade[10]=rs.getInt("count");
	    					units[10]=rs.getInt("total_units");
	    				}else{
	    					units[4]=units[4]+rs.getInt("total_units");
	    				}
	    				
	    			}
	     		
	    		}
	    		double avg_gpa = 
	    				(grade[0]*4*units[0] + grade[1]*3.1*units[1] + grade[2] *2.2*units[2] + grade[3] * 1.6*units[3] + grade[5] * 4.3*units[5] + grade[6] * 3.7*units[6] + grade[7] * 3.4 *units[7]
	    						+ grade[8] * 2.8*units[8] + grade[9]*2.5*units[9] + grade[10] * 1.9*units[10])/
	    				(grade[0]*units[0] + grade[1]*units[1] + grade[2]*units[2] + grade[3]*units[3] + grade[10]*units[10] + grade[5]*units[5] +grade[6]*units[6] + grade[7] *units[7]+ grade[8]*units[8]+grade[9]*units[9]);
	    		
		    	%>	
		    	<h2>grade distribution with given course and faculty</h2>
		    	<table>
		    		<tr>
			    		
			    		<th>Grade</th>
			    		<th>Number</th>
			    		
		    		</tr>
		    		
		    		
		     		<tr>
		     			
		    			<td><input value = "A" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[0] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		
		    		<tr>
		     			
		    			<td><input value = "B" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[1] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		
		    		<tr>
		     			
		    			<td><input value = "C" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[2] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		
		    		<tr>
		     			
		    			<td><input value = "D" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[3] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		<tr>
		     			
		    			<td><input value = "other" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[4] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		</table>
		    		<h2>The average GPA is <%= avg_gpa%></h2>
		    		<%
		    	
	    		
	    		
	    		
	    	}else if (idfaculty == 0 && idterm == 0){
	    		pstmt = connection.prepareStatement("select grade, count(*) from course natural join class natural join student_class where idcourse = ? group by grade;");
				pstmt.setInt(1, idcourse);
				rs = pstmt.executeQuery();
				
				
				connection.commit();
				connection.setAutoCommit(true);
				
				
	    		while (rs.next()){
	    			
	    			if(rs.getString("grade").equals("A")){
	    				grade[0]=rs.getInt("count");
	    			}
	    			else if(rs.getString("grade").equals("B")){
	    				grade[1]=rs.getInt("count");
	    			}
	    			else if(rs.getString("grade").equals("C")){
	    				grade[2]=rs.getInt("count");
	    			}
	    			else if(rs.getString("grade").equals("D")){
	    				grade[3]=rs.getInt("count");
	    			}
	    			else{
	    				grade[4]=grade[4]+rs.getInt("count");
	    			}
	     		
	    		}
		    	%>	
		    	<h2>grade distribution with given course</h2>
		    	<table>
		    		<tr>
			    		
			    		<th>Grade</th>
			    		<th>Number</th>
			    		
		    		</tr>
		    		
		    		
		     		<tr>
		     			
		    			<td><input value = "A" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[0] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		
		    		<tr>
		     			
		    			<td><input value = "B" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[1] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		
		    		<tr>
		     			
		    			<td><input value = "C" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[2] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		
		    		<tr>
		     			
		    			<td><input value = "D" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[3] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		<tr>
		     			
		    			<td><input value = "other" name = "grade" size="15"></td>
		    			<td><input value = "<%= grade[4] %>" name = "number" size="15"></td>
		
		    		</tr>
		    		</table>
		    		<%
	    		
	    	}else{
	    		%><h2>invalid input</h2><% 
	    	}
	    	
	    	
	   
		%>
	    	
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
	if (pstmt_c!=null)
		pstmt_c.close();
	%>
    

   <p>back to <a href = "../index.html"> home page</a></p>
    
  </body>
</html>