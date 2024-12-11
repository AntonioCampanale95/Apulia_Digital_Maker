package com.example.bundesliga;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class TeamDAO {
	
	
	@Autowired
	private TeamRepository teamRepository;
	
	@Autowired
	private PlayerRepository playerRepository;
	
	
	public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }

    // Aggiungere una squadra
    public void addTeam(Team team) {
        teamRepository.save(team);
    }

    // Ottenere una squadra tramite ID
    public Optional<Team> getTeam(Integer id) {
        return teamRepository.findById(id);
    }

    // Eliminare una squadra
    public void delTeam(Integer id) {
        teamRepository.deleteById(id);
    }
    
 // Ottenere i giocatori di una squadra tramite nome squadra
    public List<Player> getPlayersByTeamName(String teamname) {
        return playerRepository.findByTeamname(teamname);
    }
    
    public List<Player> getAllPlayersSortedByName() {
        // Ordine ascendente
        Sort sort = Sort.by(Sort.Direction.ASC, "playername");
        return playerRepository.findAll(sort);
    }
    
    public void addPlayer(Player player) {
    	playerRepository.save(player);
    }
    
    public void delPlayer(Integer id) {
    	playerRepository.deleteById(id);
    }
    
    public boolean existsTeam(String teamname) {
    	return teamRepository.existsByTeamname(teamname);
    }
    
    public void addAllPlayers(List<Player> player) {
    	playerRepository.saveAll(player);
    }
   }
    
   
	
	
	