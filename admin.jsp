<%@ page import="java.sql.*" %>
<%
try {
   
    Class.forName("oracle.jdbc.driver.OracleDriver");
    
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "uma_vemula");

    Statement stmt = con.createStatement();
  
    ResultSet rs = stmt.executeQuery("SELECT * FROM register");

    out.print("<html><body>");
	out.print("<a href='index1.html'>Back to home page</a><br>");
	out.print("<a href='index.html'>Go to main page</a><br>");
	out.print("<a href='logout1.jsp'>Logout</a>");
    out.print("<h2 align='center'=>User Registrations</h2>");
    out.print("<table border='1' width='100%' cellspacing='0'>");

    // Table headers
    out.print("<tr>");
    
    out.print("<th>Username</th>");
	out.print("<th>Email</th>");
    out.print("<th>Password</th>");  
    
    out.print("</tr>");

    
    while (rs.next()) {
        out.print("<tr>");
	
		out.print("<td>" + rs.getString("uname") + "</td>");
		out.print("<td>" + rs.getString("email") + "</td>");
		out.print("<td>" + rs.getString("pwd") + "</td>");
        
        out.print("</tr>");
    }
    out.print("</table>");
    out.print("</body></html>");

    con.close();
} catch (Exception e) {
    out.print(e);
}
%>
