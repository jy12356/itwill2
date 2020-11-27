<%@page import="vo.NoticeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeBean article = (NoticeBean)request.getAttribute("article");
	String nowPage = request.getParameter("page");
%>
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
                    <li><a href="faq.html" class=""><em>FAQ</em></a></li>
                    <li><a href="notice.html" class=""><em>공지사항</em></a></li>
                    <!-- 						<li><a href="/customer.asp?page=viewer" class=""><em>뷰어 이용안내</em></a></li> -->
                    <li><a href="service.html" class=""><em>서비스 안내</em></a></li>
               		<!-- 						<li><a href="/customer.asp?page=vs1" class=""><em>1:1문의</em></a></li> -->
                </ul>
            </div>
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="공지사항" class="customer-notice">
                        <caption>공지사항</caption>
                        <colgroup>
                            <col width="15%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>제목</td>
                                <td>장르/만화 정액권 판매 종료 예정 안내</td>
                            </tr>
                            <tr>
                                <td>등록일</td>
                                <td>2020/10/27</td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <p>
                                        안녕하세요.<br>e북 포털 북큐브입니다.<br><br>장르/만화 정액권 판매 종료 사전 안내드립니다.<br><br><b>장르/만화 정액권<br> - 상품 판매 종료 일자 : 2020년 11월 30일 (월)<br> - 서비스 종료 일자 : 2020년 12월 31일 (목)</b><br> * 11월 30일 이전까지 정액권 상품 결제한 회원에 한하여 이용 기간 (최대 30일)까지 사용 가능<br><br>장르/만화 정액권 이용자 감소 및 대상 작품 제한에 따라 부득이하게 판매를 종료하게 된 점 양해 부탁드립니다.<br>향후 고객님들께 더 나은 서비스로 보답 드리겠습니다.<br><br><br>e북 포털 북큐브 드림.
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="default-btn-wrap">
                        <a href="notice.jsp" class="btn">목록</a>
                        <a href="/customer.asp?page=notice&page2=view&num=112679&pageNum=1" class="btn">다음</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>