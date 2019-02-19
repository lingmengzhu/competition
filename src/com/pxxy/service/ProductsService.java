package com.pxxy.service;

import java.util.List;

import com.pxxy.entity.PageBean;
import com.pxxy.entity.Products;

public interface ProductsService {

	PageBean<Products> findAllProducts(int currentPage, int pageSize);

	void delProducts(Products products);

	Products findProductsById(int products_id);

	void updateProducts(Products products);

	void addProducts(Products products);

	List<Products> findAllProductsByMatch_id(int match_id);

	List<Products> findFourProducts();

	List<Products> findUserProductsForShow(int tel);

	List<Products> findVideoproducts();

	List<Products> findDevelopproducts();

	List<Products> findPictureproducts();

	List<Products> findProductsBykey(String keywords);

}
