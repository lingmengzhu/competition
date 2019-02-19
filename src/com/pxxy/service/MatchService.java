package com.pxxy.service;

import java.util.List;

import com.pxxy.entity.Match;
import com.pxxy.entity.PageBean;

public interface MatchService {

	public void addMatch(Match match);


	public void delMatch(Match match);

	public void updateMatch(Match match);

	public Match findMatchById(int match_id);


	public PageBean<Match> findAllMatch(int currentPage, int pageSize);


	public List<Match> findAllMatchForDrop();


	public List<Match> findFourMatch();

}
