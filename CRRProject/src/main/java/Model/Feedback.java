package Model;

import java.io.Serializable;

public class Feedback implements Serializable
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String Feedback,Date;

	public String getFeedback() {
		return Feedback;
	}

	public void setFeedback(String feedback) {
		Feedback = feedback;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}
	
}
