<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC 게시판</title>
<style>
	#passForm {
		width: 300px;
		margin: auto;
		border: 1px solid orange;
		text-align: center;
	}
	
	h2 {
		text-align: center;
	}
	
	table {
		width: 300px;
		margin: auto;
		text-align: center;
	}
	
</style>
</head>
<body>
	<h2>게시판 글 삭제</h2>
	<section id="passForm">
		<form action="RequestDeletePro.bo" name="deleteForm" method="post">
			<input type="hidden" name="num" value="<%=num %>" />
			<input type="hidden" name="page" value="<%=nowPage %>" />
			<table>
				<tr>
					<td colspan="2">
						<input type="submit" value="삭제">
						<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</section>
</body>
</html>





