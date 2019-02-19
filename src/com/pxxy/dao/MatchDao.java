package com.pxxy.dao;

import java.util.List;

import com.pxxy.entity.Match;

public interface MatchDao {

	public void addMatch(Match match);

	public List<Match> findAllMatch(int currentPage, int pageSize);

	public void delMatch(Match match);

	public void updateMatch(Match match);

	public Match findMatchById(int match_id);

	int getCount();

	public List<Match> findAllMatchForDrop();

	public List<Match> findFourMatch();

}
