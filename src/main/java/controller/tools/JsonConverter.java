package controller.tools;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.io.BufferedReader;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

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
        System.out.println("clazz: " + clazz.getName());
        return mapper.readValue(json, clazz);
    }

    public List<T> parseList(String json) throws Exception {
        ObjectMapper mapper = new ObjectMapper();

        // Crea dinamicamente il tipo T[]
        @SuppressWarnings("unchecked")
        Class<T[]> clazzArray = (Class<T[]>) Array.newInstance(clazz, 0).getClass();

        T[] array = mapper.readValue(json, clazzArray);
        return Arrays.asList(array);
    }

    public String toJson(T obj) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(obj);
    }

    public String toJson(Collection<T> obj) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(obj);
    }

    public static final String merge (String json1, String json2) throws Exception {
        ObjectMapper mapper = new ObjectMapper();

        if (json1 != null && json2 != null) {
            JsonNode node1 = mapper.readTree(json1);
            JsonNode node2 = mapper.readTree(json2);

            if (node1.isObject() && node2.isObject()) {
                // Merge object nodes (sovrascrive le proprietà di node1 con quelle di node2)
                ObjectNode obj1 = (ObjectNode) node1;
                ObjectNode obj2 = (ObjectNode) node2;
                obj1.setAll(obj2);
                return mapper.writeValueAsString(obj1);

            } else if (node1.isArray() && node2.isArray()) {
                // Concatena due array JSON
                ArrayNode arr1 = (ArrayNode) node1;
                ArrayNode arr2 = (ArrayNode) node2;

                for (JsonNode element : arr2) {
                    arr1.add(element);
                }
                return mapper.writeValueAsString(arr1);

            } else {
                return mapper.writeValueAsString(node1);
            }
        }
        return null;
    }

    public static <T> JsonConverter<T> factory(Class<T> clazz, BufferedReader reader) {
        if (reader == null) {
            return new JsonConverter<>(clazz);
        }
        return new JsonConverter<>(reader, clazz);
    }
}