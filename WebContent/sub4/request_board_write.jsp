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
                    <table summary="게시판" class="onebyone">
                        <caption>희망도서 신청</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            	<tr>
									<th>도서명 <em><font color="red">(*)</font></em></th>
									<td><input type="text" name="subject" id="booktitle" required="required"></td>
								</tr>
								<tr>
									<th>저자 <em><font color="red">(*)</font></em></th>
									<td><input id="author" name="author" type="text" value=""/></td>
								</tr>
								<tr>
									<th>출판사 <em><font color="red">(*)</font></em></th>
									<td><input id="publisher" name="publisher" type="text" value=""/></td>
								</tr>
								<tr>
									<th>출판년도 <em><font color="red">(*)</font></em></th>
									<td><input type="text" name="pubdate" type="text"></td>
								</tr>
								<tr>
									<th>ISBN</th>
									<td><input id="isbn" name="isbn" type="text" maxlength="13"/></td>
								</tr>
								<tr>
									<th>첨부 내용 </th>
									<td><textarea name="content" required="required"></textarea>
                                </td>
								</tr>
								<tr>
									<th>파일첨부</th>
									<td>
										<input type="file" name="file">
										<p class="one-s-ps">*2MB 이하의 이미지 파일 및 5MB  이하의 *hwp, *doc, *docx 확장자만 첨부 가능합니다.</p>
									</td>
								</tr>
                        </tbody>
                    </table>
                    <div class="default-btn-wrap">
						<input type="submit" class="btn" value="신청">
						<a href="requestList.rq" class="btn">목록</a>
					</div>
					</form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>