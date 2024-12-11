package com.example.bundesliga;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bundesliga")
public class TeamController {

	@Autowired
	private TeamDAO teamDAO;

	@GetMapping("/teams")
	public ResponseEntity<List<Team>> getAllTeams() {
		List<Team> teams = teamDAO.getAllTeams();
		return ResponseEntity.ok(teams);
	}

	@PostMapping("/teams")
	public void addTeam(@RequestBody Team team) {
		teamDAO.addTeam(team);
	}

	@GetMapping("/teams/{id}")
	public ResponseEntity<Team> getTeam(@PathVariable Integer id) {
		Optional<Team> team = teamDAO.getTeam(id);
		return team.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@DeleteMapping("/teams/{id}")
	public void deleteTeam(@PathVariable Integer id) {
		teamDAO.delTeam(id);
	}

	// Giocatori di una squadra tramite il nome della
	// squadra
	@GetMapping("/players/{teamname}")
	public ResponseEntity<List<Player>> getPlayersByTeamName(@PathVariable String teamname) {
		List<Player> players = teamDAO.getPlayersByTeamName(teamname);
		if (players.isEmpty()) {
			throw new TeamNotFoundException(teamname + " non trovata!");
		}
		return ResponseEntity.ok(players);
	}

	@GetMapping("/players")
	public ResponseEntity<List<Player>> getAllPlayers() {
		List<Player> players = teamDAO.getAllPlayersSortedByName();
		return ResponseEntity.ok(players);
	}

	@PostMapping("/players")
	public void addPlayers(@RequestBody Player player) {
		if (teamDAO.existsTeam(player.getTeamname())) {
			teamDAO.addPlayer(player);
		} else {
			throw new TeamNotFoundException(
					player.getTeamname() + " non trovata! Inserire team presente nel database!");
		}
	}

	@DeleteMapping("/players/{id}")
	public void deletePlayer(@PathVariable Integer id) {
		teamDAO.delPlayer(id);
	}

	@PostMapping("/allplayers")
	public void addListPlayers(@RequestBody List<Player> player) {
		for (int i = 0; i < player.size(); i++) {
			if (teamDAO.existsTeam(player.get(i).getTeamname())) {
				teamDAO.addPlayer(player.get(i));
			} else {
				throw new TeamNotFoundException("Inserimento di " + player.get(i).getPlayername()
						+ " non è andato a buon fine!" + player.get(i).getTeamname() + " non esiste nel database!");
			}
		}
	}

}
