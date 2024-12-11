package TreeMapCanzoni;

import java.time.LocalDate;

public class Canzone {

	private String titolo;
	private String genere;
	private int ascoltiStream;
	private LocalDate dataUscita;

	public Canzone(String titolo, String genere, int ascoltiStream, LocalDate dataUscita) {
		this.titolo = titolo;
		this.genere = genere;
		this.ascoltiStream = ascoltiStream;
		this.dataUscita = dataUscita;
	}

	public LocalDate getDataUscita() {
		return dataUscita;
	}

	public void setDataUscita(LocalDate dataUscita) {
		this.dataUscita = dataUscita;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public int getAscoltiStream() {
		return ascoltiStream;
	}

	public void setAscoltiStream(int ascoltiStream) {
		this.ascoltiStream = ascoltiStream;
	}

}
