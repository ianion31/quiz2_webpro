package controller;

import dao.ProdiDAO;
import model.Prodi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/prodi")
public class ProdiServlet extends HttpServlet {
    private ProdiDAO dao = new ProdiDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.getRequestDispatcher("prodi/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("prodi", dao.getById(editId));
                    req.getRequestDispatcher("prodi/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    dao.delete(delId);
                    resp.sendRedirect("prodi");
                    break;
                default:
                    req.setAttribute("listProdi", dao.getAll());
                    req.getRequestDispatcher("prodi/index.jsp").forward(req, resp);
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
            Prodi p = new Prodi();
            p.setKodeProdi(req.getParameter("kode_prodi"));
            p.setNamaProdi(req.getParameter("nama_prodi"));
            p.setJenjang(req.getParameter("jenjang"));
            p.setKuota(Integer.parseInt(req.getParameter("kuota")));

            if (idParam == null || idParam.isEmpty()) {
                dao.insert(p);
            } else {
                p.setId(Integer.parseInt(idParam));
                dao.update(p);
            }
            resp.sendRedirect("prodi");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}