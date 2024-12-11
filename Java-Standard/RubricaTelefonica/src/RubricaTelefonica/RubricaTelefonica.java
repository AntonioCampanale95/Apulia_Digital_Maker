package RubricaTelefonica;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Scanner;

public class RubricaTelefonica {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

		Rubrica rubrica = new Rubrica();

		ArrayList<Contatto> contatti = rubrica.getContatti();

		contatti.add(new Contatto("Giovanni", "Campanale", "3456789875"));
		contatti.add(new Contatto("Maria", "Marconi", "3478987657"));
		contatti.add(new Contatto("Rocco", "Tanica", "3338887654"));
		contatti.add(new Contatto("Antonio", "Campanale", "3976547894"));
		contatti.add(new Contatto("Domenico", "Barracano", "3467865456"));
		contatti.add(new Contatto("Saverio", "Defrenza", "3478967567"));

		// INTERFACCIA INIZIALE

		int sceltaMenu;

		do {

			System.out.println("|Benvenuto nella tua rubrica telefonica. Cosa vuoi fare?|");
			System.out.println("--------------------------------------------");
			System.out.println("1. Aggiungere un contatto");
			System.out.println("2. Rimuovere un contatto");
			System.out.println("3. Cercare un contatto");
			System.out.println("4. Stampare tutti i contatti in rubrica");
			System.out.println("--------------------------------------------");

			sceltaMenu = scanner.nextInt();

			switch (sceltaMenu) {

			case 1: {
				Contatto nuovoContatto = new Contatto("", "", "").creaContatto();
				if (nuovoContatto != null) {
					Rubrica.aggiungiContatto(contatti, nuovoContatto);
					System.out.println("Il contatto è stato aggiunto correttamente in rubrica");
				} else {
					System.out.println("Contatto non valido");
				}
				break;
			}
			case 2: {

				System.out.println("Inserisci il numero di telefono del contatto che vuoi cancellare");
				String sceltaContatto = scanner.next();
				Rubrica.rimuoviContatto(sceltaContatto, contatti);

				break;

			}
			case 3: {

				System.out.println("Inserire il nome del contatto da cercare");
				String nomeCercato = scanner.next();
				System.out.println("Inserire il cognome del contatto da cercare");
				String cognomeCercato = scanner.next();

				Rubrica.cercaNumero(contatti, nomeCercato, cognomeCercato);
				break;

			}
			case 4: {
				System.out.println(rubrica.toString());
				break;
			}
			}
		} while (sceltaMenu > 0);

	}

}
