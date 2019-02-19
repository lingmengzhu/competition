package com.pxxy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pxxy.dao.ProductsDao;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.Products;
import com.pxxy.entity.User;
import com.pxxy.service.ProductsService;
@Service(value = "productsService")
@Transactional
public class ProductsServiceimpl implements ProductsService{
	@Resource(name = "productsDao")
	private ProductsDao productsDao;

	@Override
	public void delProducts(Products products) {
		
		productsDao.delProducts(products);
	}

	@Override
	public Products findProductsById(int products_id) {
		
		return productsDao.findProductsById(products_id);
	}

	@Override
	public void updateProducts(Products products) {
		
		productsDao.updateProducts(products);
	}

	@Override
	public void addProducts(Products products) {
		
		productsDao.addProducts(products);
	}

	@Override
	public List<Products> findAllProductsByMatch_id(int match_id) {
		
		return productsDao.findAllProductsByMatch_id(match_id);
	}

	@Override
	public List<Products> findFourProducts() {
		// TODO Auto-generated method stub
		return productsDao.findFourProducts();
	}

	@Override
	public PageBean<Products> findAllProducts(int currentPage, int pageSize) {
		int count = productsDao.getCount();
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<Products> list = productsDao.findAllProducts(currentPage,pageSize);
		PageBean<Products> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	@Override
	public List<Products> findUserProductsForShow(int tel) {
		// TODO Auto-generated method stub
		return  productsDao.findUserProductsForShow(tel);
	}

	@Override
	public List<Products> findVideoproducts() {
		// TODO Auto-generated method stub
		return productsDao.findVideoproducts();
	}

	@Override
	public List<Products> findDevelopproducts() {
		// TODO Auto-generated method stub
		return productsDao.findDevelopproducts();
	}

	@Override
	public List<Products> findPictureproducts() {
		// TODO Auto-generated method stub
		return productsDao.findPictureproducts();
	}

	@Override
	public List<Products> findProductsBykey(String keywords) {
		// TODO Auto-generated method stub
		return productsDao.findProductsBykey(keywords);
	}
}
