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
            <h3 class="subTit">책등록</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<div class="bookregiSearch-inner">
	                	<div class="bookregiSearch">
	          				<input type="text" name="searchString"  placeholder="검색어를 입력하세요" class="search_input" style="ime-mode:active;">
							<input type="button" onclick="bookSearchSubmit()">
	                	</div>
                	</div>
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
                                	<input type="text" name="subject">
                                </td>
                            </tr>
                            <tr>
                            	<td class="th">대분류</td>
                            	<td class="categ1 td">
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
                            	<td class="categ2 td">
                            		<select id="cateDef" class="on"> 
                            			<option value="def">선택해주세요.</option>
                            		</select>
                            		<select id="novel"> 
                            			<option value="nov">소설</option>
                            			<option value="es">에세이</option>
                            			<option value="tr">여행</option>
                            			<option value="po">시</option>
                            		</select>
                            		<select id="he"> 
                            			<option value="self">자기개발</option>
                            			<option value="oper">경영</option>
                            			<option value="eco">경제</option>
                            			<option value="mak">마케팅</option>
                            			<option value="his">역사</option>
                            			<option value="phil">철학</option>
                            			<option value="reli">종교</option>
                            			<option value="poli">정치</option>
                            			<option value="art">예술</option>
                            			<option value="hu">인문</option>
                            		</select>
                            		<select id="si"> 
                            			<option value="ma">수학</option>
                            			<option value="sci">과학</option>
                            			<option value="it">IT비즈니스</option>
                            			<option value="certi">자격증</option>
                            			<option value="prog">프로그래밍</option>
                            		</select>
                            		<select id="hby"> 
                            			<option value="hel">건강</option>
                            			<option value="cook">요리</option>
                            			<option value="sport">스포츠</option>
                            			<option value="mer">결혼/임신/출산</option>
                            			<option value="ect">기타</option>
                            		</select>
                            		<select id="cwn"> 
                            			<option value="ct">만화</option>
                            			<option value="weno">웹소설</option>
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
                            	<td class="th">ISBN번호</td>
                            	<td class="td"><input type="text" name="isbn"></td>
                            	<td class="th">출판날짜</td>
                            	<td class="td"><input type="text" id="pubDatePicker" name="pubdate"></td>
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