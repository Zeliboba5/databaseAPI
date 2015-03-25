package clasesForExecutionQuery;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.Database;

import java.sql.SQLException;

/**
 * Created by Abovyan Narek on 01.11.14.
 */
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

}
