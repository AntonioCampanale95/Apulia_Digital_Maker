package RubricaTelefonica;

public class NumeroSbagliatoException extends Exception{
	
	private String message;

	public NumeroSbagliatoException(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}
	

}
