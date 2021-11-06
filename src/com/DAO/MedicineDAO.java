package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.database.DBConnector;
import com.models.Medicine;

public class MedicineDAO {

	// connection
	Connection con = null;
	PreparedStatement pst;
	ResultSet rs = null;

	// ---------------------------------------------------------
	// METHOD listAllMedicines()
	// ---------------------------------------------------------

	public ArrayList<Medicine> listAllMedicines() throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, category, numberofmedicine, quantity, price, content from medicines order by itemId desc";

		// result
		ArrayList<Medicine> medicinesList = new ArrayList<Medicine>();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			// save all list to ArrayList
			try {

				while (rs.next()) {

					Medicine medi = new Medicine();

					// store information
					medi.setItemId(rs.getInt(1));
					medi.setItemName(rs.getString(2));
					medi.setCategory(rs.getString(3));
					medi.setNumberofmedicine(rs.getString(4));
					medi.setQuantity(rs.getInt(5));
					medi.setPrice(rs.getDouble(6));
					medi.setContent(rs.getString(7));

					// add to arraylist
					medicinesList.add(	medi);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return medicinesList;
	}

	// ---------------------------------------------------------
	// METHOD listMedicines()
	// ---------------------------------------------------------

	public ArrayList<Medicine> listmedicines(String category) throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, category, numberofmedicine, quantity, price, content from medicines ";

		// condition
		if (!category.isEmpty())
			selectQuery = selectQuery + "where category ='" + category + "' ";
		selectQuery = selectQuery + "order by itemId desc";

		// result
		ArrayList<Medicine> medicinesList = new ArrayList<Medicine>();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			// save all list to ArrayList
			try {

				while (rs.next()) {

					Medicine medi = new Medicine();

					// store information
					medi.setItemId(rs.getInt(1));
					medi.setItemName(rs.getString(2));
					medi.setCategory(rs.getString(3));
					medi.setNumberofmedicine(rs.getString(4));
					medi.setQuantity(rs.getInt(5));
					medi.setPrice(rs.getDouble(6));
					medi.setContent(rs.getString(7));

					// add to arraylist
					medicinesList.add(medi);

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return medicinesList;
	}

	// ---------------------------------------------------------
	// METHOD searchMedicines()
	// ---------------------------------------------------------

	public Medicine searchMedicines(int itemId) throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, category, numberofmedicine, quantity, price, content from medicines where itemId="
				+ itemId;

		// shoe for return value
		Medicine medic = new Medicine();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			try {

				while (rs.next()) {

					// store information
					medic.setItemId(rs.getInt(1));
					medic.setItemName(rs.getString(2));
					medic.setCategory(rs.getString(3));
					medic.setNumberofmedicine(rs.getString(4));
					medic.setQuantity(rs.getInt(5));
					medic.setPrice(rs.getDouble(6));
					medic.setContent(rs.getString(7));

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return medic;
	}

	// ---------------------------------------------------------
	// METHOD searchMedicines()
	// ---------------------------------------------------------

	public Medicine searchMedicines(String itemId) throws Exception {

		// make a query
		String selectQuery = "select itemId, itemName, numberofmedicine, price, content from medicines where itemId=" + itemId;

		// shoe for return value
		Medicine medic = new Medicine();

		// db connection
		try {

			con = DBConnector.getConnection();
			pst = con.prepareStatement(selectQuery);

			try {
				rs = pst.executeQuery();

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				System.out.println(pst.toString());
				e.printStackTrace();
			}

			try {

				while (rs.next()) {

					// store information
					medic.setItemId(rs.getInt(1));
					medic.setItemName(rs.getString(2));
					medic.setNumberofmedicine(rs.getString(3));
					medic.setPrice(rs.getDouble(4));
					medic.setContent(rs.getString(5));

				}

			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			DBConnector.closeConnectionAll(con, pst, rs);
		}

		// return
		return medic;
	}

	// ---------------------------------------------------------
	// METHOD addRow()
	// ---------------------------------------------------------

	public void addRow(String itemName, String category, String numberofmedicine, int quantity, double price, String content)
			throws Exception {

		// make a query
		String insertQuery = "insert into medicines (itemName, category, numberofmedicine, quantity, price, content ) "
				+ "values (?,?,?,?,?,?)";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setString(1, itemName);
			pst.setString(2, category);
			pst.setString(3, numberofmedicine);
			pst.setInt(4, quantity);
			pst.setDouble(5, price);
			pst.setString(6, content);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD updateRow()
	// ---------------------------------------------------------

	public void updateRow(int itemId, String itemName, String category, String numberofmedicine, int quantity, double price,
			String content) throws Exception {

		// make a query
		String insertQuery = "update medicines set itemName=?, category=?,numberofmedicine=?, quantity=?, price=?, content=? "
				+ " where itemId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setString(1, itemName);
			pst.setString(2, category);
			pst.setString(3, numberofmedicine);
			pst.setInt(4, quantity);
			pst.setDouble(5, price);
			pst.setString(6, content);
			pst.setInt(7, itemId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}

	// ---------------------------------------------------------
	// METHOD delRow()
	// ---------------------------------------------------------

	public void delRow(int itemId) throws Exception {

		// make a query
		String insertQuery = "delete from medicines where itemId=?";

		// db connect
		try {

			// get connection
			con = DBConnector.getConnection();
			pst = con.prepareStatement(insertQuery);

			// set
			pst.setInt(1, itemId);

			// execute
			pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.closeConnectionAll(con, pst, null);
		}
	}
}
