package controller;

import dao.PengumumanDAO;
import model.Pengumuman;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/pengumuman")
public class PengumumanServlet extends HttpServlet {
    private PengumumanDAO dao = new PengumumanDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.getRequestDispatcher("pengumuman/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("pengumuman", dao.getById(editId));
                    req.getRequestDispatcher("pengumuman/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    dao.delete(delId);
                    resp.sendRedirect("pengumuman");
                    break;
                default:
                    req.setAttribute("listPengumuman", dao.getAll());
                    req.getRequestDispatcher("pengumuman/index.jsp").forward(req, resp);
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
            Pengumuman pg = new Pengumuman();
            pg.setJudul(req.getParameter("judul"));
            pg.setIsi(req.getParameter("isi"));
            pg.setTanggalPublish(Date.valueOf(req.getParameter("tanggal_publish")));
            pg.setStatusAktif(Integer.parseInt(req.getParameter("status_aktif")));

            if (idParam == null || idParam.isEmpty()) {
                dao.insert(pg);
            } else {
                pg.setId(Integer.parseInt(idParam));
                dao.update(pg);
            }
            resp.sendRedirect("pengumuman");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}