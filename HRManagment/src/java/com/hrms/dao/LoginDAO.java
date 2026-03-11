package com.hrms.dao;

import java.sql.*;
import com.hrms.model.Login;
import com.hrms.util.DBConnection;

public class LoginDAO {

    public String validateLogin(String username, String password) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql =
                "SELECT r.role_name " +
                "FROM login l " +
                "JOIN employee e ON l.emp_id = e.emp_id " +
                "JOIN role r ON e.role_id = r.role_id " +
                "WHERE l.username=? AND l.password=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            return rs.getString("role_name");
        }

        return null;
    }

    public Login getLoginByEmployee(int empId) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT login_id, emp_id, username FROM login WHERE emp_id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Login login = new Login();
            login.setLoginId(rs.getInt("login_id"));
            login.setEmpId(rs.getInt("emp_id"));
            login.setUsername(rs.getString("username"));
            // password is intentionally NOT retrieved
            return login;
        }

        return null;
    }
}