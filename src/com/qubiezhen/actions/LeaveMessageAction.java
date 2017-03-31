package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.LeaveMessageDto;
import com.qubiezhen.services.LeaveMessageService;

import java.util.List;

/**
 * Created by yangj on 2016/12/24.
 */
public class LeaveMessageAction extends ActionSupport {
    private List<LeaveMessageDto> msgList;
    private LeaveMessageDto msgdto;

    public List<LeaveMessageDto> getMsgList() {
        return msgList;
    }

    public void setMsgList(List<LeaveMessageDto> msgList) {
        this.msgList = msgList;
    }

    public LeaveMessageDto getMsgdto() {
        return msgdto;
    }

    public void setMsgdto(LeaveMessageDto msgdto) {
        this.msgdto = msgdto;
    }

    public String addLeaveMessage() {
        if (LeaveMessageService.addLeaveMessage(msgdto)) {
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryLeaveMessage() {
        List<LeaveMessageDto> tempList = LeaveMessageService.getLeaveMessageList(msgdto);
        if (tempList.size() > 0) {
            this.msgList = tempList;
            return SUCCESS;
        }
        return ERROR;
    }
}
