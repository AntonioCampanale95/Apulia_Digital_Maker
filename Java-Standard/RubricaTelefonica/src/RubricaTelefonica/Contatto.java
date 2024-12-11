package RubricaTelefonica;

import java.util.ArrayList;
import java.util.Scanner;

public class Contatto {

	Scanner sc = new Scanner(System.in);

	private String nome;
	private String cognome;
	private String numero;

	public Contatto(String nome, String cognome, String numero) {
		this.nome = nome;
		this.cognome = cognome;
		this.numero = numero;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	@Override
	public String toString() {
		return nome + " " + cognome + ": " + numero;

	}

	public Contatto creaContatto() {

		int tentativo = 3;

		while (tentativo > 0) {
			System.out.println("Inserisci il nome");
			String nuovoNome = sc.next();
			System.out.println("Inserisci il cognome");
			String nuovoCognome = sc.next();
			System.out.println("Inserisci il numero di telefono (10 caratteri)");
			String nuovoNumeroTelefono = sc.next();
			try {
				if (nuovoNumeroTelefono.length() != 10) {
					throw new NumeroSbagliatoException("Il numero non può avere questi caratteri. Inserirne 10!");
				}
				Contatto nuovoCont = new Contatto(nuovoNome, nuovoCognome, nuovoNumeroTelefono);
				return nuovoCont;
			} catch (NumeroSbagliatoException e) {
				System.out.println(e.getMessage());
				tentativo = tentativo - 1;
				if (tentativo == 0) {
					System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
				}
			}
		}
		return null;
	}
}
