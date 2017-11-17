<html>
<head>
<title>Show Contact</title></head>
<style>
table{
    border: 3px solid black;
    border-collapse: collapse;
    border-spacing:25px;
}
 th, td{
 	 border: 1px solid black;
 	padding:10px;
 	text-align:center;
 }
 body{	background: #B6F4D9 url("https://www.nyrp.org/assets/images/img-tree.png") no-repeat right top fixed;

}
</style>
<body align="center">
<%@page import="java.util.*" %>
<%@page import="javax.jdo.*" %>
<%@page import="com.contact.*" %>
<form action="index.jsp" align=right> 
<input type="submit" value="Home"> 
</form>

<p align=center> <h1>Showing the Contacts</h1>
<% 
PersistenceManager pm = PMF.get().getPersistenceManager();
Query q = pm.newQuery(POJO.class);

	List<POJO> ls =  (List<POJO>) q.execute();
int i=1; 
for(POJO sp : ls){%>
<table align=center> 
<br><br><br></b>
<% out.print(" Value   :<h3>"+i+"</h3>");%>
<tr>
	<th><h3> Type</h3>
	<th><h3> Description</h3></th>
</tr>
<tr>
	<td> <% out.print("Id"); %></td>
	<td><% out.print(sp.getId()); %> </td>
</tr>

<tr>
	<td> <% out.print("Name"); %></td>
	<td><% out.print(sp.getName()); %> </td>
</tr>

<tr>
	<td> <% out.print("Age"); %></td>
	<td><% out.print(sp.getAge()); %> </td>
</tr>

<tr>
	<td> <% out.print("Dob"); %></td>
	<td><% out.print(sp.getDob()); %> </td>
</tr>

<tr>
	<td> <% out.print("Phone"); %></td>
	<td><% out.print(sp.getPhno()); %> </td>
</tr>

<tr>
	<td> <% out.print("Email"); %></td>
	<td><% out.print(sp.getEmail()); %> </td>
</tr>

<tr>
	<td> <% out.print("Address"); %></td>
	<td><% out.print(sp.getAddr()); %> </td>
</tr>
	<br>
	<br>
	<br>
	</table>
<% i++;}

%> 
</body>


</html>