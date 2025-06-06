package controller.common;
import controller.tools.ImgByteConverter;
import controller.tools.JsonConverter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Bean.ProdottoBean;
import model.Bean.VolumeBean;
import model.DAO.ProdottoDAO;
import model.DAO.VolumeDAO;
import model.DTO.*;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@MultipartConfig
@WebServlet("/common/GetUserIdentity")
public class GetUserIdentity extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.getWriter().write((String) session.getAttribute("logToken"));
        response.setStatus(200);

    }
}
