<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 책등록</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">책등록</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
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
                                <td colspan="3">
                                	<input type="text" name="title">
                                </td>
                            </tr>
                            <style>
								.categ2 select{display: none;}
								.categ2 select.on{display: block;}
							</style>
                            <tr>
                            	<td class="th">대분류</td>
                            	<td class="categ1">
                            		<select>
                            			<option value="cateDef">선택해주세요.</option>
                            			<option value="novel">소설</option>
                            			<option value="he">인문/경제</option>
                            			<option value="si">과학/IT</option>
                            			<option value="hby">취미</option>
                            			<option value="cwn">만화/웹소설</option>
                            		</select>
                            	</td>
                            	<td class="th">소분류</td>
                            	<td class="categ2">
                            		<select id="cateDef" class="on"> 
                            			<option>선택해주세요.</option>
                            		</select>
                            		<select id="novel"> 
                            			<option>소설</option>
                            			<option>에세이</option>
                            			<option>여행</option>
                            			<option>시</option>
                            		</select>
                            		<select id="he"> 
                            			<option>자기개발</option>
                            			<option>경영</option>
                            			<option>경제</option>
                            			<option>마케팅</option>
                            			<option>역사</option>
                            			<option>철학</option>
                            			<option>종교</option>
                            			<option>정치</option>
                            			<option>예술</option>
                            			<option>인문</option>
                            		</select>
                            		<select id="si"> 
                            			<option>수학</option>
                            			<option>과학</option>
                            			<option>IT비즈니스</option>
                            			<option>자격증</option>
                            			<option>프로그래밍</option>
                            		</select>
                            		<select id="hby"> 
                            			<option>건강</option>
                            			<option>요리</option>
                            			<option>스포츠</option>
                            			<option>결혼/임신/출산</option>
                            			<option>기타</option>
                            		</select>
                            		<select id="cwn"> 
                            			<option>만화</option>
                            			<option>웹소설</option>
                            		</select>
                            	</td>
                            </tr>
                            <tr>
                            	<td class="th">저자</td>
                            	<td><input type="text" name="author"></td>
                            	<td class="th">출판사</td>
                            	<td><input type="text" name="publisher"></td>
                            </tr>
                            <tr>
                            	<td class="th">ISBN번호</td>
                            	<td><input type="text" name="isbn"></td>
                            	<td class="th">출판날짜</td>
                            	<td><input type="text" id="pubDatePicker" name="pubdate"></td>
                            </tr>
                            <tr>
                                <td class="th">요약내용</td>
                                <td colspan="3">
                                    <textarea rows="" cols="" name="desc">
                                    </textarea>
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
	                    $(function() {
	                        $( "#pubDatePicker" ).datepicker({});
	                        
	                        $(".categ1 select").on("change",function(){
	                        	var val = this.value;
	                        	$(".categ2 select").removeClass("on");
	                        	$("#"+val).addClass("on");	                        	
	                        });
	                    });
	                    
	                    
                    
                    </script>
                    <div class="default-btn-wrap">
                   	    <a href="board.jsp" class="btn">작성</a>
                        <a href="board.jsp" class="btn">다시쓰기</a>
                        <a href="board.jsp" class="btn">목록</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>

<jsp:include page="../include/footer.jsp"/>