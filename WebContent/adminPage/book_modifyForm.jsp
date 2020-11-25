<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.BookBean"%>
<jsp:include page="../include/header.jsp"/>
<% 
	request.setCharacterEncoding("utf-8"); 
	BookBean bookBean=(BookBean)request.getAttribute("bookBean"); 
	String nowPage=request.getParameter("page"); 
	String catg1 = bookBean.getCatg1();
	String catg2 = bookBean.getCatg2();
	String title = request.getParameter("title");
	String isbn = request.getParameter("isbn");
%>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 책등록</p>
        </div>
    </div>
    <script type="text/javascript">
	    function bookSearchSubmit(){
			var keyword = $(".search_input").val();
			alert(keyword);
			$.ajax({
			    url: "BookRegiSerch.bok", // 클라이언트가 요청을 보낼 서버의 URL 주소
			    data: { keyword: "홍길동" },                // HTTP 요청과 함께 서버로 보낼 데이터
			    type: "GET",                             // HTTP 요청 방식(GET, POST)
			    dataType: "json"                         // 서버에서 보내줄 데이터의 타
			}).done(function(json) {
			    $("<h1>").text(json.title).appendTo("body");
			    $("<div class=\"content\">").html(json.html).appendTo("body");
			
			}).fail(function(xhr, status, errorThrown) {
			    $("#text").html("오류가 발생했습니다.<br>")
			    .append("오류명: " + errorThrown + "<br>")
			    .append("상태: " + status);
			})
			
		}
    </script>
    <script type="text/javascript">
  		$(document).ready( function() {
           $( "#pubDatePicker" ).datepicker({});
           if($(".categ1 select option:selected")){
           	var val = $(".categ1 select option:selected").attr('data-tab');
           	alert(val);
           	$(".categ2 select").removeClass("on");
           	$(".categ2 #"+val).addClass("on");	     
           }
           $(".categ1 select").on("change",function(){
           	var val = $(".categ1 select option:selected").attr('data-tab');
           	$(".categ2 select").removeClass("on");
           	$(".categ2 #"+val).addClass("on");	                        	
           });
       });
      </script>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="subTit">책정보수정</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<div class="bookregiSearch-inner">
	                	<div class="bookregiSearch mb10">
	          				<input type="text" name="searchString"  placeholder="검색어를 입력하세요" id="search_input" class="search_input" style="ime-mode:active;">
							<input type="button" onclick="bookSearchSubmit()">
	                	</div>
	                	<div class="serachBookResult mb10">
	                		<table summary="책정보수정" class="customer-table notice">
		                        <caption>책정보수정</caption>
		                        <colgroup>
		                            <col width="10%">
		                            <col width="30%">
		                            <col width="10%">
		                            <col width="20%">
		                            <col width="10%">
		                            
		                        </colgroup>
		                        <thead>
		                            <tr>
		                                <th scope="col"></th>
		                                <th scope="col">제목</th>
		                                <th scope="col">내용</th>
		                                <th scope="col">저자</th>
		                                <th scope="col">ISBN</th>
		                                <th scope="col">출판사</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td class="tac"><input type="checkbox" value=""></td>
		                                <td>2020/10/27</td>
		                                <td>2020/10/27</td>
		                                <td>2020/10/27</td>
		                                <td>2020/10/27</td>
		                                <td>2020/10/27</td>
		                            </tr>
		                        </tbody>
		                    </table>	
	                	</div>
                	</div>
                	<form action="BookModifyPro.bok" method="post" name="bookRegForm" enctype="multipart/form-data">
                		<input type="hidden" value="<%=nowPage%>" name="page">
                		<input type="hidden" value="<%=title%>" name="title1">
                		<input type="hidden" value="<%=isbn%>" name="isbn1">
	                    <table summary="책정보수정" class="customer-notice">
	                        <caption>책정보수정</caption>
	                        <colgroup>
	                            <col width="15%">
	                            <col width="35%">
	                            <col width="15%">
	                            <col width="35%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <td class="th">책제목</td>
	                                <td colspan="3" class="td">
	                                	<input type="text" name="title" value="<%=bookBean.getTitle()%>">
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th">대분류</td>
	                            	<td class="categ1 td">
	                            		<select name="catg1">
	                            			<option value="" data-tab="cateDef" <%if(catg1.equals("")){ %>selected<%}%>>선택해주세요.</option>
	                            			<option value="소설" data-tab="novel" <%if(catg1.equals("소설")){ %>selected<%}%>>소설</option>
	                            			<option value="인문/경제" data-tab="he" <%if(catg1.equals("인문/경제")){ %>selected<%}%>>인문/경제</option>
	                            			<option value="과학/IT" data-tab="si" <%if(catg1.equals("과학/IT")){ %>selected<%}%>>과학/IT</option>
	                            			<option value="취미" data-tab="hby" <%if(catg1.equals("취미")){ %>selected<%}%>>취미</option>
	                            			<option value="만화/웹소설" data-tab="cwn" <%if(catg1.equals("만화/웹소설")){ %>selected<%}%>>만화/웹소설</option>
	                            		</select>
	                            	</td>
	                            	<td class="th">소분류</td>
	                            	<td class="categ2 td">
	                            		<select id="cateDef" class="on" name="catg2"> 
	                            			<option value="def">선택해주세요.</option>
	                            		</select>
	                            		<select id="novel" name="catg2"> 
	                            			<option value="소설" <%if(catg2.equals("소설")){ %>selected<%}%>>소설</option>
	                            			<option value="에세이" <%if(catg2.equals("에세이")){ %>selected<%}%>>에세이</option>
	                            			<option value="여행" <%if(catg2.equals("여행")){ %>selected<%}%>>여행</option>
	                            			<option value="시" <%if(catg2.equals("시")){ %>selected<%}%>>시</option>
	                            		</select>
	                            		<select id="he" name="catg2"> 
	                            			<option value="자기개발" <%if(catg2.equals("자기개발")){ %>selected<%}%>>자기개발</option>
	                            			<option value="경영" <%if(catg2.equals("경영")){ %>selected<%}%>>경영</option>
	                            			<option value="경제" <%if(catg2.equals("경제")){ %>selected<%}%>>경제</option>
	                            			<option value="마케팅" <%if(catg2.equals("마케팅")){ %>selected<%}%>>마케팅</option>
	                            			<option value="역사" <%if(catg2.equals("역사")){ %>selected<%}%>>역사</option>
	                            			<option value="철학" <%if(catg2.equals("철학")){ %>selected<%}%>>철학</option>
	                            			<option value="종교" <%if(catg2.equals("종교")){ %>selected<%}%>>종교</option>
	                            			<option value="정치" <%if(catg2.equals("정치")){ %>selected<%}%>>정치</option>
	                            			<option value="예술" <%if(catg2.equals("예술")){ %>selected<%}%>>예술</option>
	                            			<option value="인문" <%if(catg2.equals("인문")){ %>selected<%}%>>인문</option>
	                            		</select>
	                            		<select id="si" name="catg2"> 
	                            			<option value="수학" <%if(catg2.equals("수학")){ %>selected<%}%>>수학</option>
	                            			<option value="과학" <%if(catg2.equals("과학")){ %>selected<%}%>>과학</option>
	                            			<option value="비즈니스" <%if(catg2.equals("비즈니스")){ %>selected<%}%>>IT비즈니스</option>
	                            			<option value="자격증" <%if(catg2.equals("자격증")){ %>selected<%}%>>자격증</option>
	                            			<option value="프로그래밍" <%if(catg2.equals("프로그래밍")){ %>selected<%}%>>프로그래밍</option>
	                            		</select>
	                            		<select id="hby" name="catg2"> 
	                            			<option value="건강" <%if(catg2.equals("건강")){ %>selected<%}%>>건강</option>
	                            			<option value="요리" <%if(catg2.equals("요리")){ %>selected<%}%>>요리</option>
	                            			<option value="스포츠" <%if(catg2.equals("스포츠")){ %>selected<%}%>>스포츠</option>
	                            			<option value="결혼/임신/출산" <%if(catg2.equals("결혼/임신/출산")%><%){ %>selected<%}%>>결혼/임신/출산</option>
	                            			<option value="기타" <%if(catg2.equals("기타")){ %>selected<%}%>>기타</option>
	                            		</select>
	                            		<select id="cwn" name="catg2"> 
	                            			<option value="만화" <%if(catg2.equals("만화")){ %>selected<%}%>>만화</option>
	                            			<option value="웹소설" <%if(catg2.equals("웹소설")){ %>selected<%}%>>웹소설</option>
	                            		</select>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th">저자</td>
	                            	<td class="td"><input type="text" name="author" value="<%=bookBean.getAuthor()%>"></td>
	                            	<td class="th">출판사</td>
	                            	<td class="td"><input type="text" name="publisher" value="<%=bookBean.getPublisher()%>"></td>
	                            </tr>
	                            <tr>
	                            	<td class="th">저자 정보</td>
	                            	<td class="td" colspan="3">
	                            	 	<textarea rows="" cols="" name="author_info"><%=bookBean.getAuthor_info()%></textarea>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th">ISBN번호</td>
	                            	<td class="td"><input type="text" name="isbn" value="<%=bookBean.getIsbn()%>"></td>
	                            	<td class="th">출판날짜</td>
	                            	<td class="td"><input type="text" id="pubDatePicker" name="pubdate" value="<%=bookBean.getPubdate()%>"></td>
	                            </tr>
	                            <tr>
	                                <td class="th">목차</td>
	                                <td colspan="3">
	                                    <textarea rows="" cols="" name="index"><%=bookBean.getIndex()%></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="th">요약내용</td>
	                                <td colspan="3">
	                                    <textarea rows="" cols="" name="description"><%=bookBean.getDescription()%></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th">이미지 파일</td>
	                            	<td colspan="3">
			                            <input type="hidden" name="oldimage" title="첨부파일1" value="<%=bookBean.getImage() %>">
	                            		<input type="file" name="image">
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    
	                    
	                    <div class="default-btn-wrap">
	                   	    <input type="submit" class="btn" value="수정">
	                        <a href="BookList.bok" class="btn">목록</a>
	                        <a href="board.jsp" class="btn">다시쓰기</a>
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>

<jsp:include page="../include/footer.jsp"/>