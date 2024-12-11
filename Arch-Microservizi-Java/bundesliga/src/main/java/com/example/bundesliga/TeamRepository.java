package com.example.bundesliga;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeamRepository extends JpaRepository<Team, Integer> {
	
	Optional <Team> findByTeamname(String teamname);
	
	boolean existsByTeamname(String teamname);
}
