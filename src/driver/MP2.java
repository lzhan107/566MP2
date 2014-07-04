package driver;

import action.DBFunctions;
import action.XMLSplitAtAvgIonizationEnergy;
import action.XMLSplitAtAvgMolarMass;
import action.XMLSplitAtAvgProtonNum;
import action.XMLSplitAtOneHundredProtonNum;
import action.XMLToCSVConverter;
import action.XMLToHTMLConverter;
import action.XMLToJSONConverter;
import action.XMLToJSONConverterUsingXSLT;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Lei
 */
public class MP2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        if (args.length == 0) {
            System.exit(1);
        }

        for (int i = 0; i < args.length; i++) {
            //Output two XML files with split point at chemical element content vale for no_of_protons <= 100.
            if (args[i].equals("transformation1")) {
                XMLSplitAtOneHundredProtonNum xmlSplitAtOneHundredProtonNum = new XMLSplitAtOneHundredProtonNum();
                xmlSplitAtOneHundredProtonNum.xmlTransformation();
            }
            //Output XML files with split point is at avg(no_of_protons).
            if (args[i].equals("transformation2")) {
                XMLSplitAtAvgProtonNum xmlSplitAtAvgProtonNum = new XMLSplitAtAvgProtonNum();
                xmlSplitAtAvgProtonNum.xmlTransformation();
            }
            //Output XML files with split point is at avg(molar_mass).
            if (args[i].equals("transformation3")) {
                XMLSplitAtAvgMolarMass xmlSplitAtAvgMolarMass = new XMLSplitAtAvgMolarMass();
                xmlSplitAtAvgMolarMass.xmlTransformation();
            }
            //Output XML files with split point is at avg(ionization_energy).
            if (args[i].equals("transformation4")) {
                XMLSplitAtAvgIonizationEnergy xmlSplitAtAvgIonizationEnergy = new XMLSplitAtAvgIonizationEnergy();
                xmlSplitAtAvgIonizationEnergy.xmlTransformation();
            }
            //Output csv format
            if (args[i].equals("transformation5")) {
                XMLToCSVConverter xmlToCSVConverter = new XMLToCSVConverter();
                xmlToCSVConverter.xmlTransformation();
            }
            //Output HTML format
            if (args[i].equals("transformation6")) {
                XMLToHTMLConverter xmlToHTMLConverter = new XMLToHTMLConverter();
                xmlToHTMLConverter.xmlTransformation();
            }
            //Output JSON format for the entire input document.
            if (args[i].equals("transformation7")) {
                XMLToJSONConverterUsingXSLT xmlToJSONConverterUsingXSLT = new XMLToJSONConverterUsingXSLT();
                xmlToJSONConverterUsingXSLT.xmlTransformation();
            }
            //The total number of chemical elements
            if (args[i].equals("function1")) {
                DBFunctions dbFunctions = new DBFunctions();
                dbFunctions.getTotalNumOfElements();
            }
            //The chemical element with the maximum number of protons
            if (args[i].equals("function2")){
                DBFunctions dbFunctions = new DBFunctions();
                dbFunctions.getElementsWithMaxNumOfProton();
            }
            //The chemical element with the minimum ionization energy
            if (args[i].equals("function3")){
                DBFunctions dbFunctions = new DBFunctions();
                dbFunctions.getElementsWithMinIonizationEnergy();
            }
            //The chemical element with a molar mass ~10% higher than the average
            if (args[i].equals("function4")){
                DBFunctions dbFunctions = new DBFunctions();
                dbFunctions.getElementsWithMolarMassTenPercentHigherThanAvg();
            }
            //The chemical elements with no protons
            if (args[i].equals("function5")){
                DBFunctions dbFunctions = new DBFunctions();
                dbFunctions.getElementsWithoutProton();
            }
        }
    }
}
