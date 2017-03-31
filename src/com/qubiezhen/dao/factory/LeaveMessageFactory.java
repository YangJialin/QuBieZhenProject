package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.LeaveMessageDao;
import com.qubiezhen.dao.impl.LeaveMessageDaoImpl;

/**
 * Created by yangj on 2016/12/24.
 */
public class LeaveMessageFactory {
    public static LeaveMessageDao getLeaveMessageDao() {
        return new LeaveMessageDaoImpl();
    }
}
