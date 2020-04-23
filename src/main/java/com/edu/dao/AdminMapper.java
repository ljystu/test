package com.edu.dao;

import com.edu.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {

    Admin loginAdmin(Admin admin);

    String getPassword(@Param("adminId") int id);

    int resetPassword(@Param("adminId") int id,@Param("adminPwd") String password);

    int findIdByName(@Param("adminName")String name);
}
