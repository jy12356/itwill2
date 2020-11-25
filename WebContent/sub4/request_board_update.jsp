<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                    <table summary="게시판" class="onebyone">
                        <caption>희망도서 신청</caption>
                        <colgroup>
                        
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            	<tr>
									<th>도서명 <em><font color="red">(*)</font></em></th>
									<td><input id="booktitle" name="booktitle" type="text" value=""/></td>
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
									<td><input id="date" name="date" type="text" value="" maxlength="4"/></td>
								</tr>
								<tr>
									<th>ISBN</th>
									<td><input id="isbn" name="isbn" type="text" value="" maxlength="13"/></td>
								</tr>
								<tr>
									<th>가격</th>
									<td><input id="price" name="price" type="text" value="" maxlength="10"/></td>
								</tr>
								<tr>
									<th>첨부 내용 </th>
									<td><textarea rows="" cols="" name="content"></textarea>
                                </td>
								</tr>
								<tr>
									<th>파일첨부</th>
									<td>
										<div class="one-file">
											<p><input type="text" name="" value="" readonly="readonly" id="fileName" class="file_name"></p>
											<p class="file-btn">찾아보기<input type="file" name="file_name" value="찾아보기"></p>
										</div>
										<p class="one-s-ps">*2MB 이하의 이미지 파일 및 5MB  이하의 *hwp, *doc, *docx 확장자만 첨부 가능합니다.</p>
									</td>
								</tr>
                        </tbody>
                    </table>
                    <div class="default-btn-wrap">
						<input type="submit" name="" class="" value="신청">
                        <a href="request_board.jsp" class="btn">목록</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>