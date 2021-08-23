package org.spring.my.dao;

import org.spring.my.dto.Reaction;

public interface ReactionDAO {
	public void insert(Reaction reaction);
	public Reaction selectOne(Reaction reaction);
	public void update(Reaction reaction);
}
