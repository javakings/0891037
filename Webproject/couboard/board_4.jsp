<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("EUC-KR"); 
   	  String writer=request.getParameter("shop");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="Jquery.js"></script>

<title>		Poncoo �Խ���	 </title>
</head>
<body>
	<%
	 
	SimpleDateFormat sdf = new SimpleDateFormat("MM�� dd��");
	Board_DAO dao = Board_DAO.getBoard_DAO();
	ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>(dao.getAppBoard(writer));
	
	if(arr.size()>0){

	%>
	<%
	for(Board_DTO dto : arr){
	%>
			<%=sdf.format(dto.getReg_date())%>
			<%=dto.getChoice() %>
			<%=dto.getTitle() %><br>
        	<%=dto.getContent() %><br>
	<%
		}
	}else{
		out.println("���� �Էµ� �����Ͱ� �����ϴ�");
	}
%>



</body>

</html>