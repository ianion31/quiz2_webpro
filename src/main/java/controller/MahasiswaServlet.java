package controller;

import dao.JalurMasukDAO;
import dao.MahasiswaDAO;
import model.Mahasiswa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/mahasiswa")
public class MahasiswaServlet extends HttpServlet {
    private MahasiswaDAO mhsDAO = new MahasiswaDAO();
    private JalurMasukDAO jalurDAO = new JalurMasukDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.setAttribute("listJalur", jalurDAO.getAll());
                    req.getRequestDispatcher("mahasiswa/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("mhs", mhsDAO.getById(editId));
                    req.setAttribute("listJalur", jalurDAO.getAll());
                    req.getRequestDispatcher("mahasiswa/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    mhsDAO.delete(delId);
                    resp.sendRedirect("mahasiswa");
                    break;
                default:
                    req.setAttribute("listMhs", mhsDAO.getAll());
                    req.getRequestDispatcher("mahasiswa/index.jsp").forward(req, resp);
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
            Mahasiswa m = new Mahasiswa();
            m.setNama(req.getParameter("nama"));
            m.setNrp(req.getParameter("nrp"));
            m.setAngkatan(req.getParameter("angkatan"));
            m.setJalurMasukId(Integer.parseInt(req.getParameter("jalur_masuk_id")));

            if (idParam == null || idParam.isEmpty()) {
                mhsDAO.insert(m);
            } else {
                m.setId(Integer.parseInt(idParam));
                mhsDAO.update(m);
            }
            resp.sendRedirect("mahasiswa");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}