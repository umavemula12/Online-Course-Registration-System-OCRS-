<center><body text='red'><h3>Logout Successful</h3></body></center>
<jsp:include page="admin.html" />
<br>
<%
	
	session.removeAttribute("user");
	
%>