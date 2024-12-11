package esercizioBanca;

import java.util.Scanner;

public class Correntista {

	Scanner sc = new Scanner(System.in);

	private String nome;
	private String cognome;
	private String codiceFiscale;
	private String dataNascita;
	
	
	// COSTRUTTORE DEL CORRENTISTA
	public Correntista(String nome, String cognome, String codiceFiscale, String dataNascita) {

		this.nome = nome;
		this.cognome = cognome;
		this.codiceFiscale = codiceFiscale;
		this.dataNascita = dataNascita;

	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNome() {
		return nome;
	}

	public String getCognome() {
		return cognome;
	}

	public String getCodiceFiscale() {
		return codiceFiscale;
	}

	public String getDataNascita() {
		return dataNascita;
	}
	
	// MEDOTO CHE CREA UN NUOVO CORRENTISTA E LO INSERISCE AUTOMATICAMENTE NELL'ARRAYLIST DEI CORRENTISTI
	public Correntista creaCorrentista() {

		System.out.println("Inserisci il nome");
		String nuovoNome = sc.next();
		System.out.println("Inserisci il cognome");
		String nuovoCognome = sc.next();
		System.out.println("Inserisci il codice fiscale");
		String nuovoCodiceFiscale = sc.next();
		System.out.println("Inserisci la data di nascita");
		String nuovaDataNascita = sc.next();

		Correntista nuovoCorr = new Correntista(nuovoNome, nuovoCognome, nuovoCodiceFiscale, nuovaDataNascita);
		nuovoCorr.stampaEl();
		return nuovoCorr;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public void setCodiceFiscale(String codiceFiscale) {
		this.codiceFiscale = codiceFiscale;
	}

	public void setDataNascita(String dataNascita) {
		this.dataNascita = dataNascita;
	}
	
	// METODO CHE STAMPA I DATI E IL SALDO DEI CORRENTISTI
	public void stampaEl() {
		System.out.println("Nome : " + getNome());
		System.out.println("Cognome : " + getCognome());
		System.out.println("Codice Fiscale : " + getCodiceFiscale());
		System.out.println("Data di nascita : " + getDataNascita());
	}

}