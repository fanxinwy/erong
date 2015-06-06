package nw.verification.message.support;

import nw.verification.image.VerifyCodeUtils;
import nw.verification.message.MessageProcessor;

public class DefaultMessageProcessor implements MessageProcessor {
	
	private int defaultCodeLength = 4;
	protected static final String VERIFY_CODES = "1234567890";

	@Override
	public String getCode(String phoneNumber) {
		return getCode(phoneNumber, defaultCodeLength);
	}

	@Override
	public String getCode(String phoneNumber, int codeLength) {
		return VerifyCodeUtils.generateVerifyCode(codeLength, VERIFY_CODES);
	}
	
	@Override
	public void setDefaultCodeLength(int length) {
		defaultCodeLength = length;		
	}

}
