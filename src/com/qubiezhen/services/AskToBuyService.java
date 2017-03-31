package com.qubiezhen.services;

import com.qubiezhen.dao.dto.AskToBuyDto;
import com.qubiezhen.dao.factory.AskToBuyDaoFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/28.
 */
public class AskToBuyService {
    public static Boolean addAskToBuy(AskToBuyDto askdto) {
        return AskToBuyDaoFactory.getAskToBuyDao().addAskToBuy(askdto);
    }

    public static List<AskToBuyDto> getAskToBuyList(AskToBuyDto askdto) {
        return AskToBuyDaoFactory.getAskToBuyDao().getAskToBuyList(askdto);
    }

    public static AskToBuyDto getAskToBuyDetails(AskToBuyDto askdto) {
        return AskToBuyDaoFactory.getAskToBuyDao().getAskToBuyDetails(askdto);
    }
}
