/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package queryUtilities;

/**
 * 
 * @author Lei Queries for database functions
 */
public class QueryUtilities {
	public static final String NUM_OF_CHEMICAL_ELEMENT = "count(doc('chemistry.xml')//element)";
	public static final String ELEMENT_WITH_MAXIMUM_NUM_OF_PROTON = " for $x in doc('chemistry.xml')//element "
			+ " where $x/atomic_no = max(doc('chemistry.xml')//atomic_no)"
			+ " return $x";
	public static final String ELEMENT_WITH_MINIMUM_NUM_OF_IONIZATION_ENERGY = "for $x in doc('chemistry.xml')//element "
			+ "where $x//ionization_energy[1]/value/text() = min(doc('chemistry.xml')//ionization_energy[1]/value/text())"
			+ "return $x";
	public static final String ELEMENT_WITH_MOLAR_MASS_TEN_PERCENT_HIGHER_THAN_AVG = "for $x in doc('chemistry.xml')//element "
			+ "where $x//molar_mass[1]/value/text() > 1.1*avg(doc('chemistry.xml')//molar_mass[1]/value/text())"
			+ "return $x";
	public static final String ELEMENT_WITHOUT_PROTONS = "for $x in doc('chemistry.xml')//element "
			+ "where $x/atomic_no = doc('chemistry.xml')//no_of_neutrons "
			+ "return $x";
}
