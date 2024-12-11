package esercizioBanca;

public class SaldoInsufficienteException extends Exception{
	
	private String message;
	
	public SaldoInsufficienteException(String message) {
        this.message = message;
    }

	public String getMessage() {
		return message;
	}
	
}