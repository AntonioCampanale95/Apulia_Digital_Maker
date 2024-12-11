package esercizioBanca;

import java.util.InputMismatchException;

public class ContoConFido extends ContoCorrente {

	private double fido;

	// COSTRUTTORE DEL CONTOCORRENTE CON L'AGGIUNTA DEL FIDO
	public ContoConFido(String numContoCorrente, Correntista correntisti, double saldo, double fido) {
		super(numContoCorrente, correntisti, saldo);
		this.fido = fido;
	}

	public double getFido() {
		return fido;
	}

	public double setFido(double fido) {
		this.fido = fido;
		return fido;
	}

	// OVERRIDE DEL METODO PRELEVA PER UTILIZZARLO ANCHE CON I CONTI CON FIDO
	@Override
	public void preleva() {

		int tentativo = 3;
		double saldoConFido = getSaldo() + fido;
		double saldoPersonale;

		while (tentativo > 0) {
			try {
				System.out.println("Inserisci l'importo che vuoi prelevare");
				double importo = sc.nextDouble();

				if (getSaldo() < importo && saldoConFido < importo) {
					throw new SaldoInsufficienteException(
							"L'importo da lei selezionato è superiore al saldo disponibile. Il fido non può coprire la richiesta.");
				} else if (importo == 0) {
					throw new Importo0Exception("L'importo da lei selezionato è pari a 0");
				} else if (getSaldo() > importo) {
					saldoPersonale = getSaldo() - importo;
					double saldoFinale = setSaldo(saldoPersonale);
					System.out.println("Il saldo attuale, dopo l'operazione, è " + saldoPersonale);
					break;
				} else if (getSaldo() < importo && saldoConFido > importo) {
					double fidoFinale = setFido(saldoConFido - importo);
					double saldoFinale = setSaldo(0);
					System.out.println("Il saldo attuale, dopo l'operazione, è " + saldoFinale
							+ ". Il fido rimanente è : " + fidoFinale);
					break;
				}
			} catch (SaldoInsufficienteException | Importo0Exception e) {
				System.out.println(e.getMessage());
				tentativo--;
				if (tentativo == 0) {
					System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
				}
			} catch (InputMismatchException e) {
				System.out.println("Input non valido. Assicurati di inserire un importo valido.");
				sc.next(); 
				tentativo--;
				if (tentativo == 0) {
					System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
				}
			}
		}
	}

	
	//OVERRIDE DEL METODO DEPOSITA PER ADATTARLO ALLE ESIGENZE DEI CONTI CON FIDO
	public void deposita() {
		int tentativo = 3;
		final double tettoFido = 5000;
		double fidoAttuale = getFido();
		double saldoAttuale = getSaldo();
		while (tentativo > 0) {
			try {
				System.out.println("Inserisci l'importo da depositare:");
				double importo = sc.nextDouble();
				if (importo > 1000) {
					throw new DepositoMaxException(
							"L'importo che si vuole depositare è superiore a quello possibile. Deposito massimo 1000 euro");
				} else {
					if (fidoAttuale < tettoFido) {
						double importoFido = Math.min(tettoFido - fidoAttuale, importo);
						double importoSaldo = importo - importoFido;
						fidoAttuale = fidoAttuale + importoFido;
						saldoAttuale = saldoAttuale + importoSaldo;
					} else {
						saldoAttuale = saldoAttuale + importo;
					}
					setFido(fidoAttuale);
					setSaldo(saldoAttuale);
					break;
				}
			} catch (DepositoMaxException e) {
				System.out.println(e.getMessage());
				tentativo--;
				if (tentativo == 0) {
					System.out.println("Hai esaurito il numero di tentativi possibili! Riprovare più tardi");
				}
			}
		}
	}
}