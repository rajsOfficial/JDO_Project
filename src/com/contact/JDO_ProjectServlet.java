package com.contact;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.jdo.*;
import com.contact.*;

@SuppressWarnings("serial")
public class JDO_ProjectServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		int check = 0;

		PersistenceManager pm = PMF.get().getPersistenceManager();
		POJO obj = new POJO();
		String id = req.getParameter("id").trim();
		try{
			pm.getObjectById(POJO.class, id);
			out.println("Given Id Already Present.. ID should be unique..!");
			check++;
		}
		catch(Exception e){
	
		}
		
		long ph = Long.parseLong(req.getParameter("ph").trim());
		int age = Integer.parseInt(req.getParameter("age"));
		String d = req.getParameter("dob");

		if (age >= 14 && age <= 99) {
			int sub = Integer.parseInt(d.substring(0, (d.length() - 6)));
			if (sub <= 2003 && sub >= 1917) {
				if((2017-sub)==age){
				if (ph >= 1000000000 && ph <= 9999999999L) {
				} else {
					check++;
					out.println("Given Phone number is not a valid one");
				}
			}
				else
					{
					check++;
					out.println("Given Age And DAte Of Birth are not matching");
					}
			}
			else {
				
				check++;
				out.print("Please Enter a valid Date Of Birth");
			}
		} else {
			check++;
			out.print("Please Enter a valid age");
		}

		/*
		 * else { out.print("Given Id Already Present.. Id should be unique"); }
		 */
		obj.setAge(age);
		obj.setPhno(ph);
		obj.setEmail(req.getParameter("email"));
		obj.setAddr(req.getParameter("adr"));
		obj.setDob(d);
		obj.setId(id);
		obj.setName(req.getParameter("name"));
		if (check == 0) {
			pm.makePersistent(obj);
			out.print("Saved Succesfully");
			req.getRequestDispatcher("index.jsp").forward(req, res);
		} else {
			HttpSession htps = req.getSession();
			htps.setAttribute("Pojo", obj);
			req.getRequestDispatcher("verify.jsp").forward(req, res);
		}
		
	}
}
