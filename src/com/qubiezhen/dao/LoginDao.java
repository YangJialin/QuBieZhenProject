package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.AdminDto;

/**
 * Created by yangj on 2016/12/12.
 */
public interface LoginDao {
    AdminDto adminLogin(AdminDto admindto);
}
