package controller;

import dao.JalurMasukDAO;
import dao.JadwalSeleksiDAO;
import model.JadwalSeleksi;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/jadwal")
public class JadwalServlet extends HttpServlet {
    private JadwalSeleksiDAO jadwalDAO = new JadwalSeleksiDAO();
    private JalurMasukDAO jalurDAO = new JalurMasukDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.setAttribute("listJalur", jalurDAO.getAll());
                    req.getRequestDispatcher("jadwal/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("jadwal", jadwalDAO.getById(editId));
                    req.setAttribute("listJalur", jalurDAO.getAll());
                    req.getRequestDispatcher("jadwal/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    jadwalDAO.delete(delId);
                    resp.sendRedirect("jadwal");
                    break;
                default:
                    req.setAttribute("listJadwal", jadwalDAO.getAll());
                    req.getRequestDispatcher("jadwal/index.jsp").forward(req, resp);
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
            JadwalSeleksi js = new JadwalSeleksi();
            js.setJalurMasukId(Integer.parseInt(req.getParameter("jalur_masuk_id")));
            js.setNamaKegiatan(req.getParameter("nama_kegiatan"));
            js.setTanggalMulai(Date.valueOf(req.getParameter("tanggal_mulai")));
            js.setTanggalSelesai(Date.valueOf(req.getParameter("tanggal_selesai")));
            js.setLokasi(req.getParameter("lokasi"));

            if (idParam == null || idParam.isEmpty()) {
                jadwalDAO.insert(js);
            } else {
                js.setId(Integer.parseInt(idParam));
                jadwalDAO.update(js);
            }
            resp.sendRedirect("jadwal");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}