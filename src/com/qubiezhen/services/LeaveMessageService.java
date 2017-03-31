package com.qubiezhen.services;

import com.qubiezhen.dao.dto.LeaveMessageDto;
import com.qubiezhen.dao.factory.LeaveMessageFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/24.
 */
public class LeaveMessageService {
    public static Boolean addLeaveMessage(LeaveMessageDto msgdto) {
        return LeaveMessageFactory.getLeaveMessageDao().addLeaveMessage(msgdto);
    }

    public static List<LeaveMessageDto> getLeaveMessageList(LeaveMessageDto msgdto) {
        return LeaveMessageFactory.getLeaveMessageDao().getLeaveMessageList(msgdto);
    }
}
