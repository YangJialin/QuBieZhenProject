package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.NoticeDto;
import com.qubiezhen.services.NoticeService;

import java.util.List;
import java.util.Map;

/**
 * Created by yangj on 2016/12/26.
 */
public class NoticeAction extends ActionSupport {
    private NoticeDto ndto;
    private List<NoticeDto> ndtoList;
    private Map request;

    public String addNotice() {
        request = (Map) ActionContext.getContext().get("request");
        if (NoticeService.addNotice(ndto)) {
            request.put("msg", "添加成功");
            return SUCCESS;
        }
        request.put("msg", "添加失败");
        return ERROR;
    }

    public String deleteNotice() {
        request = (Map) ActionContext.getContext().get("request");
        if (NoticeService.deleteNotice(ndto)) {
            request.put("msg", "删除成功");
            return SUCCESS;
        }
        request.put("msg", "删除失败");
        return ERROR;
    }

    public String modifyNotice() {
        request = (Map) ActionContext.getContext().get("request");
        if (NoticeService.modifyNotice(ndto)) {
            request.put("msg", "修改成功");
            return SUCCESS;
        }
        request.put("msg", "修改失败");
        return ERROR;
    }

    public String queryNotice() {
        List<NoticeDto> list = NoticeService.getNoticeList(ndto);
        if (list.size() > 0) {
            this.ndtoList = list;
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryNoticeById() {
        NoticeDto tempdto;
        tempdto = NoticeService.getNoticeById(ndto);
        if (tempdto != null) {
            this.ndto = tempdto;
            return SUCCESS;
        }
        return ERROR;
    }

    public NoticeDto getNdto() {
        return ndto;
    }

    public void setNdto(NoticeDto ndto) {
        this.ndto = ndto;
    }

    public Map getRequest() {
        return request;
    }

    public void setRequest(Map request) {
        this.request = request;
    }

    public List<NoticeDto> getNdtoList() {
        return ndtoList;
    }

    public void setNdtoList(List<NoticeDto> ndtoList) {
        this.ndtoList = ndtoList;
    }
}
