package raid.sql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Sql {
	Connection conn=null;
	String TEAM="data";
	String MEMBER=TEAM+"_member";
	String WORKS=TEAM+"_works";
	String M_WORKS=TEAM+"_monthly_works";
	public Sql(Connection conn)	{	this.conn=conn;	}
	public void connectionClose()
	{
		try	{	conn.close();	}
		catch(Exception e)	{	e.printStackTrace();	}
	}
	public ResultSet statusAll()
	{
		ResultSet rs = null;
		PreparedStatement pstmt=null;
		try {

			String query="select recipename, "
					+ "member1 as m1_name, fn_memberjob(member1) as m1_job, fn_memberjobtype(member1) as m1_type, fn_membersynergy(member1) as m1_synergy ,"
					+ "member2 as m2_name, fn_memberjob(member2) as m2_job, fn_memberjobtype(member2) as m2_type, fn_membersynergy(member2) as m2_synergy ,"
					+ "member3 as m3_name, fn_memberjob(member3) as m3_job, fn_memberjobtype(member3) as m3_type, fn_membersynergy(member3) as m3_synergy ,"
					+ "member4 as m4_name, fn_memberjob(member4) as m4_job, fn_memberjobtype(member4) as m4_type, fn_membersynergy(member4) as m4_synergy "
					+ "from public.raidstatusboard rsb join raidrecipe rr on (rsb.recipeid=rr.recipeid)" ;
			pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

			rs = pstmt.executeQuery();
		}
		catch (Exception e)
		{	
			e.printStackTrace();
		}
		finally{}
		
		return rs;
	}
}
