
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import = "java.sql.*" import="java.util.Date"%>
    <%   request.setCharacterEncoding("euc-kr");    %>
    <%@page import="somaerequest.SomaeDAO"%>
   <jsp:useBean id="Somae" class="somaerequest.SomaeDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="Somae"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��������</title>
</head>
<body>

	<script type="text/javascript">
	<%
	if(Somae.getId() == null){
		%>
		alert("ID�� �Է��ϼ���.");
		history.back();
		<%
	}else if(Somae.getName()==null){	// name �� �� if��
		%>
		alert("��ǥ�ڸ��� �Է��� �ּ���");
		history.back();
		<%
	}else if(Somae.getPasswd1()==null){
		%>
		alert("��й�ȣ�� �Է��� �ּ���.");
		history.back();
		<%
	}else if(!Somae.getPasswd1().equals(Somae.getPasswd2())){
		%>
		alert("��й�ȣ�� Ȯ��â�� �Է³����� �ٸ��ϴ�.");
		history.back();
		<%
	}else if(Somae.getPasswd1().length() <4 || Somae.getPasswd1().length() > 12){		// �н����� Ȯ�� â
		%>
		alert("PW�� ���´� 4~12�� �Դϴ�.");
		history.back();
		<%
	}else if(Somae.getJob_name()==null){
		%>
		alert("��ȣ�� �Է��ϼ���.");
		history.back();
		<%
	}else if(Somae.getJob_value()==null){
		%>
		alert("����� ��ȣ�� �Է��ϼ���.");
		history.back();
		<%
	}else if(Somae.getAcademy()==null){
		%>
		alert("���þ����� ������ �ּ���.");
		history.back();
		<%
	}else if(Somae.getTel1()==null|| Somae.getTel2()==null || Somae.getTel3()==null){
		%>
		alert("��ȭ��ȣ�� �Է��ϼ���.");
		history.back();
		<%
	}else if(Somae.getWhat()==null){
		%>
		alert("�ڵ��� ��ü�� �����ϼ���.");
		history.back();
		<%
	}else if(Somae.getPhone1()==null||Somae.getPhone2()==null||Somae.getPhone3()==null){
		%>
		alert("�ڵ��� ��ȣ�� �Է��ϼ���.");
		history.back();
		<%
	}else if(Somae.getEmail()==null){
		%>
		alert("�̸��� ID�� �Է��ϼ���.");
		history.back();
		<%
	}else if(Somae.getSite()==null||Somae.getEmail2()==null){
		%>
		alert("�ּҸ� ������ �ּ���.");
		history.back();
		<%
	}else if(Somae.getZip()==null){
		%>
		alert("��ư�� �����ż� �ּҸ� ã���ּ���.");
		history.back();
		<%
	}else if(Somae.getAddress()==null){
		%>
		alert("���ּҸ� �Է��� �ּ���.");
		history.back();
		<%
	}else{
		
		SomaeDAO dao = SomaeDAO.getSomaeDAO();
		
		int imsi = dao.setMEMBER_IMSI(Somae);
		
		if(imsi > 0){
			%>
			alert("ȸ������ ��û ���������� �Ǿ����ϴ�.");
			parent.location.href='../index.jsp'; 
			<%
		}else{
			%>
			alert("�Է½���");
			history.back();
			<%
		}
	}
		
	%>
	</script>
</body>
</html>