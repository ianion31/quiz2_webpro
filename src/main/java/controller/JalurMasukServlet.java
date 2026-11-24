package controller;

import dao.JalurMasukDAO;
import model.JalurMasuk;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/jalur-masuk")
public class JalurMasukServlet extends HttpServlet {
    private JalurMasukDAO dao = new JalurMasukDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.getRequestDispatcher("jalur_masuk/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    JalurMasuk existing = dao.getById(editId);
                    req.setAttribute("jalur", existing);
                    req.getRequestDispatcher("jalur_masuk/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    dao.delete(delId);
                    resp.sendRedirect("jalur-masuk");
                    break;
                default:
                    List<JalurMasuk> list = dao.getAll();
                    req.setAttribute("listJalur", list);
                    req.getRequestDispatcher("jalur_masuk/index.jsp").forward(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        String namaJalur = req.getParameter("nama_jalur");

        try {
            JalurMasuk jm = new JalurMasuk();
            jm.setNamaJalur(namaJalur);

            if (idParam == null || idParam.isEmpty()) {
                dao.insert(jm);
            } else {
                jm.setId(Integer.parseInt(idParam));
                dao.update(jm);
            }
            resp.sendRedirect("jalur-masuk");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}