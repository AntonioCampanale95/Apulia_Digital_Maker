package esercizioBanca;

import java.util.ArrayList;
import java.util.Scanner;

public class ManagerBanca {
	Scanner sc = new Scanner(System.in);

	private ArrayList<ContoCorrente> conti;
	private ArrayList<Correntista> correntisti;
	
	
	//COSTRUTTORE DEL MANAGER BANCARIO CHE GESTISCE I DATI DEGLI ARRAY DEI CORRENTISTI E DEI CONTICORRENTI
	public ManagerBanca() {

		this.conti = new ArrayList<ContoCorrente>();
		this.correntisti = new ArrayList<Correntista>();

		correntisti.add(new Correntista("Antonio", "Campanale", "CMPNTN95R14L109G", "14/10/1995"));
		correntisti.add(new Correntista("Maria", "Rossi", "RSSMRA80A41H501X", "01/04/1980"));
		correntisti.add(new Correntista("Luigi", "Bianchi", "BNCLGU75L12F205Y", "12/07/1975"));
		correntisti.add(new Correntista("Giovanna", "Verdi", "VRDGNN60C45I309Z", "03/12/1960"));
		correntisti.add(new Correntista("Marco", "Ferrari", "FRRMRC85R23D403W", "23/05/1985"));
		correntisti.add(new Correntista("Elena", "Russo", "RSSLNE70T42E507U", "10/09/1970"));
		correntisti.add(new Correntista("Giuseppe", "Bianconi", "RSSMRA90E15H501B", "16/08/1940"));
		correntisti.add(new Correntista("Domenico", "Defrenza", "DMNDFR95L17L109F", "12/12/2012"));

		conti.add(new ContoCorrente("IT12R1234567890123456789012", correntisti.get(0), 10000));
		conti.add(new ContoCorrente("FR76A9876543210987654321098", correntisti.get(1), 30000));
		conti.add(new ContoCorrente("DE34C6543210987654321098744", correntisti.get(2), 50000));
		conti.add(new ContoCorrente("ES45B5432109876543210987644", correntisti.get(3), 15000));
		conti.add(new ContoCorrente("GB98D4321098765432109876554", correntisti.get(4), 23000));
		conti.add(new ContoCorrente("NL21E32109876543210398765424", correntisti.get(5), 80000));
		conti.add(new ContoConFido("IT45B54321098765432109876", correntisti.get(6), 43500, 5000));
		conti.add(new ContoConFido("IT76C37581857178517571857", correntisti.get(7), 60000, 5000));

	}

	public ArrayList<ContoCorrente> getConti() {
		return conti;
	}

	public void setConti(ArrayList<ContoCorrente> conti) {
		this.conti = conti;
	}

	public ArrayList<Correntista> getCorrentisti() {
		return correntisti;
	}

	public void setCorrentisti(ArrayList<Correntista> correntisti) {
		this.correntisti = correntisti;
	}

}