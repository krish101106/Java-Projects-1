package com.hrms.controller;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.util.DBConnection;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        int experience = Integer.parseInt(request.getParameter("experience_years"));
        int deptId = Integer.parseInt(request.getParameter("dept_id"));
        int roleId = Integer.parseInt(request.getParameter("role_id"));

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            // Insert employee
            String empSql = "INSERT INTO employee(name,surname,experience_years,dept_id,role_id) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(empSql, Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setInt(3, experience);
            ps.setInt(4, deptId);
            ps.setInt(5, roleId);

            ps.executeUpdate();

            // Get generated emp_id
            ResultSet rs = ps.getGeneratedKeys();
            int empId = 0;

            if (rs.next()) {
                empId = rs.getInt(1);
            }

            // Insert login credentials
            String loginSql = "INSERT INTO login(emp_id, username, password) VALUES(?,?,?)";

            PreparedStatement ps2 = con.prepareStatement(loginSql);

            ps2.setInt(1, empId);
            ps2.setString(2, username);
            ps2.setString(3, password);

            ps2.executeUpdate();

            response.sendRedirect("ViewEmployeesServlet");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}