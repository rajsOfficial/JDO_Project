package com.contact;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Show extends HttpServlet {

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		PersistenceManager pm = PMF.get().getPersistenceManager();
//		POJO pk=pm.getObjectById(POJO.class, 23);
		Query q = pm.newQuery(POJO.class);
		
			List<POJO> ls =  (List<POJO>) q.execute();
			if(ls.isEmpty()) {
				out.print("There is no contact to display");
				req.getRequestDispatcher("index.jsp").forward(req, res);
			}
			else {
				int i = 1;
				for (POJO sp : ls) {

					out.println("<table align=center	<br><br><br></br>");
					out.print(" Value   :<h3>" + i + "</h3>");
					out.print("<tr><th><h3> Type</h3> <th><h3>Description</h3></th> </tr>");
					out.print("<tr><td>Id</td><td>" + sp.getId() + "</td></tr>");
					out.print("<tr><td>Name</td><td>" + sp.getName() + "</td></tr>");
					out.print("<tr><td>Age</td><td>" + sp.getAge() + "</td></tr>");
					out.print("<tr><td>DOB</td><td>" + sp.getDob() + "</td></tr>");
					out.print("<tr><td>Email</td><td>" + sp.getEmail() + "</td></tr>");
					out.print("<tr><td>Address</td><td>" + sp.getAddr() + "</td></tr>");
					i++;
				}

			} 
		
	}
}