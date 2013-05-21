package App;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class AppDAO {
	
	private String userPhone;
	
	private static AppDAO dao = new AppDAO();
	//�ڱ��ڽ��� ȣ���Ѵ� (static�̹Ƿ� ���۽� �ѹ��� ����)
	
	// �ν��Ͻ��� �ϳ��� ��������ؼ� ������ private
	private AppDAO(){
		
	}
	
	public static AppDAO getAppDAO(){
		return dao;
	}
	
	private Connection gConnection(){
		Connection conn =null;

		try{
			InitialContext initCtx=new InitialContext();
			DataSource ds=(DataSource)initCtx.lookup("java:comp/env/jdbc/ii_javakings");
			conn= ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int HpchecktoDB(String hp){		// DB���� Hp ��ȣ�� �����Ͱ� Divclient ���� �ִ��� Ȯ��
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select Id, Pwd from Divclient where Id = ?";
		int check = 0;
		
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hp);
			rs = pstmt.executeQuery();
			
			if(rs.next()){	// �޾ƿ� hp�� Divclient�� �ִٴ� �Ҹ�
				if(rs.getString("Pwd") == null){		// �н����尡 �������� �ʾҴ� = ó������
					check = 1;
				}else{
					check = 2;
				}
			}
			System.out.println("������������");
		} catch (Exception e) {
			return -1;		// ������ ��� -1 ����
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		return check;		// Handphone��ȣ 
										// (0�� �� = DB�� ���� | 1�� �� = DB�� ������ ù���� | 2�� �� = DB�� ������ �н����嵵 ����)
	}
	
	public String getSomaelist(String hp){ 	// Allclient������ Hp ��ȣ�� �� Somae����Ʈ�� �޾ƿ´�
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT Somae FROM Allclient WHERE Hp = ?  group by Somae";
		String imsi = "";
		
			try {
				conn = gConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hp);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					imsi += rs.getString("Somae")+"|";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(SQLException ex){}
				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
				if(conn != null)try{conn.close();}catch(SQLException ex){}
			}
			
			return imsi;
	}

	public void setDivclient(String hp,String pw){		// ���� ���� Hp ��ȣ��  Divclient�� ���(Pw�� null��)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "Insert into Divclient values(?,?,?)";
		
		try {
			
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hp);
			pstmt.setString(2, pw);
			pstmt.setString(3, "client");
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	
	public void setDivclient_pwd(String hp,String pw){		// ���� ���� Hp ��ȣ��  Divclient�� ���(Pw�� null��)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Divclient set Pwd = ? where Id = ?";
		
		try {
			
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, hp);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
	}

	public String getSomaeUser(String hp,String somae){		// ���� somae���� hp�� ���� �޾ƿ�
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select Cnt,Hanjan from "+somae+" where Phone = '"+hp+"'";
		String imsi = "";
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				imsi =  Integer.toString(rs.getInt("Cnt")+(rs.getInt("Hanjan")*10));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		return imsi;
		
		
	}
}
