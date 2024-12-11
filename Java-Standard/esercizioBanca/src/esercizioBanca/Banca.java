package esercizioBanca;

import java.util.ArrayList;
import java.util.Scanner;

public class Banca {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		// ARRAYLIST DEI CORRENTISTI E DEI CONTI GESTITI DALLA CLASSE MANAGERBANCA
		
		ManagerBanca mb1 = new ManagerBanca();

		ArrayList<Correntista> correntisti = mb1.getCorrentisti();

		ArrayList<ContoCorrente> conti = mb1.getConti();

	
		// INTERFACCIA DI SCELTA DEL MENU INIZIALE
		int sceltaMenu;
				
        System.out.println("|BENVENUTO IN APULIA DIGITAL BANK|");
		System.out.println("------------------------");
		System.out.println("1. Crea un nuovo correntista");
		System.out.println("2. Accedi al tuo conto bancario");
		System.out.println("3. Esci");
		System.out.println("------------------------");

		sceltaMenu = sc.nextInt();

		switch (sceltaMenu) {
		case 1: {
			Correntista nuovoCorrentista = new Correntista("", "", "", "").creaCorrentista();
			correntisti.add(nuovoCorrentista);
			break;
		}
		case 2: {
			// INIZIO (RICHIESTA DI INSERIMENTO DEL NUMERO DI CONTO E RICERCA NEL DATABASE)
			int tentativo = 3;
			ContoCorrente contoTrovato = null;
			while (tentativo > 0) {

				System.out.println("Benvenuto! Inserire il numero di conto");

				String sceltaConto = sc.next();

				contoTrovato = ContoCorrente.ricercaConto(sceltaConto, conti);

				tentativo--;
				if (tentativo == 0 && contoTrovato == null) {
					System.out.println("Hai esaurito i tentativi! Rivolgersi alla banca");
					System.exit(0);
				} else if (contoTrovato != null) {
					break;
				}
			}

			int sceltaOperazione;

			do {

				System.out.println("------------------------");
				System.out.println("1. Deposita");
				System.out.println("2. Preleva");
				System.out.println("3. Stampa i tuoi dati");
				System.out.println("4. Bonifico");
				System.out.println("5. Esci");
				System.out.println("------------------------");

				sceltaOperazione = sc.nextInt();

				switch (sceltaOperazione) {
				
				// INTERFACCIA DI SCELTA DELLE OPERAZIONI (UNA VOLTA CHE IL CORRENTISTA HA
				// "ESEGUITO L'ACCESSO"

				case 1: {
					contoTrovato.deposita();
					System.out.println("Il tuo saldo attuale è " + contoTrovato.getSaldo());
					break;
				}
				case 2: {
					 if (contoTrovato instanceof ContoConFido) {
					        ContoConFido contoConFido = (ContoConFido) contoTrovato;
					        contoConFido.preleva();
					    } else {
					        contoTrovato.preleva();
					    }
					break;
				}
				case 3: {
					contoTrovato.getCorrentisti().stampaEl();
					System.out.println("Saldo : " + contoTrovato.getSaldo());
					break;
				}
				case 4: {
					contoTrovato.bonifico(conti);
					break;
				}
				case 5: {
					System.out.println("Uscita dal menu...");
					return;
				}
				default: {
					System.out.println("Inserire numero corretto per far partire un'operazione");
				}
				}

			} while (sceltaOperazione > 0);
			break;
		}
		case 3: {
			System.out.println("Uscita dal menu...");
			return;
		}
		default: {
			System.out.println("Inserire numero corretto per far partire un'operazione");
		}
		}		

	}
}