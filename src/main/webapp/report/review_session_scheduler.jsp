<%@ page language="java" contentType="text/html; charset=UTF=8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import= "java.time.LocalTime"%>
<!doctype html>
<html>
  <head>
  <meta charset="UTF-8">
    <title>Report b 2</title>
  </head>
  <body>
  	<h1>Review Session Scheduler</h1>
	
    <%@ page language="java" import="java.sql.*" %>
    <%
    Connection connection = null;
    ResultSet rs = null;
	PreparedStatement pstmt = null;
	ResultSetMetaData rsmd = null;
	
	ResultSet rs1 = null;
	PreparedStatement pstmt1 = null;
	ResultSetMetaData rsmd1 = null;

	boolean valid = true;
	
	int[][] reviewsession_occupied = new int[10][15];;
	int[][] weekly_occupied = new int [7][13];
	
	int idsection = 0;
	int start_month;
	int start_day;
	int end_month;
	int end_day;
	
	java.util.Date date1; 
	java.util.Date date2; 
	
	Calendar cal;
	
	int input_day_range = 0;
	
	int ct1,ct2,ct3,ct4,ct5,ct6;
	
	String[] days = {"Monday", "Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
	
    try{
    	DriverManager.registerDriver(new org.postgresql.Driver());
    	//---------------------------connection 要改------------------------------------
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
    		//----------------------------query里的year/quarter 要改------------------------------------

			pstmt = connection.prepareStatement("select distinct section.idsection, course_num, title, label from course natural join class natural join section natural join term where term.year = 2022 and term.quarter = 'spring';");

			
			rs = pstmt.executeQuery();
			
			
			connection.commit();
			connection.setAutoCommit(true);
	%>	
			<form action="review_session_scheduler.jsp" method="POST">
        
			<%
                if(rs.isBeforeFirst()) {
                %>
                	<select name="idsection">
				<%
				if (rs.isBeforeFirst())
				{
					while(rs.next()){
						%>
						<option value=<%=rs.getInt("idsection")%>> <%=rs.getInt("idsection")%> -- <%=rs.getString("course_num")%>  <%=rs.getString("title")%> section_label:<%=rs.getString("label")%></option>
						<%
					}
				}
				%>
			</select>
                	
            <br> 
            <br>   	
			<label for="start_month">Choose a Month:</label>
			
			<select name="start_month" id="start_month">
			  <option value=1>1</option>
			  <option value=2>2</option>
			  <option value=3>3</option>
			  <option value=4>4</option>
			  <option value=5>5</option>
			  <option value=6>6</option>
			  <option value=7>7</option>
			  <option value=8>8</option>
			  <option value=9>9</option>
			  <option value=10>10</option>
			  <option value=11>11</option>
			  <option value=12>12</option>
			</select>	
			
			<br>   	
			<label for="start_day">Choose a Day:</label>
			
			<select name="start_day" id="start_day">
			  <option value=1>1</option>
			  <option value=2>2</option>
			  <option value=3>3</option>
			  <option value=4>4</option>
			  <option value=5>5</option>
			  <option value=6>6</option>
			  <option value=7>7</option>
			  <option value=8>8</option>
			  <option value=9>9</option>
			  <option value=10>10</option>
			  <option value=11>11</option>
			  <option value=12>12</option>
			  <option value=13>13</option>
			  <option value=14>14</option>
			  <option value=15>15</option>
			  <option value=16>16</option>
			  <option value=17>17</option>
			  <option value=18>18</option>
			  <option value=19>19</option>
			  <option value=20>20</option>
			  <option value=21>21</option>
			  <option value=22>22</option>
			  <option value=23>23</option>
			  <option value=24>24</option>
			  <option value=25>25</option>
			  <option value=26>26</option>
			  <option value=27>27</option>
			  <option value=28>28</option>
			  <option value=29>29</option>
			  <option value=30>30</option>
			  <option value=31>31</option>
			</select>	
            
            <br> 
            <br>   	
			<label for="end_month">Choose a Month:</label>
			
			<select name="end_month" id="end_month">
			  <option value=1>1</option>
			  <option value=2>2</option>
			  <option value=3>3</option>
			  <option value=4>4</option>
			  <option value=5>5</option>
			  <option value=6>6</option>
			  <option value=7>7</option>
			  <option value=8>8</option>
			  <option value=9>9</option>
			  <option value=10>10</option>
			  <option value=11>11</option>
			  <option value=12>12</option>
			</select>	
			
			<br>   	
			<label for="end_day">Choose a Day:</label>
			
			<select name="end_day" id="end_day">
			  <option value=1>1</option>
			  <option value=2>2</option>
			  <option value=3>3</option>
			  <option value=4>4</option>
			  <option value=5>5</option>
			  <option value=6>6</option>
			  <option value=7>7</option>
			  <option value=8>8</option>
			  <option value=9>9</option>
			  <option value=10>10</option>
			  <option value=11>11</option>
			  <option value=12>12</option>
			  <option value=13>13</option>
			  <option value=14>14</option>
			  <option value=15>15</option>
			  <option value=16>16</option>
			  <option value=17>17</option>
			  <option value=18>18</option>
			  <option value=19>19</option>
			  <option value=20>20</option>
			  <option value=21>21</option>
			  <option value=22>22</option>
			  <option value=23>23</option>
			  <option value=24>24</option>
			  <option value=25>25</option>
			  <option value=26>26</option>
			  <option value=27>27</option>
			  <option value=28>28</option>
			  <option value=29>29</option>
			  <option value=30>30</option>
			  <option value=31>31</option>
			</select>    	
                	
                 <%
                }
                 %>	
			
            <button type="submit" name="action" value="submit">GET</button>
            </form>
        <%
		}else{
		connection.setAutoCommit(false);
		
		
		start_month = Integer.parseInt(request.getParameter("start_month"));
		start_day = Integer.parseInt(request.getParameter("start_day"));
		end_month = Integer.parseInt(request.getParameter("end_month"));
		end_day = Integer.parseInt(request.getParameter("end_day"));
		//System.out.println(start_month);
		
		date1 = new java.util.Date(118, start_month-1, start_day);
      	date2 = new java.util.Date(118, end_month-1, end_day);
      	System.out.println(date1);
      	System.out.println(date2);
      	long difference = date2.getTime() - date1.getTime();
  	  	int daysBetween = (int)(difference / (1000*60*60*24))+1;
  	  	System.out.println(daysBetween);
  	  	
  	  	cal = Calendar.getInstance();
  	  	cal.setTime(date1);
  	  	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK)-1;
  	  	System.out.println(dayOfWeek);
      	if(dayOfWeek == 0){
      		dayOfWeek = 7;
      	}
      	System.out.println(dayOfWeek);
      	
		pstmt = connection.prepareStatement("select distinct day_of_week, start_time, end_time from student_section natural join section_weekly natural join meeting_weekly where idstudent in (select distinct idstudent from student_section where idsection = ?);");
		//System.out.println(request.getParameter("idsection"));
		idsection = Integer.parseInt(request.getParameter("idsection"));
		pstmt.setInt(1, idsection);
		rs = pstmt.executeQuery();
		
		
		pstmt1 = connection.prepareStatement("select distinct date, start_time, end_time from student_section natural join section_review_session natural join meeting_review_session where idstudent in (select distinct idstudent from student_section where idsection = ?);");
		pstmt1.setInt(1, idsection);
		rs1 = pstmt1.executeQuery();
		
		
		if (start_month>end_month || (start_month==end_month && start_day>end_day)){
			valid = false;
			%><h1>input time range is invalid</h1> <%
		} else {
			input_day_range = daysBetween;
			//reviewsession_occupied = new int[10][15];
			//weekly_occupied = new int[7][13];
			for(int i=0;i<10;i++){
				reviewsession_occupied[i][0]=0;
				reviewsession_occupied[i][1]=0;
				reviewsession_occupied[i][2]=8;
				reviewsession_occupied[i][3]=9;
				reviewsession_occupied[i][4]=10;
				reviewsession_occupied[i][5]=11;
				reviewsession_occupied[i][6]=12;
				reviewsession_occupied[i][7]=13;
				reviewsession_occupied[i][8]=14;
				reviewsession_occupied[i][9]=15;
				reviewsession_occupied[i][10]=16;
				reviewsession_occupied[i][11]=17;
				reviewsession_occupied[i][12]=18;
				reviewsession_occupied[i][13]=19;
				reviewsession_occupied[i][14]=20;
			}
			for(int j=0;j<7;j++){
				weekly_occupied[j][0]=8;
				weekly_occupied[j][1]=9;
				weekly_occupied[j][2]=10;
				weekly_occupied[j][3]=11;
				weekly_occupied[j][4]=12;
				weekly_occupied[j][5]=13;
				weekly_occupied[j][6]=14;
				weekly_occupied[j][7]=15;
				weekly_occupied[j][8]=16;
				weekly_occupied[j][9]=17;
				weekly_occupied[j][10]=18;
				weekly_occupied[j][11]=19;
				weekly_occupied[j][12]=20;
			}
		}
		
		connection.commit();
		connection.setAutoCommit(true);
		//System.out.println("get here");
		
    	%>
    	<h3>Input start date is <%= start_month %>/<%= start_day %></h3>
    	<h3>Input end date is <%= end_month %>/<%= end_day %></h3>	
    	<h2>occupied weekly time</h2>
    	<table>
    		<tr>
	    		<th>day of week</th>
	    		<th>start time</th>
	    		<th>end time</th>
	    		
    		</tr>
    		
    		<% 
    		while (rs.next()){
    			if(valid){
		    		int tmp = rs.getInt("day_of_week")-1;
		    		
		    	
		    		LocalTime localTime = rs.getTime("start_time").toLocalTime();
		    		LocalTime localTime1 = rs.getTime("end_time").toLocalTime();
		    		int start_hr = localTime.getHour();
		    		int end_hr;
		    		if(localTime1.getMinute()!=0){
		    		   end_hr = localTime1.getHour() + 1;}
		    		else{
		    			end_hr = localTime1.getHour();
		    		}
		    		for(int k = 0; k<12;k++){
		    			if(weekly_occupied[tmp][k]>=start_hr && weekly_occupied[tmp][k]< end_hr){
		    				weekly_occupied[tmp][k] = 0;
		    			}
		    		}
    			}
     		%>	
     		<tr>
     			<td><input value = "<%= rs.getInt("day_of_week") %>" name = "day_of_week" size="15" readonly></td>
    			<td><input value = "<%= rs.getTime("start_time") %>" name = "start_time" size="15"></td>
    			<td><input value = "<%= rs.getTime("end_time") %>" name = "end_time" size="15"></td>

    		</tr>
    		
    		<%}
    		%>
    	</table>
    	<br>
    	<h2>occupied review session time</h2>
    	<table>
    		<tr>
	    		<th>date</th>
	    		<th>start time</th>
	    		<th>end time</th>
	    		
    		</tr>
    		
    		<% 
    		ct2=0;
    		while (rs1.next()){
    		
     		%>	
     		<tr>
     			<td><input value = "<%= rs1.getDate("date") %>" name = "date" size="15" readonly></td>
    			<td><input value = "<%= rs1.getTime("start_time") %>" name = "start_time" size="15"></td>
    			<td><input value = "<%= rs1.getTime("end_time") %>" name = "end_time" size="15"></td>

    		</tr>
    		
    		<%}
    		%>
    	</table>
    	<%
    	if(valid){
    		
    		ct1=dayOfWeek-1;
    		%>
    		<br>
    		<h2>Available review session time</h2>
        	<ul>
        	<%
        	//int cur_month = start_month;
        	//int cur_day = start_day;
        	//int day;
        	
    		for(int x = 0; x <input_day_range; x++){
    			
    			if(ct1==7){ct1=0;}
    			for(int y=0; y <12; y++){
    				if(weekly_occupied[ct1][y]>0 && ct1<5){
    					%><li><%=days[ct1]%> Date:<%=cal.get(Calendar.MONTH)+1%>/<%=cal.get(Calendar.DAY_OF_MONTH)%> : <%=weekly_occupied[ct1][y]%>:00 -> <%=weekly_occupied[ct1][y]+1%>:00</li><%
    				}
    			}
    			ct1++;
    			cal.add(Calendar.DATE, 1);
    		}
        	%>
        	</ul>
        	<%
    		
		}
	}%>
    	

    
    
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