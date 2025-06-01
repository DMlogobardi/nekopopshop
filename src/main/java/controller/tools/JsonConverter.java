package controller.tools;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;

public class JsonConverter<T> {

    private final BufferedReader reader;
    private final Class<T> clazz;

    public JsonConverter(BufferedReader reader, Class<T> clazz) {
        this.reader = reader;
        this.clazz = clazz;
    }

    public JsonConverter(Class<T> clazz) {
        this.reader = null;
        this.clazz = clazz;
    }

    public T parse() throws Exception {
        StringBuilder jsonBuilder = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            jsonBuilder.append(line);
        }

        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(jsonBuilder.toString(), clazz);
    }

    public T parse(String json) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.readValue(json, clazz);
    }

    public static <T> JsonConverter<T> factory(Class<T> clazz, BufferedReader reader) {
        if (reader == null) {
            return new JsonConverter<>(clazz);
        }
        return new JsonConverter<>(reader, clazz);
    }
}