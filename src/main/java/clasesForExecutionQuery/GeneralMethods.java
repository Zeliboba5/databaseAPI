package clasesForExecutionQuery;

import com.google.gson.JsonObject;

import java.sql.SQLException;


public interface GeneralMethods {

    public String delegationCall(String method, JsonObject data) throws SQLException;
}
