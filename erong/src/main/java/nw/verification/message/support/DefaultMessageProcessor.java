package nw.verification.message.support;

import nw.verification.message.MessageProcessor;

public class DefaultMessageProcessor implements MessageProcessor {

	@Override
	public String getCode(String phoneNumber) {
		// TODO Auto-generated method stub
		return getCode(phoneNumber, 4);
	}

	@Override
	public String getCode(String phoneNumber, int codeLength) {
		// TODO Auto-generated method stub
		return "2345";
	}

}
