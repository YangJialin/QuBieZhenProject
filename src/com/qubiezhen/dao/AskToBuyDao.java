package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.AskToBuyDto;

import java.util.List;

/**
 * Created by yangj on 2016/12/28.
 */
public interface AskToBuyDao {
    Boolean addAskToBuy(AskToBuyDto askdto);

    List<AskToBuyDto> getAskToBuyList(AskToBuyDto askdto);

    AskToBuyDto getAskToBuyDetails(AskToBuyDto askdto);
}
