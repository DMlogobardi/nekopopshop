package model;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataSourceInizialize implements ServletContextListener {
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        DataSource ds = null;

        try{
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");

            ds= (DataSource) envCtx.lookup("jdbc/storage");

        } catch (NamingException e){
            System.out.println("error: " + e.getMessage());
        }

        context.setAttribute("dataSource", ds);
        System.out.println("dataSource: " + ds.toString());
    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
}
