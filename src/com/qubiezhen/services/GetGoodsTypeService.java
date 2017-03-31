package com.qubiezhen.services;

import com.qubiezhen.dao.dto.GoodsTypeDto;
import com.qubiezhen.dao.factory.GoodsTypeDaoFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/18.
 */
public class GetGoodsTypeService {
    public static List<GoodsTypeDto> getGoodsType() {
        return GoodsTypeDaoFactory.getGoodsTypeDao().getGoodsType();
    }
}
