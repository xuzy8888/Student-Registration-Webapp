<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home Page</title>
</head>


<!-- HTML body part -->
<body>
	<h2>Student Home Page</h2>
				<% 
				try {
					DriverManager.registerDriver (new org.postgresql.Driver());
					Connection conn = DriverManager.getConnection("jdbc:postgresql:test_db?user=postgres&password=88921621xzy");

                    String action = request.getParameter("action");
				%>

				<%
                    if (action != null && action.equals("insert")) {
						
                        conn.setAutoCommit(false);
                        PreparedStatement pstmt = conn.prepareStatement("INSERT INTO student VALUES (?, ?, ?, ?, ?, ?, ?)");

                        pstmt.setString(1, request.getParameter("student_id"));
                        pstmt.setString(2, request.getParameter("ssn"));
                        pstmt.setString(3, request.getParameter("firstname"));
                        pstmt.setString(4, request.getParameter("middlename"));
                        pstmt.setString(5, request.getParameter("lastname"));
                        pstmt.setString(6, request.getParameter("residency"));
                        pstmt.setString(7, request.getParameter("enrollment"));
                        pstmt.executeUpdate();

                        conn.commit();
                        conn.setAutoCommit(true);
                    }
	            %>

				<%
					if (action != null && action.equals("update")) {
                        conn.setAutoCommit(false);
                        PreparedStatement pstmt = conn.prepareStatement("UPDATE student SET ssn = ?, firstname = ?, middlename = ?, lastname = ?, residency = ?, enrollment = ? WHERE student_id = ?");
                        pstmt.setString(1, request.getParameter("ssn"));
                        pstmt.setString(2, request.getParameter("firstname"));
                        pstmt.setString(3, request.getParameter("middlename"));
                        pstmt.setString(4, request.getParameter("lastname"));
                        pstmt.setString(5, request.getParameter("residency"));
                        pstmt.setString(6, request.getParameter("enrollment"));
                        pstmt.setString(7, request.getParameter("student_id"));
                        pstmt.executeUpdate();
                        
                        conn.setAutoCommit(false);
                        conn.setAutoCommit(true);
                    }
				%>

				<%
					if (action != null && action.equals("delete")) {
                        conn.setAutoCommit(false);
                        
                        PreparedStatement pstmt = conn.prepareStatement("DELETE FROM student WHERE student_id = ?");
                        pstmt.setString(1, request.getParameter("student_id"));
                        pstmt.executeUpdate();

                        conn.setAutoCommit(false);
                        conn.setAutoCommit(true);
                    }
				%>

				<table border="1">
					<tr>
						<th>student_id</th>
						<th>SSN</th>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>residency</th>
						<th>enrollment</th>
						<th>Action</th>
					</tr>
					<tr>
						<form action="student.jsp" method="get">
							<input type="hidden" value="insert" name="action">
							<th><input value="" name="student_id" size="15"></th>
							<th><input value="" name="ssn" size="15"></th>
							<th><input value="" name="firstname" size="15"></th>
							<th><input value="" name="middlename" size="15"></th>
							<th><input value="" name="lastname" size="15"></th>
							<th><input value="" name="residency" size="15"></th>
							<th><input value="" name="enrollment" size="15"></th>
							<th><input type="submit" value="Insert"></th>
						</form>
					</tr>

					<%
						String getStudentQuery = "SELECT * FROM student";
						Statement stmt = conn.createStatement(); 
						ResultSet rset = stmt.executeQuery(getStudentQuery);
						while (rset.next()){ 
					%>
						<tr>
							<form action="student.jsp" method="get">
								<input type="hidden" value="update" name="action">

								<td>
									<input value="<%= rset.getString("student_id") %>" name="student_id" size="15" readonly="true">
								</td>

								<td>
									<input value="<%= rset.getString("ssn") %>" name="ssn" size="15">
								</td>

								<td>
									<input value="<%= rset.getString("firstname") %>" name="firstname" size="15">
								</td>

								<td>
									<input value="<%= rset.getString("middlename") %>" name="middlename" size="15">
								</td>

								<td>
									<input value="<%= rset.getString("lastname") %>" name="lastname" size="15">
								</td>

								<td>
									<input value="<%= rset.getString("residency") %>" name="residency" size="15">
								</td>

								<td>
									<input value="<%= rset.getString("enrollment") %>" name="enrollment" size="15">
								</td>

								<td>
									<input type="submit" value="Update">
								</td>
							</form>
							<form action="student.jsp" method="get">
								<input type="hidden" value="delete" name="action">
								<input type="hidden" value="<%= rset.getString("student_id") %>" name="student_id">
								<td>
									<input type="submit" value="Delete">
								</td>
							</form>
						</tr>
					<% 
						} 
					%>
					<%
						rset.close();
						stmt.close();
						conn.close();
					} catch (SQLException sqle) {
						out.println(sqle.getMessage());
					} catch (Exception e) {
						out.println(e.getMessage());
					}%>
				</table>
			
	

	<p>if you are undergraduate student <a href = "undergraduates.jsp"> click here</a></p>
    <p>if you are graduate student <a href = "graduates.jsp"> click here</a></p>
    <p>update enrolled records <a href = "class_enrolled.jsp"> click here</a></p>
    <p>update class taken records <a href = "class_taken.jsp"> click here</a></p>
    <p>update attendance records <a href = "attendance.jsp"> click here</a></p>
    <p>update probation records <a href = "probation.jsp"> click here</a></p>
    <p>update previous education records <a href = "previous_edu.jsp"> click here</a></p>
   <p>back to <a href = "../index.html"> home page</a></p>
	
	
</body>
</html>