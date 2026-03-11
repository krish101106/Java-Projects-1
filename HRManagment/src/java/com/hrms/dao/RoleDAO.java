package com.hrms.dao;

import java.sql.*;
import java.util.*;
import com.hrms.model.Role;
import com.hrms.util.DBConnection;

public class RoleDAO {

    public List<Role> getAllRoles() throws Exception {

        List<Role> list = new ArrayList<>();

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM role";

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()) {

            Role role = new Role();

            role.setRoleId(rs.getInt("role_id"));
            role.setRoleName(rs.getString("role_name"));

            list.add(role);
        }

        return list;
    }
}