
<%@ import="java.io.*" %>
<%@ import="java.sql.*" %>
<%@ import="javax.servlet.*" %>
<%
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","uma_vemula");

			Statement stmt = con.createStatement();
			String qry="select * from register";

			ResultSet rs=stmt.executeQuery(qry);
<u></u>
			out.print("<table border=3>");
			  out.print("<tr>");
			   out.print("<th>USER NAME</th>");
			   out.print("<th>EMAIL</th>");
			   out.print("<th>PASSWORD</th>");
			   
			  out.print("</tr>");

			  while(rs.next())
			  {
				  out.print("<tr>");
					
					out.print("<td>"+rs.getString(1)+"</td>");
					
					out.print("<td>"+rs.getString(2)+"</td>");
					out.print("<td>"+rs.getString(3)+"</td>");
					
				  out.print("</tr>");
			  }
			out.print("</table>");
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

%>



