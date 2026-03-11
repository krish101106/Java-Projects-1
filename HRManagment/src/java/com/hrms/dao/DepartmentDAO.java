package com.hrms.dao;

import java.sql.*;
import java.util.*;
import com.hrms.model.Department;
import com.hrms.util.DBConnection;

public class DepartmentDAO {

    public List<Department> getAllDepartments() throws Exception {

        List<Department> list = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM department";

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()) {

            Department dept = new Department();

            dept.setDeptId(rs.getInt("dept_id"));
            dept.setDeptName(rs.getString("dept_name"));

            list.add(dept);
        }

        return list;
    }
}