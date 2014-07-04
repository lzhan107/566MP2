/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 *
 * @author Lei
 */
public class XMLSplitAtOneHundredProtonNum {
    private Document document;
    private InputStream xmlStream;
    private InputStream xslStream;
    private StreamSource styleSource;
    private DOMSource source;
    private StreamResult result;

    public void xmlTransformation() {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            //Use classLoader to get chemistry.xml, shoud not use File,otherwise it won't find 
            xmlStream = this.getClass().getClassLoader().getResourceAsStream("chemistry.xml");
            xslStream = this.getClass().getClassLoader().getResourceAsStream("no_of_proton_less_equal_than_one_hundred.xsl");
            DocumentBuilder builder = factory.newDocumentBuilder();
            document = builder.parse(xmlStream);
            TransformerFactory tFactory = TransformerFactory.newInstance();
            tFactory.setAttribute("indent-number", 2);
            styleSource = new StreamSource(xslStream);
            Transformer transformer = tFactory.newTransformer(styleSource);
            //Indent the XML output
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            source = new DOMSource(document);
            result = new StreamResult("no_of_proton_less_equal_than_one_hundred.xml");
            System.out.println("\n\n==== File no_of_proton_less_equal_than_one_hundred.xml created ====\n\n");
            transformer.transform(source, result);
            //Second part of xml, no_of_proton > 100
            DocumentBuilderFactory factory2 = DocumentBuilderFactory.newInstance();
            xmlStream = this.getClass().getClassLoader().getResourceAsStream("chemistry.xml");
            xslStream = this.getClass().getClassLoader().getResourceAsStream("no_of_proton_greater_than_one_hundred.xsl");
            DocumentBuilder builder2 = factory2.newDocumentBuilder();
            document = builder2.parse(xmlStream);
            TransformerFactory tFactory2 = TransformerFactory.newInstance();
            tFactory2.setAttribute("indent-number", 2);
            styleSource = new StreamSource(xslStream);
            Transformer transformer2 = tFactory2.newTransformer(styleSource);
            //Indent the XML output
            transformer2.setOutputProperty(OutputKeys.INDENT, "yes");
            transformer2.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "4");
            source = new DOMSource(document);
            result = new StreamResult("no_of_proton_greater_than_one_hundred.xml");
            System.out.println("\n\n==== File no_of_proton_greater_than_one_hundred.xml  ====\n\n");
            transformer2.transform(source, result);
        } catch (TransformerConfigurationException tce) {
            System.out.println("\n Transformer Factory Error");
            System.out.println(tce.getException());

            Throwable x = tce;
            if (tce.getException() != null) {
                x = tce.getException();
            }
            x.printStackTrace();
        } catch (TransformerException te) {
            System.out.println("\n** Transformation error");
            System.out.println("   " + te.getMessage());
            // Use the contained exception, if any
            Throwable x = te;
            if (te.getException() != null) {
                x = te.getException();
            }
            x.printStackTrace();
        } catch (SAXException sxe) {
            Exception x = sxe;
            if (sxe.getException() != null) {
                x = sxe.getException();
            }
            x.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        } catch (ParserConfigurationException pce) {
            pce.printStackTrace();
        } finally {
            if (xmlStream != null) {
                try {
                    xmlStream.close();
                } catch (IOException ex) {
                    System.out.println(ex);
                }
            }
            if (xslStream != null) {
                try {
                    xslStream.close();
                } catch (IOException ex) {
                    System.out.println(ex);
                }
            }
        }
    }
}
