package com.hrms.controller;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.util.DBConnection;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int empId = Integer.parseInt(request.getParameter("emp_id"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        int experience = Integer.parseInt(request.getParameter("experience_years"));
        int deptId = Integer.parseInt(request.getParameter("dept_id"));
        int roleId = Integer.parseInt(request.getParameter("role_id"));

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE employee SET name=?, surname=?, experience_years=?, dept_id=?, role_id=? WHERE emp_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, surname);
            ps.setInt(3, experience);
            ps.setInt(4, deptId);
            ps.setInt(5, roleId);
            ps.setInt(6, empId);

            ps.executeUpdate();

            response.sendRedirect("ViewEmployeesServlet");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}