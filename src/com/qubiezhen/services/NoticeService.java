package com.qubiezhen.services;

import com.qubiezhen.dao.dto.NoticeDto;
import com.qubiezhen.dao.factory.NoticeDaoFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/26.
 */
public class NoticeService {
    public static Boolean addNotice(NoticeDto ndto) {
        return NoticeDaoFactory.getNoticeDao().addNotice(ndto);
    }

    public static Boolean modifyNotice(NoticeDto ndto) {
        return NoticeDaoFactory.getNoticeDao().modifyNotice(ndto);
    }

    public static Boolean deleteNotice(NoticeDto ndto) {
        return NoticeDaoFactory.getNoticeDao().deleteNotice(ndto);
    }

    public static List<NoticeDto> getNoticeList(NoticeDto ndto) {
        return NoticeDaoFactory.getNoticeDao().getNoticeList(ndto);
    }

    public static NoticeDto getNoticeById(NoticeDto ndto) {
        return NoticeDaoFactory.getNoticeDao().getNoticeById(ndto);
    }

}
