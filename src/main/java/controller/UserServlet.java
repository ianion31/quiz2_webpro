package controller;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.getRequestDispatcher("user/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("user", dao.getById(editId));
                    req.getRequestDispatcher("user/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    dao.delete(delId);
                    resp.sendRedirect("user");
                    break;
                default:
                    req.setAttribute("listUser", dao.getAll());
                    req.getRequestDispatcher("user/index.jsp").forward(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        try {
            User u = new User();
            u.setName(req.getParameter("name"));
            u.setEmail(req.getParameter("email"));
            u.setPassword(req.getParameter("password"));

            if (idParam == null || idParam.isEmpty()) {
                dao.insert(u);
            } else {
                u.setId(Integer.parseInt(idParam));
                dao.update(u);
            }
            resp.sendRedirect("user");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}