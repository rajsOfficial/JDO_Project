<html>
<head>
<title>Edit Page</title></head><style type="text/css">
body{	background: #B6F4D9 url("https://www.nyrp.org/assets/images/img-tree.png") no-repeat right top fixed;

}
.container input {
	width: 20%;
	height: 27px;
	}
form {

	align: center;
}
</style>
<form action="index.jsp" align=right> 
<input type="submit" value="Home"> 
</form>

<%@page import="java.util.*" %>
<%@ page buffer="10kb" autoFlush="false" %>
<%@page import=" com.google.appengine.api.datastore.*" %>
<%@page import="com.contact.*" %>
<%@page import="javax.jdo.*" %>
<%@page isErrorPage="true" %>
<% 
int id=Integer.parseInt(request.getParameter("S1"));
Key k= KeyFactory.createKey("POJO",id);	
PersistenceManager pm = PMF.get().getPersistenceManager();

try{

POJO sp = pm.getObjectById(POJO.class, k);
session.setAttribute("id", id);
	%>
	<body align="center">
	<h1 align=center>Enter Your Details Here to edit</h1>
	<h4>
		<div class="container">
			<form action="update" method="post">
			<label>Name</label> <input type="text" name="name1" value=<%=sp.getName() %> ><br><br>
				<label>Age </label> <input type="number" name="age1" value=<%= sp.getAge() %> > (Age should be within 14-99)<br><br>
				<label>DOB </label><input type="date" name="dob1"  value=<%=sp.getDob() %> >
				(Year should be between 1917-2003)<br><br>
				 <label>Phone</label>	<input type="number" name="ph1" value=<%=sp.getPhno() %> ><br> <br>
				 <label>Email</label><input type="email" name="email1" value=<%=sp.getEmail() %> ><br><br> 
				 <label>Address</label><input type="text" name="addr1" value=<%=sp.getAddr() %> ><br> <br>
				 <input type="submit">
			</form>
		</div>
	
		<%}
catch(Exception e) {
	response.getWriter().print("No such contact present for the Given Id "); 
%>	<jsp:forward page="Edit.jsp" />
<%} %>


		
</body>
</html>
