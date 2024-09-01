package Model;

import java.io.Serializable;

public class User implements Serializable
{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int id;
	String username, password, policeId, email, State;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getState() {
		return State;
	}

	public void setState(String state) {
		State = state;
	}

	public String getPoliceId() {
		return policeId;
	}

	public void setPoliceId(String policeId) {
		this.policeId = policeId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	
}
