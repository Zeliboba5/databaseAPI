package util;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


/**
 * Created by Abovyan Narek on 06.11.14.
 */
public class JsonResponse {
    // класс для формирования json ответа на основании возвращенной информации из Database

    public static String createResponse(Object responseFromDatabase) {
        JsonObject requestResult = new JsonObject();
        JsonObject data;
        JsonArray dataArray;
        if (responseFromDatabase instanceof JsonObject) {
            data = (JsonObject) responseFromDatabase;
            if (data.get("exception") == null) {
                requestResult.addProperty("code", 0);
                requestResult.add("response", data.get("response") == null ? data : data.get("response"));
            } else {
                switch (data.get("exception").getAsString()) {
                    case "not found":
                        requestFailBuilder(requestResult, 1, "the requested object was not found");
                        break;
                    case "invalid query":
                        requestFailBuilder(requestResult, 3, "invalid query");
                        break;
                    case "user already exists":
                        requestFailBuilder(requestResult, 5, "user already exists");
                        break;
                    default:
                        requestFailBuilder(requestResult, 4, "An unknown error");
                }
            }
        } else {
            if (responseFromDatabase instanceof JsonArray) {
                dataArray = (JsonArray) responseFromDatabase;
                requestResult.addProperty("code", 0);
                requestResult.add("response", dataArray);
            }
        }

        return requestResult.toString();
    }

    private static void requestFailBuilder (JsonObject requestResult, int code, String response) {
        requestResult.addProperty("code", code);
        requestResult.addProperty("response", response);
        //System.out.println("Exception Json :  " + requestResult.toString());
    }
}
