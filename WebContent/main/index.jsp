<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.BookBean"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd a hh:mm");
%>
<%
	// 전달받은 request 객체로부터 데이터 가져오기
	// "pageInfo" 객체와 "articleList" 객체를 request 객체로부터 꺼내서 저장
	// "pageInfo" 객체로부터 페이지 관련 값들을 꺼내서 변수에 저장
	String id = (String) session.getAttribute("id"); 
	ArrayList<BookBean> bookList = (ArrayList<BookBean>)request.getAttribute("bookList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	String catg1 = "소설";
	if(request.getParameter("catg1")!=null){
		catg1 = request.getParameter("catg1");
	}
	String catg2 = "전체";
	if(request.getParameter("catg2")!=null){
		catg2 = request.getParameter("catg2");
	}
%>  

<jsp:include page="../include/header.jsp" />
<section class="" id="contents">
<script type="text/javascript" charset="utf-8" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/jquery-3.2.1.js"></script>
 
<script type="text/javascript">
$(document).ready(function() {
    brandnewNotice();
});
 
function brandnewNotice() {
    $
            .ajax({
                dataType : "json",
                url : "menu/brandnewNotice.do",
                type : "GET",
                success : function(data) {
                    var html = '';
                    html += '<table class="table" align="center" width="700" border="1" cellspacing="0">';
                    html += '<tr>';
                    html += '<td>' + data.ntitle + '</td>';
                    html += '<td>' + data.nContents + '</td>';
                    html += '<td>' + data.nDate + '</td>';
                    html += '</tr>';
                    html += '</table>';
                    $("#brandnewNotice").html(html);
                },
                error : function(jqXHR, textStatus, errorThrown) {
                    /* alert("에러 발생~~ \n" + textStatus + " : " + errorThrown); */
                    /* 주석처리 안해놓으면 블로그에서 alert창이 뜬다.. 귀찮 (가끔 특정 사이트를 웹 또는 폰으로 서칭도중에 "바이러스가 발견되었습니다~
어쩌구 하는 팝업창이 뜨는건 이런걸 이용한 눈속임 사기.." */
                }
            });
}
</script>
	<div class="today-hot">
		<h3 class="hot-title">오늘의 추천</h3>
		<div class="hot-inner">
			<p class="prev">
				<a href="javascript:;"><span>prev</span></a>
			</p>
			<p class="next">
				<a href="javascript:;"><span>next</span></a>
			</p>
		</div>
		<div class="slider">
			<ul>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100243.jpg"
								alt="도서 이미지 - 어떻게 말해줘야 할까" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>채널A 〈요즘 육아 금쪽같은 내 새끼〉 SBS 〈우리 아이가 달라졌어요〉국민 육아멘토 오은영 박사가
										알려주는 ‘부모의 말’육아 현실을 200퍼센트 반영한 130가지 한마디...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029866&page=buy">어떻게
								말해줘야 할까</a>
						</p>
						<p>오은영 글, 차상미 그림</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<a
							href="https://www.bookcube.com/detail.asp?series_num=920020151&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2007/200707030.jpg"
								alt="도서 이미지 - 달러구트 꿈 백화점" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>여기는 잠들어야만 입장할 수 있는 ‘달러구트 꿈 백화점’입니다 잠들어야만 입장할 수 있는 독특한
										마을. 그곳에 들어온 잠든 손님들에게 가장 인기 있는 곳은, 온갖 꿈을 한데...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920020151&page=buy">달러구트
								꿈 백화점</a>
						</p>
						<p>이미예</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<a
							href="https://www.bookcube.com/detail.asp?series_num=920017326&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2007/200701496.jpg"
								alt="도서 이미지 - 돈의 속성" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판 최상위 부자 김승호 회장이 직접 밝히는 돈에
										통찰과 철학 맨손에서 종잣돈을 만들고 돈을 불리는 75가지 방법 이 책 『돈...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920017326&page=buy">돈의
								속성</a>
						</p>
						<p>김승호</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<a
							href="https://www.bookcube.com/detail.asp?series_num=920025243&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2009/200902682.jpg"
								alt="도서 이미지 - 규칙 없음" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>“통제와 규정은, 무능력한 직원에게나 필요한 것!” | 넷플릭스 CEO 리드 헤이스팅스의 첫 책 |

										1997년 설립 당시, 넷플릭스는 우편으로 DVD를 대여해 주는 회사에 불과했다. ...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920025243&page=buy">규칙
								없음</a>
						</p>
						<p>리드 헤이스팅스, 에린 마이어</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920028916&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2010/201003746.jpg"
								alt="도서 이미지 - 워터 댄서" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>* 뉴욕타임스 베스트셀러 1위 * 아마존 베스트셀러 1위 * 오프라 윈프리 북클럽 선정도서 *
										[타임] 외 13개 매체가 뽑은 올해의 책 * 전미도서상 수상작가 신작 소설 전미도서상 ...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920028916&page=buy">워터
								댄서</a>
						</p>
						<p>타네히시 코츠</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<a
							href="https://www.bookcube.com/detail.asp?series_num=920029916&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100423.jpg"
								alt="도서 이미지 - 이만하면 괜찮은 죽음" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>‘괜찮은 죽음’을 말하는 슬프고도 유쾌한 문장들 이만하면 괜찮은 죽음이란 게 과연 존재할까? 모든
										죽음은 무너지는 아픔과 깊은 슬픔이 뒤따른다. 검은색으로 가득한 장례식장...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029916&page=buy">이만하면
								괜찮은 죽음</a>
						</p>
						<p>데이비드 재럿</p>
					</div>
				</li>
				<li>
					<div class="figure">
						<span class="label"><em>10% <span>할인</span></em></span> <a
							href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy">
							<span class="rm_br"><img
								src="https://bookimg.bookcube.com/150/2011/201100254.jpg"
								alt="도서 이미지 - 주식하는 마음" /></span> <span class="light"></span>
							<div class="caption">
								<div class="about">
									<p>“당신이 주식투자로 부자가 되면 좋겠습니다.” 출연만으로 유튜브 누적 조회수 100만 회 기록!
										트레바리에서 가장 빨리 마감되는 클럽의 주인공! 투자 고수 홍진채가 전하는 ‘주...</p>
								</div>
							</div>
						</a>
					</div>
					<div class="hot-info">
						<p class="hot-title">
							<a
								href="https://www.bookcube.com/detail.asp?series_num=920029909&page=buy">주식하는
								마음</a>
						</p>
						<p>홍진채</p>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="main-inner">
		<div class="quick">
			<ul>
				<li><a href="/event_detail.asp?event_num=5060">최대 50%</a></li>
				<li><a
					href="/event_detail.asp?page=nm&mode=theme&event_num=12142">전문서적관</a></li>
				<li><a
					href="/categorylist.asp?page=&mainclass_num=27&subclass_num=&sort=%EC%9D%B8%EA%B8%B0%EC%88%9C&list_type=">오디오북</a></li>
				<li><a href="/event.asp?page=nm&now_yn=1">이벤트</a></li>
			</ul>
		</div>
	</div>
	<div class="main-inner">
		<div class="main_event">
			<h3 class="coTitle">이벤트</h3>
			<div class="banner-list">
				<ul class="mds-banner slider-event">
					<li class="swiper-slide"><a href="" target="_blank"><img
							src="images/e7652_pc_banner.jpg" alt=""></a></li>
					<li class="swiper-slide"><a href="" target="_blank"><img
							src="images/e7652_pc_banner.jpg" alt=""></a></li>
					<li class="swiper-slide"><a href="" target="_blank"><img
							src="images/e7652_pc_banner.jpg" alt=""></a></li>
					<li class="swiper-slide"><a href="" target="_blank"><img
							src="images/e7652_pc_banner.jpg" alt=""></a></li>
					<li class="swiper-slide"><a href="" target="_blank"><img
							src="images/e7652_pc_banner.jpg" alt=""></a></li>
				</ul>
				</ul>
			</div>
		</div>
	</div>
	<div class="main-inner">
		<div class="main_ct_best">
			<div class="ct-best">
				<h3>카테고리별 베스트</h3>
				<ul>
					<li><a href="../sub1/list.html">소설<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">인문/경제<span
							class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">자기개발<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">과학<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">IT<span class="ct-arrow"></span></a></li>
					<li><a href="../sub1/list.html">건강<span class="ct-arrow"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="rank_inner">
		<div class="main-inner">
			<div class="cover-section realtime-hot-box mt60">
				<div class="cover-section-inner">
					<div class="special-title">
						<h3 class="coTitle coTitleL">실시간 인기작품</h3>
						<span class="date"><%=sf.format(nowTime)%>기준</span>
					</div>
					<div class="realtime-hot-list mt30">
						<ul>
							<li class="head">
								<p class="rank">
									<span>순위</span>
								</p>
								<p class="webtoon">
									<strong class="fn-webtoon">소설</strong> <a
										href="/webtoon/best/realtime" class="btn-type03">더보기 <span
										class="more"></span>
									</a>
								</p>
								<p class="comic">
									<strong class="fn-comic">인문/경제</strong> <a
										href="/comic/best/all/realtime" class="btn-type03">더보기 <span
										class="more"></span></a>
								</p>
								<p class="fiction">
									<strong class="fn-fiction">과학/IT</strong> <a
										href="/novel/best/all/realtime" class="btn-type03">더보기 <span
										class="more"></span></a>
								</p>
							</li>
							
							<li class="top-rank top-one">
								<p class="rank">
									<span><strong>1</strong></span><span class="icon"></span>
								</p>
								<div class="webtoon">
									<p>
										<strong>인 마이 클로젯</strong><span>RISA LISA</span>
									</p>
									<div>
										<a title="인 마이 클로젯" href="/webtoon/wt_closet_wz">
											<div>
												<img
													src="https://img.mrblue.com/prod_img/comics/wt_closet_wz/thumb_sq.jpg"
													alt="">
											</div> <span><strong>인 마이 클로젯</strong></span><span>RISA LISA</span><span>BL</span>
										</a>
									</div>
								</div>
								<div class="comic">
									<p>
										<strong>괴 (연재)</strong><span>야설록</span>
									</p>
									<div>
										<a title="괴 (연재)" href="/comic/goe">
											<div>
												<img
													src="https://img.mrblue.com/prod_img/comics/goe/main_large.jpg"
													alt="">
											</div> <span><strong>괴 (연재)</strong></span><span>야설록</span><span>무협</span>
										</a>
									</div>
								</div>
								<div class="fiction">
									<p>
										<strong>무인이곽 (연재)</strong><span>우각</span>
									</p>
									<div>
										<a title="무인이곽 (연재)" href="/novel/E000072153">
											<div>
												<img
													src="https://img.mrblue.com/prod_img/ebook/E000072153/main_large.jpg"
													alt="">
											</div> <span><strong>무인이곽 (연재)</strong></span><span>우각</span><span>무협</span>
										</a>
									</div>
								</div>
							</li>
							
							<li class="top-rank top-one">
								<p class="rank">
									<span><strong>1</strong></span><span class="icon"></span>
								</p>
								<div class="webtoon">
									<p>
										<strong>인 마이 클로젯</strong><span>RISA LISA</span>
									</p>
									<div>
										<a title="인 마이 클로젯" href="/webtoon/wt_closet_wz">
											<div>
												<img
													src="https://img.mrblue.com/prod_img/comics/wt_closet_wz/thumb_sq.jpg"
													alt="">
											</div> <span><strong>인 마이 클로젯</strong></span><span>RISA LISA</span><span>BL</span>
										</a>
									</div>
								</div>
								<div class="comic">
									<p>
										<strong>괴 (연재)</strong><span>야설록</span>
									</p>
									<div>
										<a title="괴 (연재)" href="/comic/goe">
											<div>
												<img
													src="https://img.mrblue.com/prod_img/comics/goe/main_large.jpg"
													alt="">
											</div> <span><strong>괴 (연재)</strong></span><span>야설록</span><span>무협</span>
										</a>
									</div>
								</div>
								<div class="fiction">
									<p>
										<strong>무인이곽 (연재)</strong><span>우각</span>
									</p>
									<div>
										<a title="무인이곽 (연재)" href="/novel/E000072153">
											<div>
												<img
													src="https://img.mrblue.com/prod_img/ebook/E000072153/main_large.jpg"
													alt="">
											</div> <span><strong>무인이곽 (연재)</strong></span><span>우각</span><span>무협</span>
										</a>
									</div>
								</div>
							</li>
            
							<!-- 									<li class="top-rank"> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>2</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>겨울 지나 벚꽃</strong><span>밤우</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="겨울 지나 벚꽃" href="/webtoon/wt_blossom_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_blossom_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>겨울 지나 벚꽃</strong></span><span>밤우</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>일대검호</strong><span>황성</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="일대검호" href="/comic/C000045625"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/C000045625/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>일대검호</strong></span><span>황성</span><span>무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>재벌가 망나니 (연재)</strong><span>한유림</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="재벌가 망나니 (연재)" href="/novel/munpia0949"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/munpia0949/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>재벌가 망나니 (연재)</strong></span><span>한유림</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li class="top-rank"> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>3</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>어는점</strong><span>MEL</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="어는점" href="/webtoon/wt_freezing_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_freezing_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>어는점</strong></span><span>MEL</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>일검진천 [개정판]</strong><span>묵검향</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="일검진천 [개정판]" href="/comic/kocncm_0525"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/kocncm_0525/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>일검진천 [개정판]</strong></span><span>묵검향</span><span>무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>의술 펼치는 왕자님 (연재)</strong><span>목직</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="의술 펼치는 왕자님 (연재)" href="/novel/E000072283"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/E000072283/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>의술 펼치는 왕자님 (연재)</strong></span><span>목직</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>4</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>살벌한 동거</strong><span>하엘 / 백하나</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="살벌한 동거" href="/webtoon/wt_scary_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_scary_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>살벌한 동거</strong></span><span>하엘 / 백하나</span><span>로맨스</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>사류무사 (연재)</strong><span>황성</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="사류무사 (연재)" href="/comic/4ryumusa"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/4ryumusa/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>사류무사 (연재)</strong></span><span>황성</span><span>무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>음악천재 재벌3세 (연재)</strong><span>성불예정</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="음악천재 재벌3세 (연재)" href="/novel/E000072188"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/E000072188/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>음악천재 재벌3세 (연재)</strong></span><span>성불예정</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li class=""> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>5</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>화룡기</strong><span>명월당</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="화룡기" href="/webtoon/wt_hwalyong_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_hwalyong_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>화룡기</strong></span><span>명월당</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>제왕의 꽃 [스크롤]</strong><span>토연 / 이승희</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="제왕의 꽃 [스크롤]" href="/comic/C000045734"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/C000045734/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>제왕의 꽃 [스크롤]</strong></span><span>토연 / 이승희</span><span>순정</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>슬러거 포수 강건후 (연재)</strong><span>온필수</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="슬러거 포수 강건후 (연재)" href="/novel/E000072243"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/E000072243/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>슬러거 포수 강건후 (연재)</strong></span><span>온필수</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>6</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>괴 [스크롤]</strong><span>야설록</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="괴 [스크롤]" href="/webtoon/wt_goe_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_goe_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>괴 [스크롤]</strong></span><span>야설록</span><span>액션</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>일상다정사</strong><span>김세영</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="일상다정사" href="/comic/wbeast_0005"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wbeast_0005/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>일상다정사</strong></span><span>김세영</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>칼끝에 천하를 묻다</strong><span>오채지</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="칼끝에 천하를 묻다" href="/novel/baro689111"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/baro689111/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>칼끝에 천하를 묻다</strong></span><span>오채지</span><span>신무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>7</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>나만의 스폰서</strong><span>최경아</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="나만의 스폰서" href="/webtoon/wt_sponsor_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_sponsor_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>나만의 스폰서</strong></span><span>최경아</span><span>로맨스</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>군주의 여인(컬러연재)</strong><span>박다연 / 원작 독연</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="군주의 여인(컬러연재)" href="/comic/monarchlady_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/monarchlady_wz/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>군주의 여인(컬러연재)</strong></span><span>박다연 / 원작 독연</span><span>순정</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>신투, 천하를 훔치다 (연재)</strong><span>윤하준</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="신투, 천하를 훔치다 (연재)" href="/novel/E000072285"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/E000072285/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>신투, 천하를 훔치다 (연재)</strong></span><span>윤하준</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>8</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>스머프 월드 [일반판]</strong><span>오태 / 제이제이</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="스머프 월드 [일반판]" href="/webtoon/wt_smurf15_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_smurf15_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>스머프 월드 [일반판]</strong></span><span>오태 / 제이제이</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>견자전설</strong><span>황성</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="견자전설" href="/comic/gjjs_hs"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/gjjs_hs/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>견자전설</strong></span><span>황성</span><span>무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>아빠가 너무 강함 (연재)</strong><span>개벽s</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="아빠가 너무 강함 (연재)" href="/novel/jplus0185"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/jplus0185/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>아빠가 너무 강함 (연재)</strong></span><span>개벽s</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>9</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>쉿, 아기가 자고 있어요</strong><span>몽글</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="쉿, 아기가 자고 있어요" href="/webtoon/wt_sleeping_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_sleeping_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>쉿, 아기가 자고 있어요</strong></span><span>몽글</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>도편수 [개정판]</strong><span>묵검향</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="도편수 [개정판]" href="/comic/kocncm_0268"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/kocncm_0268/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>도편수 [개정판]</strong></span><span>묵검향</span><span>무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>재벌집 서자, 그레이트 어게인 (연재)</strong><span>굿라이버</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="재벌집 서자, 그레이트 어게인 (연재)" href="/novel/jplus0309"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/jplus0309/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>재벌집 서자, 그레이트 어게인 (연재)</strong></span><span>굿라이버</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
							<!-- 									<li class="last"> -->
							<!-- 									<p class="rank"> -->
							<!-- 										<span><strong>10</strong></span><span class="icon"></span> -->
							<!-- 									</p> -->
							<!-- 									<div class="webtoon"> -->
							<!-- 										<p> -->
							<!-- 											<strong>최강의 냄새</strong><span>이만세</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="최강의 냄새" href="/webtoon/wt_strongest_wz"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/wt_strongest_wz/thumb_sq.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>최강의 냄새</strong></span><span>이만세</span><span>BL</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="comic"> -->
							<!-- 										<p> -->
							<!-- 											<strong>천년왕</strong><span>황성</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="천년왕" href="/comic/chunnwang"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/comics/chunnwang/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>천년왕</strong></span><span>황성</span><span>무협</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									<div class="fiction"> -->
							<!-- 										<p> -->
							<!-- 											<strong>템빨 (연재)</strong><span>박새날</span> -->
							<!-- 										</p> -->
							<!-- 										<div> -->
							<!-- 											<a title="템빨 (연재)" href="/novel/se1610"> -->
							<!-- 											<div> -->
							<!-- 												<img src="https://img.mrblue.com/prod_img/ebook/se1610/main_large.jpg" alt=""> -->
							<!-- 											</div> -->
							<!-- 											<span><strong>템빨 (연재)</strong></span><span>박새날</span><span>판타지</span></a> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<!-- 									</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main-inner">
		<div class="main_new_book">
			<div class="md">
				<div class="md-title">
					<h3 class="coTitle">신간</h3>
					<a href="https://www.bookcube.com/new.asp?page=nm" class="more">더보기</a>
				</div>
				
				<ul>
					<%
						for(int i = 0; i < bookList.size(); i++) {
					%>
					<li>
						<div class="figure">
							<a href="BookDetail.bok?isbn<%=bookList.get(i).getIsbn()%>">
								<span class="rm_br">
									<img src="https://bookimg.bookcube.com/150/2011/201100479.jpg" alt="도서 이미지 - 가족사진">
								</span> 
<!-- 								<span class="light"></span> -->
							</a>
						</div>
						
						<div class="hot-info">
							<p class="hot-title">
								<a href="BookDetail.bok?isbn<%=bookList.get(i).getIsbn()%>"><%=bookList.get(i).getTitle() %>도서명</a>
							</p>
							<p><%=bookList.get(i).getAuthor() %>저자명</p>
						</div>
					</li>
					
					<li>
						<div class="figure">
							<a href="https://www.bookcube.com/detail.asp?series_num=920030020&amp;page=">
								<span class="rm_br">
									<img src="https://bookimg.bookcube.com/150/2011/201100501.jpg" alt="도서 이미지 - 30 Lessons on Grammar">
								</span> 
								<span class="light"></span>
							</a>
						</div>
						
						<div class="hot-info">
							<p class="hot-title">
								<a href="https://www.bookcube.com/detail.asp?series_num=920030020&amp;page=">30 Lessons on Grammar</a>
							</p>
							<p>Michael A. Putlack</p>
						</div>
					</li>
					
<!-- 					<li> -->
<!-- 						<div class="figure"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920030035&amp;page="> -->
<!-- 								<span class="rm_br"><img -->
<!-- 									src="https://bookimg.bookcube.com/150/2011/201100522.jpg" -->
<!-- 									alt="도서 이미지 - 7대 이슈로 보는 돈의 역사"></span> <span class="light"></span> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 						<div class="hot-info"> -->
<!-- 							<p class="hot-title"> -->
<!-- 								<a -->
<!-- 									href="https://www.bookcube.com/detail.asp?series_num=920030035&amp;page=">7대 -->
<!-- 									이슈로 보는 돈의 역사</a> -->
<!-- 							</p> -->
<!-- 							<p>홍춘욱</p> -->
<!-- 						</div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="figure"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920029992&amp;page="> -->
<!-- 								<span class="rm_br"><img -->
<!-- 									src="https://bookimg.bookcube.com/150/2011/201100475.jpg" -->
<!-- 									alt="도서 이미지 - 10대가 알아야 할 미래직업의 이동 (개정판)"></span> <span -->
<!-- 								class="light"></span> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 						<div class="hot-info"> -->
<!-- 							<p class="hot-title"> -->
<!-- 								<a -->
<!-- 									href="https://www.bookcube.com/detail.asp?series_num=920029992&amp;page=">10대가 -->
<!-- 									알아야 할 미래직업의 이동 ...</a> -->
<!-- 							</p> -->
<!-- 							<p>박종서,신지나,민준홍</p> -->
<!-- 						</div> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<div class="figure"> -->
<!-- 							<a -->
<!-- 								href="https://www.bookcube.com/detail.asp?series_num=920029977&amp;page="> -->
<!-- 								<span class="rm_br"><img -->
<!-- 									src="https://bookimg.bookcube.com/150/2011/201100517.jpg" -->
<!-- 									alt="도서 이미지 - 걸스 라이크 어스"></span> <span class="light"></span> -->
<!-- 							</a> -->
<!-- 						</div> -->
<!-- 						<div class="hot-info"> -->
<!-- 							<p class="hot-title"> -->
<!-- 								<a -->
<!-- 									href="https://www.bookcube.com/detail.asp?series_num=920029977&amp;page=">걸스 -->
<!-- 									라이크 어스</a> -->
<!-- 							</p> -->
<!-- 							<p>크리스티나 앨저</p> -->
<!-- 						</div> -->
<!-- 					</li> -->
					<%} %>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="main-inner">
		<div class="main_free_book">
			<div class="md">
				<div class="md-title">
					<h3 class="coTitle">무료</h3>
					<a href="https://www.bookcube.com/free.asp?page=nm" class="more">더보기</a>
				</div>
				<ul>
					<li>
						<div class="figure">
							<span class="label"><em>1권 <span>무료</span></em></span> <a
								href="https://www.bookcube.com/detail.asp?series_num=920029949&amp;page=buy">
								<span class="rm_br"><img
									src="https://bookimg.bookcube.com/150/2011/201100426.jpg"
									alt="도서 이미지 - 대한민국 상가투자 지도 (체험판)"></span> <span class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a
									href="https://www.bookcube.com/detail.asp?series_num=920029949&amp;page=buy">대한민국
									상가투자 지도 (체험판)</a>
							</p>
							<p>김종율</p>
						</div>
					</li>
					<li>
						<div class="figure">
							<span class="label"><em>1권 <span>무료</span></em></span> <a
								href="https://www.bookcube.com/detail.asp?series_num=920029937&amp;page=buy">
								<span class="rm_br"><img
									src="https://bookimg.bookcube.com/150/2011/201100459.jpg"
									alt="도서 이미지 - 파워풀 (체험판)"></span> <span class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a
									href="https://www.bookcube.com/detail.asp?series_num=920029937&amp;page=buy">파워풀
									(체험판)</a>
							</p>
							<p>패티 맥코드</p>
						</div>
					</li>
					<li>
						<div class="figure">
							<span class="label"><em>1권 <span>무료</span></em></span> <a
								href="https://www.bookcube.com/detail.asp?series_num=920029935&amp;page=buy">
								<span class="rm_br"><img
									src="https://bookimg.bookcube.com/150/2011/201100457.jpg"
									alt="도서 이미지 - 마음아, 넌 누구니 (체험판)"></span> <span class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a
									href="https://www.bookcube.com/detail.asp?series_num=920029935&amp;page=buy">마음아,
									넌 누구니 (체험판)</a>
							</p>
							<p>박상미</p>
						</div>
					</li>
					<li>
						<div class="figure">
							<span class="label"><em>1권 <span>무료</span></em></span> <a
								href="https://www.bookcube.com/detail.asp?series_num=920029931&amp;page=buy">
								<span class="rm_br"><img
									src="https://bookimg.bookcube.com/150/2011/201100440.jpg"
									alt="도서 이미지 - 초역 다빈치 노트 (체험판)"></span> <span class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a
									href="https://www.bookcube.com/detail.asp?series_num=920029931&amp;page=buy">초역
									다빈치 노트 (체험판)</a>
							</p>
							<p>사쿠라가와 다빈치</p>
						</div>
					</li>
					<li>
						<div class="figure">
							<span class="label"><em>1권 <span>무료</span></em></span> <a
								href="https://www.bookcube.com/detail.asp?series_num=920029929&amp;page=buy">
								<span class="rm_br"><img
									src="https://bookimg.bookcube.com/150/2011/201100438.jpg"
									alt="도서 이미지 - 주식, 나는 대가처럼 투자한다 (체험판)"></span> <span
								class="light"></span>
							</a>
						</div>
						<div class="hot-info">
							<p class="hot-title">
								<a
									href="https://www.bookcube.com/detail.asp?series_num=920029929&amp;page=buy">주식,
									나는 대가처럼 투자한다 (체험판)</a>
							</p>
							<p>강영연, 최재원</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp" />
