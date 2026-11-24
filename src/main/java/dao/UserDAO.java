package dao;

import model.User;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public List<User> getAll() throws Exception {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                list.add(u);
            }
        }
        return list;
    }

    public User getById(int id) throws Exception {
        User u = null;
        String sql = "SELECT * FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new User();
                    u.setId(rs.getInt("id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                }
            }
        }
        return u;
    }

    public User login(String email, String password) throws Exception {
        User u = null;
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    u = new User();
                    u.setId(rs.getInt("id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                }
            }
        }
        return u;
    }

    public void insert(User u) throws Exception {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.executeUpdate();
        }
    }

    public void update(User u) throws Exception {
        String sql = "UPDATE users SET name = ?, email = ?, password = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setInt(4, u.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}