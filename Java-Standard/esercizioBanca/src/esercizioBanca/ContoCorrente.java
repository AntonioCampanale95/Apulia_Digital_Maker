package esercizioBanca;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

public class ContoCorrente {

	private double saldo;
	private String numContoCorrente;
	private Correntista correntisti;

	// COSTRUTTORE DEL CONTOCORRENTE
	public ContoCorrente(String numContoCorrente, Correntista correntisti, double saldo) {
		this.numContoCorrente = numContoCorrente;
		this.correntisti = correntisti;
		this.saldo = saldo;
	}

	public Correntista getCorrentisti() {
		return correntisti;
	}

	public String getNumContoCorrente() {
		return numContoCorrente;
	}

	public double getSaldo() {
		return saldo;
	}

	public double setSaldo(double saldo) {
		this.saldo = saldo;
		return saldo;
	}

	// METODO PER PRELEVARE
	Scanner sc = new Scanner(System.in);
	public void preleva() {
	    int tentativo = 3;
	    while (tentativo > 0) {
	        System.out.println("Tentativi rimanenti: " + tentativo);
	        System.out.println("Inserisci l'importo che vuoi prelevare");
	        try {
	            if (sc.hasNextDouble()) {
	                double importo = sc.nextDouble();
	                if (saldo < importo) {
	                    throw new SaldoInsufficienteException("L'importo da lei selezionato è superiore al saldo disponibile");
	                } else if (importo == 0) {
	                    throw new Importo0Exception("L'importo da lei selezionato è pari a 0");
	                } else {
	                    saldo -= importo;
	                    System.out.println("Il saldo attuale, dopo l'operazione, è " + saldo);
	                    break;
	                }
	            } else {
	                sc.next(); // Pulisce l'input non valido
	                throw new InputMismatchException("Errore: L'importo deve essere un numero!");
	            }
	        } catch (SaldoInsufficienteException | Importo0Exception e) {
	            System.out.println(e.getMessage());
	            tentativo--;
	            if (tentativo == 0) {
	                System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
	            }
	        } catch (InputMismatchException e) {
	            System.out.println(e.getMessage());
	            tentativo--;
	            if (tentativo == 0) {
	                System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
	            }
	        }
	    }
	}

	// METODO PER DEPOSITARE
	public void deposita() {
		int tentativo = 3;
		while (tentativo > 0) {
			try {
				System.out.println("Inserisci l'importo da depositare.");
				double importo = sc.nextDouble();
				if (importo > 1000) {
					throw new DepositoMaxException(
							"L'importo che si vuole depositare è superiore a quello possibile. Deposito massimo 1000 euro");
				} else {
					saldo = saldo + importo;
					break;
				}
			} catch (DepositoMaxException e) {
				System.out.println(e.getMessage());
				tentativo = tentativo - 1;
				if (tentativo == 0) {
					System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
				}
			}
		}
	}

	// METODO PER LA RICERCA DEL CONTO NELL'ARRAY
	public static ContoCorrente ricercaConto(String sceltaConto, ArrayList<ContoCorrente> conti) {
		ContoCorrente contoTrovato = null;
		try {
			for (int i = 0; i < conti.size(); i++) {
				if (sceltaConto.equals(conti.get(i).getNumContoCorrente())) {
					System.out.println(
							"Benvenuto " + conti.get(i).getCorrentisti().getNome() + ", che operazione vuoi fare?");
					contoTrovato = conti.get(i);
					break;
				}
			}
			if (contoTrovato == null) {
				throw new ContoAssenteException("Il numero di conto da lei inserito è inesistente. Riprovare");
			}
		} catch (ContoAssenteException e) {
			System.out.println(e.getMessage());
		}
		return contoTrovato;
	}

	// METODO PER EFFETTUARE UN BONIFICO (SOLDI DA UN CONTO AD UN ALTRO)
	public void bonifico(ArrayList<ContoCorrente> conti) {
		double importoBonifico = 0;
		int tentativo = 3;
		while (tentativo > 0) {
			System.out.println("Inserire importo per il bonifico");
			importoBonifico = sc.nextDouble();
			try {
				if (saldo < importoBonifico) {
					throw new SaldoInsufficienteException(
							"L'importo da lei selezionato per il bonifico è maggiore del saldo");
				}else {
					saldo = saldo - importoBonifico;
					break;
				}
			} catch (SaldoInsufficienteException e) {
				System.out.println(e.getMessage());
				tentativo = tentativo - 1;
				if (tentativo == 0) {
					System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
				}
			}
		}

		System.out.println("Inserire numero conto di chi deve ricevere il bonifico");
		String sceltaConto2 = sc.next();
		ContoCorrente contoTrovato = null;
		try {
			for (int i = 0; i < conti.size(); i++) {
				if (sceltaConto2.equals(conti.get(i).getNumContoCorrente())) {
					System.out.println("Stai passando " + importoBonifico + " euro " + " a "
							+ conti.get(i).getCorrentisti().getNome());
					contoTrovato = conti.get(i);
					break;
				} 
			}

			if (contoTrovato != null) {
				double saldoRicevente = contoTrovato.getSaldo();
				double saldoFinaleRicevente = saldoRicevente + importoBonifico;
				System.out.println("Il saldo di " + contoTrovato.getCorrentisti().getNome() + saldoFinaleRicevente);
			}  else
				throw new ContoAssenteException("Il numero di conto da lei inserito è inesistente. Riprovare");

		} catch (ContoAssenteException e) {
			System.out.println(e.getMessage());
		} 
	}
}