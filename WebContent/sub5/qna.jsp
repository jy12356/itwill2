<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
<div class="category-nav">
	<div class="category-nav-inner">
		<p>
			HOME > 고객센터
		</p>
	</div>
</div>
<div class="contents-wrap">
	<div class="customer">
		<h3 class="coTitle">고객센터</h3>
		<br>
		<br>
		<!-- 				<div class="customer-top-menu"> -->
		<!-- 					<ul> -->
		<!-- 						<li><a href="../customer.asp?page=faq" class=""><em>FAQ</em></a></li> -->
		<!-- 						<li><a href="../customer.asp?page=notice" class=""><em>공지사항</em></a></li> -->
		<!-- 						<li><a href="../customer.asp?page=viewer" class=""><em>뷰어 이용안내</em></a></li> -->
		<!-- 						<li><a href="../customer.asp?page=service" class=""><em>서비스 안내</em></a></li> -->
		<!-- 						<li><a href="../customer.asp?page=vs1" class="on"><em>1:1문의</em></a></li> -->
		<!-- 					</ul> -->
		<!-- 				</div> -->
		<div class="customer-contents">
			<div class="customer-inner">
				<div class="customer-contents">
					<div class="customer-use-wrap">
						<ul class="customer-s-menu one">
							<li>
							<a href="qna.html" class="on">1:1 문의하기</a>
							</li>
							<li>
							<a href="qna2.html" class="">문의 내역 확인</a>
							</li>
						</ul>
						<div class="one-ps">
							<p>
								* 항목은 필수 입력 항목입니다.
							</p>
						</div>
						<form name="frmBbsWrite" method="post" action="qna2.html " enctype="multipart/form-data">
							<input type="hidden" name="page" value="vs1"/>
							<input type="hidden" name="num" value=""/>
							<input type="hidden" name="mode" value="input"/>
							<input type="hidden" name="mainclass_num" class="mainclass_num" value="1"/>
							<input type="hidden" name="subclass_num" class="subclass_num" value=""/>
							<fieldset>
								<legend>1:1 문의하기</legend>
								<table class="onebyone" summary="1:1 문의">
								<caption>1:1 문의하기</caption>
								<colgroup>
								<col width="100px">
								<col width="*"></colgroup>
								<tbody>
								<tr>
									<th>
										<span>*</span>문의유형
									</th>
									<td>
										<div class="select-wrap">
											<div class="one-sel">
												<p class="one-select">
													오류문의
												</p>
												<ul class="one-list sel1">
													<li data-num="1">오류문의</li>
													<li data-num="2">작품관련 문의</li>
													<li data-num="3">취소/환불/현금영수증 발급</li>
													<li data-num="4">이용관련 문의</li>
												</ul>
											</div>
											<div class="one-sel">
												<p class="one-select">
													2차 선택
												</p>
												<ul class="one-list sel2 on">
													<!-- 												<li data-num="1">전자책 다운로드 오류</li><li data-num="2">결제오류</li><li data-num="3">앱오류</li><li data-num="4">도서 파일 오류</li><li data-num="5">기타오류 </li> -->
												</ul>
											</div>
										</div>
										<div class="select-ps">
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<span>*</span>문의제목
									</th>
									<td>
										<input type="text" name="title" value="" class="q-title required">
									</td>
								</tr>
								<tr>
									<th>
										<span>*</span>문의내용
									</th>
									<td>
										<textarea cols="5" rows="8" name="content"></textarea>
									</td>
								</tr>
								<!-- 								<tr> -->
								<!-- 									<th>파일첨부</th> -->
								<!-- 									<td> -->
								<!-- 										<div class="one-file"> -->
								<!-- 											<p><input type="text" name="" value="" readonly="readonly" id="fileName" class="file_name"></p> -->
								<!-- 											<p class="file-btn">찾아보기<input type="file" name="file_name" value="찾아보기"></p> -->
								<!-- 										</div> -->
								<!-- 										<p class="one-s-ps">*2MB 이하의 이미지 파일 및 5MB  이하의 *hwp, *doc, *docx 확장자만 첨부 가능합니다.</p> -->
								<!-- 									</td> -->
								<!-- 								</tr> -->
								<tr>
									<th>
										답변알림
									</th>
									<td>
										<div class="one-reply-alram">
											<input type="text" name="email" value="" class="q-reply">
											<div class="checkbox">
												<label>
												<input type="checkbox" name="email_replay">
												<span>
												<i></i>
												</span>
												</label>
												<p>
													답변 알림 받기
												</p>
											</div>
										</div>
										<p class="one-s-ps">
											*메일 주소 작성 시 답변 완료 내용을 발송해드립니다.
										</p>
									</td>
								</tr>
								<tr>
									<th>
										기기정보
									</th>
									<td class="q-device">
										PC
									</td>
								</tr>
								</tbody>
								</table>
								<div class="one-btn">
									<input type="submit" name="" class="" value="등록하기">
								</div>
							</fieldset>
						</form>
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
                                 // 문의 유형 뎁스 분류
                                 var select0 = '',
                                     select1 = '',
                                     select2 = '',
                                     select3 = '',
                                     select4 = '',
                                     select5 = '';
                                 select0 += "<li data-num='1'>결제 오류</li>" + "<li data-num='2'>서비스오류</li>" + "<li data-num='3'>기타오류 </li>";
                                 select1 += "<li data-num='1'>작품 출간일정 문의</li>" + "<li data-num='2'>오탈자 문의</li>" + "<li data-num='3'>기타 작품 문의</li>";
                                 select2 += "<li data-num='1'>구독취소/환불안내</li>" + "<li data-num='2'>주문 취소</li>" + "<li data-num='3'>현금영수증 발급신청</li>" + "<li data-num='4'>기타 문의</li>";
                                 select3 += "<li data-num='1'>가입/탈퇴/로그인</li>" + "<li data-num='2'>본인/성인인증</li>" + "<li data-num='3'>서비스 이용문의</li>" + "<li data-num='4'>쿠폰/상품권 문의</li>" + "<li data-num='5'>기타 문의</li>";
                                 select4 += "<li data-num='1'>주문 취소</li>" + "<li data-num='2'>북캐시 환불 요청</li>" + "<li data-num='3'>현금영수증 발급신청</li>";
                                 select5 += "<li data-num='1'>개인저자 투고문의</li>" + "<li data-num='2'>출판사 제휴문의</li>";
                                 // 문의유형 사전 안내 문구
                                 var ps0 = '',
                                     ps1 = '',
                                     ps2 = '',
                                     ps3 = '',
                                     ps4 = '',
                                     ps5 = '',
                                     ps6 = '',
                                     ps7 = '',
                                     ps8 = '',
                                     ps9 = '',
                                     ps10 = '';
                                 ps0 += "<p><span class='one-dot'>*</span>결제 오류시 먼저 '마이페이지'에서 '구매내역'새로고침을 해보세요.</p>" + "<p><span class='one-dot'>*</span>운영체제와 일치 하는 버전인지 확인 해보세요.[북큐브앱>내서재>설정>하단 '최신 버전 업데이트']</p>";
                                 ps1 += "<p><span class='one-dot'>*</span>북큐브 앱이 최신 버전인지 확인 해보세요.[북큐브앱>내서재>설정>하단 '최신 버전 업데이트']</p>";
                                 ps2 += "<p><잠깐 확인!>*주문 취소는 배송일을 기준으로 1일 내에는 불가능 합니다.(유의사항 참고) 부득이한 사정으로 인한 취소 요청시에는, '동서남-book'으로 문의 남겨 주세요.</p>";
                                 ps3 += "<p><잠깐 확인!>*구독 취소 및 환불은 결제일을 기준으로 1주일 초과시 불가합니다.(유의사항 참고) 부득이한 사정으로 인한 환불 요청시에는, '동서남-book'으로 문의 남겨 주세요.</p>";
                                 ps4 += "<p><span class='one-dot'>*</span>탈퇴는 pc에서 가능합니다.[PC 북큐브 접속 > 로그인 > 마이페이지 > 회원정보 수정 > 하단 탈퇴 버튼 클릭]</p>";
                                 ps5 += "<p><span class='one-dot'>*</span>해외에서 직접 본인/성인인증이 어려운 경우 신분증 사진을 첨부해 주십시오. (이름 및 생년월일을 제외한 개인정보 및 얼굴사진을 가리고 첨부해주세요.)</p>"
                                 ps6 += "<p><span class='one-dot'>*</span>전자도서관 문의는 이용하시는 도서관 기관명, 아이디와 함께 아래의 메일주소로 문의 주시면 더욱 빠른 처리가 가능합니다. 1588-1925 (내선 2번) library@bookcube.com</p>";
                                 ps7 += "<p><span class='one-dot'>*</span>다운로드를 받지 않은 전자책에 대해서는 직접 취소하실 수 있습니다.[마이페이지 > 주문내역 확인 > 전자책 선택 > 주문취소 요청]</p>";
                                 ps8 += "<p><span class='one-dot'>*</span>북캐시 환불은 화요일까지 접수해주신 분에 한하여, 매주 수요일 일괄 처리됩니다.</p>" + "<p><span class='one-dot'>*</span>환불을 신청하는 회원과 예금주의 성함이 일치해야 합니다.</p>" + "<p><span class='one-dot'>*</span>환불금액은 고객님의 계좌로 입금되며, 회원약관에 명시된 바와 같이 환불 수수료 (10%와 1,000원 중 큰 금액)을 공제합니다.</p>" + "<p><span class='one-dot'>*</span>북캐시 구매시 추가로 적립된 적립금을 사용하셨다면, 그 금액을 제외하고 환불됩니다.</p>";
                                 ps9 += "<p><span class='one-dot'>*</span>메일주소를 입력하지 않으시면 회원가입시 등록하신 이메일로 발송이 됩니다.</p>";
                                 ps10 += "<p><span class='one-dot'>*</span>*서비스 이용 문의시에는 보다 정확하게 문의해 주시기 바랍니다.</p>";
                                 var selectPs = $(".select-ps");
                                 $(".sel1 li").on("click", function () {
                                     var idx = $(this).index();
                                     var textContent = $(".onebyone textarea");
                                     textContent.text("");
                                     selectPs.html("");
                                     $(".mainclass_num").val($(this).data("num"));
                                     if ($(".sel2").hasClass("on")) {
                                         $(".sel2").prev().text("2차 선택");
                                         $(".sel2").removeClass("on");
                                         $(".sel2").addClass("on");
                                         $(".sel2").html(eval("select" + idx));
                                     } else {
                                         $(".sel2").html(eval("select" + idx)).addClass("on");
                                     }
                                 });
                                 var textarea = [
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*오류시간 : \n\n*오류발생 상황(자세한 설명) : \nex) 3개월 구독을 결제했는데, 구독 월 수가 증가하지 않습니다.\n\n*오류메세지가 뜨는 경우 해당 화면을 캡쳐하여 꼭 첨부해주세요.',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*오류시간 : \n\n*오류발생 상황(자세한 설명) : \nex) 사이트에 접속했는데 로딩이 되지 않습니다.\n\n*오류메세지가 뜨는 경우 해당 화면을 캡쳐하여 꼭 첨부해주세요.',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*사용환경(PC,IOS,안드로이드 등) : \n\n*기기버전(안드로이드버전,IOS버전) : \n\n*북큐브 앱 버전 : \n[북큐브 앱 > 설정 > 버전정보]\n\n*오류 발생 상황(자세한 설명) : \n\n*오류메세지가 뜨는 경우 해당 화면을 캡쳐하여 꼭 첨부해주세요.',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n*오류 시간: \n\n*사용환경(PC,IOS,안드로이드 등) : \n\n*오류 도서명 및 연재회차 : \n\n*오류 발생 지점(도서 % 또는 문제가 있는 문장 문구): \n\n*오류발생 상황(자세한 설명) : \nex. 내서재에서 세트도서를 보는 도중 2권 파일이 열리지 않아요. \n\n*오류메세지가 뜨는 경우 해당 화면을 캡쳐하여 꼭 첨부해주세요.',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*오류시간 : \n\n*사용환경(PC,IOS,안드로이드등) : \n\n*도서명 및 연재회차 : \n\n*오류 발생 상황(자세한 설명) : \n\n*오류메세지가 뜨는 경우 해당 화면을 캡쳐하여 꼭 첨부해주세요.',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*문의 작품 유형(일반소설/전공/여행 etc) : \n*문의 작품 : \n*작품 저자 : ',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*문의 작품 유형(일반도서/로맨스/BL/웹툰) : \n*문의 작품 : \n*오탈자 내용 : ',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*이벤트 도서 : \n\n*문의 내용 : ',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*이벤트 명 : \n\n*이벤트 도서 : \n\n*문의 및 불편내용',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*쿠폰,상품권 명(또는 받은 경로) : \n*문의 내용 : ',
                                     '*결제일 : \n\n*결제수단 : \n\n*환불금액 : \n\n*은행 : \n\n*계좌번호 : \n\n*예금주명 : \n\n*환불사유 : ',
                                     '*구매일시 : \n\n*성함 : \n\n*휴대폰번호 : \n\n*메일주소 : \n\n*구매한 구독 개월 수 : \n\n 반드시 본인의 정보가 정확한지 확인하여 주시기 바랍니다.[마이페이지 > 나의 정보에서 조회가능]\n\n*결제수단 : ',
                                     '정확한 확인을 위하여 입력 양식을 작성해주세요.\n\n*투고 장르 : \n*문의 내용 : ',
                                     ' '
                                 ]
                                 $(document).on("click", ".sel2 li", function () {
                                     var textContent = $(".onebyone textarea");
                                     var text = $(this).text();
                                     selectPs.html("");
                                     $(".subclass_num").val($(this).data("num"));
                                     switch (text) {
                                         case "결제 오류": textContent.text(textarea[0]);
                                             selectPs.html(ps0);
                                             break;
                                         case "서비스오류": textContent.text(textarea[1]);
                                             break;
                                         case "앱오류": textContent.text(textarea[2]);
                                             selectPs.html(ps1);
                                             break;
                                         case "도서 파일 오류": textContent.text(textarea[3]);
                                             break;
                                         case "기타 오류": textContent.text(textarea[4]);
                                             selectPs.html(ps2);
                                             break;
                                         case "작품 출간일정 문의": textContent.text(textarea[5]);
                                             break;
                                         case "오탈자 문의": textContent.text(textarea[6]);
                                             break;
                                         case "구독취소/환불안내": textContent.text(textarea[10]);
                                             selectPs.html(ps3);
                                             break;
                                         case "주문 취소": textContent.text(textarea[13]);
                                             selectPs.html(ps2);
                                             break;
                                         case "기타 작품 문의": textContent.text(textarea[5]);
                                             break;
                                         case "가입/탈퇴/로그인": textContent.text(textarea[13]);
                                             selectPs.html(ps4);
                                             break;
                                         case "본인/성인인증": textContent.text(textarea[13]);
                                             selectPs.html(ps5);
                                             break;
                                         case "서비스 이용문의": textContent.text(textarea[13]);
                                             selectPs.html(ps10);
                                             break;
                                         case "쿠폰/상품권 문의": textContent.text(textarea[9]);
                                             break;
                                         case "주문 취소": textContent.text(textarea[13]);
                                             selectPs.html(ps7);
                                             break;
                                         case "북캐시 환불 요청": textContent.text(textarea[10]);
                                             selectPs.html(ps8);
                                             break;
                                         case "현금영수증 발급신청": textContent.text(textarea[11]);
                                             selectPs.html(ps9);
                                             break;
                                         case "개인저자 투고문의": textContent.text(textarea[12]);
                                             selectPs.html(ps10);
                                             break;
                                         case "기타 문의": textContent.text(textarea[13]);
                                             selectPs.html(ps10);
                                             break;
                                         default: textContent.text("");
                                     }
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<jsp:include page="../include/footer.jsp"/>