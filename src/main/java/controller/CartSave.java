package controller;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import model.SessionCart;

import javax.sql.DataSource;

public class CartSave implements HttpSessionListener {

    public CartSave() {
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        SessionCart cart = (SessionCart) se.getSession().getAttribute("cart");
        String log = (String) se.getSession().getAttribute("logToken");
        if (cart != null && log != null) {
            DataSource ds = (DataSource) se.getSession().getServletContext().getAttribute("dataSource");
            cart.push(ds);
            se.getSession().removeAttribute("cart");
        }
    }
}
