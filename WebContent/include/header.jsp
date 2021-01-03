<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="vo.MsgBean"%>
<%
String id = (String)session.getAttribute("id");
ArrayList<MsgBean> myMsgList = (ArrayList<MsgBean>) request.getAttribute("msgList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<!-- Google Tag Manager -->
<script>
	(function(w,d,s,l,i){
		w[l]=w[l]||[];w[l].push({
			'gtm.start': new Date().getTime(),event:'gtm.js'});
			var f=d.getElementsByTagName(s)[0],
			j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';
			j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-KP248RV');
</script>
<script>
	window.onload = function() {
		if(id != null){
<%-- 			<% int listCount = pageInfo.getListCount(); %> --%>
		}
	}
</script>
<!-- End Google Tag Manager -->

<meta charset="UTF-8">
<meta name="title" content="e북포털 북큐브">
<meta name="description" content="새로운 독서의 시작, 전자책 서점,웹소설,웹툰을 지금 바로 만나보세요.">
<meta name="title" content="">
<meta property="og:type" content="book">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:site_name" content="e북포털 북큐브">
<meta property="og:image" content="">
<meta property="og:url" content="">
<meta property="fb:app_id" content="159693857557581">
<meta property="og:locale" content="ko_KR">

<title>동서남BOOK</title>
<link rel="shortcut icon" type="image/x-icon" href="images/icon/bookcube_ci.ico">
<link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/nanumgothic.css">
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/reset.css" />
<link type="text/css" rel="stylesheet" href="css/main.css?v=20200917" />
<link type="text/css" rel="stylesheet" href="css/slick.css" />
<link type="text/css" rel="stylesheet"  href="js/lib/swipe/swiper.css" />
<script type="text/javascript" src="js/lib/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="js/lib/jquery.cookie.js"></script>
<script type="text/javascript" src="js/bookcube.js?200519"></script>
<script type="text/javascript" src="js/lib/slick.min.js"></script>
<script type="text/javascript" src="js/slimScroll.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/sub.js"></script>
<script type="text/javascript" src="js/placeholders.min.js"></script>
<script type="text/javascript" src="js/lib/swipe/swiper-4.3.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif&family=Open+Sans&family=Roboto&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" href="sub5/FullCalendar/vendor/css/fullcalendar.min.css" /> -->
<!-- <link rel="stylesheet" href="sub5/FullCalendar/vendor/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href='sub5/FullCalendar/vendor/css/select2.min.css' /> -->
<!-- <link rel="stylesheet" href='sub5/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' /> -->

<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600"> -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> -->

<!-- <link rel="stylesheet" href="sub5/FullCalendar/css/main.css"> -->
<!-- naver-->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
	<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript"> if(!wcs_add) var wcs_add = {}; wcs_add["wa"] = "75bf1248432b84"; wcs_do(); </script>
<!-- naver-->
<!-- kakao 로그인-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<div class="wrap" data-page="nm" data-web-class="일반">
<header class="header">
	
	<div class="header-top">
		<div class="header-top-inner">
			<div class="h-top">
				<form name="searchFrm" id="searchFrm" autocomplete="off">
				<!--input type="hidden" name="searchOption" id="searchOption" value="" /-->
				<input type="text" style="display: none;" />
					<fieldset>
						<legend>검색</legend>
						<h1 class="logo"><a href="Main.book">북큐브서점</a></h1>
						<div class="search">						
							<input type='text' name='search' class="search_input" style="ime-mode:active;" />
							<input type='button' onclick="frmSearchSubmit()" />
						</div>
						<%if(id == null){ %>
						<ul class="my-lnb">
							<li class="btnLogin logoutIcon"><a href="MemberLoginForm.me">로그인</a></li>
							<li class="mypageIcon"><a href="MemberJoinForm.me">회원가입</a></li>
						</ul>
						<%}else{ %>
						<ul class="my-lnb">
							<li class="btnLogOut logoutIcon"><a href="MemberLogoutPro.me">로그아웃</a></li>
							<%if(id.equals("admin")){ %>
								<li class="mypageIcon"><a href="MemberList.me">admin</a></li>
							<%}else{
								%>
								<li class="mypageIcon"><a href="Mypage.me?id=<%=id%>">MY</a></li>								
								<li class="basketIcon"><a href="MyBasketList.bk">책바구니</a></li>
							<%} %>
							
							<%if(myMsgList == null) { %>
							<li class="alarm on alarmIcon" id="message">
								<a href="MyMsg.msg">알리미</a>
							</li>
							<% } else { %>
							<li class="alarm on alarmIcon2" id="message2">
								<a href="MyMsg.msg">
									<span class="alarmdot">
										<%=myMsgList.size() %>
									</span>
									알리미
								</a>
							</li>
							<% } %>
							
						</ul>
						<% } %>
					</fieldset>
				</form>
				<div class="alarm_layer_box" style="display:none;">
					<iframe src="" width="430" height="510" frameborder="0"  name="alarm_view" id="alarm_view" scrolling="no"></iframe>
				</div>
				<div class="fastSearch">
					<div class="fastRight">
						<ul class="fastUl">
							
						</ul>
					</div>
					<div class="auto-complete">
						<p style="display: none;">자동완성 기능이 꺼져 있습니다.</p>
						<p><a href="javascript:;" class="">자동완성 끄기</a></p>
					</div>
				</div>
			</div> 
			<div class="h-top-bottom">
				<h2 class="hide">메인메뉴</h2>
				<ul class="gnb">
					<li><a href="Main.book" class="on">홈</a></li>
					<li><a href="NoticeBoardList.not?page=1">공지사항</a></li>
					<li><a href="FreeBoardList.free">자유게시판</a></li>					
					<li><a href="FullCalendar.ca">이달의 책(행사)</a></li>
						
				</ul>
				<ul class="lnb">
					<li><a href="Charge.dok">정기권 결제</a></li>					
					<li><a href="RequestList.rq">희망도서신청</a>
					<li><a href="QnaList.qna">고객센터</a></li>
				</ul>
			</div>
		</div>
	</div>
	
</header>
<div class="header-bottom">
	<div class="header-bottom-inner">
		<div class="h-bottom-left">
			<!-- <p class="all-category"><a href="#">소설</a></p> -->
			<ul class="snb-left">
				<li><a href="javascript:;" class="on">소설</a></li>
				<li><a href="javascript:;" class="">인문/경제</a></li>
				<li><a href="javascript:;" class="">과학</a></li>
				<li><a href="javascript:;" class="">취미</a></li>
				<li><a href="javascript:;" class="">만화/웹소설</a></li>
				
			</ul>
		</div>
<!-- 		<div class="h-bottom-right"> -->
<!-- 			<ul class="snb-right"> -->
<!-- 				<li><a href="../sub1/list_best.jsp">베스트</a></li> -->
<!-- 				<li><a href="../sub1/list_new.jsp">신간</a></li> -->
<!-- <!-- 				<li><a href="../sub1/event">이벤트</a></li> --> 
<!-- 			</ul> -->
<!-- 		</div> -->
		
	</div>
	<div class="m-category">
		<div class="main-inner">
			<div class="category-inner">
				<div>
					<ul class="">
						<li><a href="BookList.bok?catg1=소설&catg2=소설">소설</a></li>	
						<li><a href="BookList.bok?catg1=소설&catg2=에세이">에세이</a></li>	
						<li><a href="BookList.bok?catg1=소설&catg2=여행">여행</a></li>	
						<li><a href="BookList.bok?catg1=소설&catg2=시">시</a></li>	
					</ul>
				</div>
				<div>
					<ul class="">
						<li><a href="BookList.bok?catg1=인문/경제&catg2=자기개발">자기개발</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=경영">경영</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=경제">경제</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=마케팅">마케팅</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=역사">역사</a></li>
						<li><a href="BookList.bok?catg1=인문/경제&catg2=철학">철학</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=종교">종교</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=정치">정치</a></li>								
						<li><a href="BookList.bok?catg1=인문/경제&catg2=예술">예술</a></li>	
						<li><a href="BookList.bok?catg1=인문/경제&catg2=인문">인문</a></li>					
					</ul>
				</div>
				<div>
					<ul class="">
						<li><a href="BookList.bok?catg1=과학&catg2=수학">수학</a></li>	
						<li><a href="BookList.bok?catg1=과학&catg2=과학">과학</a></li>	
						<li><a href="BookList.bok?catg1=과학&catg2=IT/비즈니스">IT/비즈니스</a></li>	
						<li><a href="BookList.bok?catg1=과학&catg2=자격증">자격증</a></li>	
						<li><a href="BookList.bok?catg1=과학&catg2=프로그래밍">프로그래밍</a></li>		
					</ul>
				</div>
				<div>
					<ul class="">
						<li><a href="BookList.bok?catg1=취미&catg2=건강">건강</a></li>	
						<li><a href="BookList.bok?catg1=취미&catg2=요리">요리</a></li>	
						<li><a href="BookList.bok?catg1=취미&catg2=스포츠">스포츠</a></li>	
						<li><a href="BookList.bok?catg1=취미&catg2=결혼/임신/출산">결혼/임신/출산</a></li>	
						<li><a href="BookList.bok?catg1=취미&catg2=기타">기타</a></li>		
					</ul>
				</div>
				<div>
					<ul class="">
						<li><a href="BookList.bok?catg1=만화/웹소설&catg2=만화">만화</a></li>	
						<li><a href="BookList.bok?catg1=만화/웹소설&catg2=웹소설">웹소설</a></li>	
					</ul>
				</div>
				<a href="javascript:;" class="category-close">close</a>
			</div>
		</div>
	</div>
</div>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login" style="display:none"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">

	function frmSearchSubmit(){		
		
		var objFrm = $("#searchFrm") ;
		if ($(".search_input").val() == ''){
			alert('검색어를 검색해주세요.');
			$(".search_input").focus();			
			return ;
		}else{
			objFrm.attr("method","get");
			objFrm.attr("action","SearchAll.book");
			objFrm.submit();
		}		
	}

// 	var naver_id_login = new naver_id_login("tdoziaWOhdIeC0LICk28", httpsUrl +"/member/naver/naver.asp");

// 	naver_id_login.setPopup(); //Popup형태의 인증 진행
// 	naver_id_login.init_naver_id_login();

// 	var naver_url = $("#naver_id_login_anchor").attr("href");

// 	$("#login .naver a").attr("href", naver_url);
</script>
</div>
</body>
