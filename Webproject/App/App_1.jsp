<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="App.*" %>
    <%	response.setCharacterEncoding("EUC-KR");
    		String hp = request.getParameter("userPhone");
    		String pwd = request.getParameter("Pwd");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޾ƿ� �ڵ��� ��ȣ�� üũ�ϴ� ��...</title>
</head>
<body>
<input type="hidden" value="<%=hp%>" name="handphone">

	<%
	AppDAO dao = AppDAO.getAppDAO();

	if(pwd != null){
		dao.setDivclient_pwd(hp, pwd);
	}
	if(hp != null){
	int check = dao.HpchecktoDB(hp);
	
		if(check == 0){		// �ڵ��� ��ȣ�� DB�� ���� ���
			dao.setDivclient(hp,pwd);		// ��й�ȣ�� �翬�� null��
			request.setAttribute("imsi", "0");
			%>
			<jsp:forward page="somae_list.jsp"/>
			<%
		}else if(check == 1){	// �ڵ��� ��ȣ�� DB�� �ִµ� ù����(Pwd�� ���� null�� ���)
			request.setAttribute("imsi", "0");
			%>
			<jsp:forward page="somae_list.jsp"/>
			<%
		}else if(check == 2){	// �ڵ��� ��ȣ�� DB�� �����鼭 Pwd�� null�� �ƴ� ��� (����Ʈ �Ѹ��� �������� �̵�)
			request.setAttribute("imsi", "1");
			%>
			<jsp:forward page="somae_list.jsp"/>
			<%
		}else{		// -1 = �����߻�
			
		}
	}

	%>


</body>
</html>