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
                		<input type="hidden" value="<%=nowPage%>" name="page" >
                		<input type="hidden" value="<%=title%>" name="title1">
                		<input type="hidden" value="<%=isbn%>" name="isbn1">
                		<div class="one-ps pb10">
                			<p>
								* 항목은 필수 입력 항목입니다.
							</p>
						</div>
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
	                                <td class="th"><span class="point">*</span>책제목</td>
	                                <td colspan="3" class="td">
	                                	<input type="text" name="title" value="<%=bookBean.getTitle()%>"  required="required">
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>대분류</td>
	                            	<td class="categ1 td">
	                            		<select name="catg1"  required="required">
	                            			<option value="" data-tab="cateDef" <%if(catg1.equals("")){ %>selected<%}%>>선택해주세요.</option>
	                            			<option value="소설" data-tab="novel" <%if(catg1.equals("소설")){ %>selected<%}%>>소설</option>
	                            			<option value="인문/경제" data-tab="he" <%if(catg1.equals("인문/경제")){ %>selected<%}%>>인문/경제</option>
	                            			<option value="과학/IT" data-tab="si" <%if(catg1.equals("과학/IT")){ %>selected<%}%>>과학/IT</option>
	                            			<option value="취미" data-tab="hby" <%if(catg1.equals("취미")){ %>selected<%}%>>취미</option>
	                            			<option value="만화/웹소설" data-tab="cwn" <%if(catg1.equals("만화/웹소설")){ %>selected<%}%>>만화/웹소설</option>
	                            		</select>
	                            	</td>
	                            	<td class="th"><span class="point">*</span>소분류</td>
	                            	<td class="categ2 td">
	                            		<select id="cateDef" class="catg2" name="catg2"> 
	                            			<option value="def" <%if(catg1.equals("")){ %>selected<%}%>>선택해주세요.</option>
	                            		</select>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>저자</td>
	                            	<td class="td"><input type="text" name="author" value="<%=bookBean.getAuthor()%>"  required="required"></td>
	                            	<td class="th"><span class="point">*</span>출판사</td>
	                            	<td class="td"><input type="text" name="publisher" value="<%=bookBean.getPublisher()%>" required="required"></td>
	                            </tr>
	                            <tr>
	                            	<td class="th">저자 정보</td>
	                            	<td class="td" colspan="3">
	                            	 	<textarea rows="" cols="" name="author_info"><%=bookBean.getAuthor_info()%></textarea>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>ISBN번호</td>
	                            	<td class="td"><input type="text" name="isbn" value="<%=bookBean.getIsbn()%>" required="required"></td>
	                            	<td class="th"><span class="point">*</span>출판날짜</td>
	                            	<td class="td cal"><input type="text" id="pubDatePicker" name="pubdate" value="<%=bookBean.getPubdate()%>" required="required"></td>
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
	                                    <textarea rows="" cols="" name="description" ><%=bookBean.getDescription()%></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>이미지 파일</td>
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
<script type="text/javascript">
$(document).ready( function() {
    $( "#pubDatePicker" ).datepicker({});
    var seledcatg1 =$(".categ1 select > option:selected").val();
    var sel1 = ['소설','에세이','여행','시'];
	var sel2 = ['자기개발','경영','경제','마케팅','역사','철학','종교','정치','예술','인문'];
	var sel3 = ['수학','과학','IT비즈니스','자격증','프로그래밍'];
	var sel4 = ['건강','요리','스포츠','결혼/임신/출산','기타'];
	var sel5 = ['만화','웹소설'];
	var catg2 = '<%=catg2%>';
    if(seledcatg1 == "소설"){
		$.each(sel1,function(i,item){
			if(catg2 == item){
				$('.catg2').append('<option class="smcatg" value="'+item+'" selected>'+item+'</option>')			
			}else{
				$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')		
			}
		});
	}else if(seledcatg1 == "인문/경제"){
		$.each(sel2,function(i,item){
			if(catg2 == item){
				$('.catg2').append('<option class="smcatg" value="'+item+'" selected>'+item+'</option>')			
			}else{
				$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')		
			}
		});
	}else if(seledcatg1 == "과학/IT"){
		$.each(sel3,function(i,item){
			if(catg2 == item){
				$('.catg2').append('<option class="smcatg" value="'+item+'" selected>'+item+'</option>')			
			}else{
				$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')		
			}
		});
	}else if(seledcatg1 == "취미"){
		$.each(sel4,function(i,item){
			if(catg2 == item){
				$('.catg2').append('<option class="smcatg" value="'+item+'" selected>'+item+'</option>')			
			}else{
				$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')		
			}
		});
	}else if(seledcatg1 == "만화/웹소설"){
		$.each(sel5,function(i,item){
			if(catg2 == item){
				$('.catg2').append('<option class="smcatg" value="'+item+'" selected>'+item+'</option>')			
			}else{
				$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')		
			}
		});
	}
    
    $(".categ1 select").on("change",function(){
    	var catval = $(this).val();
    	
    	$('.smcatg').remove();
    	if(catval == "소설"){
    		$.each(sel1,function(i,item){
    			$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "인문/경제"){
    		$.each(sel2,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "과학/IT"){
    		$.each(sel3,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "취미"){
    		$.each(sel4,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "만화/웹소설"){
    		$.each(sel5,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}
   	})
    
});
</script>

<jsp:include page="../include/footer.jsp"/>