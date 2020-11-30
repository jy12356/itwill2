<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 희망도서 신청 목록 > 희망도서 신청</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">희망도서 신청</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<form action="RequestWritePro.rq" method="post"
                		enctype="multipart/form-data" name="request_board_write">
                    <table summary="게시판" class="customer-notice">
                        <caption>희망도서 신청</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="35%">
                            <col width="15%">
                            <col width="35%">
                        </colgroup>
                        <tbody>
                       		<tr>
								<td>도서명 <font color="red">(*)</font></td>
								<td colspan="3"><input type="text" name="subject" id="booktitle" required="required"></td>
							</tr>
							<tr>
								<td>저자 <font color="red">(*)</font></td>
								<td colspan="3"><input type="text" name="author" id="author" required="required"></td>
							</tr>
							<tr>
								<td>출판사 <font color="red">(*)</font></td>
								<td colspan="3"><input type="text" name="publisher" id="publisher" required="required"></td>
							</tr>
							<tr>
								<td>출판년도</td>
								<td colspan="3"><input type="text" id="pubdate" name="pubdate" required="required"></td>
							</tr>
							<tr>
								<td>첨부 내용</td>
								<td colspan="3"><textarea name="content" id="content" name="content"></textarea>
                                </td>
							</tr>
							<tr>
								<td>파일 첨부</td>	
								<td>
									<input type="file" name="file">
								</td>
							</tr>
                        </tbody>
                    </table>
                    <div class="btn_inner">
						<input type="submit" class="btn" value="신청">
						<input type="button" class="btn"  value="목록" onclick="location.href='RequestList.rq'">
					</div>
					</form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>