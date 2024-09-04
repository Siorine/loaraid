package raid.data;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.naming.NamingException;

import raid.sql.DBConnection;
import raid.sql.Sql;
import raid.vo.RaidStatusBoard;

public class Raid {
	static Connection conn = null;
	Sql sql;
	ArrayList<RaidStatusBoard> rsb_list = new ArrayList<RaidStatusBoard>();
	
	public Raid()
	{
		
	}
	public void setRaidStatus() 
	{
		ResultSet rs = sql.statusAll();
		try
		{
			while(rs.next())
			{
				RaidStatusBoard item = new RaidStatusBoard(rs.getString("recipename"),
						rs.getString("m1_name"),rs.getString("m1_job"),rs.getString("m1_type"),rs.getString("m1_synergy"),
						rs.getString("m2_name"),rs.getString("m2_job"),rs.getString("m2_type"),rs.getString("m2_synergy"),
						rs.getString("m3_name"),rs.getString("m3_job"),rs.getString("m3_type"),rs.getString("m3_synergy"),
						rs.getString("m4_name"),rs.getString("m4_job"),rs.getString("m4_type"),rs.getString("m4_synergy")
						);
				rsb_list.add(item);
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	public ArrayList<RaidStatusBoard> getRaidStatus() 
	{
		return rsb_list;
	}
	
	public void connClose()
	{
		try
		{
			sql.connectionClose();
			conn.close();
		}catch (Exception e) {}
	}
	public void connOpen()
	{
		try {
			conn = DBConnection.getConnection();
			sql = new Sql(conn);
		} 
		catch (ClassNotFoundException e) {	e.printStackTrace();	} 
		catch (SQLException e) {		e.printStackTrace();	} 
		catch (NamingException e) {		e.printStackTrace();	}
	}
}
