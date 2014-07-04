/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import dbUtilities.DBConnectionUtil;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.xml.xquery.XQConnection;
import javax.xml.xquery.XQException;
import javax.xml.xquery.XQExpression;
import javax.xml.xquery.XQSequence;
import queryUtilities.QueryUtilities;

/**
 * 
 * @author Lei
 */
public class DBFunctions {

	public void getTotalNumOfElements() {
		XQConnection conn = DBConnectionUtil.getConnection();
		try {
			XQExpression xqe = conn.createExpression();
			XQSequence xqs = xqe
					.executeQuery(QueryUtilities.NUM_OF_CHEMICAL_ELEMENT);
			while (xqs.next()) {
				System.out
						.println("\n\n====  Total number of element is:  ====\n\n");
				System.out.println(xqs.getInt() + "\n");
			}
		} catch (XQException ex) {
			System.out.println(ex);
		} finally {
			DBConnectionUtil.closeConnection(conn);
		}
	}

	public void getElementsWithMaxNumOfProton() {
		XQConnection conn = DBConnectionUtil.getConnection();
		OutputStream output = null;
		try {
			XQExpression xqe = conn.createExpression();
			XQSequence xqs = xqe
					.executeQuery(QueryUtilities.ELEMENT_WITH_MAXIMUM_NUM_OF_PROTON);
			output = new FileOutputStream("element_max_num_of_proton.xml");
			xqs.writeSequence(output, null);
			System.out
					.println("\n\n====  File element_max_num_of_proton.xml created  ====\n\n");
		} catch (FileNotFoundException ex) {
			System.out.println(ex);
		} catch (XQException ex) {
			System.out.println(ex);
		} finally {
			DBConnectionUtil.closeConnection(conn);
			if (output != null) {
				try {
					output.close();
				} catch (IOException ex) {
					System.out.println(ex);
				}
			}
		}
	}

	public void getElementsWithMinIonizationEnergy() {
		XQConnection conn = DBConnectionUtil.getConnection();
		OutputStream output = null;
		try {
			XQExpression xqe = conn.createExpression();
			XQSequence xqs = xqe
					.executeQuery(QueryUtilities.ELEMENT_WITH_MINIMUM_NUM_OF_IONIZATION_ENERGY);
			output = new FileOutputStream("element_min_ionization_energy.xml");
			System.out
					.println("\n\n====  File element_min_ionization_energy.xml created  ====\n\n");
			xqs.writeSequence(output, null);
		} catch (FileNotFoundException ex) {
			System.out.println(ex);
		} catch (XQException ex) {
			System.out.println(ex);
		} finally {
			DBConnectionUtil.closeConnection(conn);
			if (output != null) {
				try {
					output.close();
				} catch (IOException ex) {
					System.out.println(ex);
				}
			}
		}
	}

	public void getElementsWithMolarMassTenPercentHigherThanAvg() {
		XQConnection conn = DBConnectionUtil.getConnection();
		OutputStream output = null;
		try {
			XQExpression xqe = conn.createExpression();
			XQSequence xqs = xqe
					.executeQuery(QueryUtilities.ELEMENT_WITH_MOLAR_MASS_TEN_PERCENT_HIGHER_THAN_AVG);
			output = new FileOutputStream(
					"element_molar_mass_ten_percent_less_than_avg.xml");
			System.out
					.println("\n\n====  File element_molar_mass_ten_percent_less_than_avg.xml created  ====\n\n");
			xqs.writeSequence(output, null);
		} catch (FileNotFoundException ex) {
			System.out.println(ex);
		} catch (XQException ex) {
			System.out.println(ex);
		} finally {
			DBConnectionUtil.closeConnection(conn);
			if (output != null) {
				try {
					output.close();
				} catch (IOException ex) {
					System.out.println(ex);
				}
			}
		}
	}

	public void getElementsWithoutProton() {
		XQConnection conn = DBConnectionUtil.getConnection();
		OutputStream output = null;
		try {
			XQExpression xqe = conn.createExpression();
			XQSequence xqs = xqe
					.executeQuery(QueryUtilities.ELEMENT_WITHOUT_PROTONS);
			output = new FileOutputStream("element_without_proton.xml");
			System.out
					.println("\n\n====  File element_without_proton.xml created  ====\n\n");
			xqs.writeSequence(output, null);
		} catch (FileNotFoundException ex) {
			System.out.println(ex);
		} catch (XQException ex) {
			System.out.println(ex);
		} finally {
			DBConnectionUtil.closeConnection(conn);
			if (output != null) {
				try {
					output.close();
				} catch (IOException ex) {
					System.out.println(ex);
				}
			}
		}
	}
}
