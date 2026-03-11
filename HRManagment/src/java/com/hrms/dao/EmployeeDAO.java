package com.hrms.dao;

import java.sql.*;
import java.util.*;
import com.hrms.model.Employee;
import com.hrms.util.DBConnection;

public class EmployeeDAO {

    public void addEmployee(Employee emp) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO employee(name,surname,experience_years,dept_id,role_id) VALUES(?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, emp.getName());
        ps.setString(2, emp.getSurname());
        ps.setInt(3, emp.getExperienceYears());
        ps.setInt(4, emp.getDeptId());
        ps.setInt(5, emp.getRoleId());

        ps.executeUpdate();
    }

    public void updateEmployee(Employee emp) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE employee SET name=?, surname=?, experience_years=?, dept_id=?, role_id=? WHERE emp_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, emp.getName());
        ps.setString(2, emp.getSurname());
        ps.setInt(3, emp.getExperienceYears());
        ps.setInt(4, emp.getDeptId());
        ps.setInt(5, emp.getRoleId());
        ps.setInt(6, emp.getEmpId());

        ps.executeUpdate();
    }

    public void deleteEmployee(int empId) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "DELETE FROM employee WHERE emp_id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empId);

        ps.executeUpdate();
    }

    public List<Employee> getAllEmployees() throws Exception {

        List<Employee> list = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM employee";

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()) {

            Employee emp = new Employee();

            emp.setEmpId(rs.getInt("emp_id"));
            emp.setName(rs.getString("name"));
            emp.setSurname(rs.getString("surname"));
            emp.setExperienceYears(rs.getInt("experience_years"));
            emp.setDeptId(rs.getInt("dept_id"));
            emp.setRoleId(rs.getInt("role_id"));

            list.add(emp);
        }

        return list;
    }

    public Employee getEmployeeById(int empId) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM employee WHERE emp_id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Employee emp = new Employee();
            emp.setEmpId(rs.getInt("emp_id"));
            emp.setName(rs.getString("name"));
            emp.setSurname(rs.getString("surname"));
            emp.setExperienceYears(rs.getInt("experience_years"));
            emp.setDeptId(rs.getInt("dept_id"));
            emp.setRoleId(rs.getInt("role_id"));
            return emp;
        }

        return null;
    }
}