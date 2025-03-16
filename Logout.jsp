<center><body text='red'><h3>Logout Successful</h3></body></center>
<jsp:include page="login.html" />
<br>
<%
	
	session.removeAttribute("user");
	
%>