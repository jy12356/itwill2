<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 글쓰기 폼
String id = (String) session.getAttribute("id"); // 아이디가져오기
if(id==null) { // 로긴안한상태면 로그인화면으로
	response.sendRedirect("MemberLoginForm.me");
}
NoticeBean article = (NoticeBean)request.getAttribute("article");
    String nowPage = request.getParameter("page");
%>

<jsp:include page="../include/header.jsp"/>

						<script>
                             $(function () {
                                 $(".one-select").on("click", function () {
                                     if ($(this).hasClass("on")) {
                                         $(this).removeClass("on");
                                         $(this).next().hide();
                                     } else {
                                         $(this).addClass("on");
                                         $(this).next().show();
                                     }
                                 });
                                 $(document).on("click", ".one-list li", function () {
                                     var text = $(this).text();
                                     $(this)
                                         .parent()
                                         .prev()
                                         .text(text)
                                         .removeClass("on");
                                     $(this).parent().hide();
                                 });
                                 // 첨부 파일 확장자 검사 및 용량 체크
                                 // $(".onebyone input[type='file']").on("change", function() {
                                 // var ext = $(this).val().split('.').pop().toLowerCase();
                                 // if($.inArray(ext, ['jpg','jpeg','gif','png','bmp','hwp', 'doc', 'docx']) == -1) {
                                 // window.alert('이미지 파일과 hwp,doc,docx 확장자 파일만 첨부 가능합니다.');
                                 // resetFormElement($(this));
                                 // $(".file_name").val('');
                                 // }else{
                                 // if($.inArray(ext, ['jpg','jpeg','gif','png','bmp']) == -1){ // 문서파일일때
                                 // var fileSize =this.files[0].size;
                                 // var maxSize = 5 * 1024 * 1024;
                                 // if(fileSize > maxSize){
                                 // alert("파일용량 5MB를 초과했습니다.");
                                 // resetFormElement($(this));
                                 // $(".file_name").val('');
                                 // }else{
                                 // $(".file_name").val($(this).val());
                                 // }
                                 // }else if($.inArray(ext, ['hwp','doc','docx']) == -1){  //이미지 파일일때
                                 // var fileSize =this.files[0].size;
                                 // var maxSize = 2 * 1024 * 1024;
                                 // if(fileSize > maxSize){
                                 // alert("파일용량 2MB를 초과했습니다.");
                                 // resetFormElement($(this));
                                 // $(".file_name").val('');
                                 // }else{
                                 // $(".file_name").val($(this).val());
                                 // }
                                 // }
                                 // }
                                 // });
                                 // // 첨부파일 실패시 첨부파일 form 리셋
                                 // function resetFormElement(e) {
                                 // e.wrap('<form>').closest('form').get(0).reset();
                                 // e.unwrap();
                                 // }
                                 // 필수 입력 항목 체크
                                 var _btn = $(".one-btn input[type='submit']");
                                 _btn.on("click", function () {
                                     var sel2Prev = $(".sel2").prev().text();
                                     if (!$(".sel2").hasClass("on") || sel2Prev.match("2차 선택") || $(".required").val().length < 1 || $(".onebyone textarea").val().length < 1) {
                                         alert("필수 항목을 입력해 주세요.");
                                         return false;
                                     }
                                 });
                             });
                         </script>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p><a href="../main/index.jsp">HOME</a> > 공지사항</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">공지사항 작성</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<form action="NoticeBoardWritePro.not" method="post"
                	enctype="multipart/form-data" name="notice_writeForm">
	                    <table summary="게시판" class="customer-notice">
	                        <caption>게시판</caption>
	                        <colgroup>
	                            <col width="15%">
	                            <col width="35%">
	                            <col width="15%">
	                            <col width="35%">
	                        </colgroup>
	                        <colgroup>
								<col width="100px">
								<col width="*"></colgroup>
	                        <tbody>
<!-- 	                        <tr> -->
<!-- 									<td> -->
<!-- 										<span>*</span>공지 유형 -->
<!-- 									</td> -->
<!-- 									<td> -->
<!-- 										<div class="select-wrap"> -->
<!-- 											<div class="one-sel"> -->
<!-- 												<p class="one-select"> -->
<!-- 													분류 선택 -->
<!-- 												</p> -->
<!-- 												<ul class="one-list sel1" > -->
<!-- 												<li data-num="1"><input type="radio" name="notice" id="notice" value="공지사항">공지사항</li> -->
<!-- 												<li data-num="2"><input type="radio" name="notice_alram" id="notice_alram" value="알림">알림</li> -->
<!-- 												</ul> -->
<!-- 											</div> -->
<!-- 											</div> -->
<!-- 											</td> -->
<!-- 											</tr> -->
	                            <tr>
	                                <td>제목</td>
	                                <td colspan="3">
	                                	<input type="text" name="subject">
	                                </td>
	                            </tr>
	                            
	                            <tr>
	                            	<td>작성자</td>
	                            	<td colspan="3">
	                            		<input type="text" name="id" value="<%=id%>" readonly="readonly">
	                            	</td>
<!-- 	                            	<td class="th">비밀번호</td> -->
<!-- 	                            	<td> -->
<!-- 	                            		<input type="text" name="pass"> -->
<!-- 	                            	</td> -->
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td colspan="3">
	                                    <textarea name="content"></textarea>
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
	                    	<a href="NoticeBoardList.not" class="btn">목록</a>
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>