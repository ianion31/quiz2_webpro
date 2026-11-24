package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("logout".equals(action)) {
            HttpSession session = req.getSession(false);
            if (session != null) session.invalidate();
            resp.sendRedirect("login.jsp");
        } else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        try {
            User user = userDAO.login(email, password);
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("userLogin", user);
                resp.sendRedirect("dashboard.jsp");
            } else {
                req.setAttribute("error", "Email atau password salah!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}