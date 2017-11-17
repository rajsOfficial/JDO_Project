package com.contact;

import java.io.*;
import javax.jdo.*;
import com.contact.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.*;

public class UpdateServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		HttpSession hs= req.getSession();
		String id=(String) hs.getAttribute("id");
		Key k= KeyFactory.createKey("POJO", id);
		PersistenceManager pm= PMF.get().getPersistenceManager();
		POJO sp = pm.getObjectById(POJO.class, k);
		PrintWriter out= res.getWriter();
		
		
		sp.setName(req.getParameter("name1"));
		long ph = Long.parseLong(req.getParameter("ph1").trim());
		int age = Integer.parseInt(req.getParameter("age1"));
		String d = req.getParameter("dob1");
		int check=0;
		if (age >= 14 && age <= 99) {
			int sub = Integer.parseInt(d.substring(0, (d.length() - 6)));
			if (sub <= 2003 && sub >= 1917) {
				if((2017-sub)==age){
				if (ph >= 100000000 && ph <= 9999999999L) {
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
		sp.setAge(age);
		sp.setPhno(ph);
		sp.setEmail(req.getParameter("email1"));
		sp.setAddr(req.getParameter("addr1"));
		sp.setDob(d);
		sp.setId(id);
		if (check == 0) {
			pm.makePersistent(sp);
			out.print("Edited Succesfully");
			req.getRequestDispatcher("index.jsp").forward(req, res);
		} else {
			hs.setAttribute("Pojo", sp);
			req.getRequestDispatcher("updateverify.jsp").forward(req, res);
		}
		
	}
	}