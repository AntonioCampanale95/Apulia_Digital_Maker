package esercizioBanca;

public class ContoAssenteException extends Exception {
	private String message;

	public ContoAssenteException(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

}