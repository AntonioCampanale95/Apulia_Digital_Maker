package RubricaTelefonica;

public class ContattoAssenteException extends Exception{
	
	private String message;

	public ContattoAssenteException(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}
	

}
