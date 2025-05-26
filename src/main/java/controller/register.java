package controller;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.cj.xdevapi.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Bean.AccountBean;
import model.Bean.ClienteBean;
import model.Bean.IndirizzoBean;
import model.Bean.NumTelefonoBean;
import model.DAO.AccountDAO;
import model.DAO.ClienteDAO;
import model.DAO.IndirizzoDAO;
import model.DAO.NumtelefonoDAO;
import model.DTO.RegisterDTO;

import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class login
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public register() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("logToken") != null) {
			request.setAttribute("errors", "utent alredy logged in");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		DataSource ds = (DataSource) session.getAttribute("dataSource");

		StringBuilder jsonBuilder = new StringBuilder();
		try (BufferedReader reader = request.getReader()) {
			String line;
			while ((line = reader.readLine()) != null) {
				jsonBuilder.append(line);
			}
		}

		String requestBody = jsonBuilder.toString();

		ObjectMapper mapper = new ObjectMapper();
		RegisterDTO registerData = mapper.readValue(requestBody, RegisterDTO.class);

		ClienteBean cliente = ClienteBean.getByCheckEmail(
				0,
				registerData.getName(),
				registerData.getCognome(),
				registerData.getNascita(),
				registerData.getEmail(),
				registerData.getCf()
		);

		if(cliente == null) {
			request.setAttribute("errors", "email non valida");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}

		ClienteDAO clienteDAO = new ClienteDAO(ds);
		int idCliente;
		try{
			idCliente = clienteDAO.doSave(cliente);
		}catch (SQLException e){
			System.out.println(e.getMessage());
			request.setAttribute("errors", "dato inserito non valido or internal server error");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}

		IndirizzoBean indirizzo = new IndirizzoBean(
				0,
				registerData.getVia(),
				registerData.getCivico(),
				registerData.getCap(),
				idCliente
		);

		NumTelefonoBean tel = new NumTelefonoBean(
				0,
				registerData.getPrefisso(),
				registerData.getNumero(),
				idCliente
		);

		AccountBean account = new AccountBean(
				0,
				AccountBean.hashPassword(registerData.getPassword()),
				registerData.getNick(),
				idCliente
		);
		IndirizzoDAO indirizzoDAO = new IndirizzoDAO(ds);
		NumtelefonoDAO numtelefonoDAO = new NumtelefonoDAO(ds);
		AccountDAO accountDAO = new AccountDAO(ds);

		try{
			indirizzoDAO.doSave(indirizzo);
			numtelefonoDAO.doSave(tel);
			accountDAO.doSave(account);
		}catch (SQLException e){
            try {
                clienteDAO.doDelete(idCliente);
            } catch (SQLException ex) {
				request.setAttribute("errors", "internal server error");
				request.getRequestDispatcher("register.jsp").forward(request, response);
				return;
            }
            System.out.println(e.getMessage());
			request.setAttribute("errors", "dati inseriti non valido or internal server error");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return;
		}
		request.setAttribute("register", "success");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}