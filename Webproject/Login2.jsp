<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("euc-kr");
    %>
    <jsp:useBean id="check" class="project.CheckID" scope="page"/>
    <jsp:setProperty property="*" name="check"/>
    <%

    Class.forName("com.mysql.jdbc.Driver");
    
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
    
	try{
		String jdbcDriver = "jdbc:mysql://localhost/ii_javakings?"+"useUnicode=true&characterEncoding=euckr";
		String dbUser = "ii_javakings";
		String dbPass = "jang8410";
		String query= "SELECT * from Divclient where id = '"+check.getId()+"'";
		//"SELECT * from MEMBER order by id";//
		
		//2. �����ͺ��̽� Ŀ�ؼ� ����
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//3. statement ����
		stmt = conn.createStatement();
		//4. ��������
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
				if(rs.getString("pwd")==null){
					%><script type="text/javascript">alert("��<%=check.getId()%>���� ��й�ȣ�� �ʿ��մϴ�\n ��й�ȣ�� ������ �����ż� �������ּ���");
					history.back();</script>
					<%
				}
			if(rs.getString("pwd").equals(check.getPw())){
		    	session.setAttribute("id", check.getId());   
		    	session.setAttribute("kind", rs.getString("Kind"));
				%><script type="text/javascript">alert("��<%=check.getId()%>���� �α��� �մϴ�");</script>
				<%
				response.sendRedirect("index.jsp");
			}else{
				%><script type="text/javascript">alert("��й�ȣ�� �ùٸ��� �ʽ��ϴ�");
				history.back();</script>
				<%
			}
		}else{
			%><script type="text/javascript">alert("�������� �ʴ� ID�Դϴ�.");
			history.back();</script>
			<%
		}
		
	}catch(Exception e){
	}finally{
		if(rs != null)try{rs.close();}catch(SQLException ex){}
		if(stmt != null)try{stmt.close();}catch(SQLException ex){}
		if(conn != null)try{conn.close();}catch(SQLException ex){}
	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>
<script type="text/javascript"></script>
<body>

</body>
</html>