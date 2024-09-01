package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

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
	
	public String CheckName(String name) throws ClassNotFoundException, SQLException
	{
		String status=null;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select UserName from Users where UserName=?");
		ps.setString(1, name);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			status=rs.getString(1);
		}
		
		return status;
	}
	
	public int UpdateUser(User u) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update Users set UserName=?,Password=?,PoliceId=?,Email=?,State=? where id=?");
		ps.setString(1, u.getUsername());
		ps.setString(2, u.getPassword());
		ps.setString(3, u.getPoliceId());
		ps.setString(4, u.getEmail());
		ps.setString(5, u.getState());
		ps.setInt(6, u.getId());
		status=ps.executeUpdate();
		
		return status;
	}
	
	public User ViewUserById(int id) throws ClassNotFoundException, SQLException
	{
		User u=new User();
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from Users where id=?");
		ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			u.setId(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setPassword(rs.getString(3));
			u.setPoliceId(rs.getString(4));
			u.setEmail(rs.getString(5));
			u.setState(rs.getString(6));
		}
		
		return u;
	}
	
	public int insertSignup(User u) throws SQLException, ClassNotFoundException {
		int status = 0;
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("insert into Users (UserName, Password, PoliceId, Email, State ) values (?, ?, ?, ?, ?)");
		ps.setString(1, u.getUsername());
		ps.setString(2, u.getPassword());
		ps.setString(3, u.getPoliceId());
		ps.setString(4, u.getEmail());
		ps.setString(5, u.getState());;
		status=ps.executeUpdate();
		return status;
	}
	
	public ArrayList<User> ViewUsers() throws ClassNotFoundException, SQLException
	{
		ArrayList<User> list=new ArrayList<User>();
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("select * from Users");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			User u=new User();
			u.setId(rs.getInt(1));
			u.setUsername(rs.getString(2));
			u.setPassword(rs.getString(3));
			u.setPoliceId(rs.getString(4));
			u.setEmail(rs.getString(5));
			u.setState(rs.getString(6));
			list.add(u);
		}
		return list;
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
	
	public ArrayList<Report> ViewReports() throws ClassNotFoundException, SQLException
	{
		ArrayList<Report> view=new ArrayList<Report>();
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("select * from Reports order by id asc");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) 
		{
			Report rp=new Report();
			rp.setId(rs.getInt(1));
			rp.setRegion(rs.getString(2));
			rp.setCrimeType(rs.getString(3));
			rp.setDate(rs.getString(4));
			rp.setDescription(rs.getString(5));
			
			view.add(rp);
		}
		
		return view;
	}
	
	public ArrayList<Report> ViewReportsById(int cid) throws ClassNotFoundException, SQLException
	{
		ArrayList<Report> view=new ArrayList<Report>();
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("select * from Reports where id=?");
		ps.setInt(1, cid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) 
		{
			Report rp=new Report();
			rp.setId(rs.getInt(1));
			rp.setRegion(rs.getString(2));
			rp.setCrimeType(rs.getString(3));
			rp.setDate(rs.getString(4));
			rp.setDescription(rs.getString(5));			
			
			
			view.add(rp);
		}
		
		return view;
	}
	
	public ArrayList<Report> ViewEvidentImagesByID(int cid) throws ClassNotFoundException, SQLException{
		ArrayList<Report> list=new ArrayList<Report>();
		
		Connection con=getConnection();
		
		try {
			PreparedStatement ps=con.prepareStatement("select image from EvidentImages where cid=?");
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				String s1=Base64.getEncoder().encodeToString(rs.getBytes(1));
				Report r=new Report();
				r.setDatafile(s1);
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Report> ViewEvidentVideosByID(int cid) throws ClassNotFoundException, SQLException{
		ArrayList<Report> list=new ArrayList<Report>();
		
		Connection con=getConnection();
		
		try {
			PreparedStatement ps=con.prepareStatement("select video from EvidentVideos where cid=?");
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				String s1=Base64.getEncoder().encodeToString(rs.getBytes(1));
				Report r=new Report();
				r.setDatafile(s1);
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Report> ViewEvidentFilesByID(int cid) throws ClassNotFoundException, SQLException{
		ArrayList<Report> list=new ArrayList<Report>();
		
		Connection con=getConnection();
		
		try {
			PreparedStatement ps=con.prepareStatement("select files from EvidentFiles where cid=?");
			ps.setInt(1, cid);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				String s1=Base64.getEncoder().encodeToString(rs.getBytes(1));
				Report r=new Report();
				r.setDatafile(s1);
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int DeleteReport(int id) throws ClassNotFoundException, SQLException
	{
		int status=0;
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("delete from Reports where id=?");
		ps.setInt(1, id);
		status=ps.executeUpdate();
		
		return status;
	}
	
	public ArrayList<Feedback> ViewFeedback() throws ClassNotFoundException, SQLException
	{
		ArrayList<Feedback> list=new ArrayList<Feedback>();
		
		Connection con=getConnection();
		
		PreparedStatement ps=con.prepareStatement("select * from Feedback");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			Feedback f=new Feedback();
			f.setFeedback(rs.getString(1));
			f.setDate(rs.getString(2));
			list.add(f);
		}
		
		return list;
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
	
	public ArrayList<Report> viewCrimeRates() throws ClassNotFoundException, SQLException
	{
		ArrayList<Report> list=new ArrayList<Report>();
		
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select RegionName,count(CrimeType) from Reports group by RegionName");
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			Report rp=new Report();
			rp.setRegion(rs.getString(1));
			rp.setId(rs.getInt(2));
			list.add(rp);
		}
		
		return list;
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
