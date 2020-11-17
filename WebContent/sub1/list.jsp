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
                        <li><a href="../sub1/list.html" class="on">전체</a></li>
                        <li><a href="../sub1/list_best.html" class="">베스트</a></li>
                        <li><a href="../sub1/list_new.html" class="">신간</a></li>
                        <li><a href="../sub1/list_free.html" class="">무료</a></li>
                    </ul>
                    <div class="list-sort">
                        <div class="k-array">
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="최신순"><span class="radio_on"><em>최신순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="인기순"><span class="radio_off"><em>인기순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="서평순"><span class="radio_off"><em>서평순</em></span></label>
                            <input type="radio" name="" id="">
                            <label for="" class="radio" data-sort="가격순"><span class="radio_off"><em>낮은가격순</em></span></label>
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
                                    $(function() {
                                        $(".s-result").on("click focus", function() {
                                            $(this).next().show();
                                        });
                                        $(document).on("click", ".arrayBox ul li a", function() {
                                            var text = $(this).text();
                                            $(this).parent().parent().find("li a").removeClass("on");
                                            $(this).parent().parent().hide();
                                            $(this).addClass("on");
                                            $(this).parent().parent().prev().text(text);

                                            goUrl('/categorylist.asp?page=' + $(".wrap").data("page") + '&mainclass_num=' + $(".wrap").data("mainclass-num") + '&subclass_num=' + $(".wrap").data("subclass-num") + '&sort=' + $(".wrap").data("sort") + '&list_type=' + $(this).data("list-type"));
                                            return false;
                                        });
                                    });
                                </script>
                            </div>
                            <div class="view-select">
                                <ul>
                                    <li class="list"><a href="javascript:;" class="on">리스트보기</a></li>
                                    <li class="thum"><a href="javascript:;" class="">썸네일보기</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="list-page">
                        <div class="list">
                            <!-- *****list thum 클래스 차이로 리스트보기와 썸네일 보기로 변경됩니다.*****-->
                            <ul class="book-list">
                                <li>
                                    <div class="figure">
                                        <a href="detail.html">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100486.jpg" alt="도서 이미지 - 식스센스" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="detail.html">식스센스</a></p>
                                        <p class="hot-author">노희준, 우다영, 이갑수, 정명섭, 정재희, 차소희<em>|</em><a href="/search.asp?searchString=%EC%86%90%EC%95%88%EC%9D%98%EC%B1%85&searchOption=publisher">손안의책</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>이 책 〈식스센스〉는 단어가 가리키듯 여섯 번째 감각이 존재하는 여섯 작가의 독특한 여섯 가지 이야기를 모은 단편집이다. 순문학과 장르문학, SF, 추리, 웹소설 등 각 방면에서 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>9,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="detail.html">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100515.jpg" alt="도서 이미지 - 샹젤리제 거리의 작은 향수가게" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="detail.html">샹젤리제 거리의 작은 향수가게</a></p>
                                        <p class="hot-author">레베카 레이즌<em>|</em><a href="/search.asp?searchString=%ED%99%A9%EA%B8%88%EC%8B%9C%EA%B0%84&searchOption=publisher">황금시간</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>“‘사랑에 빠졌어’를 프랑스어로 뭐라고 하죠?”
                                                불안을 환희로, 환희를 사랑으로 바꾸는 향수의 마법!
                                                ‘로맨틱 파리 컬렉션’ 마지막 이야기

                                                『센 강변의 작은 책방』과 『...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>9,100원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="detail.html">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100516.jpg" alt="도서 이미지 - 마더 앤 마더" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="detail.html">마더 앤 마더</a></p>
                                        <p class="hot-author">엘리자베스 노어백<em>|</em><a href="/search.asp?searchString=%ED%99%A9%EA%B8%88%EC%8B%9C%EA%B0%84&searchOption=publisher">황금시간</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>20년 전 죽은 딸이 눈앞에 나타났다
                                                두 엄마와 딸, 여성 셋이 펼치는 최고의 심리 스릴러
                                                “매혹적인 데뷔” 찬사 속, 전 세계 33개국 출간!

                                                『마더 앤 마더』는 아동 실종이란 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>11,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029977&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100517.jpg" alt="도서 이미지 - 걸스 라이크 어스" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029977&page=">걸스 라이크 어스</a></p>
                                        <p class="hot-author">크리스티나 앨저<em>|</em><a href="/search.asp?searchString=%ED%99%A9%EA%B8%88%EC%8B%9C%EA%B0%84&searchOption=publisher">황금시간</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>“우리처럼 평범하고, 가치 있는 목숨을 가진 여성의 이야기”

                                                여성 범죄의 진범을 끝까지 쫓는 FBI 여성 요원의 활약
                                                기득권과 사회적 약자에 고착된 추악한 뫼비우스의 띠
                                                〈뉴...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>10,400원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029990&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100473.jpg" alt="도서 이미지 - 내 몸을 죽이는 기적의 첨가물" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029990&page=">내 몸을 죽이는 기적의 첨가물</a></p>
                                        <p class="hot-author">바니 하리 저,김경영 역<em>|</em><a href="/search.asp?searchString=%EB%8F%99%EB%85%98%EB%9D%BC%EC%9D%B4%ED%94%84&searchOption=publisher">동녘라이프</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>비만, 노화, 당뇨... 당신의 몸은 이미 식품첨가물에 찌들었다!
                                                “이 책을 읽는 것만으로도 몇 배는 더 건강해질 것이다”
                                                한국식건강연구소 배지영 소장, 차움푸드테라피클리닉...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>13,860원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029999&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100477.jpg" alt="도서 이미지 - 아직도 쭈그리고 앉은 사람이 있다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029999&page=">아직도 쭈그리고 앉은 사람이 있다</a></p>
                                        <p class="hot-author">최영철<em>|</em><a href="/search.asp?searchString=%EB%8F%84%EC%84%9C%EC%B6%9C%ED%8C%90+%EC%A3%BC%EB%93%9C&searchOption=publisher">도서출판 주드</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1986년 한국일보 신춘문예로 등단한 시인의 첫번째 시집을 전자책으로 재출간</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030001&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100479.jpg" alt="도서 이미지 - 가족사진" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030001&page=">가족사진</a></p>
                                        <p class="hot-author">최영철<em>|</em><a href="/search.asp?searchString=%EB%8F%84%EC%84%9C%EC%B6%9C%ED%8C%90+%EC%A3%BC%EB%93%9C&searchOption=publisher">도서출판 주드</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>최영철 시인의 두번째 시집 〈가족 사진〉이 절판됨에 따라 전자책으로 재출간합니다.</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030002&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100480.jpg" alt="도서 이미지 - 홀로 가는 맹인 악사" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030002&page=">홀로 가는 맹인 악사</a></p>
                                        <p class="hot-author">최영철<em>|</em><a href="/search.asp?searchString=%EB%8F%84%EC%84%9C%EC%B6%9C%ED%8C%90+%EC%A3%BC%EB%93%9C&searchOption=publisher">도서출판 주드</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1986년 한국일보 신춘문예로 등단한 최영철 시인의 세번째 시집을 전자책으로 재출간함.</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030003&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100481.jpg" alt="도서 이미지 - 야성은 빛나다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030003&page=">야성은 빛나다</a></p>
                                        <p class="hot-author">최영철<em>|</em><a href="/search.asp?searchString=%EB%8F%84%EC%84%9C%EC%B6%9C%ED%8C%90+%EC%A3%BC%EB%93%9C&searchOption=publisher">도서출판 주드</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>한국일보 신춘문예로 등단한 최영철 시인의 네번째 시집을 전자책으로 재출간.</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030004&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100482.jpg" alt="도서 이미지 - 우리는 무지개를 타고" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030004&page=">우리는 무지개를 타고</a></p>
                                        <p class="hot-author">보배<em>|</em><a href="/search.asp?searchString=%EC%95%84%ED%86%A0%ED%8F%AC%EC%8A%A4&searchOption=publisher">아토포스</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>문학으로 성소수자 인권 신장을 도모하는 비영리단체 한국퀴어문학종합플랫폼 ‘무지개책갈피’ 창립자 보배가 퀴어로 살고 퀴어로 읽는 일을 이야기한다. 삶으로 문학을 읽어내고...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>11,700원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030083&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100617.jpg" alt="도서 이미지 - 로미오와 줄리엣" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030083&page=">로미오와 줄리엣</a></p>
                                        <p class="hot-author">윌리엄 셰익스피어<em>|</em><a href="/search.asp?searchString=%EC%97%B4%EB%A6%B0%EC%B1%85%EB%93%A4&searchOption=publisher">열린책들</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>증오 속에서 태어나 죽음을 넘어서는 불멸의 사랑
                                                셰익스피어가 창조한 가장 유명한 사랑의 비극

                                                영문학사 최고의 작가 윌리엄 셰익스피어의 희곡 『로미오와 줄리엣』이 셰익스피어...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030084&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100618.jpg" alt="도서 이미지 - 첫 사랑" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030084&page=">첫 사랑</a></p>
                                        <p class="hot-author">이반 투르게네프<em>|</em><a href="/search.asp?searchString=%ED%95%B4%EC%84%B1%EC%A0%84%EC%9E%90%EB%B6%81&searchOption=publisher">해성전자북</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>그는 순진하고 영리한 소녀가 고상한 감정과 사랑에 눈뜨면서 참된, 그러면서도 순간적인 사랑에 승화되어 가는 비련의 과정을 즐겨 묘사했다. 투르게네프가 묘사한 남녀 주인공의 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030085&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100619.jpg" alt="도서 이미지 - 사랑이 있는 곳에 신이 있다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030085&page=">사랑이 있는 곳에 신이 있다</a></p>
                                        <p class="hot-author">톨스토이<em>|</em><a href="/search.asp?searchString=%ED%95%B4%EC%84%B1%EC%A0%84%EC%9E%90%EB%B6%81&searchOption=publisher">해성전자북</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>세계 많은 사람들에게 고매한 사상을 전파하면서도 자기 아내를 설득하지 못하고 잦은 불화를 일으키자 현실 생활과 신념의 불일치로 톨스토이는 괴로워하였습니다. 그는 그것이 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920030089&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100668.jpg" alt="도서 이미지 - 다섯가지 소원" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920030089&page=">다섯가지 소원</a></p>
                                        <p class="hot-author">조 사이플<em>|</em><a href="/search.asp?searchString=%EC%8D%A8%EB%84%A4%EC%8A%A4%ED%8A%B8&searchOption=publisher">써네스트</a><em>|</em>2020.11.04</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>시한부 삶을 살고 있는 10살 소년과 삶을 마감하고 싶은 100살 노인이 만나서 소년의 ‘다섯 가지 소원’을 이루어가는 과정을 흥미롭게 그려가는 이야기이다. 소설 마지막의 반전이...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>10,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029868&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100247.jpg" alt="도서 이미지 - 유랑의 달" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029868&page=">유랑의 달</a></p>
                                        <p class="hot-author">나기라 유우<em>|</em><a href="/search.asp?searchString=%EC%9D%80%ED%96%89%EB%82%98%EB%AC%B4&searchOption=publisher">은행나무</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>2020 서점대상 1위

                                                아마존일본 종합 1위
                                                츠타야서점 종합 1위
                                                제41회 요시카와에이지 문학신인상 최종 후보작

                                                “오래도록 읽힐 대단한 작품이 나왔다.”
                                                출간 직후 일본 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>10,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029870&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100241.jpg" alt="도서 이미지 - 엄마의 마지막 말들" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029870&page=">엄마의 마지막 말들</a></p>
                                        <p class="hot-author">박희병<em>|</em><a href="/search.asp?searchString=%EC%B0%BD%EB%B9%84&searchOption=publisher">창비</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>“나는 어머니의 보호자이자 관찰자이자 기록자였다”
                                                1년의 간병, 어머니의 사랑과 존엄성에 대한 인문학적 기록

                                                엄마의 삶이 점차 마지막을 향해 갈 때, 아들은 엄마의 말을 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>11,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029918&page=">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100427.jpg" alt="도서 이미지 - 돈말글" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029918&page=">돈말글</a></p>
                                        <p class="hot-author">정은길<em>|</em><a href="/search.asp?searchString=%ED%95%9C%EA%B5%AD%EA%B2%BD%EC%A0%9C%EC%8B%A0%EB%AC%B8%28%ED%95%9C%EA%B2%BDBP%29&searchOption=publisher">한국경제신문(한경BP)</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>화제의 네이버 오디오클립 〈정은길 아나운서의 돈말글〉 출간!
                                                ‘우리 삶에 필요한 3가지, 우리는 돈과 말과 글과 어떤 관계를 맺으며 살아가고 있을까?’
                                                혼자서도 돈 걱정 없이 당...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>11,040원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <span class="label"><em>1권
                                                <span>무료</span></em></span>
                                        <a href="/detail.asp?series_num=920029919&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100428.jpg" alt="도서 이미지 - 돈말글 (체험판)" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029919&page=buy">돈말글 (체험판)</a></p>
                                        <p class="hot-author">정은길<em>|</em><a href="/search.asp?searchString=%ED%95%9C%EA%B5%AD%EA%B2%BD%EC%A0%9C%EC%8B%A0%EB%AC%B8%28%ED%95%9C%EA%B2%BDBP%29&searchOption=publisher">한국경제신문(한경BP)</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>화제의 네이버 오디오클립 〈정은길 아나운서의 돈말글〉 출간!
                                                ‘우리 삶에 필요한 3가지, 우리는 돈과 말과 글과 어떤 관계를 맺으며 살아가고 있을까?’
                                                혼자서도 돈 걱정 없이 당...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>0원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029924&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100433.jpg" alt="도서 이미지 - 의미 수업" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029924&page=buy">의미 수업</a></p>
                                        <p class="hot-author">데이비드 케슬러<em>|</em><a href="/search.asp?searchString=%ED%95%9C%EA%B5%AD%EA%B2%BD%EC%A0%9C%EC%8B%A0%EB%AC%B8%28%ED%95%9C%EA%B2%BDBP%29&searchOption=publisher">한국경제신문(한경BP)</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>베스트셀러 《인생 수업》, 《상실 수업》에 이은 마지막 3부작
                                                슬픔의 5단계를 넘어 6단계를 밝혀낸 최초의 책

                                                “살다보면 누구나 어떤 방식으로든 넘어지고 무너진다.
                                                중요한 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>13,440원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <span class="label"><em>1권
                                                <span>무료</span></em></span>
                                        <a href="/detail.asp?series_num=920029925&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100434.jpg" alt="도서 이미지 - 의미 수업 (체험판)" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029925&page=buy">의미 수업 (체험판)</a></p>
                                        <p class="hot-author">데이비드 케슬러<em>|</em><a href="/search.asp?searchString=%ED%95%9C%EA%B5%AD%EA%B2%BD%EC%A0%9C%EC%8B%A0%EB%AC%B8%28%ED%95%9C%EA%B2%BDBP%29&searchOption=publisher">한국경제신문(한경BP)</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>베스트셀러 《인생 수업》, 《상실 수업》에 이은 마지막 3부작
                                                슬픔의 5단계를 넘어 6단계를 밝혀낸 최초의 책

                                                “살다보면 누구나 어떤 방식으로든 넘어지고 무너진다.
                                                중요한 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>0원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029933&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100455.jpg" alt="도서 이미지 - 샤인(shine)" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029933&page=buy">샤인(shine)</a></p>
                                        <p class="hot-author">JESSICA JUNG<em>|</em><a href="/search.asp?searchString=RHK&searchOption=publisher">RHK</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>★★ 제시카 소설 데뷔작 ★★
                                                케이 팝 스타의
                                                놀라운 이야기가 지금 시작된다!
                                                솔로 가수이자 패션 디자이너 및 사업가, 세계적인 인플루언서 등으로 활동 영역을 넓히며 끊임
                                                없이 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>10,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029934&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100456.jpg" alt="도서 이미지 - 마음아, 넌 누구니" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029934&page=buy">마음아, 넌 누구니</a></p>
                                        <p class="hot-author">박상미<em>|</em><a href="/search.asp?searchString=%ED%95%9C%EA%B5%AD%EA%B2%BD%EC%A0%9C%EC%8B%A0%EB%AC%B8%28%ED%95%9C%EA%B2%BDBP%29&searchOption=publisher">한국경제신문(한경BP)</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>“우리는 남에게 좋은 사람이기 위해 나에게 얼마나 나쁜 사람인가”
                                                마음근육 튼튼한 내가 되는 법

                                                울먹울먹, 살랑살랑, 끄덕끄덕, 감정이 오르락내리락. 희망이 생기고 기분이 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>12,640원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <span class="label"><em>1권
                                                <span>무료</span></em></span>
                                        <a href="/detail.asp?series_num=920029935&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2011/201100457.jpg" alt="도서 이미지 - 마음아, 넌 누구니 (체험판)" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029935&page=buy">마음아, 넌 누구니 (체험판)</a></p>
                                        <p class="hot-author">박상미<em>|</em><a href="/search.asp?searchString=%ED%95%9C%EA%B5%AD%EA%B2%BD%EC%A0%9C%EC%8B%A0%EB%AC%B8%28%ED%95%9C%EA%B2%BDBP%29&searchOption=publisher">한국경제신문(한경BP)</a><em>|</em>2020.11.03</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>“우리는 남에게 좋은 사람이기 위해 나에게 얼마나 나쁜 사람인가”
                                                마음근육 튼튼한 내가 되는 법

                                                울먹울먹, 살랑살랑, 끄덕끄덕, 감정이 오르락내리락. 희망이 생기고 기분이 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>0원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029515&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005176.jpg" alt="도서 이미지 - 813의 수수께끼 (상) - 아르센 뤼팽 걸작선 04" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029515&page=buy">813의 수수께끼 (상) - 아르센 뤼팽 걸작선 04</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029516&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005177.jpg" alt="도서 이미지 - 813의 수수께끼 (하) - 아르센 뤼팽 걸작선 04" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029516&page=buy">813의 수수께끼 (하) - 아르센 뤼팽 걸작선 04</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029529&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005191.jpg" alt="도서 이미지 - 계축일기" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029529&page=buy">계축일기</a></p>
                                        <p class="hot-author">작자 미상<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>인목대비 폐비 사건에 대한 궁중 비사를 기록한
                                                우리나라 궁중 문학의 대표작!

                                                《계축일기》는 인목대비 폐비 사건에 대한 궁중의 비사(?史)를 기록한 작품이다. 지존의 위치에 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029530&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005192.jpg" alt="도서 이미지 - 고맙습니다, 아버지" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029530&page=buy">고맙습니다, 아버지</a></p>
                                        <p class="hot-author">신현락<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>외로움 속에서도 아버지의 자리를 버리지 않고
                                                끝까지 열심히 산 ‘아버지다운 아버지’의 이야기!

                                                이 책은 단단한 시어로 ‘깊이 있는 허무’를 담은 시를 써 온 신현락 시인의...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,800원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029531&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005193.jpg" alt="도서 이미지 - 괴도신사 뤼팽 - 아르센 뤼팽 걸작선 01" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029531&page=buy">괴도신사 뤼팽 - 아르센 뤼팽 걸작선 01</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029532&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005194.jpg" alt="도서 이미지 - 구운몽" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029532&page=buy">구운몽</a></p>
                                        <p class="hot-author">김만중<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>인생무상, 일장춘몽을 보여 주는
                                                몽자류 소설의 효시!

                                                《구운몽》은 인생의 덧없음을 성진의 하룻밤 꿈을 통해 보여 주는 몽자류 소설이다. 성진이 세상의 온갖 부귀영화를 누리...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029533&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005196.jpg" alt="도서 이미지 - 귀의 성" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029533&page=buy">귀의 성</a></p>
                                        <p class="hot-author">이인직<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>본처와 첩 사이의 비극적 갈등 속에
                                                신분제와 일부종사에 대한 문제점을 지적하다!

                                                《귀의 성》은 남편의 첩살림을 보지 못하는 본처가 결국 첩을 살해하는 가정 비극을 다룬 작품...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,800원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029535&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005198.jpg" alt="도서 이미지 - 그날 밤 게르에선 무슨 일이 일어난 걸까" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029535&page=buy">그날 밤 게르에선 무슨 일이 일어난 걸까</a></p>
                                        <p class="hot-author">초원광분<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>몽골의 방대한 초원과 끝없는 사막을 말을 타고 바람처럼 가르는 상상을 하며 낙타처럼 웅얼웅얼 모인 사람들이 있다. 함께 초원에 쏟아지던 유성을 보고, 때로는 헛것을 보면서 마...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,600원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029537&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005200.jpg" alt="도서 이미지 - 그럼에도 우리는 행복하다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029537&page=buy">그럼에도 우리는 행복하다</a></p>
                                        <p class="hot-author">김종원<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>이어령 전 문화부장관의 추천도서!

                                                “우리는 행복하기 위해 태어났어요.”
                                                행복은 누군가가 쥐어 주는 것이 아니라
                                                당신이 쥐어 잡는 것이다.

                                                “당신의 행복한 삶을 살아가고 있나...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>8,300원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029539&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005202.jpg" alt="도서 이미지 - 금수회의록" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029539&page=buy">금수회의록</a></p>
                                        <p class="hot-author">신채호<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>애국 계몽 운동에 앞장선
                                                안국선, 신채호의 대표 신소설 모음집!

                                                안국선, 신채호는 개화기 애국 계몽 운동에 앞장섰던 작가이다. 〈금수회의록〉은 여러 동물이 등장하여 이야기를...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029540&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005203.jpg" alt="도서 이미지 - 금오신화" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029540&page=buy">금오신화</a></p>
                                        <p class="hot-author">김시습<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>현실의 무게를 초현실적으로 풀어낸
                                                우리나라 최초의 한문 소설!

                                                《금오신화》는 〈이생규장전〉, 〈만복사저포기〉, 〈취유부벽정기〉, 〈남염부주지〉, 〈용궁부연록〉 5편의 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029541&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005207.jpg" alt="도서 이미지 - 기암성 - 아르센 뤼팽 걸작선 03" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029541&page=buy">기암성 - 아르센 뤼팽 걸작선 03</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029547&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005214.jpg" alt="도서 이미지 - 꿈" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029547&page=buy">꿈</a></p>
                                        <p class="hot-author">이광수<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>불교 사상을 바탕으로
                                                인간 욕망의 무상을 표현하다!

                                                이 작품은 이광수가 《삼국유사》에 실려 있는 〈조신 설화〉를 바탕으로 창작한 것으로, 주인공이 바라던 바가 꿈속에서 실...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029551&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005218.jpg" alt="도서 이미지 - 나는 영화가 좋다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029551&page=buy">나는 영화가 좋다</a></p>
                                        <p class="hot-author">이창세<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>영화만 생각하고, 영화만 아는, 영화에 중독된 사람들의 이야기
                                                영화인들의 영화 같은 삶’을 들여다본다.

                                                영화기자 출신으로 영화 프로듀서이자 영화배우인 저자가 오랜 시간을 ...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>10,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029552&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005219.jpg" alt="도서 이미지 - 나는 이제 좀 행복해져야겠다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029552&page=buy">나는 이제 좀 행복해져야겠다</a></p>
                                        <p class="hot-author">정헌재<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>글 · 그림 · 사진_ 정헌재(페리테일)

                                                단순하고 짧은 컷 속에 깊이를 담아내는 카툰 에세이 작가로, 2002년부터 지금까지 뻔쩜넷에서 소통하고, 그림을 그리고, 글을 쓰고, 사진을...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,800원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029555&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005224.jpg" alt="도서 이미지 - 날개 외" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029555&page=buy">날개 외</a></p>
                                        <p class="hot-author">이상<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>분열된 자아의 내면 고백을 드러낸
                                                한국 최초의 심리주의 소설을 보여 주다!

                                                이상은 알쏭달쏭한 숫자와 기호, 일상 어법을 넘어선 해석하기 어려운 초현실주의적 시로 ‘문학사의...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029572&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005249.jpg" alt="도서 이미지 - 당신이 나를 웃게 합니다" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029572&page=buy">당신이 나를 웃게 합니다</a></p>
                                        <p class="hot-author">송은주<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>『당신이 나를 웃게 합니다』에는 평범한 사람들의 따뜻한 행동 하나가 이 세상을 얼마나 바꿀 수 있는지를 보여주는 감동적인 사연이 가득하다. 뉴욕 9.11 테러 소식을 멀리서 전해...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>7,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029573&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005250.jpg" alt="도서 이미지 - 두 가지 미소의 여인 - 아르센 뤼팽 걸작선 10" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029573&page=buy">두 가지 미소의 여인 - 아르센 뤼팽 걸작선 10</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029578&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005255.jpg" alt="도서 이미지 - 레디메이드 인생 외" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029578&page=buy">레디메이드 인생 외</a></p>
                                        <p class="hot-author">채만식<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>강렬한 풍자와 비판을 통해
                                                민족, 사회, 역사를 묘사하다!

                                                채만식은 문학을 ‘역사를 밀고 나가는 힘’으로 보고, 민족과 역사 그리고 사회의 변화 과정을 작품 속에 담아내고자 했...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029579&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005256.jpg" alt="도서 이미지 - 뤼팽 대 홈즈 - 아르센 뤼팽 걸작선 02" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029579&page=buy">뤼팽 대 홈즈 - 아르센 뤼팽 걸작선 02</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029580&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005257.jpg" alt="도서 이미지 - 뤼팽의 고백 - 아르센 뤼팽 걸작선 06" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029580&page=buy">뤼팽의 고백 - 아르센 뤼팽 걸작선 06</a></p>
                                        <p class="hot-author">모리스 르블랑<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>1905년 추리소설 역사상 아르센 뤼팽의 등장은 충격 그 자체였다. 이제껏 추리소설에서는 탐정이 범인을 추적했지만 뤼팽 시리즈는 이런 공식을 과감히 깨뜨렸다. 뤼팽은 아예 범인...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>6,000원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029584&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005261.jpg" alt="도서 이미지 - 메밀꽃 필 무렵 외" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029584&page=buy">메밀꽃 필 무렵 외</a></p>
                                        <p class="hot-author">이효석<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>원초적 자연 풍경과 인간 본연의 순수함을
                                                감각적인 언어와 서정적 분위기 속에 담다!

                                                이효석의 초기 작품은 사회주의 이념을 바탕으로 한 것이 대부분이었다면 후기 작품은 원초...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029588&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005265.jpg" alt="도서 이미지 - 무영탑 1" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029588&page=buy">무영탑 1</a></p>
                                        <p class="hot-author">현진건<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>민간 설화를 바탕으로
                                                주체적인 민족의식을 드러내다!

                                                민간에 구비 전승되던 아사달 아사녀 설화를 소재로 한, 비극적인 사랑 이야기를 다룬 역사 소설이다. 군국주의가 심화된 19...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>5,100원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029589&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005266.jpg" alt="도서 이미지 - 무영탑 2" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029589&page=buy">무영탑 2</a></p>
                                        <p class="hot-author">현진건<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>민간 설화를 바탕으로 주체적인 민족의식을 드러내다!민간에 구비 전승되던 아사달 아사녀 설화를 소재로 한, 비극적인 사랑 이야기를 다룬 역사 소설이다. 군국주의가 심화된 19...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>5,100원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029590&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005267.jpg" alt="도서 이미지 - 물레방아 외" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029590&page=buy">물레방아 외</a></p>
                                        <p class="hot-author">나도향<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>퇴폐적 낭만주의에서 사실적 리얼리즘으로
                                                변모하며 현실 문제를 드러내다!

                                                나도향은 초기에는 병적이고 퇴폐적인 경향이 강한 작품을 주로 발표했으나 후기에 이르러서는 사회의...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029596&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005274.jpg" alt="도서 이미지 - 발가락이 닮았다 외" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029596&page=buy">발가락이 닮았다 외</a></p>
                                        <p class="hot-author">김동인<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>단편소설의 형식적 아름다움을 구현하며
                                                한국 근대 문학의 새로운 가능성을 열다!

                                                김동인은 단편소설의 형식적 아름다움을 완성하고, 자연주의 문학을 받아들이는 등 한국 근대 문학...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,500원</span></p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="figure">
                                        <a href="/detail.asp?series_num=920029597&page=buy">
                                            <span class="rm_br"><img src="https://bookimg.bookcube.com/150/2010/201005275.jpg" alt="도서 이미지 - 밤길 외" /></span>
                                            <span class="light"></span>
                                        </a>
                                    </div>
                                    <div class="hot-info">
                                        <p class="hot-title"><a href="/detail.asp?series_num=920029597&page=buy">밤길 외</a></p>
                                        <p class="hot-author">이태준<em>|</em><a href="/search.asp?searchString=%EB%84%A5%EC%84%9C%EC%8A%A4&searchOption=publisher">넥서스</a><em>|</em>2020.11.02</p>
                                        <div class="hot-score">
                                            <p><span class="list-star rank0"></span><i><em>0.0</em> (0명)</i><em>|</em>총 1권</p>
                                            <!--end 클래스 유무 -->
                                        </div>
                                        <div class="hot-desc">
                                            <p>전통적 풍류와 아름다운 문장을 통해
                                                한국의 대표적 서정을 드러내다!

                                                이태준은 우리 민족의 전통적 풍류와 서정을 작품 속에 녹여 낸 작가이다. 사상적이거나 현실적인 내용보다는...</p>
                                        </div>
                                        <div class="hot-cash">
                                            <p>구매 <span>4,200원</span></p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="btn_inner">
								<a href="../adminPage/book_regi.jsp" class="btn">글쓰기</a>
							</div>
                            <div class="paging"><a href="/categorylist.asp?mainclass_num=00&pageNum=1" class="on fir" data-page-num="1">1</a><a href="/categorylist.asp?mainclass_num=00&pageNum=2" class="" data-page-num="2">2</a><a href="/categorylist.asp?mainclass_num=00&pageNum=3" class="" data-page-num="3">3</a><a href="/categorylist.asp?mainclass_num=00&pageNum=4" class="" data-page-num="4">4</a><a href="/categorylist.asp?mainclass_num=00&pageNum=5" class="" data-page-num="5">5</a><a href="/categorylist.asp?mainclass_num=00&pageNum=6" class="" data-page-num="6">6</a><a href="/categorylist.asp?mainclass_num=00&pageNum=7" class="" data-page-num="7">7</a><a href="/categorylist.asp?mainclass_num=00&pageNum=8" class="" data-page-num="8">8</a><a href="/categorylist.asp?mainclass_num=00&pageNum=9" class="" data-page-num="9">9</a><a href="/categorylist.asp?mainclass_num=00&pageNum=10" class="" data-page-num="10">10</a><a href="/categorylist.asp?mainclass_num=00&pageNum=11" class="arr next" data-page-num="11"><img src="../images/p-next.png"><span class="hide">다음페이지</span></a>
                                <a href="/categorylist.asp?mainclass_num=00&pageNum=781" class="arr" data-page-num="781"><img src="../images/p-last.png"><span class="hide">마지막페이지</span></a>
                            </div>
                        </div>
                        <script>
                            // 리시트 보기 방식 변경
                            $(function() {
                                $(".view-select ul li a").on("click", function() {
                                    var cls = $(this).parent().attr("class");
                                    $(".view-select ul li a").removeClass("on");
                                    $(this).addClass("on");
                                    $(".list-page > div").attr("class", cls);

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