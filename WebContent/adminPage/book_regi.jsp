<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
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
			    url: "/API/NaverBookApiTest.java", // 클라이언트가 요청을 보낼 서버의 URL 주소
			    data: { keyword: "홍길동" },                // HTTP 요청과 함께 서버로 보낼 데이터
			    type: "GET",                             // HTTP 요청 방식(GET, POST)
			    dataType: "json"                         // 서버에서 보내줄 데이터의 타
			}).done(function(html) {
				result = html;
			    for(var i=0; i< result; i++){
			    	alert(result[i]);
			    }
			}).fail(function(xhr, status, errorThrown) {
			    $("#text").html("오류가 발생했습니다.<br>")
			    .append("오류명: " + errorThrown + "<br>")
			    .append("상태: " + status);
			})
			
		}
    </script>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="subTit">책등록</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<div class="bookregiSearch-inner">
	                	<div class="bookregiSearch">
	          				<input type="text" name="searchString"  placeholder="검색어를 입력하세요" id="search_input" class="search_input" style="ime-mode:active;">
							<input type="button" onclick="bookSearchSubmit()">
	                	</div>
	                	<div class="serachBookResult">
	                		<table summary="책검색결과" class="customer-table notice">
		                        <caption>게시판</caption>
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
                	<form action="BookWritePro.bok" method="post" name="bookRegForm" enctype="multipart/form-data">
	                    <table summary="책등록" class="customer-notice">
	                        <caption>책등록</caption>
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
	                                	<input type="text" name="title">
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th">대분류</td>
	                            	<td class="categ1 td">
	                            		<select name="catg1">
	                            			<option value="" data-tab="cateDef">선택해주세요.</option>
	                            			<option value="소설" data-tab="novel">소설</option>
	                            			<option value="인문/경제" data-tab="he">인문/경제</option>
	                            			<option value="과학/IT" data-tab="si">과학/IT</option>
	                            			<option value="취미" data-tab="hby">취미</option>
	                            			<option value="만화/웹소설" data-tab="cwn">만화/웹소설</option>
	                            		</select>
	                            	</td>
	                            	<td class="th">소분류</td>
	                            	<td class="categ2 td">
	                            		<select id="cateDef" class="on" name="catg2"> 
	                            			<option value="def">선택해주세요.</option>
	                            		</select>
	                            		<select id="novel" name="catg2"> 
	                            			<option value="소설">소설</option>
	                            			<option value="에세이">에세이</option>
	                            			<option value="여행">여행</option>
	                            			<option value="시">시</option>
	                            		</select>
	                            		<select id="he" name="catg2"> 
	                            			<option value="자기개발">자기개발</option>
	                            			<option value="경영">경영</option>
	                            			<option value="경제">경제</option>
	                            			<option value="마케팅">마케팅</option>
	                            			<option value="역사">역사</option>
	                            			<option value="철학">철학</option>
	                            			<option value="종교">종교</option>
	                            			<option value="정치">정치</option>
	                            			<option value="예술">예술</option>
	                            			<option value="인문">인문</option>
	                            		</select>
	                            		<select id="si" name="catg2"> 
	                            			<option value="수학">수학</option>
	                            			<option value="과학">과학</option>
	                            			<option value="비즈니스">IT비즈니스</option>
	                            			<option value="자격증">자격증</option>
	                            			<option value="프로그래밍">프로그래밍</option>
	                            		</select>
	                            		<select id="hby" name="catg2"> 
	                            			<option value="건강">건강</option>
	                            			<option value="요리">요리</option>
	                            			<option value="스포츠">스포츠</option>
	                            			<option value="결혼/임신/출산">결혼/임신/출산</option>
	                            			<option value="기타">기타</option>
	                            		</select>
	                            		<select id="cwn" name="catg2"> 
	                            			<option value="만화">만화</option>
	                            			<option value="웹소설">웹소설</option>
	                            		</select>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th">저자</td>
	                            	<td class="td"><input type="text" name="author"></td>
	                            	<td class="th">출판사</td>
	                            	<td class="td"><input type="text" name="publisher"></td>
	                            </tr>
	                            <tr>
	                            	<td class="th">저자 정보</td>
	                            	<td class="td" colspan="3">
	                            	 	<textarea rows="" cols="" name="author_info"></textarea>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th">ISBN번호</td>
	                            	<td class="td"><input type="text" name="isbn"></td>
	                            	<td class="th">출판날짜</td>
	                            	<td class="td"><input type="text" id="pubDatePicker" name="pubdate"></td>
	                            </tr>
	                            <tr>
	                                <td class="th">목차</td>
	                                <td colspan="3">
	                                    <textarea rows="" cols="" name="index"></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="th">요약내용</td>
	                                <td colspan="3">
	                                    <textarea rows="" cols="" name="description"></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th">이미지 파일</td>
	                            	<td colspan="3">
	                            		<input type="file" name="image">
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    
	                    <script type="text/javascript">
                    		$(document).ready( function() {
		                        $( "#pubDatePicker" ).datepicker({});
		                        
		                        $(".categ1 select").on("change",function(){
		                        	var val = $(".categ1 select option:selected").attr('data-tab');
		                        	$(".categ2 select").removeClass("on");
		                        	$(".categ2 #"+val).addClass("on");
		                        	
		                        });
		                        
		                        
		                    });
	                    </script>
	                    <div class="default-btn-wrap">
	                   	    <input type="submit" class="btn" value="작성">
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