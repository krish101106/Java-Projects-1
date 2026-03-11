package com.hrms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");   // radio button value

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT emp_id FROM login WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                int empId = rs.getInt("emp_id");

                HttpSession session = request.getSession();
                session.setAttribute("emp_id", empId);
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                RequestDispatcher rd;

                if (role.equalsIgnoreCase("HR")) {

                    rd = request.getRequestDispatcher("hr/hrDashboard.jsp");

                } else {

                    rd = request.getRequestDispatcher("employee/employeeDashboard.jsp");

                }

                rd.forward(request, response);

            } else {

                request.setAttribute("error", "Invalid username or password");

                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}