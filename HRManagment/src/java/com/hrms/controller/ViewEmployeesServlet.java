package com.hrms.controller;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.util.DBConnection;
import com.hrms.model.Employee;

@WebServlet("/ViewEmployeesServlet")
public class ViewEmployeesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Employee> employees = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM employee";

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(sql);

            while(rs.next()){

                Employee emp = new Employee();

                emp.setEmpId(rs.getInt("emp_id"));
                emp.setName(rs.getString("name"));
                emp.setSurname(rs.getString("surname"));
                emp.setExperienceYears(rs.getInt("experience_years"));
                emp.setDeptId(rs.getInt("dept_id"));
                emp.setRoleId(rs.getInt("role_id"));

                employees.add(emp);
            }

            request.setAttribute("employeeList", employees);

            request.getRequestDispatcher("hr/employeeList.jsp")
                   .forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}