<html>
<head>
<title>Edit Page</title></head><style>
body{	background: #B6F4D9 url("https://www.nyrp.org/assets/images/img-tree.png") no-repeat right top fixed;

}</style>
<form action="index.jsp" align=right> 
<input type="submit" value="Home"> 
</form>
<body align="center">
<h1> Welcome to the Edit Page</h1><br>
<br>
<br><br><br>
<h3>Enter the ID to Edit</h3>
<%@page import=" com.google.appengine.api.datastore.*" %>
<%@page isErrorPage="true" %>

<form action="Editing.jsp">
Here 	<input type="number" name="S1" required/>
<input type="submit" value="Enter">	</form>

</body>

</html>