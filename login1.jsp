<%@ page import="java.sql.*" %>

<%
        String uname=request.getParameter("username");
	String pwd=request.getParameter("password");
		
        try{
            if(uname.equals("uma") && pwd.equals("uma123"))
            {
                
				session.setAttribute("user",uname);
				
				%>
				<jsp:include page="admin.jsp"/>
				
				
			<%
            }
            else
            {
                out.print("<center><body text='red'><h3>Login Failed</h3></body></center>");
				%>
				<jsp:include page="admin.html"/>
			<%
            }
            
        }
        catch (Exception e)
	{
		e.printStackTrace();
	}

%>