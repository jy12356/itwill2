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
                	<form action="">
	                    <table summary="게시판" class="customer-notice">
	                        <caption>게시판</caption>
	                        <colgroup>
	                            <col width="15%">
	                            <col width="35%">
	                            <col width="15%">
	                            <col width="35%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <td>책제목</td>
	                                <td colspan="3">
	                                	<input type="text" name="title">
	                                </td>
	                            </tr>
	                            <tr>
	                            <tr>
	                            	<td>작성자</td>
	                            	<td>
	                            		<input type="text" name="id">
	                            	</td>
	                            	<td class="th">비밀번호</td>
	                            	<td>
	                            		<input type="text" name="pass">
	                            	</td>
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td colspan="3">
	                                    <textarea name="desc">
	                                    </textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>파일</td>
	                            	<td colspan="3">
	                            		<input type="file" name="file">
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    <div class="default-btn-wrap">
	                    	<input type="submit" class="btn" value="글쓰기">
	                        <a href="board.jsp" class="btn">목록</a>
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>