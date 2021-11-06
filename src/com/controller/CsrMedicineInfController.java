package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MedicineDAO;
import com.models.Medicine;

/**
 * Servlet implementation class CsrShoeController
 */
@WebServlet("/CsrMedicineInfController")
public class CsrMedicineInfController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsrMedicineInfController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		// Object for DB tasks
		MedicineDAO mediDao = new MedicineDAO();
  
		try {
			
			// mode param for tasks 
			String mode = request.getParameter("mode");
			System.out.println(mode + "/from cont");
			
			// params
			int itemId = 0;
			String itemName = "";
			String category = "";
			String numberofmedicine = "";
			String content = "";
			int quantity = 0;
			Double price = 0.0;
		
			// new shoes information
			if(mode.equals("new")) {
				
				 itemName = request.getParameter("itemName");
				 category = request.getParameter("category");
				 numberofmedicine = request.getParameter("numberofmedicine");
				 content = request.getParameter("content");
				 quantity = Integer.parseInt(request.getParameter("quantity"));
				 price = Double.parseDouble(request.getParameter("price"));
			
				
				// call method to insert data
				 mediDao.addRow( itemName, category, numberofmedicine, quantity, price, content);
				
				// redirect page to form page
				response.sendRedirect("CsrMedicineForm.jsp");
			
			// delete data
			}else if(mode.equals("del")) {
				
				itemId = Integer.parseInt(request.getParameter("itemId"));
				category = request.getParameter("category");
				
				// call method to delete data
				mediDao.delRow(itemId);
				
				// forward page to shoes list
				request.setAttribute(category, "category");
				getServletContext().getRequestDispatcher("/CsrMedicineController").forward(request, response);
			
			// update data
			}else if(mode.equals("edit")) {
				
				 itemId = Integer.parseInt(request.getParameter("itemId"));
				 itemName = request.getParameter("itemName");
				 category = request.getParameter("category");
				 numberofmedicine = request.getParameter("numberofmedicine");
				 content = request.getParameter("content");
				 quantity = Integer.parseInt(request.getParameter("quantity"));
				 price = Double.parseDouble(request.getParameter("price"));
				 
				// call method to update data
				 mediDao.updateRow( itemId, itemName, category, numberofmedicine, quantity, price, content);
				
				// forward page to shoes list
				request.setAttribute(category, "category");
				getServletContext().getRequestDispatcher("/CsrMedicineController").forward(request, response);
			
			// to search data for edit-page 
			}else if(mode.equals("search")) {
				
				itemId = Integer.parseInt(request.getParameter("itemId"));
				
				// call method to update data
				Medicine medi = mediDao.searchMedicines(itemId);
				
				// forward page to medicine list 
				request.setAttribute("mode", "edit");   //  should be changed to edit mode
				request.setAttribute("medicines", medi);
				getServletContext().getRequestDispatcher("/CsrMedicineForm.jsp").forward(request, response);
				
			}	 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
