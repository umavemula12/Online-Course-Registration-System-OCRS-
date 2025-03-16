<%@ page import="java.sql.*"%>   

<%

		
		String uname=request.getParameter("username");
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		
		String cpwd=request.getParameter("confirmPassword");
		

		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","uma_vemula");
			String qry="insert into register values(?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(qry);

			
			pstmt.setString(1, uname);
			pstmt.setString(2,email);
			pstmt.setString(3, pwd);			
			pstmt.setString(4, cpwd);
			
			
			pstmt.executeUpdate();

			out.print("<center><body text='pink'><h3>Registeration Successful</h3></body></center>");

			%>
				<jsp:include page="login.html"/>	
			<%
			con.close();

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
%>
