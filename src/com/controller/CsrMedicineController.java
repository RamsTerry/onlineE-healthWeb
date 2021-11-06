package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBConnector;
import com.models.Medicine;

@WebServlet("/CsrMedicineController")
public class CsrMedicineController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	public CsrMedicineController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

		// variables

		String category = request.getParameter("category");

		// select shoe list
		try {

			// create sql
			String sql = "select itemId, itemName, category, numberofmedicine, quantity, price,content  from medicines "
					+ " where category = '" + category + "' order by itemId desc ";

			// DB connection
			con = DBConnector.getConnection();

			// resultSet
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			// ArrayList for medicine

			ArrayList<Medicine> medicinesList = new ArrayList<Medicine>();

			while (rs.next()) {

				Medicine medic = new Medicine();

				// store information
				medic.setItemId(rs.getInt(1));
				medic.setItemName(rs.getString(2));
				medic.setCategory(rs.getString(3));
				medic.setNumberofmedicine(rs.getString(4));
				medic.setQuantity(rs.getInt(5));
				medic.setPrice(rs.getDouble(6));
				medic.setContent(rs.getString(7));

				medicinesList.add(medic);

			}

			// set attribute
			request.setAttribute("category", category);
			request.setAttribute("medicinesList", medicinesList);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null)
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pst != null)
				try {
					pst.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		// Dispatcher - forward to result page
		getServletContext().getRequestDispatcher("/CsrMedicinesList.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
