package com.hrms.dao;

import java.sql.*;
import java.util.*;
import com.hrms.model.Salary;
import com.hrms.util.DBConnection;

public class SalaryDAO {

    public void addSalary(Salary sal) throws Exception {

        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO salary(emp_id,amount,effective_date) VALUES(?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, sal.getEmpId());
        ps.setDouble(2, sal.getAmount());
        ps.setDate(3, java.sql.Date.valueOf(sal.getEffectiveDate()));

        ps.executeUpdate();
    }

    public List<Salary> getSalaryByEmployee(int empId) throws Exception {

        List<Salary> list = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM salary WHERE emp_id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, empId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            Salary sal = new Salary();

            sal.setSalaryId(rs.getInt("salary_id"));
            sal.setEmpId(rs.getInt("emp_id"));
            sal.setAmount(rs.getDouble("amount"));
            sal.setEffectiveDate(rs.getDate("effective_date").toString());

            list.add(sal);
        }

        return list;
    }
}