package com.pxxy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pxxy.dao.MatchDao;
import com.pxxy.entity.Match;
import com.pxxy.entity.PageBean;
import com.pxxy.entity.User;
import com.pxxy.service.MatchService;

@Service(value = "matchService")
@Transactional
public class MatchServiceimpl implements MatchService {
	@Autowired
	private MatchDao matchDao;

	@Override
	public void addMatch(Match match) {
		
		matchDao.addMatch(match);

	}
	@Override
	public void delMatch(Match match) {
		matchDao.delMatch(match);
		

	}

	@Override
	public void updateMatch(Match match) {
		matchDao.updateMatch(match);
		

	}

	@Override
	public Match findMatchById(int match_id) {
		
		return matchDao.findMatchById(match_id);

	}

	@Override
	public PageBean<Match> findAllMatch(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		int count = matchDao.getCount();
		int totalPage = (int) Math.ceil(count*1.0/pageSize);
		List<Match> list = matchDao.findAllMatch(currentPage,pageSize);
		PageBean<Match> pb = new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(list);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}
	@Override
	public List<Match> findAllMatchForDrop() {
		// TODO Auto-generated method stub
		return matchDao.findAllMatchForDrop();
	}
	@Override
	public List<Match> findFourMatch() {
		// TODO Auto-generated method stub
		return matchDao.findFourMatch();
	}

	}


