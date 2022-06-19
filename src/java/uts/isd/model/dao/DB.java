package uts.isd.model.dao;

import java.sql.Connection;

/**
 *  @author Sam Sam
 *  Contains database set up 
 */
public abstract class DB {
//    protected String URL = "jdbc:derby://localhost:1527/";
    protected String URL = "jdbc:mysql://aa1boye1ic9liso.clfkr0w3yl3q.ap-southeast-2.rds.amazonaws.com:3306";
//    protected String db = "iotdb";   
    protected String db = "aa1boye1ic9liso";   
    protected String dbuser = "isduser";
    protected String dbpass = "admin123";
//    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected String driver = "com.mysql.jdbc.Driver";
    protected Connection conn;
}
