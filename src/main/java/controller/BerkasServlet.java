package controller;

import dao.BerkasPendaftaranDAO;
import dao.MahasiswaDAO;
import model.BerkasPendaftaran;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/berkas")
public class BerkasServlet extends HttpServlet {
    private BerkasPendaftaranDAO berkasDAO = new BerkasPendaftaranDAO();
    private MahasiswaDAO mhsDAO = new MahasiswaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new":
                    req.setAttribute("listMhs", mhsDAO.getAll());
                    req.getRequestDispatcher("berkas/form.jsp").forward(req, resp);
                    break;
                case "edit":
                    int editId = Integer.parseInt(req.getParameter("id"));
                    req.setAttribute("berkas", berkasDAO.getById(editId));
                    req.setAttribute("listMhs", mhsDAO.getAll());
                    req.getRequestDispatcher("berkas/form.jsp").forward(req, resp);
                    break;
                case "delete":
                    int delId = Integer.parseInt(req.getParameter("id"));
                    berkasDAO.delete(delId);
                    resp.sendRedirect("berkas");
                    break;
                default:
                    req.setAttribute("listBerkas", berkasDAO.getAll());
                    req.getRequestDispatcher("berkas/index.jsp").forward(req, resp);
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
            BerkasPendaftaran bp = new BerkasPendaftaran();
            bp.setMahasiswaId(Integer.parseInt(req.getParameter("mahasiswa_id")));
            bp.setJenisBerkas(req.getParameter("jenis_berkas"));
            bp.setFilePath(req.getParameter("file_path"));
            bp.setStatusVerifikasi(req.getParameter("status_verifikasi"));
            bp.setCatatan(req.getParameter("catatan"));

            if (idParam == null || idParam.isEmpty()) {
                berkasDAO.insert(bp);
            } else {
                bp.setId(Integer.parseInt(idParam));
                berkasDAO.update(bp);
            }
            resp.sendRedirect("berkas");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}