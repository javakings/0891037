<%@page import="board.Board_DAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%request.setCharacterEncoding("euc-kr");   
        String kind = (String)session.getAttribute("kind");
        if(kind == null){
        	response.sendRedirect("../index.jsp");
        }
        if(!kind.equals("somae")){  
        	response.sendRedirect("../index.jsp");
        }
        String writer=(String)session.getAttribute("id");
        
        %>
	<jsp:useBean id="board" class="board.Board_DTO"/>
	<jsp:setProperty property="*" name="board"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <%
 if(writer==null){
   		  %>
   	<script type="text/javascript">
		alert("�α����� ���ֽñ� �ٶ��ϴ�.");
		location.replace("http://poncoo.com");
	</script>
   		  <%
   	  }
 %>
<title>�Խ��� ����</title>
</head>
<body>
<%
ArrayList<Integer> arr = new ArrayList<Integer>();
Board_DAO dao = Board_DAO.getBoard_DAO();

if(board.getType()!=null){
	for(int i = 0; i<board.getType().length; i++){
		arr.add(i, Integer.parseInt(board.getType()[i]));
	}
	
	int imsi = dao.delBoard(arr);
	
	if(imsi>0){
		%>
		<script type="text/javascript">
		alert("���� ���� �Ϸ� (<%=board.getType().length%>��)")
		location.replace("/couboard/board_1.jsp");
		</script>
		<%
	}
	
}else{
	%>
	<script type="text/javascript">
	alert("������ üũ�ڽ��� �����ϴ�...")
	history.back();
	</script>
	<%
}

%>
</body>
</html>