/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.StringWriter;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 *
 * @author Lei
 */
public class XMLToJSONConverter {

    private PrintStream output;
    private StringWriter stringWriter;
    private InputStream xmlStream;
    private Document document;
    private StreamResult result;
    private DOMSource source;
    private String strFileContent;
    private JSONObject json;

    public void xmlTransformation() {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            xmlStream = this.getClass().getClassLoader().getResourceAsStream("chemistry.xml");
            document = builder.parse(xmlStream);

            TransformerFactory tFactory = TransformerFactory.newInstance();
            Transformer transformer = tFactory.newTransformer();
            source = new DOMSource(document);
            stringWriter = new StringWriter();
            result = new StreamResult(stringWriter);
            transformer.transform(source, result);
            strFileContent = stringWriter.toString();
            json = XML.toJSONObject(strFileContent);
            output = new PrintStream("xmlToJSON.json");
            System.out.println("\n\n==== File xmlToJSON.json created  ====\n\n");
            System.setOut(output);
            System.out.println(json.toString());
        } catch (JSONException ex) {
            System.out.println(ex);
        } catch (TransformerException ex) {
            System.out.println(ex);
        } catch (SAXException ex) {
            System.out.println(ex);
        } catch (IOException ex) {
            System.out.println(ex);
        } catch (ParserConfigurationException ex) {
            System.out.println(ex);
        } finally{
            if (output != null){
                output.close();
            }
        }
    }
}
