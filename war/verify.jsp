<html>
<head>
</head>

<title>Contact Book</title>
<style>
.container input {
	width: 20%;
	height: 27px;
}
body{	background: #B6F4D9 url("https://www.nyrp.org/assets/images/img-tree.png") no-repeat right top fixed;

}
form {
	align: center;
}

</style>
<%@page import="com.contact.POJO" %>
<form action="index.jsp" align=right>
	<input type="submit" value="Home">
</form>

<body align="center">

	<h1 align=center>Enter Your Details Here</h1>
	<h4>
		<div class="container">
		<% POJO sp=(POJO) session.getAttribute("Pojo"); %>
			<form action="controller" method="post">
				
				<label>Id </label> <input type="number" name="id" value=<%=sp.getId()%> required /><br><br> 
				<label>Name</label> <input type="text" name="name" value=<%=sp.getName()%> required /><br>
				<br> <label>Age </label> <input type="number" name="age" value=<%=sp.getAge()%> required /> (Age should be within 14-99)<br>
				<br> <label>DOB </label><input type="date" name="dob" value=<%=sp.getDob()%> required /> (Year should be between 1917-2003)<br>
				<br> <label>Phone</label> <input type="number" name="ph" value=<%=sp.getPhno()%>	required /><br> <br>
				<label>Email </label><input type="email" name="email"  value=<%=sp.getEmail()%> required /><br><br>
			    <label>Address</label> <input type="text" name="adr" value=<%=sp.getAddr()%>  required /><br> <br>
			 
				<input type="submit">
   <%-- <% session.invalidate(); %> --%>
			</form>

		</div>
	</h4>
</body>


</html>