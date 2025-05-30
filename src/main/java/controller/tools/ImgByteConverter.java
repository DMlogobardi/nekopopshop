package controller.tools;

import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImgByteConverter {

    public ImgByteConverter() {
    }

    public final static Collection<byte[]> Converter(Collection<Part> parts) throws IOException, IllegalStateException, IllegalArgumentException {
        Collection<byte[]> imgBytes = new ArrayList<byte[]>();
        for (Part part : parts) {
            if(part.getName().equals("image") && part.getSize() > 0 && part.getContentType().equals("image/png") || part.getContentType().equals("image/jpeg")) {
                byte[] imageBytes = part.getInputStream().readAllBytes();
                imgBytes.add(imageBytes);
            }
        }
        return imgBytes;
    }

    public final static byte[] Converter(Part part) throws IOException, IllegalStateException, IllegalArgumentException {
        byte[] imgByte = null;
        if(part.getName().equals("image") && part.getSize() > 0 && part.getContentType().equals("image/png") || part.getContentType().equals("image/jpeg")) {
            imgByte = part.getInputStream().readAllBytes();
        }
        return imgByte;
    }

    public final static Optional<Part> getPartByID(Collection<Part> parts, int id) {
        Optional<Part> imgPart = parts.stream().filter(part -> {
                    String nomeFile = part.getSubmittedFileName(); // es: "img_20.jpg"
                    Matcher matcher = Pattern.compile(".*?(\\d+)\\.[^.]+$").matcher(nomeFile);
                    return matcher.matches() && Integer.parseInt(matcher.group(1)) == id;
                })
                .findFirst();
        return imgPart;
    }
}
