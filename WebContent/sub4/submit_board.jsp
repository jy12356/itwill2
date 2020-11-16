<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 희망도서 신청 목록 </p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="coTitle">희망도서 신청 목록</h3>
            
            <div class="customer-contents">
                <div class="customer-inner">	
				<div class="onebyone-step">
					<img src="boardimg/step.jpg" alt="1.신청 접수 2.신청 내용 확인 3.도서 구매 완료">
					<p>신청 도서를 일주일 안에 확인 및 구매 할 수 있도록 노력하고 있습니다.<br>단, <span>주말,공휴일 신청 및 확인 절차가 많아지는 경우</span>에는 지연될 수 있는 점 양해 부탁드립니다.</p>
				</div>
				<table class="onebyone-list" summary="희망도서 신청 목록">
					<caption>문의 내역 확인</caption>
                        <colgroup>
                            <col width="20%">
                            <col width="*">
                            <col width="15%">
                            <col width="15%">
                        </colgroup>
						<tbody>
							<tr>
								<th>진행 현황</th>
								<th>신청 도서명</th>
								<th>신청자명</th>
								<th>도서 신청일</th>
							</tr>
                            <tr>
                                <td>신청 접수
<!--                                 <img src="boardimg/one-step.jpg"> -->
                                <td><a href="submit_board_update.jsp">안드로이드는 전기양을 꿈꾸는가?</a></td>
                                <td>김바보</td>
                                </td><td>2020/11/12</td>
                            </tr>
						</tbody>
                    </table>
                    <div class="btn_inner">
<!--                     	<form action="submit_boardSearch.jsp" method="post"> -->
<!-- 						<input type="text" name="search" class="input_box">  -->
<!-- 						<input type="submit" value="조회" class="btn"></form> -->
						<input type="text" name="search" class="input_box">
						<a href="submit_boardSearch.jsp" class="btn">조회</a>
                    	<a href="submit_board_write.jsp" class="btn">도서 신청</a>
                    </div>
                    <div class="paging">
                        <a href="/customer.asp?page=notice&pageNum=1" class="arr" data-page-num="1"><img src="../images/p-first.png"><span class="hide">처음페이지</span></a>
                        <a href="/customer.asp?page=notice&pageNum=1" class="arr prev" data-page-num="1"><img src="../images/p-prev.png"><span class="hide">이전페이지</span></a>
                        <a href="/customer.asp?page=notice&pageNum=1" class="on fir" data-page-num="1">1</a>
                        <a href="/customer.asp?page=notice&pageNum=11" class="arr next" data-page-num="11">
                            <img src="../images/p-next.png"><span class="hide">다음페이지</span></a>
                        <a href="/customer.asp?page=notice&pageNum=27" class="arr" data-page-num="27"><img src="../images/p-last.png"><span class="hide">마지막페이지</span></a>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>