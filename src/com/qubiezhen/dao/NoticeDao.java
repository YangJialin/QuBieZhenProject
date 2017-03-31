package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.NoticeDto;

import java.util.List;

/**
 * Created by yangj on 2016/12/26.
 */
public interface NoticeDao {
    Boolean addNotice(NoticeDto ndto);

    Boolean deleteNotice(NoticeDto ndto);

    Boolean modifyNotice(NoticeDto ndto);

    List<NoticeDto> getNoticeList(NoticeDto ndto);

    NoticeDto getNoticeById(NoticeDto ndto);
}
