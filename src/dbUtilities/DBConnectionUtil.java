/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dbUtilities;

import javax.xml.xquery.XQConnection;
import javax.xml.xquery.XQDataSource;
import javax.xml.xquery.XQException;
import net.xqj.basex.BaseXXQDataSource;

/**
 *
 * @author Lei
 * Utility class for database connection and disconnection
 */
public class DBConnectionUtil {

    public static XQConnection getConnection() {
        XQConnection conn = null;
        try {
            XQDataSource ds = new BaseXXQDataSource();
            ds.setProperty("serverName", "localhost");
            ds.setProperty("databaseName", "chemistry");
            ds.setProperty("port", "1984");
            conn = ds.getConnection("admin", "admin");

        } catch (XQException ex) {
            System.out.println("\n\n====  Unable to connect to BaseX database, please go to \"MP2/basex/bin\" folder "
                    + "and click on \"basexserver.bat\", start database server first!  ====\n\n");
            System.out.println(ex);
        }
        return conn;
    }

    public static void closeConnection(XQConnection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (XQException ex) {
                System.out.println(ex);
            }
        }
    }
}
