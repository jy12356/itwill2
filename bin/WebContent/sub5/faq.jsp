<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 고객센터</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">고객센터</h3>
            <div class="customer-top-menu">
                <ul>
                    <li><a href="../sub5/faq.jsp" class=""><em>FAQ</em></a></li>
                    <li><a href="../sub5/notice.jsp" class=""><em>공지사항</em></a></li>
                    <li><a href="../sub5/service.jsp" class=""><em>서비스 안내</em></a></li>
                    <li><a href="../sub5/one.jsp" class=""><em>1:1문의</em></a></li>
                </ul>
            </div>
            <div class="customer-contents">
                <div class="customer-inner">
                    <form name="frmFAQ" method="get" action="/customer.asp?page=faq">
                        <fieldset>
                            <legend>자주 찾는 질문 검색하기</legend>
                            <div class="c-faq-wrap">
                                <div class="c-faq">
                                    <div class="c-faq-inner">
                                        <p>자주 찾는 질문을 검색해주세요.</p>
                                        <input type="text" name="faq_search" value="" id="">
                                        <input type="submit" name="" id="" value="검색">
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <div class="customer-func">
                        <ul>
                            <li><a href="/customer.asp?page=faq&page2=best10" class="on">TOP10</a></li>
                            <!-- 				<li><a href="/customer.asp?page=faq&page2=mylibrary" class="">PC 내서재</a></li> -->
                            <!-- 				<li><a href="/customer.asp?page=faq&page2=app" class="">북큐브 APP</a></li> -->
                            <li><a href="/customer.asp?page=faq&page2=order" class="">주문/취소</a></li>
                            <li><a href="/customer.asp?page=faq&page2=service" class="">사이트 이용</a></li>
                            <!-- 				<li><a href="/customer.asp?page=faq&page2=b2b" class="">전자도서관</a></li> -->
                        </ul>
                    </div>
                    <table summary="자주 찾는 질문 리스트" class="customer-table">
                        <caption>자주 찾는 질문</caption>
                        <colgroup>
                            <col width="11%">
                            <col width="*">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col" abbr="번호">번호</th>
                                <th scope="col" abbr="제목">제목</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>111689</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>성인 인증 시도 시 계속 오류가 나요!</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>성인 회원임에도 불구하고 성인인증 시도 시 지속적으로 인증 오류(ex - 만 19세 미만의 청소년으로 성인도서 이용이 불가하다.) 가 발생될 경우 아래의 내용 확인 후 해결되지 않을 경우 1:1 게시판을 통해 문의 주시길 부탁드립니다.<br><br><b>사전 확인 사항<br>크롬 브라우저 사용 여부</b><br>혹 성인인증을 크롬 브라우저를 통해 진행하셨나요? <br>크롬 브라우저의 경우 보안정책 변경으로 인하여, 인증 처리에 오류가 발생할 수 있습니다. 인증 처리의 문제가 있을 경우 크롬이 아닌 다른 브라우저에서 재시도 해 주시길 부탁드립니다.<br><br>만약 다른 브라우저로 인증을 시도하였음에도 지속적인 오류가 발생할 경우, 아래 내용을 기재하여 1:1 게시판에 글 남겨주시면 담당자가 확인 후 처리 도와드리도록 하겠습니다.<br><br><b>오류 미해결 시 1:1 게시판 게시글 작성 양식</b><br>1. 성인인증 시도 기기 : PC / 안드로이드 / 아이폰 <br>2. 이용 브라우저 :<br>3. 인증 수단 : (ex - 휴대폰인증 > PASS 앱)</div>
                                </td>
                            </tr>
                            <tr>
                                <td>100405</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>주문한 작품의 대여 기간은 어디서 확인할 수 있나요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>대여 만료 기간은 결제한 작품의 상세페이지, 구매목록, 북큐브 앱 (PC / Android / iOS)에서 모두 확인 가능합니다.<br>- 다운로드 미완료 : 대여중 (다운로드 시점부터 N일)<br>- 다운로드 완료 : 대여중 (~YYYY-MM-DD HH:MM)<br></div>
                                </td>
                            </tr>
                            <tr>
                                <td>64744</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>로그인하니까 구매내역과 북캐시가 없어졌어요!</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>카카오/네이버/페이스북/페이코 ID로 로그인하셨나요? <br>북큐브 ID가 있음에도 카카오/네이버/페이스북/페이코 ID로 로그인할 경우 기존에 보유한 북큐브 ID와 자동으로 연동되지 않으며 신규 계정이 생성됩니다. <br> 카카오/네이버/페이스북/페이코 ID 가 아닌 기존에 사용한 북큐브 ID로 로그인하시어 확인 부탁드리며, 북큐브 ID가 생각나지 않을 경우, 1:1문의에 성함, 이메일 정보를 기입하시어 내용 남겨주시면 확인 후 답변드리도록 하겠습니다.<br>카카오/네이버/페이스북/페이코 ID로도 로그인을 원하실 경우, [북큐브 ID로 로그인> 마이페이지> 회원정보수정]으로 접속하시어 [연동하기]를 통해 페이스북/네이버/카카오 /페이코 ID와 연동 후 이용해 주세요.</div>
                                </td>
                            </tr>
                            <tr>
                                <td>59605</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>북큐브 적립금 사용은 어떻게 하나요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div><b>적립금 사용 방법</b><br>1. 결제하기 버튼 클릭 <br>2. 적립금 항목에 사용 적립금 금액 입력 <br>3. 적립금 제외한 나머지 결제 금액이 있을 경우 추가 입력 또는 결제수단 선택 후 결제하면 완료!<br><br>단, 적립금은 유효기간이 있습니다.<br>[마이페이지-적립금 내역]에서 적립금 유효기간 확인 후 이용 부탁드립니다.<br>(소멸된 적립금에 대해서는 복원이 어렵습니다.)</div>
                                </td>
                            </tr>
                            <tr>
                                <td>32602</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>구매 또는 대여한 도서는 몇대의 기기까지 이용 가능 한가요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>북큐브에서는 한 아이디 계정 당 5대의 기기에서 이용이 가능합니다.<br><br>다만 책파일 다운로드 시 함께 저장되는 인증서 파일로 단말기 대수를 체크하고 있기에, 북큐브 앱 또는 PC 내서재 프로그램을 삭제 후 재설치 시 새로운 기기로 인식되는 점 참고 부탁드립니다.<br>앱 재설치 또는 기기 변경 등의 이유로 5대 제한이 걸린 경우 '내 기기관리' 기능을 통해 미사용하는 기기에 대해 사용자가 직접 기기를 해제할 수 있습니다. (월 3회 해제 가능)<br><br>PC : '북큐브 내서재' 프로그램 > 설정 > 내 기기 관리<br>모바일 : 북큐브 앱 > 내서재 > 설정 > 내 기기 관리<br><br>위 경로를 통해 현재 사용하지 않거나 동일한 기기이나 앱 재설치로 여러 번 등록된 목록을 해제 후 이용 하시길 바랍니다. (매월 1일 기기 해제 횟수 초기화)</div>
                                </td>
                            </tr>
                            <tr>
                                <td>32589</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>원격 조정 요청은 어떻게 하나요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>북큐브 고객 상담원의 안내에 따라 해결이 되지 않는 결제, 북플레이어, 다운로드 오류 등의 문제 는 원격 조정을 통해 해결 해드리겠습니다. <br> <br> <b>[원격 조정 연결 가능 시간]</b> <br> 1588-1925 평 일 : 09시 ~ 18시 점심시간 : 12시 ~ 13시 주말 및 공휴일 휴무 <br> <br><b>[원격 조정 연결 방법]</b> <br>1. 전화 또는 일대일 게시판을 통해서 원격 조정 요청 <br>2. 상담원의 안내에 따라 하기 페이지 접속 <br><b><a href="https://898.tv/bookcube">https://898.tv/bookcube</a></b> <br>3. 프로그램 설치 후 화면에 나오는 수락 버튼을 클릭하면 원격 조정 연결 완료</div>
                                </td>
                            </tr>
                            <tr>
                                <td>32566</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>회원 탈퇴는 어떻게 하나요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>회원 탈퇴는 PC웹에 한하여 제공하고 있으며, 아래의 방법으로 진행해 주시면 됩니다.<br>단, 회원 탈퇴시 고객님의 모든 정보(결제 및 이용 내역 포함) 및 구매 도서도 이용 불가하게 되며 탈퇴한 이후에 모든 정보 (잔여 캐시 및 결제 도서 포함)는 복원이 불가하오니 신중하게 결정한 뒤 진행 부탁드립니다.<br><br><b>회원 탈퇴 진행 방법</b><br>마이페이지 > 회원정보 > 맨 하단 [회원탈퇴] 버튼 클릭</div>
                                </td>
                            </tr>
                            <tr>
                                <td>32543</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>주문/취소</span>전자책 구매취소, 환불이 가능한가요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>구매한 콘텐츠 및 서비스에 대하여 승인일로부터 7일 이내에 다운로드/스트리밍 서비스를 하지 않은 경우 주문취소 및 환불이 가능합니다. [마이페이지 > 주문내역 > 취소를 원하는 도서 '결제취소' 클릭]<br>단, 하기의 경우에는 주문취소 및 환불이 불가합니다.<br>1. 주문 후 7일 경과<br>2. 주문을 통해 지급받은 적립금 사용<br>3. 구매한 콘텐츠 및 서비스에 대하여 다운로드 및 스트리밍 서비스 이용<br>(전자책이라는 컨텐츠의 특성 상 다운로드/스트리밍 완료된 건에 대해서는 주문취소 처리가 불가합니다.)</div>
                                </td>
                            </tr>
                            <tr>
                                <td>32542</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>북캐시 잔액 환불해 주세요</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>북캐시 환불은 충전한 북캐시 사용 여부 (북캐시 충전 시 추가 제공된 적립금 사용 여부 포함)에 따라 환불 처리 방식이 다르게 적용됩니다.<br><br><b>1. 충전 후 북캐시 또는 추가 제공된 적립금을 일부 사용한 경우</b><br>사용 후 남은 북캐시에 대한 환불은 불가하나, 회원이 요청하는 경우 이용 약관에 명시된 내용에 따라 환불을 진행합니다.<br><br> - 환불 금액 : 북캐시 구매 시 추가적으로 제공된 적립금이 있는 경우 해당 금액 및 환불 수수료 (남은 북캐시의 10%와 1,000원 중 큰 금액)을 공제한 금액<br> - 신청 방법 : [고객센터>1:1 문의]를 통해 아래 환불 신청 양식에 맞춰 게시글 작성<br> - 주의 사항 :<br> 1. 환불 신청하는 회원의 이름과 계좌의 예금주 명이 일치해야 환불 처리가 가능합니다.<br> 2. 간편 회원가입(네이버/카카오/페이스북/페이코) 회원의 경우 회원명과 예금주 명 일치 여부를 확인하기 위하여, 반드시 [마이페이지>회원정보수정] 페이지 하단의 본인인증 완료 처리 후 요청해 주세요.<br> 3. 추가 제공된 적립금 및 환불 수수료를 공제한 뒤 금액이 남아있는 경우에 한하여 환불이 가능합니다.<br> 4. 부분 환불은 불가합니다.<br><br><b>[1:1 게시판 환불 신청 양식]</b><br>결제일 :<br>결제수단 :<br>환불금액 :<br>은행 :<br>계좌번호 :<br>예금주명 :<br>환불 사유 :<br><br>1:1 게시판에 양식에 맞춰 작성해 주신 내용을 토대로 담당자가 확인 후 환불 가능 금액에 대한 1차 안내를 드리며, 해당 내용 확인 후 화요일까지 환불 금액 동의해 주신 분에 한하여 매주 수요일 일괄 처리됩니다.<br><br><b>2. 결제일로부터 7일 이내 충전된 북캐시 및 추가 제공된 적립금을 사용하지 않은 경우</b><br>북캐시 및 추가 제공된 적립금을 사용하지 않은 경우 결제 취소 처리가 가능합니다.<br>단, 결제 수단 특성에 따라 '휴대폰 소액결제'의 경우 결제 월이 아닌 경우 취소 불가하오니 이 점 이용에 참고 부탁드립니다.<br>ex) 12월 31일 휴대폰 소액 결제를 통해 북캐시 3만원 충전한 경우, 충전된 북캐시와 추가 제공된 적립금을 사용하지 않았더라도 1월 1일 0시부터 결제 취소 불가</div>
                                </td>
                            </tr>
                            <tr>
                                <td>10449</td>
                                <td>
                                    <span>Q.</span>
                                    <p><span>사이트 이용</span>해외거주자는 성인 인증 또는 본인인증을 어떻게 하나요?</p>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>A.</span>
                                    <div>해외에 거주하여 아이핀 또는 휴대폰 인증을 통해 성인 또는 본인인증 처리가 어려운 경우, 아래 양식에 맞춰 1:1 문의 또는 webmaster@bookcube.com 으로 전달해 주시면 확인 후 인증 처리 가능합니다.<br><br><b>전달 요청 양식</b><br>- 북큐브 아이디 (간편 로그인 계정인 경우 [마이페이지 > 회원정보수정] 페이지에서 닉네임 확인 후 전달)<br>- 이름<br>- 생년월일이 포함된 신분증 사본 (파일 첨부)<br><br>*성인인 경우 본인인증 및 성인인증 처리 모두 완료<br><br>고객님의 신분증 사본은 성인인증 처리 완료 후 내용 삭제 및 파기되며, 등록 기간은 메일 발송 후 1~2일 정도 소요됩니다. (주말, 공휴일 제외)</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="paging"><a href="/customer.asp?page=faq&pageNum=1" class="on fir" data-page-num="1">1</a>
                    </div>
                    <script>
                        $(function() {
                            var _td = $(".customer-table td");
                            _td.on("click", function() {
                                $(".customer-table tr:nth-child(2n)").hide();
                                $(this).parent().next().show();
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>