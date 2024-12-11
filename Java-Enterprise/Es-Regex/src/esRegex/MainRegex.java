package esRegex;

import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class MainRegex {

	public static void main(String[] args) {
		String testString = "The quick brown fox jumps over the lazy fox.";

		// Creazione del pattern per cercare la parola "fox" nella stringa di testo

		Pattern pattern = Pattern.compile("fox");
		Matcher matcher = pattern.matcher(testString);
		
		boolean parolaTrovata = false;
		// Trovare la corrispondenza
		while (matcher.find()) {
			int startIndex = matcher.start(); // Ottieni l'indice di inizio della corrispondenza
			System.out.println("Trovato alla posizione: " + startIndex);
			int startEnd = matcher.end();
			System.out.println("Trovato alla posizione: " + startEnd);
			parolaTrovata = true;
			
	}
		if (!parolaTrovata) {
			System.out.println("NON TROVATO!");
		}
		
		
	}

}
