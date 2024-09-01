package Model;

import java.io.InputStream;
import java.io.Serializable;

public class Report implements Serializable {
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	int id;
	InputStream Evident=null;
	String region=null, crimeType=null, filetype,datafile=null,date=null,description=null;

	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public InputStream getEvident() {
		return Evident;
	}

	public void setEvident(InputStream evident) {
		Evident = evident;
	}

	public String getDatafile() {
		return datafile;
	}

	public void setDatafile(String datafile) {
		this.datafile = datafile;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCrimeType() {
		return crimeType;
	}

	public void setCrimeType(String crimeType) {
		this.crimeType = crimeType;
	}

	
}
