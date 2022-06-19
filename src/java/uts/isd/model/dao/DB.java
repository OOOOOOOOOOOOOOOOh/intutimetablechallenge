package uts.isd.model.dao;

import java.sql.Connection;

/**
 *  @author Sam Sam
 *  Contains database set up 
 */
public abstract class DB {
    protected String URL = "jdbc:derby://localhost:1527/";
    protected String db = "iotdb";   
    protected String dbuser = "isduser";
    protected String dbpass = "admin";
    protected String driver = "org.apache.derby.jdbc.ClientDriver";
    protected Connection conn;
}
