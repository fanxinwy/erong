package nw.verification.message;

public interface MessageProcessor {
	
	String getCode(String phoneNumber);
	
	String getCode(String phoneNumber, int codeLength);

}
