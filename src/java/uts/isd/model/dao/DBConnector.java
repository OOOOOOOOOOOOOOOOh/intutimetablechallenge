package uts.isd.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *  @author Sam Sam
 *  Inherits protected fields of the DB class
 */

public class DBConnector extends DB{
    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://aa1boye1ic9liso.clfkr0w3yl3q.ap-southeast-2.rds.amazonaws.com:3306/?user=isduser&password=admin123&useSSL=false");
    }

    public Connection openConnection(){
        return this.conn;
    }

    public void closeConnection() throws SQLException {
        this.conn.close();
    }
}