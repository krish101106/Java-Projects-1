package com.hrms.controller;

import java.io.IOException;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.hrms.dao.*;
import com.hrms.model.*;

@WebServlet("/ViewEmployeeServlet")
public class ViewEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int empId = Integer.parseInt(request.getParameter("emp_id"));

            
            EmployeeDAO employeeDAO   = new EmployeeDAO();
            DepartmentDAO deptDAO     = new DepartmentDAO();
            RoleDAO roleDAO           = new RoleDAO();
            SalaryDAO salaryDAO       = new SalaryDAO();
            LoginDAO loginDAO         = new LoginDAO();

            Employee employee = employeeDAO.getEmployeeById(empId);

            if (employee == null) {
                response.sendRedirect(request.getContextPath() + "/ViewEmployeesServlet");
                return;
            }

           
            String deptName = "N/A";
            for (Department d : deptDAO.getAllDepartments()) {
                if (d.getDeptId() == employee.getDeptId()) {
                    deptName = d.getDeptName();
                    break;
                }
            }

          
            String roleName = "N/A";
            for (Role r : roleDAO.getAllRoles()) {
                if (r.getRoleId() == employee.getRoleId()) {
                    roleName = r.getRoleName();
                    break;
                }
            }

          
            List<Salary> salaries = salaryDAO.getSalaryByEmployee(empId);

            Login login = loginDAO.getLoginByEmployee(empId);
            String username = (login != null) ? login.getUsername() : "N/A";

         
            request.setAttribute("employee",  employee);
            request.setAttribute("deptName",  deptName);
            request.setAttribute("roleName",  roleName);
            request.setAttribute("salaries",  salaries);
            request.setAttribute("username",  username);

            request.getRequestDispatcher("hr/viewEmployee.jsp")
                   .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
