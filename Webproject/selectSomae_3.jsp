<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
                    <%
    request.setCharacterEncoding("euc-kr");
                    if(session.getAttribute("kind") == null){
                        response.sendRedirect("../index.jsp");
                   }else if(!session.getAttribute("kind").equals("somae")){
                            response.sendRedirect("/admin/admin.jsp");
                     }
    %>
    <jsp:useBean id="lookat" class="project.SomaeDBLook"/>
    <jsp:setProperty property="*" name="lookat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Է�Ȯ��</title>
</head>
	<%
	int a =lookat.dbcheck((String)session.getAttribute("id"));
	StringTokenizer st = null;
	out.println("�� ������ ���� : "+a);
	%>
<body>
<center>
<table>
<tr>
	<td>
	�����
	</td>
	<td>
	���� ��ȭ
	</td>
	<td>
	���� ���(10��)
	</td>
	<td>
	����
	</td>
	<td>
	�ð�
	</td>
</tr>
<%
for(int i=0; i<a; i++){
	st = new StringTokenizer(lookat.getImsi().get(i),"|");
	String phone = st.nextToken();
	if(phone.length()>7){
		phone = phone.substring(0,3)+"****"+phone.substring(7);
	}
	%>
<tr>
	<td><%=phone %>
	</td>
	<td><%=st.nextToken() %>��
	</td>
	<td><%=st.nextToken() %>�� ���
	</td>
	<td><%=st.nextToken() %>��
	</td>
	<td><%=st.nextToken() %>
	</td>
</tr>
<%} %>
</table>
<input type="button" onclick="location.href='selectSomae_1.jsp'" value="�ٸ��˻�">
<input type="button" onclick="location.href='../index.jsp'" value="�ʱ�ȭ������">
</center>
</body>
</html>