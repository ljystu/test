package com.edu.dao;

import com.edu.pojo.Admin;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {

    Admin loginAdmin(Admin admin);

}
