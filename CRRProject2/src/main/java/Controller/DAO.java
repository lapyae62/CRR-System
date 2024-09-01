package Controller;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Feedback;
import Model.Report;
import Model.User;

public class DAO {
	
	public Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection con  = null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
		
		return con;
	}
	
	public ArrayList<Report> ViewCrimes() throws ClassNotFoundException, SQLException
	{
		ArrayList<Report> list=new ArrayList<Report>();
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("select RegionName,CrimeType,count(CrimeType) from Reports group by RegionName,CrimeType");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Report r=new Report();
			r.setRegion(rs.getString(1));
			r.setCrimeType(rs.getString(2));
			r.setDatafile(rs.getString(3));
			list.add(r);		
		}
		
		return list;
	}
	
	public double getReportPercent(String State) throws ClassNotFoundException, SQLException
	{
		double[] percent=new double[2];
		double result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			percent[0]=rs.getDouble(1);
		}
		PreparedStatement ps2=con.prepareStatement("select count(CrimeType) from Reports where RegionName=? group by RegionName");
		ps2.setString(1, State);
		ResultSet rs2=ps2.executeQuery();
		while(rs2.next())
		{
			percent[1]=rs2.getDouble(1);
		}
		result=(percent[1]/percent[0])*100;
		
		return result;
	}
	
	public int insertReport(Report rp) throws ClassNotFoundException, SQLException {
		int status = 0,cid=0;
		
		Connection con = getConnection();
		
		PreparedStatement ps = con.prepareStatement("insert into Reports (RegionName, CrimeType, ReportDate, Description) values (?, ?, ?, ?)");		
		ps.setString(1, rp.getRegion());
		ps.setString(2, rp.getCrimeType());
		ps.setString(3, rp.getDate());
		ps.setString(4, rp.getDescription());
		status = ps.executeUpdate();
		
		if(status>0)
		{
			PreparedStatement ps2=con.prepareStatement("select max(id) from Reports");
			ResultSet rs=ps2.executeQuery();
			while(rs.next())
			{
				cid=rs.getInt(1);
			}
			
		}
		
		return cid;
	}
	
	public int insertImageEvidence(InputStream is,int cid) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into EvidentImages(image, cid) values(?, ?)");
		ps.setBlob(1, is);
		ps.setInt(2, cid);
		status=ps.executeUpdate();
		
		return status;
	}
	
	public int insertVideoEvidence(InputStream is,int cid) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into EvidentVideos(video, cid) values(?, ?)");
		ps.setBlob(1, is);
		ps.setInt(2, cid);
		status=ps.executeUpdate();
		
		return status;
	}
	
	public int insertFileEvidence(InputStream is,int cid) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into EvidentFiles(files, cid) values(?, ?)");
		ps.setBlob(1, is);
		ps.setInt(2, cid);
		status=ps.executeUpdate();
		
		return status;
	}
	
	public User isValidUser (String user,String password) throws ClassNotFoundException, SQLException {
		User result=new User();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("select * from Users where UserName=? and Password=?");
		ps.setString(1, user);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			result.setId(rs.getInt(1));
			result.setUsername(rs.getString(2));
			result.setPassword(rs.getString(3));
			result.setPoliceId(rs.getString(4));
			result.setEmail(rs.getString(5));
			result.setState(rs.getString(6));
		}
		
		return result;
	}
	
	public int UserLogOut(String Username) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("delete from Users where UserName=?");
		ps.setString(1, Username);
		status=ps.executeUpdate();
		
		return status;
	}
	
	public int insertFeedback(Feedback f) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into Feedback(Feedback,FeedbackDate) values(?,?)");
		ps.setString(1,f.getFeedback());
		ps.setString(2, f.getDate());
		
		status=ps.executeUpdate();
		
		return status;
	}
	
	public int ChildAbuseRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Child Abuse' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int CyberCrimeRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Cybercrime' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int DomesticViolenceRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Domestic Violence' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int ElderAbuseRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Elder Abuse' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int EnvironmentalCrimeRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Environmental Crime' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int RobberyRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Robbery' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int HomicideRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Homicide' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int SexOffencesRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Sex Offenses' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int HumanTraffickingRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Human Trafficking' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int IdentityTheftRate(String RegionName) throws ClassNotFoundException, SQLException
	{
		int result=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where CrimeType='Identity Theft' and RegionName=? group by RegionName");
		ps.setString(1, RegionName);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
		}
		
		return result;
	}
	
	public int KaChinRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Kachin' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int KaYahRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Kayah' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int KaYinRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Kayin' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int ChinRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Chin' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int MonRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Mon' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int RaKhineRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Rakhine' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int ShanRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Shan' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int SaGaingRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Sagaing' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int BaGoRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Bago' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int MaGweRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Magwe' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int MandalayRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Mandalay' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int YangonRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Yangon' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int AyeyarwadyRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Ayeyarwady' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}
	
	public int TanintharyiRate() throws ClassNotFoundException, SQLException
	{
		int rate=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select count(CrimeType) from Reports where RegionName='Tanintharyi' group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			rate=rs.getInt(1);
		}
		
		return rate;
	}

}
