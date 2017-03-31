package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.LeaveMessageDto;

import java.util.List;

/**
 * Created by yangj on 2016/12/24.
 */
public interface LeaveMessageDao {
    Boolean addLeaveMessage(LeaveMessageDto msgdto);

    List<LeaveMessageDto> getLeaveMessageList(LeaveMessageDto msgdto);
}
