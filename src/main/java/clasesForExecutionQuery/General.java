package clasesForExecutionQuery;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.Database;

import java.sql.SQLException;


public class General {
    Database database;
    Gson gson;

    public General(Database database, Gson gson) {
        this.database = database;
        this.gson = gson;
    }

    public String clear() throws SQLException {
        return database.clear();
    }

    public String status() throws SQLException {
        return database.status();
    }

}
