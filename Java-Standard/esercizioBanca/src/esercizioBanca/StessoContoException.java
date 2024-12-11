package esercizioBanca;

public class StessoContoException extends Exception{
	
private String message;
	
	public StessoContoException(String message) {
        this.message = message;
    }

	public String getMessage() {
		return message;
	}


}
