<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.*" %>
    <% Date a = new Date();%>
                    <%
    request.setCharacterEncoding("euc-kr");
                    
      if(session.getAttribute("kind") == null){
         response.sendRedirect("../index.jsp");
    }else if(!session.getAttribute("kind").equals("somae")){
             response.sendRedirect("/admin/admin.jsp");
      }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�˻� ���� ���� �޴�</title>

<script type="text/javascript">
function number(num){
	if(isNaN(num.value)){
		alert("���ڸ� �Է��ϼ���!");
		num.focus();
		num.value = "0";
	}
}
</script>
</head>
<body>
  <form action="selectSomae_3.jsp" method="post" name="checkhistory">
  <center>
<table>
<tr>	
	<td bgcolor="#828282" width="500px">
    	<h2 style="color:#FFF" align="center">
	����<input type="radio" name="longday"  checked="true"  value="today">
	�Ϸ���<input type="radio" name="longday"  value="oneday">
	��������<input type="radio" name="longday"  value="weekday">
	�Ѵ���<input type="radio" name="longday" value="monthday">
    	</h2>
	</td>
    <td>
	 	<h2 style="color:#FFF" align="center"> ~ </h2>
	</td>
    <td bgcolor="#828282" width="400px">
		<h2 style="color:#FFF" align="center"> ���� : <%=(1900+a.getYear())+"�� "+(1+a.getMonth())+"�� "+a.getDate()+"�� "%> ����</h2>
	</td>
</tr>
<tr>
	<td>
	</td>
	<td>
	
	</td>
	<td align="right">
    <input type="submit" style="font-size:36px;" value="��� ���� ��ȸ" >
	
	</td>
</tr>
</table>
</form>
<br><br>

  <form action="selectSomae_2.jsp" method="post" name="checkdb">
  
<table>
<tr>
	<td>
	</td>
	<td bgcolor="#828282" width="200px">
    	<h2 style="color:#FFF" align="center">
			���� ���� =
    	</h2>
	</td>
	<td bgcolor="#828282" width="300px">
    	<h2 style="color:#FFF" align="left">
	<input type="text" dir="rtl" name="cupmuch" onblur=number(this) style="width:40px; font-size:36px;" value="0">
	�̻�<input type="radio" name="cupmuch2" checked="true" value="up">
	����<input type="radio" name="cupmuch2" value="down">
    	</h2>
	</td>


	<td>
	</td>
	<td bgcolor="#828282" width="200px">
    	<h2 style="color:#FFF" align="center">
			/ ���� ���	= 
        </h2>
	</td>
	<td bgcolor="#828282" width="300px">
    	<h2 style="color:#FFF" align="left">
			��������<input type="radio" name="updown2" checked="true" value="asc">
			��������<input type="radio" name="updown2" value="desc">
        </h2>
	</td>
</tr>
<tr>
<td>
	</td>
	<td>
	</td>
	<td>
	</td>
	<td>
	</td>
	<td>
	</td>
	<td align="right">
	<input type="submit" style="font-size:36px;" value="����� �˻�" >
	</td>
</tr>
</table>
</center>
</form>
</body>
</html>