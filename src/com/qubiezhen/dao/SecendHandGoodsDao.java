package com.qubiezhen.dao;

import com.qubiezhen.dao.dto.SecendHandGoodsDto;

import java.util.List;

/**
 * Created by yangj on 2016/12/18.
 */
public interface SecendHandGoodsDao {
    /**
     * 添加商品
     *
     * @param sgdto
     * @return
     */
    Boolean add2HandGoods(SecendHandGoodsDto sgdto);

    /**
     * 删除商品
     *
     * @param sgdto
     * @return
     */
    Boolean delete2HandGoods(SecendHandGoodsDto sgdto);

    /**
     * 按条件取得商品信息
     *
     * @param sgdto
     * @return
     */
    List<SecendHandGoodsDto> get2HandGoodsList(SecendHandGoodsDto sgdto);

    /**
     * 取得商品详细
     *
     * @param sgdto
     * @return
     */
    SecendHandGoodsDto get2HandGoodsById(SecendHandGoodsDto sgdto);

    /**
     * 修改商品信息
     *
     * @param sgdto
     * @return
     */
    Boolean modify2HandGoods(SecendHandGoodsDto sgdto);
}
