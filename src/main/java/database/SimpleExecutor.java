package database;

import java.sql.*;


public class SimpleExecutor {
    public void execUpdate(Connection connection, String update) throws SQLException {
        Statement stmt = connection.createStatement();
        stmt.execute(update);
        stmt.close();
    }

    public int execUpdateAndReturnId(PreparedStatement stm) throws SQLException  {
        int id ;
        stm.executeUpdate();
        ResultSet resultSet = stm.getGeneratedKeys();
        if (resultSet != null && resultSet.next()) {
            id = resultSet.getInt(1);
        } else {
            id = -1;
        }
        stm.close();
        return id;
    }
}
