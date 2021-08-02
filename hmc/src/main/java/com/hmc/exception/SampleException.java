package com.hmc.exception;

public class SampleException extends RuntimeException {

	private static final long serialVersionUID = -3058896678234981041L;

	private String title;
	
	public SampleException(String title, String message) {
		super(message);
		this.title = title;
	}
	
	public String getTitle() {
		return title;
	}
	
	

}
