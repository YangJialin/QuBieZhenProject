package com.qubiezhen.services;

import com.qubiezhen.dao.SecendHandGoodsDao;
import com.qubiezhen.dao.dto.SecendHandGoodsDto;
import com.qubiezhen.dao.factory.SecendHandGoodsDaoFactory;

import java.util.List;

/**
 * Created by yangj on 2016/12/18.
 */
public class SecendHandGoodsService {

    public static Boolean addSecendHandGoodsService(SecendHandGoodsDto sgdto) {
        return SecendHandGoodsDaoFactory.getSecendHandDao().add2HandGoods(sgdto);
    }

    public static List<SecendHandGoodsDto> getSecendHandGoodsList(SecendHandGoodsDto sgdto) {
        return SecendHandGoodsDaoFactory.getSecendHandDao().get2HandGoodsList(sgdto);
    }

    public static SecendHandGoodsDto getSecendHandGoodsById(SecendHandGoodsDto sgdto) {
        return SecendHandGoodsDaoFactory.getSecendHandDao().get2HandGoodsById(sgdto);
    }

    /**
     * 删除商品ByID
     */
    public static Boolean deleteSecendHandGoodsService(SecendHandGoodsDto sgdto) {
        return SecendHandGoodsDaoFactory.getSecendHandDao().delete2HandGoods(sgdto);
    }

    /**
     *
     */
    public static Boolean modifySecendHandGoods(SecendHandGoodsDto sgdto) {
        return SecendHandGoodsDaoFactory.getSecendHandDao().modify2HandGoods(sgdto);
    }
}
