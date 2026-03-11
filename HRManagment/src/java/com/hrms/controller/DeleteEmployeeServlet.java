package com.hrms.controller;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.util.DBConnection;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int empId = Integer.parseInt(request.getParameter("emp_id"));

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM employee WHERE emp_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, empId);

            ps.executeUpdate();

            response.sendRedirect("ViewEmployeesServlet");

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}