package com.edu.service;

import com.edu.dao.AdminMapper;
import com.edu.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminService")
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin loginAdmin(Admin admin) {
        return adminMapper.loginAdmin(admin);
    }

    @Override
    public String getPassword(int id) {
        return adminMapper.getPassword(id);
    }

    @Override
    public boolean resetPassword(int id, String password) {
        return adminMapper.resetPassword(id, password)>0;
    }

    @Override
    public int findIdByName(String name) {
        return adminMapper.findIdByName(name);
    }
}
