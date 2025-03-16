<%@ page import="java.sql.*"%>   

<%

		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pno = request.getParameter("pno");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String addr = request.getParameter("addr");
		String quali = request.getParameter("quali");
		String college = request.getParameter("college");
		String department = request.getParameter("department");
		String id = request.getParameter("id");
		String Year = request.getParameter("year");
		String langs = request.getParameter("lang");

		
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","uma_vemula");
			String qry="insert into stu values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(qry);

			
			pstmt.setString(1, name);
			pstmt.setString(2,email);
			pstmt.setString(3, pno);			
			pstmt.setString(4, dob);
			pstmt.setString(5, gender);
			pstmt.setString(6,addr);
			pstmt.setString(7, quali);			
			pstmt.setString(8, college);
			pstmt.setString(9, department);
			pstmt.setString(10, id);
			pstmt.setString(11, Year);			
			pstmt.setString(12, langs);
			
			
			
			pstmt.executeUpdate();

			out.print("<center><body text='pink'><h3>Successfully Enter</h3></body></center>");

			%>
				<jsp:include page="index.html"/>	
			<%
			con.close();

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

%>


