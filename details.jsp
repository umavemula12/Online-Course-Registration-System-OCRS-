<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>student Profile</title>
    <link rel="stylesheet" href="style12.css">
</head>
<body>
    

   <div class="container">
   	  <a href="index.html">Back to home</a>
       <center> <h1><br>Student Profile<br></h1></center><br>
        <%
            String username = (String)session.getAttribute("user"); 

            if (username == null) {
                response.sendRedirect("login.jsp");  
                return; 
            }

            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "uma_vemula");
                String query = "SELECT * FROM stu WHERE name = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, username);
                rs = pstmt.executeQuery();

                if (rs.next()) {

                    
                    String name = rs.getString("name");
					String email = rs.getString("email");
					String pno = rs.getString("pno");
					String dob = rs.getString("dob");
					String gender = rs.getString("gender");
					String addr = rs.getString("addr");
					String quali = rs.getString("quali");
					String college = rs.getString("college");
					String department = rs.getString("depatment");
					String id = rs.getString("id");
					String Year = rs.getString("year");
					String langs = rs.getString("lang");
					
			                   
                               
        %>
			
        <center>
    <table border="5" cellspacing="0" colspan="2" rowspan="2" align='center' height="450%" width="40%">
        <tr>
            <th>Name</th>
            <td><%= name %></td>
        </tr>

        <tr>
            <th>Email</th>
            <td><%= email %></td>
        </tr>
		<tr>
            <th>Phone No</th>
            <td><%= pno %></td>
        </tr>
		<tr>
            <th>DOB</th>
            <td><%= dob %></td>
        </tr>
        
        <tr>
            <th>gender</th>
            <td><%= gender %></td>
        </tr>
        
        <tr>
            <th>Address</th>
            <td><%= addr %></td>
        </tr>
		<tr>
            <th>Qualification</th>
            <td><%= quali %></td>
        </tr>
		<tr>
            <th>College</th>
            <td><%= college %></td>
        </tr>
		<tr>
            <th>Department</th>
            <td><%= department %></td>
        </tr>
		<tr>
            <th>Enrollement Id</th>
            <td><%= id %></td>
        </tr>
		<tr>
            <th>Year</th>
            <td><%= Year %></td>
        </tr>
		<tr>
            <th>Languages Known</th>
            <td><%= langs %></td>
        </tr>
		
    </table>
</center>

        <%
                } 
		else {
                    out.println("<p>Student Not Fill the details so fill the student details.</p>");
					out.print("<a href='student_details.html'>Student profile</a></li>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } 
        %>
    </div>

    <footer style="text-align: center;">
       Copy Right @Vemula Uma 22761A05C6
    </footer>
</body>
</html>
