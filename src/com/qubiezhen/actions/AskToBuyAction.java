package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.AskToBuyDto;
import com.qubiezhen.services.AskToBuyService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yangj on 2016/12/28.
 */
public class AskToBuyAction extends ActionSupport {
    private AskToBuyDto askdto;
    private List<AskToBuyDto> askList;

    public List<AskToBuyDto> getAskList() {
        return askList;
    }

    public void setAskList(List<AskToBuyDto> askList) {
        this.askList = askList;
    }

    public AskToBuyDto getAskdto() {
        return askdto;
    }

    public void setAskdto(AskToBuyDto askdto) {
        this.askdto = askdto;
    }

    public String addAskToBuy() {
        if (AskToBuyService.addAskToBuy(askdto)) {
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryAskToBuyList() {
        List<AskToBuyDto> tempList;
        tempList = AskToBuyService.getAskToBuyList(askdto);
        if (tempList != null) {
            System.out.println(tempList.get(0).getCreateTime());
            this.askList = tempList;
            return SUCCESS;
        }
        return ERROR;
    }

    public String queryAskToBuyDetails() {

        AskToBuyDto tempdto = AskToBuyService.getAskToBuyDetails(askdto);
        if (tempdto != null) {
            this.askdto = tempdto;
            return SUCCESS;
        }
        return ERROR;
    }
}
