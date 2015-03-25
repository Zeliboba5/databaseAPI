package clasesForExecutionQuery;

import com.google.gson.JsonObject;

import java.sql.SQLException;

/**
 * Created by Abovyan Narek on 01.11.14.
 */
public interface GeneralMethods {

    public String delegationCall(String method, JsonObject data) throws SQLException;
}
