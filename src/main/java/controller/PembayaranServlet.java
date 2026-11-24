package controller;

import dao.MahasiswaDAO;
import dao.PembayaranDAO;
import model.Pembayaran;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/pembayaran")
public class PembayaranServlet extends HttpServlet {
    private PembayaranDAO bayarDAO = new PembayaranDAO();
    private MahasiswaDAO mhsDAO = new MahasiswaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.setAttribute("listMhs", mhsDAO.getAll());
                    req.getRequestDispatcher("pembayaran/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("pembayaran", bayarDAO.getById(editId));
                    req.setAttribute("listMhs", mhsDAO.getAll());
                    req.getRequestDispatcher("pembayaran/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    bayarDAO.delete(delId);
                    resp.sendRedirect("pembayaran");
                    break;
                default:
                    req.setAttribute("listPembayaran", bayarDAO.getAll());
                    req.getRequestDispatcher("pembayaran/index.jsp").forward(req, resp);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        String tglParam = req.getParameter("tanggal_bayar");
        try {
            Pembayaran p = new Pembayaran();
            p.setMahasiswaId(Integer.parseInt(req.getParameter("mahasiswa_id")));
            p.setKodePembayaran(req.getParameter("kode_pembayaran"));
            p.setNominal(Double.parseDouble(req.getParameter("nominal")));
            p.setMetodeBayar(req.getParameter("metode_bayar"));
            p.setStatusBayar(req.getParameter("status_bayar"));
            p.setTanggalBayar((tglParam == null || tglParam.isEmpty()) ? null : Date.valueOf(tglParam));

            if (idParam == null || idParam.isEmpty()) {
                bayarDAO.insert(p);
            } else {
                p.setId(Integer.parseInt(idParam));
                bayarDAO.update(p);
            }
            resp.sendRedirect("pembayaran");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}