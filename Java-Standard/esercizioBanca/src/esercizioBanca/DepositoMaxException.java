package esercizioBanca;

public class DepositoMaxException extends Exception {
	
private String message;
	
	public DepositoMaxException(String message) {
        this.message = message;
    }

	public String getMessage() {
		return message;
	}

}