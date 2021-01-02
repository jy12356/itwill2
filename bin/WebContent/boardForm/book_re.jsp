<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 게시판</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">게시판</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="게시판" class="customer-notice">
                        <caption>게시판</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>책제목</td>
                                <td>
                                	<input type="text" name="title">
                                </td>
                            </tr>
                            <tr>
                                <td>등록일</td>
                                <td>
									
								</td>
                            </tr>
                            <tr>
                            	<td>
                            		<select>
                            			<option>소설</option>
                            			<option>인문/경제</option>
                            			<option>과학/IT</option>
                            			<option>취미</option>
                            			<option>만화/웹소설</option>
                            		</select>
                            	</td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea rows="" cols="" name="desc">
                                    </textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="default-btn-wrap">
                        <a href="board.jsp" class="btn">목록</a>
                        <a href="/customer.asp?page=notice&page2=view&num=112679&pageNum=1" class="btn">다음</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>