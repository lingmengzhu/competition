package com.pxxy.test;


import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.pxxy.entity.Match;
import com.pxxy.entity.Products;
import com.pxxy.service.MatchService;
import com.pxxy.service.ProductsService;

public class Test01 {
	@Test
public void test1(){
     	Match match=new Match();
		List<Match> list=null;
		match.setMatch_id(1);
		match.setMatch_info("wjfdsjkf");
		
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		MatchService matchService =(MatchService)ac.getBean("matchService");
		matchService.addMatch(match);
		
		
	}

}
