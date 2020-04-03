package com.edu.service;

import com.edu.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminService {

    Admin loginAdmin(Admin admin);

    String getPassword(int id);

    boolean resetPassword(int id,String password);

    int findIdByName(String name);

}
