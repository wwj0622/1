package com.topscit.springboot1.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.topscit.springboot1.bean.Goods;
import com.topscit.springboot1.dao.GoodsMapper;
import com.topscit.springboot1.service.GoodsService;

@Service("goodsService")
public class GoodsServiecImpl implements GoodsService{

	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public PageInfo<Goods> selectListGoodsByPn(int pn, int size) {
		PageHelper.startPage(pn, size);
		List<Goods> list = goodsMapper.selectListGoods();
		PageInfo<Goods> pageInfo = new PageInfo<Goods>(list);
		return pageInfo;
	}

}