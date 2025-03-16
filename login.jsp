<%@ page import="java.sql.*" %>

<%
        String uname=request.getParameter("username");
		String pwd=request.getParameter("password");
		
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","uma_vemula");

            String qry="select * from register where uname=? and pwd=?";
            PreparedStatement pst=con.prepareStatement(qry);
            pst.setString(1,uname);
            pst.setString(2,pwd);
            ResultSet rs=pst.executeQuery();
			
            if(rs.next())
            {
                
				session.setAttribute("user",uname);
				%>
				<jsp:include page="index.html"/>
				
				
			<%
            }
            else
            {
                out.print("<center><body text='red'><h3>Login Failed</h3></body></center>");
				%>
				<jsp:include page="login.html"/>
			<%
            }
            con.close();
        }
        catch (Exception e)
	{
		e.printStackTrace();
	}

%>