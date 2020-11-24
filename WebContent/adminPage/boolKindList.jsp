<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BookBean"%>
<%@page import="java.util.ArrayList"%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	ArrayList<BookBean> bookList = (ArrayList<BookBean>)request.getAttribute("bookList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
%>    
<section class="sub">
   
     <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">책 리스트 보기</h3>
            
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="책 리스트 보기" class="customer-table notice">
                        <caption>책 리스트 보기</caption>
                        <colgroup>
                            <col style="width:5%">
                            <col style="width:25%">
                            <col style="width:20%">
                            <col style="width:20%">
                            <col style="width:15%">
                            <col style="width:15%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" abbr="책번호"></th>
                                <th scope="col" abbr="등록일">제목</th>
                                <th scope="col" abbr="등록일">작가</th>
                                <th scope="col" abbr="등록일">isbn</th>
                                <th scope="col" abbr="등록일">출판사</th>
                                <th scope="col" abbr="등록일">출간일</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for(int i=0; i < bookList.size(); i++ ){ %>
                            <tr>
                                <td class="tac"><input type="checkbox" id="checkbox_num" class="check_num" value="<%=bookList.get(i).getNum()%>" name="book_num"></td>
                                <td><%=bookList.get(i).getTitle()%></td>
                                <td><%=bookList.get(i).getAuthor()%></td>
                                <td><%=bookList.get(i).getIsbn()%></td>
                                <td><%=bookList.get(i).getPublisher()%></td>
                                <td><%=bookList.get(i).getPubdate()%></td>
                            </tr>
                        <%} %>
                        </tbody>
                    </table>
                    <div class="btn_inner"> 
                    	<a href="javascript:void(0);" onclick="deleteBook(); return false;"class="btn">삭제하기</a>
                    	<a href="javascript:void(0);" onclick="modifyBook(); return false;" class="btn">수정하기</a>
                    	<a href="BookList.bok?page=<%=nowPage%>" class="btn">목록보기</a>
                    </div>
                    
                    <div class="paging">
                  	<%if(nowPage <= 1) {%>
						<a href="BoardList.bok?page=1" class="arr" data-page-num="1">
							<img src="images/p-first.png"><span class="hide">처음페이지</span>
						</a>
                         		<a href="BoardList.bok?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="<%=nowPage - 1 %>">
							<img src="images/p-prev.png"><span class="hide">이전페이지</span>
						</a>
					<%}%>
					<%for(int i = startPage; i <= endPage; i++) { 
							if(i == nowPage) { %>
								<a href="BoardList.bok?page=<%=i %>" class="on fir" data-page-num="<%=i %>"><%=i %></a>
							<%} else { %>
								<a href="BoardList.bok?page=<%=i %>" class="" data-page-num="<%=i %>"><%=i %></a>
							<%} %>
					<%} %>
                   	<%if(nowPage >= maxPage) { %>
						<a href="BoardList.bok?page=<%=nowPage + 1 %>" class="arr next" data-page-num="<%=nowPage + 1 %>">
                        		<img src="images/p-next.png"><span class="hide">다음페이지</span>
                       	</a>
                       	<a href="BoardList.bok?page=<%=maxPage%>" class="arr"data-page-num="<%=maxPage%>">
                      		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                   		</a>
					<%}%>                                
                   </div>
                </div>
            </div>

        </div>
    </div>
	<script type="text/javascript">
// 		파라미터 들고오기
		function Request(){
	   	 var requestParam ="";
	   	 //getParameter 펑션
	   	  this.getParameter = function(param){
	   	  //현재 주소를 decoding
	   	  var url = unescape(location.href);
	   	  //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다.
	   	   var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&");
	   	   for(var i = 0 ; i < paramArr.length ; i++){
	   	     var temp = paramArr[i].split("="); //파라미터 변수명을 담음
	   	 
	   	     if(temp[0].toUpperCase() == param.toUpperCase()){
	   	       // 변수명과 일치할 경우 데이터 삽입
	   	       requestParam = paramArr[i].split("=")[1];
	   	       break;
	   	     }
	   	   }
	   	   return requestParam;
	   	 }
	   	}
		//다중 체크 안되게 방지
		$(function() { 
			$(".check_num").bind('click',function() {
		 		$(".check_num").not(this).prop("checked", false);
		 	})
	    }); 
		//삭제
	   	function deleteBook(){
	   		if(confirm("삭제하시겠습니까?")){
	   		    var requestParam = new Request();
	   		 	var title = requestParam.getParameter("title");
	   		 	var isbn = requestParam.getParameter("isbn");
	   			var checked_seq = "";
	   		  	var check_count = document.getElementsByName("book_num").length;
	   		 	for (var i=0; i<check_count; i++) {
		   			if (document.getElementsByName("book_num")[i].checked == true) {
		                checked_seq = document.getElementsByName("book_num")[i].value;
		            }else{
	                	alert("게시물을 선택해주시길 바랍니다.");
	                	return false;	            	
		            }
	   		 	}
				location.href="BookDeletePro.bok?book_num="+checked_seq+"&title="+title+"&isbn="+isbn;
				return true;
       	    } else {
       	    	alert("삭제에 실패하였습니다.");
       	        return false;
       	    }
	    };
	    //수정
	   	function modifyBook(){
	   		if(confirm("수정하시겠습니까?")){
	   			var checked_seq = "";
	   		  	var check_count = document.getElementsByName("book_num").length;
	   		 	for (var i=0; i<check_count; i++) {
		   			if (document.getElementsByName("book_num")[i].checked == true) {
		                checked_seq = document.getElementsByName("book_num")[i].value;
		            }else{
	                	alert("게시물을 선택해주시길 바랍니다.");
	                	return false;	            	
		            }
	   		 	}
				location.href="BookModify.bok?book_num="+checked_seq;
				return true;
       	    } else {
       	    	alert("수정에 실패하였습니다.")
       	        return false;
       	    }
	    };
	    
	    	
	   	 
	                    	                    	
                    	 
    </script>
</section>

<jsp:include page="../include/footer.jsp"/>