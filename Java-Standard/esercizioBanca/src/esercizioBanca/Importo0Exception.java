package esercizioBanca;

public class Importo0Exception extends Exception{
	
	private String message;
	
	public Importo0Exception(String message) {
        this.message = message;
    }

	public String getMessage() {
		return message;
	}
	

}