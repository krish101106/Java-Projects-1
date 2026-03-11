package com.hrms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.util.DBConnection;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        int empId = (int) session.getAttribute("emp_id");

        try {

            Connection con = DBConnection.getConnection();

          
            String empQuery = "UPDATE employee SET name=?, surname=? WHERE emp_id=?";
            PreparedStatement ps1 = con.prepareStatement(empQuery);

            ps1.setString(1, name);
            ps1.setString(2, surname);
            ps1.setInt(3, empId);

            ps1.executeUpdate();

           
            String loginQuery = "UPDATE login SET username=?, password=? WHERE emp_id=?";
            PreparedStatement ps2 = con.prepareStatement(loginQuery);

            ps2.setString(1, username);
            ps2.setString(2, password);
            ps2.setInt(3, empId);

            ps2.executeUpdate();

            response.sendRedirect("employee/employeeDashboard.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}