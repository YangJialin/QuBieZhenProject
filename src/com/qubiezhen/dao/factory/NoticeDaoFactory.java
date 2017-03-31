package com.qubiezhen.dao.factory;

import com.qubiezhen.dao.NoticeDao;
import com.qubiezhen.dao.impl.NoticeDaoImpl;

/**
 * Created by yangj on 2016/12/26.
 */
public class NoticeDaoFactory {
    public static NoticeDao getNoticeDao() {
        return new NoticeDaoImpl();
    }
}
