package RubricaTelefonica;

import java.util.ArrayList;
import java.util.Scanner;

public class Rubrica {

	Scanner sc = new Scanner(System.in);

	private ArrayList<Contatto> contatti;

	public Rubrica() {

		this.contatti = new ArrayList<Contatto>();

	}

	public ArrayList<Contatto> getContatti() {
		return contatti;
	}

	public void setContatti(ArrayList<Contatto> contatti) {
		this.contatti = contatti;
	}

	// METODO PER AGGIUNGERE UN CONTATTO NELLA RUBRICA PRECEDENTEMENTE CREATO

	public static void aggiungiContatto(ArrayList<Contatto> contatti, Contatto contatto) {
		contatti.add(contatto);
	}

	// METODO PER RIMUOVERE UN CONTATTO CERCATO IMMETTENDO IL NUMERO DI TELEFONO

	public static Contatto rimuoviContatto(String sceltaContatto, ArrayList<Contatto> contatti) {

		Contatto contattoTrovato = null;
		try {
			for (int i = 0; i < contatti.size(); i++) {
				if (sceltaContatto.equals(contatti.get(i).getNumero())) {
					System.out.println("Il contatto da lei scelto è " + contatti.get(i).getNome() + " "
							+ contatti.get(i).getCognome() + ". Il contatto è stato cancellato definitivamente");
					contattoTrovato = contatti.get(i);
					contatti.remove(contattoTrovato);
					break;
				}
			}
			if (contattoTrovato == null) {
				throw new ContattoAssenteException("Il numero da lei inserito è inesistente nella rubrica. Riprovare");
			}
		} catch (ContattoAssenteException e) {
			System.out.println(e.getMessage());
		}
		return contattoTrovato;
	}

	// METODO PER CERCARE IL NUMERO DAL NOME E DAL COGNOME

	public static Contatto cercaNumero(ArrayList<Contatto> contatti, String nomeCercato, String cognomeCercato) {
		Contatto contattoTrovato = null;

		try {
			for (int i = 0; i < contatti.size(); i++) {
				if (nomeCercato.equals(contatti.get(i).getNome())) {
					if (cognomeCercato.equals(contatti.get(i).getCognome())) {
						System.out.println("Il contatto da lei richiesto è :" + contatti.get(i).getNome() + " "
								+ contatti.get(i).getCognome() + " " + contatti.get(i).getNumero());
						contattoTrovato = contatti.get(i);
						break;
					}
				}
			}
			if (contattoTrovato == null) {
				throw new ContattoAssenteException("Il contatto da lei cercato è inesistente nella rubrica. Riprovare");
			}
		} catch (ContattoAssenteException e) {
			System.out.println(e.getMessage());
		}
		return contattoTrovato;
	}

	// METODO PER STAMPARE TUTTI

	@Override
	public String toString() {
		StringBuilder contattiCompleti = new StringBuilder();
		contattiCompleti.append("RUBRICA\n-----------------------------\n");
		for (int i = 0; i < contatti.size(); i++) {
			contattiCompleti.append(contatti.get(i).toString() + "\n");
		}
		String contattiCompletiFine = contattiCompleti.toString();
		return contattiCompletiFine;
	}
}
