<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"/>
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME > 문학</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="detail-inner">
			<div class="search-result">
				<h3 class="coTitle">문학</h3>
				<div class="field">
					<ul class="field-list">
						<li><a href="/categorylist.asp?mainclass_num=00" class="on">전체</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=00" class="">동/서양 고전문학</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=01" class="">신화와 설화</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=02" class="">한국 고전문학</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=03" class="">문학비평/평론</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=04" class="">문학사/이론</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=05" class="">창작/문장작법</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=06" class="">국내소설</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=07" class="">해외소설</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=08" class="">시/희곡</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=09" class="">에세이/산문</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=10" class="">SF/판타지</a></li>
								<li><a href="/categorylist.asp?mainclass_num=00&subclass_num=11" class="">추리/미스터리/스릴러</a></li>
					</ul>
					
					<div class="main_event"></div>						
				</div>
				<div class="tab">
					<ul class="tab-list">
						<li><a href="../sub1/list.html" class="">전체</a></li>
						<li><a href="../sub1/list_best.html" class="on">베스트</a></li>
						<li><a href="../sub1/list_new.html" class="">신간</a></li>
						<li><a href="../sub1/list_free.html" class="">무료</a></li>
					</ul>
					<div class="list-sort">
						<div class="k-array">
							<input type="radio" name="" id="">
							<label for="" class="radio" data-sort="주간베스트"><span class="radio_on"><em>주간베스트</em></span></label>
							<input type="radio" name="" id="">
							<label for="" class="radio" data-sort="연간베스트"><span class="radio_off"><em>연간베스트</em></span></label>
							<input type="radio" name="" id="">
							<label for="" class="radio" data-sort="누적베스트"><span class="radio_off"><em>누적베스트</em></span></label>
						</div>
						
						<div class="view-array">
							<div class="arrayBox">
								<a href="javascript:;" class="s-result" title="해당 리스트 정렬">전체</a>
								<ul>
									<li><a href="#" data-list-type="" class="on">전체</a><span></span></li>
									<!--li><a href="#" data-list-type="10년소장" class="">10년소장</a><span></span></li-->
									<li><a href="#" data-list-type="대여" class="">대여</a><span></span></li>
									<li><a href="#" data-list-type="정액" class="">정액</a><span></span></li>
								</ul>
								<script>
									$(function(){
										$(".s-result").on("click focus",function(){
											$(this).next().show();
										});
										$(document).on("click",".arrayBox ul li a",function(){
											var text = $(this).text();
											$(this).parent().parent().find("li a").removeClass("on");
											$(this).parent().parent().hide();
											$(this).addClass("on");
											$(this).parent().parent().prev().text(text);

											goUrl('/categorylist.asp?page='+ $(".wrap").data("page") +'&mainclass_num='+ $(".wrap").data("mainclass-num") +'&subclass_num='+ $(".wrap").data("subclass-num") +'&sort='+ $(".wrap").data("sort") +'&list_type='+ $(this).data("list-type")) ;
											return false;
										});
									});
								</script>
							</div>
							<div class="view-select">
								<ul>
									<li class="list"><a href="javascript:;" class="">리스트보기</a></li>
									<li class="thum"><a href="javascript:;" class="on">썸네일보기</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="list-page">
						<div class="thum"> <!-- *****list thum 클래스 차이로 리스트보기와 썸네일 보기로 변경됩니다.*****-->
							<ul class="book-list">	
									<li>
										<!--div class="rank">1</div-->
										<div class="figure">
											<a href="detail.html">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1402/140229907.jpg" alt="도서 이미지 - 신 밤의 대통령" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914002292&page=">신 밤의 대통령</a></p>
											<p class="hot-author">이원호<em>|</em><a href="/search.asp?searchString=%EB%84%A4%EC%98%A4%ED%94%BD%EC%85%98&searchOption=publisher">네오픽션</a><em>|</em>2014.02.26</p>
											<div class="hot-score">
												<p><span class="list-star rank8"></span><i><em>8.0</em> (10명)</i><em>|</em>총 2권<em class="end-result">완결</em></p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>밀리언셀러 작가 이원호 신작 장편소설

지방의 폭력조직에서 세계를 넘나드는 기업형 그룹을 탄생시키며
남자의 거대한 야망을 현실로 만들어낸 인물, 백광!

치밀한 전략, 목숨...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>2,000원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">2</div-->
										<div class="figure">
											<a href="detail.html">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005412.jpg" alt="도서 이미지 - 두 번째 거짓말" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920029717&page=">두 번째 거짓말</a></p>
											<p class="hot-author">정해연<em>|</em><a href="/search.asp?searchString=%EC%9A%94%EB%8B%A4%28%ED%95%9C%EA%B5%AD%EC%B6%9C%ED%8C%90%EB%A7%88%EC%BC%80%ED%8C%85%EC%97%B0%EA%B5%AC%EC%86%8C%29&searchOption=publisher">요다(한국출판마케팅연구소)</a><em>|</em>2020.11.02</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>『내가 죽였다』 『어위크』 『유괴의 날』 등으로 한국 스릴러의 대표 작가로 자리매김한 정해연의 여섯 번째 장편. 요다 픽션(Yoda Fiction) 시리즈의 두 번째 작품이기도 하다. 전...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>9,800원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">3</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=918012738&page=">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1804/180401295.jpg" alt="도서 이미지 - 너의 췌장을 먹고 싶어" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918012738&page=">너의 췌장을 먹고 싶어</a></p>
											<p class="hot-author">스미노 요루<em>|</em><a href="/search.asp?searchString=%EC%86%8C%EB%AF%B8%EB%B6%81%EC%8A%A4&searchOption=publisher">소미북스</a><em>|</em>2018.04.13</p>
											<div class="hot-score">
												<p><span class="list-star rank8"></span><i><em>7.4</em> (7명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>2016년 일본 서점 대상 2위에 오른 스미노 요루의 첫 소설이다. 시한부 선고를 받은 소녀와 함께한 어느 소년의 이야기를 그리고 있다. ‘요루노 야스미’라는 필명으로 소설 투고...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>9,700원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">4</div-->
										<div class="figure">
											<a href="detail.html">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201003358.jpg" alt="도서 이미지 - 대통령이 사라졌다 1" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920028772&page=">대통령이 사라졌다 1</a></p>
											<p class="hot-author">빌 클린턴, 제임스 패터슨<em>|</em><a href="/search.asp?searchString=%EB%B2%A0%EB%A6%AC%ED%83%80%EC%8A%A4&searchOption=publisher">베리타스</a><em>|</em>2020.10.28</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>뉴욕 타임스, 아마존, USA 투데이,
월스트리트 저널, 인디 베스트셀러 1위
전 세계 36개국 판권 계약
미국 SHOWTIME에서 드라마 제작 중

미국 42대 대통령 빌 클린턴
세계적인 베스...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,600원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">5</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=914020296&page=">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1407/140701678.jpg" alt="도서 이미지 - 나 자신의 노래" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914020296&page=">나 자신의 노래</a></p>
											<p class="hot-author">월트 휘트먼<em>|</em><a href="/search.asp?searchString=%EC%A7%80%EC%8B%9D%EC%9D%84%EB%A7%8C%EB%93%9C%EB%8A%94%EC%A7%80%EC%8B%9D&searchOption=publisher">지식을만드는지식</a><em>|</em>2014.07.12</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>지식을 만드는 고전선집『나 자신의 노래』. 이 책은 휘트먼의 모든 시 가운데서도 가장 유명하고 핵심적인 작품으로, 총 52부로 되어 있는 장시다. 민주주의 정신을 바탕에 두고 ...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>9,600원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">6</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920020151&page=">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2007/200707030.jpg" alt="도서 이미지 - 달러구트 꿈 백화점" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920020151&page=">달러구트 꿈 백화점</a></p>
											<p class="hot-author">이미예<em>|</em><a href="/search.asp?searchString=%EB%B6%81%EB%8B%BB&searchOption=publisher">북닻</a><em>|</em>2020.07.28</p>
											<div class="hot-score">
												<p><span class="list-star rank4"></span><i><em>4.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>여기는 잠들어야만 입장할 수 있는 ‘달러구트 꿈 백화점’입니다

잠들어야만 입장할 수 있는 독특한 마을. 그곳에 들어온 잠든 손님들에게 가장 인기 있는 곳은, 온갖 꿈을 한데...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,100원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">7</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=912000388&page=">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1203/120302556.jpg" alt="도서 이미지 - 땅의 전쟁" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=912000388&page=">땅의 전쟁</a></p>
											<p class="hot-author">이원호<em>|</em><a href="/search.asp?searchString=%EC%9E%90%EC%9D%8C%EA%B3%BC%EB%AA%A8%EC%9D%8C&searchOption=publisher">자음과모음</a><em>|</em>2012.03.29</p>
											<div class="hot-score">
												<p><span class="list-star rank8"></span><i><em>8.0</em> (1명)</i><em>|</em>총 2권<em class="end-result">완결</em></p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>한국 최고의 밀리언셀러 작가 이원호 장편소설 
1970년대 강남에 휘몰아친 생존과 야망의 전쟁사 
개발을 둘러싼 정치권과 조직들 간 블랙 커넥션 

1970년대 강남의 초창기 모습...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>8,100원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">8</div-->
										<div class="figure">
											<span class="label"><em>10%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=914034075&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1408/140802777.jpg" alt="도서 이미지 - 은하영웅전설  9 - 회천편" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914034075&page=buy">은하영웅전설  9 - 회천편</a></p>
											<p class="hot-author">다나카 요시키<em>|</em><a href="/search.asp?searchString=%EB%94%94%EC%95%A4%EC%94%A8%EB%B6%81%EC%8A%A4&searchOption=publisher">디앤씨북스</a><em>|</em>2014.08.22</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>우주를 수놓는 장대한 신화, 불멸의 영웅들이 되살아난다!  
일본 최신 판본을 반영한 국내 최초 공개 전자책! 

인류가 우주로 진출한 먼 미래, 전제주의 체제 '은하제국'의 영웅 ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>5,400원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">9</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=913005680&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1304/130400002.jpg" alt="도서 이미지 - 안나 카레니나" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=913005680&page=buy">안나 카레니나</a></p>
											<p class="hot-author">레프 니콜라예비치 톨스토이<em>|</em><a href="/search.asp?searchString=%EC%8A%A4%EB%A7%88%ED%8A%B8%EB%B6%81&searchOption=publisher">스마트북</a><em>|</em>2013.04.06</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>처음으로 경험하는 삶의 충만감과 전 존재를 뒤흔드는 빛
그 격정에 전부를 바친 한 여인의 처절한 인생 
인간이 처한 삶의 공통 문제를 빼어난 심리적 통찰로 다룬 소설 

...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>4,900원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">10</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920028075&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201001948.jpg" alt="도서 이미지 - 길들여지는 사이" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920028075&page=buy">길들여지는 사이</a></p>
											<p class="hot-author">라일락<em>|</em><a href="/search.asp?searchString=%EC%95%84%EB%A6%AC%EC%95%84&searchOption=publisher">아리아</a><em>|</em>2020.10.18</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>항상 제멋대로인 그녀 "윤서이"
하지만 그런 그녀에게 꼼짝 못하는 남자 "김철수"

그런 그들은 서로가 서로에게 길들여지고 있다.
평범하면서도 평범하지 않은, 둘이 연인이 되는 ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>2,900원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">11</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=917010652&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1701/170106918.jpg" alt="도서 이미지 - 갈매기의 꿈 (범우문고 028)" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=917010652&page=buy">갈매기의 꿈 (범우문고 028)</a></p>
											<p class="hot-author">리처드 바크<em>|</em><a href="/search.asp?searchString=%EB%B2%94%EC%9A%B0%EC%82%AC&searchOption=publisher">범우사</a><em>|</em>2017.01.17</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>가장 높이 나는 갈매기가 가장 멀리 본다

우리 모두 속에 살고 있는 진정한 갈매기 조나단에게......

자유에 대한 끝없는 갈망을 노래한 소설

갈매기 조나단의 비상을 통해 완전한...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>2,500원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">12</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=909005245&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/0908/090800419.jpg" alt="도서 이미지 - 이방인" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=909005245&page=buy">이방인</a></p>
											<p class="hot-author">알베르 까뮈<em>|</em><a href="/search.asp?searchString=%EC%B2%AD%EB%AA%A9%EC%82%AC&searchOption=publisher">청목사</a><em>|</em>2010.01.04</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>카뮈의 〈이방인〉은 죽음이라는 한계 상황 앞에서 인간의 노력이란 것이 얼마나 부질없으며 한편으로는 그 죽음을 향해 맹렬히 나아가는 인간존재가 얼마나 위대한지 생각할 수 있게...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>2,000원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">13</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=909005249&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/0908/090800423.jpg" alt="도서 이미지 - 좁은문" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=909005249&page=buy">좁은문</a></p>
											<p class="hot-author">앙드레 지드<em>|</em><a href="/search.asp?searchString=%EC%B2%AD%EB%AA%A9%EC%82%AC&searchOption=publisher">청목사</a><em>|</em>2010.01.04</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>이종 남매 제롬과 알리사간의 사랑의 사연을 제롬의 독백과 편지 및 알리사의 일기를 통해 엮어나간 것으로 지드의 소설 중 가장 광범위한 독자층을 획득한 소설이다.</p>
											</div>
											<div class="hot-cash"><p>구매 <span>2,000원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">14</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=915006094&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1501/150103426.jpg" alt="도서 이미지 - 데카메론" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=915006094&page=buy">데카메론</a></p>
											<p class="hot-author">지오반니 보카치오<em>|</em><a href="/search.asp?searchString=%ED%94%84%EB%A6%AC%EC%9C%8C&searchOption=publisher">프리윌</a><em>|</em>2015.01.29</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>이 전자책은 지오반니 보카치오의 단편소설집 〈데카메론〉의 집필 배경과 작가에 얽힌 에피소드, 작품의 줄거리, 문학사적 의미와 평가, 국내에 출간된 도서정보, 영화정보 등을 아...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>1,800원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">15</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=916048791&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1606/160604131.jpg" alt="도서 이미지 - 멋진 신세계" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=916048791&page=buy">멋진 신세계</a></p>
											<p class="hot-author">올더스 헉슬리<em>|</em><a href="/search.asp?searchString=%EC%86%8C%EB%A6%AC%EC%9A%B8%EB%A6%BC&searchOption=publisher">소리울림</a><em>|</em>2016.06.24</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (2명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>이 전자책은올더스 헉슬리의 소설 〈멋진 신세계〉의 집필 배경과 작가에 얽힌 에피소드, 작품의 줄거리, 문학사적 의미와 평가, 국내에 출간된 도서정보, 영화정보 등을 아주 간략...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>1,400원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">16</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920014477&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2006/200600772.jpg" alt="도서 이미지 - 칼데콧 형제의 이솝우화" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920014477&page=buy">칼데콧 형제의 이솝우화</a></p>
											<p class="hot-author">이솝, 알프레드 칼데콧, 랜돌프 칼데콧<em>|</em><a href="/search.asp?searchString=%EC%99%93%EB%B6%81&searchOption=publisher">왓북</a><em>|</em>2020.06.05</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>2500년 전 인류의 지혜와 삶의 교훈을 담아낸 책, 이솝 우화!
정보가 범람하는 시대에 양질의 읽을거리를 찾아내어 읽는 일은 독자들의 고민이다. 그래서 지혜로운 사람들은 역사적...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>1,000원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">17</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=918029704&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1807/180707820.jpg" alt="도서 이미지 - 구마검" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918029704&page=buy">구마검</a></p>
											<p class="hot-author">이해조<em>|</em><a href="/search.asp?searchString=%ED%86%A0%EC%A7%80&searchOption=publisher">토지</a><em>|</em>2018.07.09</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>구마검(驅魔劒)
이해조(李海朝)가 지은 신소설.

1908년대한서림(大韓書林)에서 출간하였다. 중국 만청(晩淸)의 견책소설(譴責小說)인 장자(壯者)의 「소미추(掃迷帚)」에서 영향을 ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>1,000원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">18</div-->
										<div class="figure">
											<span class="label"><em>50%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=914016338&page=rental">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1404/140404243.jpg" alt="도서 이미지 - 보바리 부인" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914016338&page=rental">보바리 부인</a></p>
											<p class="hot-author">귀스타브 플로베르<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%EC%98%88%EC%B6%9C%ED%8C%90%EC%82%AC&searchOption=publisher">문예출판사</a><em>|</em>2014.05.16</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>프랑스 사실주의 소설의 초석'으로 일컬어지는 작품으로, 19세기 프랑스 작가 귀스타브 플로베르가 1857년에 발표했다. 평범한 일상생활에 환멸을 느끼고 허영과 불륜으로 자신을 ...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>5,400원</span></p><p>대여 <span>3,000원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">19</div-->
										<div class="figure">
											<span class="label"><em>50%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=915017029&page=rental">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1507/150700011.jpg" alt="도서 이미지 - 사람은 무엇으로 사는가" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=915017029&page=rental">사람은 무엇으로 사는가</a></p>
											<p class="hot-author">레프 니콜라예비치 톨스토이<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%EC%98%88%EC%B6%9C%ED%8C%90%EC%82%AC&searchOption=publisher">문예출판사</a><em>|</em>2015.07.02</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>사람은 무엇으로 살아야 하는가?
세계적 문호 톨스토이가 답하는 인생의 지혜가 담긴 명작! 

19세기 러시아문학을 대표하는 세계적 문호이자 대사상가인 톨스토이의 중‧단편 약 50편...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>3,600원</span></p><p>대여 <span>2,000원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">20</div-->
										<div class="figure">
											<span class="label"><em>10%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=919023068&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1909/190903266.jpg" alt="도서 이미지 - 하얼빈" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=919023068&page=buy">하얼빈</a></p>
											<p class="hot-author">이효석<em>|</em><a href="/search.asp?searchString=%EB%8B%A4%EC%98%A8%EA%B8%B8&searchOption=publisher">다온길</a><em>|</em>2019.09.11</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>이효석의 소설이다.

한국을 대표하는 문학작품들을 읽으면 그 시대의 삶과 경험이 고스란히 드러나 있다.

'과거를 잊은 민족에게는 미래는 없다'는 이야기가 있듯, 과거의 한국문학...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>810원</span></p><p>대여 <span>450원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">21</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=911000327&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1105/110500118.jpg" alt="도서 이미지 - 치우천왕기" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=911000327&page=buy">치우천왕기</a></p>
											<p class="hot-author">이우혁<em>|</em><a href="/search.asp?searchString=%EC%97%98%EB%A6%AD%EC%8B%9C%EB%A5%B4&searchOption=publisher">엘릭시르</a><em>|</em>2011.05.13</p>
											<div class="hot-score">
												<p><span class="list-star rank7"></span><i><em>7.2</em> (13명)</i><em>|</em>총 6권<em class="end-result">완결</em></p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>『퇴마록』과 『왜란종결자』의 신화를 잇는 한국 판타지의 결정판 드디어 완결! 
이제껏 우리가 외면했던 영웅, 치우천왕이 돌아왔다! 

단군 이전의 영웅 치우천, 치우비 형제...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,800원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">22</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=914014160&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1403/140306110.jpg" alt="도서 이미지 - 영한대역 삼국지 (전20권)" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914014160&page=buy">영한대역 삼국지 (전20권)</a></p>
											<p class="hot-author">나관중, 모종강<em>|</em><a href="/search.asp?searchString=%EB%B9%84%EC%9A%98%EB%93%9C%EC%98%AC&searchOption=publisher">비욘드올</a><em>|</em>2014.03.26</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>〈강추!〉『Romance of the Three Kingdoms 세트』는 중졸 수준의 영어 실력만 있는 독자라면 누구나 '내용 중심 읽기를 통한 영어 공부'를 손쉽게 할 수 있도록 정밀하게 기획하여...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>200,000원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">23</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920022533&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2008/200803062.jpg" alt="도서 이미지 - 당나라 퇴마사 세트" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920022533&page=buy">당나라 퇴마사 세트</a></p>
											<p class="hot-author">왕칭촨<em>|</em><a href="/search.asp?searchString=%EB%A7%88%EC%8B%9C%EB%A9%9C%EB%A1%9C&searchOption=publisher">마시멜로</a><em>|</em>2020.08.18</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>《당나라 퇴마사》전 3권 완역 세트 출간!
중국 서점 종합 베스트셀러 
웨이보 주최 웨이소설대회 대상 수상 
아시아 좋은 책 차트 평점 9.6점에 빛나는 중국드라마․영화화 예정작
...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>32,000원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">24</div-->
										<div class="figure">
											<span class="label"><em>10%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=918061449&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1812/181202329.jpg" alt="도서 이미지 - [세트] 천년의 우화 컬렉션: 동물 편 (전9권)" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918061449&page=buy">[세트] 천년의 우화 컬렉션: 동물 편 (전9권)</a></p>
											<p class="hot-author">박지원 외<em>|</em><a href="/search.asp?searchString=%EB%8F%8C%EB%8F%84%EB%9E%98&searchOption=publisher">돌도래</a><em>|</em>2018.12.14</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>픽사, 디즈니를 뛰어넘는 상상력을 우리 옛 우화 소설 속에서 만난다
- 서울대학교 등 전국 주요 대학 필독서와 접하기 어려운 희귀 작품이 한가득!
- 그동안 어려웠던 우리 옛 우화...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>18,270원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">25</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=919025365&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1910/191001860.jpg" alt="도서 이미지 - 작은 아씨들_걸 클래식 컬렉션" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=919025365&page=buy">작은 아씨들_걸 클래식 컬렉션</a></p>
											<p class="hot-author">루이자 메이 올컷<em>|</em><a href="/search.asp?searchString=%EC%9C%8C%EB%B6%81&searchOption=publisher">윌북</a><em>|</em>2019.10.14</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>★ 〈타임〉 선정 최고의 100대 소설
★ 50개 언어로 출간되어 세대를 이어가며 사랑받은 고전 위의 고전
★ 조앤 K. 롤링, 시몬 드 보부아르, 줌파 라히리, 힐러리 클린턴, 거트루드...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>11,900원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">26</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=919021270&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1908/190804976.jpg" alt="도서 이미지 - 녹두꽃 2" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=919021270&page=buy">녹두꽃 2</a></p>
											<p class="hot-author">정현민<em>|</em><a href="/search.asp?searchString=%EB%B6%81%EB%A1%9C%EA%B7%B8%EC%BB%B4%ED%8D%BC%EB%8B%88&searchOption=publisher">북로그컴퍼니</a><em>|</em>2019.08.26</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>흰옷의 백성들이 죽창을 들고 모여드니
앉으면 죽산(竹山)이요, 서면 백산(白山)이라!
갑오년의 위대한 백성들에게 바치는 헌사!

동학농민혁명은 봉건의 한 시대를 마감하고 근대의...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>11,900원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">27</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=915023430&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1510/151002805.jpg" alt="도서 이미지 - 전쟁은 여자의 얼굴을 하지 않았다" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=915023430&page=buy">전쟁은 여자의 얼굴을 하지 않았다</a></p>
											<p class="hot-author">스베틀라나 알렉시예비치<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%ED%95%99%EB%8F%99%EB%84%A4&searchOption=publisher">문학동네</a><em>|</em>2015.10.16</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>2015 노벨문학상 수상 
 다성악 같은 글쓰기로 
 우리 시대의 고통과 용기를 담아낸 기념비적 문학 
_노벨문학상 선정 이유 

“나는 이 책을 읽을 사람도 불쌍하고 
 읽지 않...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>11,200원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">28</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=918016296&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1805/180503027.jpg" alt="도서 이미지 - 미미일소흔경성" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918016296&page=buy">미미일소흔경성</a></p>
											<p class="hot-author">구만<em>|</em><a href="/search.asp?searchString=%ED%98%84%EC%95%94%EC%82%AC&searchOption=publisher">현암사</a><em>|</em>2018.05.18</p>
											<div class="hot-score">
												<p><span class="list-star rank9"></span><i><em>9.2</em> (9명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>밀리언셀러 로맨스 소설 『미미일소흔경성』
드라마에 이어 책으로 만나자! 

『하이생소묵』, 『미미일소흔경성』, 『삼삼래흘』 등 출간하는 책마다 베스트셀러를 기록하고, ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>11,200원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">29</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920023756&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2009/200900038.jpg" alt="도서 이미지 - 살고 싶다는 농담" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920023756&page=buy">살고 싶다는 농담</a></p>
											<p class="hot-author">허지웅<em>|</em><a href="/search.asp?searchString=%EC%9B%85%EC%A7%84%EC%A7%80%EC%8B%9D%ED%95%98%EC%9A%B0%EC%8A%A4&searchOption=publisher">웅진지식하우스</a><em>|</em>2020.09.01</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>오늘도 절망과 싸우는 모든 이들에게 전하는,

그럼에도 불구하고 살아야 하는 이유

작가 허지웅이 2018년 혈액암의 일종인 악성림프종이라는 큰 시련을 겪은 뒤, 인생에 대해 이...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>11,200원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">30</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=914028335&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1411/141101276.jpg" alt="도서 이미지 - 칼의 노래 - 한국문학전집 014" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914028335&page=buy">칼의 노래 - 한국문학전집 014</a></p>
											<p class="hot-author">김훈<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%ED%95%99%EB%8F%99%EB%84%A4&searchOption=publisher">문학동네</a><em>|</em>2014.11.13</p>
											<div class="hot-score">
												<p><span class="list-star rank9"></span><i><em>9.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>1993년 12월, 한국문학의 새로운 플랫폼이고자 문을 열었던 문학동네가 창립 20주년을 맞아 ‘문학동네 한국문학전집’을 발간, 그 첫 스무 권을 선보인다. 문학의 위기, 문학의 ...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>10,500원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">31</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920024004&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2009/200901135.jpg" alt="도서 이미지 - 영원의 밤" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920024004&page=buy">영원의 밤</a></p>
											<p class="hot-author">이소민<em>|</em><a href="/search.asp?searchString=%EC%97%98%EB%A6%AD%EC%8B%9C%EB%A5%B4&searchOption=publisher">엘릭시르</a><em>|</em>2020.09.03</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>“셀 수 없는 고통 속에서 하나의 위안을 얻기 위해.”
제3회 엘릭시르 미스터리 대상 수상작

제3회 엘릭시르 미스터리 대상 수상작 『영원의 밤』(정은수 작가의 『다른 남자』와 ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>10,500원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">32</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920027282&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201000862.jpg" alt="도서 이미지 - 착한 편과 나쁜 편 중 웃긴 쪽 편들 거지" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920027282&page=buy">착한 편과 나쁜 편 중 웃긴 쪽 편들 거지</a></p>
											<p class="hot-author">씩씩한 이과장<em>|</em><a href="/search.asp?searchString=%EC%83%9D%EA%B0%81%EC%9D%98%EB%B9%9B&searchOption=publisher">생각의빛</a><em>|</em>2020.10.12</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>회사원들 출근하면 회사에서 뭐 해? 
점심 먹으며 무슨 얘기해? 맨날 일만 해? 
그렇게 일하는 거 재미있어?
 
 

▶ 회사원의 매일에도 무언가가 있다!


공부를 그렇게 열심히 했...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>10,000원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">33</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=912008956&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1207/120700512.jpg" alt="도서 이미지 - 나는 게이라서 행복하다" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=912008956&page=buy">나는 게이라서 행복하다</a></p>
											<p class="hot-author">김조광수<em>|</em><a href="/search.asp?searchString=%EC%95%8C%EB%A7%88&searchOption=publisher">알마</a><em>|</em>2012.07.04</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>〈강추!〉김조광수의 브라보, 게이 라이프 
꿈을 이루지 못할 이유는 없다! 

인터뷰이 김조광수는 누구인가? 
제작자이자 영화감독 김조광수, 그의 행복한 게이 라이프를 말한...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,900원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">34</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920027473&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201001389.jpg" alt="도서 이미지 - 카페 홈즈의 마지막 사랑" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920027473&page=buy">카페 홈즈의 마지막 사랑</a></p>
											<p class="hot-author">김탁환, 신원섭, 정명섭, 정해연, 조영주, 차무진<em>|</em><a href="/search.asp?searchString=%EC%86%90%EC%95%88%EC%9D%98%EC%B1%85&searchOption=publisher">손안의책</a><em>|</em>2020.10.14</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>추리소설 작가들의 아지트인 ‘카페 홈즈’
그곳을 무대로 펼쳐지는
여섯 작가의 독특한 여섯 가지 이야기</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,800원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">35</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=918003293&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1801/180103534.jpg" alt="도서 이미지 - 무례한 사람에게 웃으며 대처하는 법" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918003293&page=buy">무례한 사람에게 웃으며 대처하는 법</a></p>
											<p class="hot-author">정문정<em>|</em><a href="/search.asp?searchString=%EA%B0%80%EB%82%98%EC%B6%9C%ED%8C%90%EC%82%AC&searchOption=publisher">가나출판사</a><em>|</em>2018.01.08</p>
											<div class="hot-score">
												<p><span class="list-star rank6"></span><i><em>6.4</em> (5명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>사람들과 만나 수많은 이야기를 하고 온 날,
마음이 헛헛할 때가 있다.
그 사람은 내게 왜 그렇게 무례할까?
나는 왜 그렇게 말했을까?

사람들과 만나 수많은 이야기를 하고 온 날...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,660원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">36</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=918031516&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1807/180710129.jpg" alt="도서 이미지 - 나는 나로 살기로 했다" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918031516&page=buy">나는 나로 살기로 했다</a></p>
											<p class="hot-author">김수현<em>|</em><a href="/search.asp?searchString=%EB%A7%88%EC%9D%8C%EC%9D%98%EC%88%B2&searchOption=publisher">마음의숲</a><em>|</em>2018.07.31</p>
											<div class="hot-score">
												<p><span class="list-star rank8"></span><i><em>7.6</em> (4명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>진짜 ‘나’로 살기 위한 뜨거운 조언들! 어른이 처음인 당신을 위한 단단한 위로들!
진짜 ‘나’로 살기 위한 뜨거운 조언들! 어른이 처음인 당신을 위한 단단한 위로들!

“...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,660원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">37</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=909004483&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/0910/091000246.jpg" alt="도서 이미지 - 아내들의 학교" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=909004483&page=buy">아내들의 학교</a></p>
											<p class="hot-author">몰리에르<em>|</em><a href="/search.asp?searchString=%EC%A7%80%EC%8B%9D%EC%9D%84%EB%A7%8C%EB%93%9C%EB%8A%94%EC%A7%80%EC%8B%9D&searchOption=publisher">지식을만드는지식</a><em>|</em>2009.11.02</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>633년 내내 논란의 소용돌이에 휩싸인 문제작! 

『아내들의 학교』는 1662년 12월 26일 왕립 극장에서 초연되었으며 폭발적인 성공을 거두었다. 이 작품은 1663년 내내 논란의...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,600원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">38</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920018023&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2007/200702038.jpg" alt="도서 이미지 - 교통경찰의 밤" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920018023&page=buy">교통경찰의 밤</a></p>
											<p class="hot-author">히가시노 게이고<em>|</em><a href="/search.asp?searchString=%ED%95%98%EB%B9%8C%EB%A6%AC%EC%8A%A4&searchOption=publisher">하빌리스</a><em>|</em>2020.07.16</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>추리소설계의 거장 히가시노 게이고가
그려 내는 치열한 교통경찰의 밤

“이 시리즈가 반드시 성공할 거라고 확신한 것은
「천사의 귀」를 완성했을 때였다.”
히가시노 게이고 ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,600원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">39</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920023497&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2008/200804992.jpg" alt="도서 이미지 - 숲의 아이들" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920023497&page=buy">숲의 아이들</a></p>
											<p class="hot-author">박주영<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%ED%95%99%EB%8F%99%EB%84%A4&searchOption=publisher">문학동네</a><em>|</em>2020.09.11</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>서정적 미스터리, 혹은 하드보일드 러브스토리
오늘의작가상, 혼불문학상 수상 작가 박주영 신작 장편소설

『백수생활백서』로 ‘오늘의작가상’을, 『고요한 밤의 눈』으로 혼불문...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,500원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">40</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=915024118&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1510/151004130.jpg" alt="도서 이미지 - 캣칭 파이어 : 헝거게임 시리즈 2" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=915024118&page=buy">캣칭 파이어 : 헝거게임 시리즈 2</a></p>
											<p class="hot-author">수잔 콜린스<em>|</em><a href="/search.asp?searchString=%EB%B6%81%ED%8F%B4%EB%A6%AC%EC%98%A4&searchOption=publisher">북폴리오</a><em>|</em>2015.10.22</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>★ 뉴욕 타임스 260주 연속 베스트셀러 ★
★ 3부작 전 세계 1억 부 이상 판매 ★
★ 전 세계 54개 언어로 번역 ★
★ 빌 게이츠가 꼽은 ‘내 인생 최고의 책’ ★


“적이...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,100원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">41</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=920027983&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201002211.jpg" alt="도서 이미지 - 단지 살인마" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920027983&page=buy">단지 살인마</a></p>
											<p class="hot-author">최제훈<em>|</em><a href="/search.asp?searchString=%ED%98%84%EB%8C%80%EB%AC%B8%ED%95%99&searchOption=publisher">현대문학</a><em>|</em>2020.10.19</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>당대 한국 문학의 가장 현대적이면서도 첨예한 작가들과 함께하는
〈현대문학 핀 시리즈〉 소설선 서른 번째 책 출간!
                                                              ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>9,100원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">42</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=913021679&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1312/131200636.jpg" alt="도서 이미지 - 카라마조프가의 형제들" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=913021679&page=buy">카라마조프가의 형제들</a></p>
											<p class="hot-author">F.M.도스토예프스키<em>|</em><a href="/search.asp?searchString=%EC%95%84%EB%A6%84%EB%8B%A4%EC%9A%B4%EB%82%A0&searchOption=publisher">아름다운날</a><em>|</em>2013.12.19</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>9.6</em> (2명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>『카라마조프가의 형제들』은 특이한 개성과 사상을 대변하는 인물들이 빚어내는 비극적인 사건을 통해 삶과 죽음, 사랑과 욕정 등 인간 존재의 근본 문제를 다루고 있다. 도스토옙...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>9,070원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">43</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=914029639&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1412/141201476.jpg" alt="도서 이미지 - 기기묘묘한 중국의 옛이야기" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914029639&page=buy">기기묘묘한 중국의 옛이야기</a></p>
											<p class="hot-author">김영준<em>|</em><a href="/search.asp?searchString=%EC%96%B4%EB%AC%B8%ED%95%99%EC%82%AC&searchOption=publisher">어문학사</a><em>|</em>2014.12.12</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>『기기묘묘한 중국의 옛이야기』는 《중국민간고사》에서 19개의 이야기를 발췌해 번역한 책이다. 원문은 싣지 않았으나 한국어로 번역하고 어려운 용어들에 한에서 주를 달아 독...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>9,000원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">44</div-->
										<div class="figure">
											<span class="label"><em>10%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=920028718&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201003150.jpg" alt="도서 이미지 - 고양이를 버리다" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920028718&page=buy">고양이를 버리다</a></p>
											<p class="hot-author">무라카미 하루키 저, 가오 옌 그림<em>|</em><a href="/search.asp?searchString=%EB%B9%84%EC%B1%84&searchOption=publisher">비채</a><em>|</em>2020.10.26</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>처음으로 털어놓는 무라카미 하루키의 시간들

아버지의 시간에서부터 조심스럽게 쌓아올린 단 하나의 서사

“우리는 광활한 대지를 향해 내리는 방대한 빗방울의, 이름 없는 ...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>8,460원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">45</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=916042747&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1604/160400255.jpg" alt="도서 이미지 - 채식주의자" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=916042747&page=buy">채식주의자</a></p>
											<p class="hot-author">한강<em>|</em><a href="/search.asp?searchString=%EC%B0%BD%EB%B9%84&searchOption=publisher">창비</a><em>|</em>2016.05.27</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>9.4</em> (3명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>상처, 욕망, 그리고 죽음

표제작인 〈채식주의자〉, 2005년 이상문학상 수상작 〈몽고반점〉, 그리고 〈나무 불꽃〉으로 구성된 소설가, 한강 연작소설. 단아하고 시심 어린 문...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>8,400원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">46</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=913001858&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1310/131001331.jpg" alt="도서 이미지 - 태백산맥  1" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=913001858&page=buy">태백산맥  1</a></p>
											<p class="hot-author">조정래<em>|</em><a href="/search.asp?searchString=%ED%95%B4%EB%83%84%EC%B6%9C%ED%8C%90%EC%82%AC&searchOption=publisher">해냄출판사</a><em>|</em>2013.10.17</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (2명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>한반도가 해방과 분단을 동시에 맞아 남한만의 단독정부가 수립되고, 제주도에서 4.3항쟁이 터지고, 여순사건이 일어나 진압된 1948년 10월부터 6.25전쟁이 끝나고 휴전이 조인되어...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>8,280원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">47</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=913001856&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1310/131001305.jpg" alt="도서 이미지 - 아리랑 1" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=913001856&page=buy">아리랑 1</a></p>
											<p class="hot-author">조정래<em>|</em><a href="/search.asp?searchString=%ED%95%B4%EB%83%84%EC%B6%9C%ED%8C%90%EC%82%AC&searchOption=publisher">해냄출판사</a><em>|</em>2013.10.17</p>
											<div class="hot-score">
												<p><span class="list-star rank10"></span><i><em>10.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>식민지시대를 깊은 역사 인식으로 탐구한 조정래의 대하소설. 김제 출신의 인물들이 군산, 하와이, 동경, 만주, 블라디보스톡 등지로 옮겨서 40여년의 세월을 살아가는 모습을 그리고...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>8,280원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">48</div-->
										<div class="figure">
											<span class="label"><em>50%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=918061019&page=rental">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1812/181201458.jpg" alt="도서 이미지 - 악의 꽃: 앙리 마티스 에디션" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=918061019&page=rental">악의 꽃: 앙리 마티스 에디션</a></p>
											<p class="hot-author">샤를 피에르 보들레르<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%EC%98%88%EC%B6%9C%ED%8C%90%EC%82%AC&searchOption=publisher">문예출판사</a><em>|</em>2018.12.11</p>
											<div class="hot-score">
												<p><span class="list-star rank7"></span><i><em>7.0</em> (1명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
											</div>
											<div class="hot-desc">
												<p>20세기를 대표하는 위대한 화가 앙리 마티스가 직접 편집하고 삽화를 그린 〈악의 꽃 : 앙리 마티스 에디션〉이 국내에서 최초로 번역.출간되었다. 이 책은 보들레르가 쓴 단 한 권의 ...</p>
											</div>
											<div class="hot-cash"><p>구매 <span>8,190원</span></p><p>대여 <span>4,550원</span></p>
											</div>
										</div>
									</li>	
									<li>
										<!--div class="rank">49</div-->
										<div class="figure">
											<span class="label"><em>10%
												<span>할인</span></em></span>
											<a href="/detail.asp?series_num=920015154&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/2006/200601945.jpg" alt="도서 이미지 - 천룡팔부 7" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=920015154&page=buy">천룡팔부 7</a></p>
											<p class="hot-author">김용, 이정원<em>|</em><a href="/search.asp?searchString=%EA%B9%80%EC%98%81%EC%82%AC&searchOption=publisher">김영사</a><em>|</em>2020.06.12</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>김용 유니버스의 결정판 《천룡팔부》 국내 최초 정식 출간 완역본

무협소설을 예술적 경지로 승화시킨 불멸의 고전



‘중국문화사의 일대 기적’이라는 극찬과 함께, 전...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>7,830원</span></p>
												</div>
											</div>
										</li>	
										<li>
											<!--div class="rank">50</div-->
										<div class="figure">
											<a href="/detail.asp?series_num=914016948&page=buy">
												<span class="rm_br"><img src="https://bookimg.bookcube.com/150/1405/140500757.jpg" alt="도서 이미지 - 비행운" /></span>
												<span class="light"></span>
											</a>
										</div>
										<div class="hot-info">
											<p class="hot-title"><a href="/detail.asp?series_num=914016948&page=buy">비행운</a></p>
											<p class="hot-author">김애란<em>|</em><a href="/search.asp?searchString=%EB%AC%B8%ED%95%99%EA%B3%BC%EC%A7%80%EC%84%B1%EC%82%AC&searchOption=publisher">문학과지성사</a><em>|</em>2014.05.13</p>
											<div class="hot-score">
												<p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p> <!--end 클래스 유무 -->
												</div>
												<div class="hot-desc">
													<p>김애란이 돌아왔다. 2012년 올해로 등단 만 10년 차가 되는 시간 동안 공백 없이 작품을 발표해오기도 했지만, 지난해 출간한 첫 장편소설 〈두근두근 내 인생〉으로 차세대 '젊은 작...</p>
												</div>
												<div class="hot-cash"><p>구매 <span>7,000원</span></p>
												</div>
											</div>
										</li>							
								</ul>
<div class="paging"><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=1" class="on fir" data-page-num="1">1</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=2" class="" data-page-num="2">2</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=3" class="" data-page-num="3">3</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=4" class="" data-page-num="4">4</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=5" class="" data-page-num="5">5</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=6" class="" data-page-num="6">6</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=7" class="" data-page-num="7">7</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=8" class="" data-page-num="8">8</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=9" class="" data-page-num="9">9</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=10" class="" data-page-num="10">10</a><a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=11" class="arr next" data-page-num="11"><img src="/images/p-next.png"><span class="hide">다음페이지</span></a>
		<a href="/categorylist.asp?mainclass_num=00&subclass_num=&page=best&pageNum=134" class="arr" data-page-num="134"><img src="/images/p-last.png"><span class="hide">마지막페이지</span></a>
</div>
							</div>
							<script>
							// 리시트 보기 방식 변경
							$(function(){
								$(".view-select ul li a").on("click",function(){
									var cls = $(this).parent().attr("class");
									$(".view-select ul li a").removeClass("on");
									$(this).addClass("on");
									$(".list-page > div").attr("class",cls);

									$.cookie("viewType", cls);
								});
							});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</section>
	
<jsp:include page="../include/footer.jsp"/>