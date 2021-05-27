package com.mrd.framework.exception.auth;

import com.mrd.framework.exception.BaseException;

public class UserPermissionException extends BaseException{

	private static final long serialVersionUID = 1L;
	
	public UserPermissionException(String message) {
		super(message);
	}
	
    public UserPermissionException(String message, Object errorCode) {
        super(message, errorCode);
    }
}
