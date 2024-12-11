package com.example.bundesliga;

public class TeamNotFoundException extends RuntimeException{
	
	public TeamNotFoundException(String message) {
		super(message);
	}

}
