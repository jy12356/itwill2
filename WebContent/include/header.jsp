<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>e북포털 북큐브</title>
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
				<input type="hidden" name="searchpage" value="normal" />
				<input type="hidden" name="page" value="">
					<fieldset>
						<legend>검색</legend>
						<h1 class="logo"><a href="Main.book">북큐브서점</a></h1>
						<div class="search">						
							<input type='text' name='searchString' class="search_input" style="ime-mode:active;" />
							<input type='button' onclick="frmSearchSubmit()" />
						</div>
						<ul class="my-lnb">
							<li class="btnLogin"><a href="MemberLoginForm.me">로그인</a></li>
							<li><a href="MemberJoinForm.me">회원가입</a></li>
						</ul>
					</fieldset>
				</form>
				<div class="my_layer_box">
					<div class="my-wrap">
						<span class="my-dot"></span>
						<div class="my-inner">
							<div class="my-top">
								<h3>마이페이지</h3>
								<a href="javascript:;" class="btn btnLogOut">로그아웃</a>
							</div>
							<ul>
								<li>
									<p>북캐시</p>
									<p>0원</p>
								</li>
								<li>
									<p>적립금</p>
									<p>0원</p>
								</li>
								<li>
									<p>쿠폰/상품권</p>
									<p>0장</p>
								</li>
								<li>
									<p>무료이용권</p>
									<p>0장</p>
								</li>
							</ul>
							<div class="my-bottom">
								<a href="https://www.bookcube.com/mypage.asp?list=_main" class="effect-btn">마이페이지 바로가기</a>
							</div>
						</div>
					</div>
				</div>
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
					<li><a href="FreeBoardList.free">게시판</a></li>
					<li><a href="../sub5/card.jsp">카트</a></li>
					<li><a href="../sub5/mypage.jsp">마이페이지</a></li>
					<!-- <li><a href="https://www.bookcube.com/toon/main.asp">관리자페이지</a></li> -->
				</ul>
				<ul class="lnb">
					<li><a href="../sub5/charge.jsp">캐시충전</a>
					<li><a href="QnaList.qna">고객센터</a>
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
		<div class="h-bottom-right">
			<ul class="snb-right">
				<li><a href="../sub1/list_best.jsp">베스트</a></li>
				<li><a href="../sub1/list_new.jsp">신간</a></li>
				<li><a href="../sub1/list_free.jsp">무료</a></li>
				<li><a href="../sub1/event">이벤트</a></li>
			</ul>
		</div>
		
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
<form name="sns_input_data">
<input type="hidden" class="sns_input_site_id" value="">
<input type="hidden" class="sns_input_id" value="">
<input type="hidden" class="sns_input_email" value="">
<input type="hidden" class="sns_input_title" value="">
</form>
<div id="login" class="login-pop">
<form onsubmit="return login_submit();">
	<div class="login-bg"></div>
	<div class="pop">
		<div class="pop-top">
			<a href="javascript:;" class="close">close</a>
		</div>
		<div class="join-wrap">
			<div class="join-info">
				<div class="js-join">
					<input type="text" name="" placeholder="아이디" maxlength="20" class="strId" />
					<p class="check"></p>
				</div>
				<div class="js-join">
					<input type="password" name="" placeholder="비밀번호" class="strPass" />
					<p class="check"></p>
				</div>
			</div>
			<div class="m-login">
				<div class="checkbox">
					<label>
						<input type="checkbox" class="loginsave">
						<span><i></i></span>
					</label>
					<p>로그인유지</p>
				</div>
				<p><a href="javascript:;" class="find-id">아이디 찾기</a><em>|</em><a href="javascript:;" class="find-pwd">비밀번호 찾기</a></p>
			</div>
			<div class="simple-login-btn">
				<p class="now-start"><span>지금 시작하세요!</span><a href="https://www.bookcube.com/member/register.asp">북큐브 간편가입 〉</a></p>
				<input type="submit" value="로그인" />
			</div>
			<div class="login-or"><p class="or">또는</p></div>
			<div class="simple-login-btn or">
				<div class="login-btn kakaotalk"><a href="javascript:loginWithKakao()"><p><span class="kakaotalk">카카오톡</span>카카오로 로그인</p></a></div>
				<div class="login-btn naver"><a href="" onClick="window.open(this.href, 'naverloginpop', 'titlebar=1, resizable=1, left='+(screen.availWidth-660)/2+',top='+(screen.availHeight-430)/2+',scrollbars=yes, width=1, height=1'); return false"><p><span class="naver">네이버</span>네이버로 로그인</p></a></div>
				<div class="login-btn facebook"><a href="javascript:;"><p><span class="facebook">페이스북</span>페이스북으로 로그인</p></a></div>
				<div class="login-btn payco"><a href="javascript:;"><p><span class="payco">페이코</span>페이코로 로그인</p></a></div>
			</div>
		</div>	
	</div>
</form>
</div>


<div id="login-success" class="login-pop">
<form>
	<div class="login-bg"></div>
	<div class="pop">
		<div class="pop-top">
			<a href="javascript:;" class="close">close</a>
		</div>
		<div class="join-connect">
			<!-- naver,twitter,kakao,facebook,payco  -->
			<p class="sns-logo">네이버</p>
			<p class="sns-confirm"><span class="sns-name">네이버</span> 인증이 완료되었습니다.</p>
			<div class="id-connect-wrap">
				<p>이미 북큐브 회원인 경우<span>북큐브 ID로 로그인하시면, SNS계정이 자동으로 연결됩니다.</span></p>
				<div class="bookcube-connect">
					<p><a href="javascript:;">북큐브 ID 연결하기</a></p>
					<div class="bookcube-input">
						<div class="js-join">
							<input type="text" name="strid" class="strLoginId" placeholder="아이디">
						</div>
						<div class="js-join">
							<input type="password" name="strpwd" class="strLoginPass" placeholder="비밀번호">
						</div>
						<div class="connect-join">
							<p><a href="#" class="find-id">아이디찾기</a><em>|</em><a href="#" class="find-pwd">비밀번호 찾기</a></p>
						</div>
						<a href="#" class="bookcube-login">로그인</a>
					</div>
				</div>
				<script>
					$(function(){
						$(".bookcube-connect > p").on("click",function(){
							if($(this).hasClass("on")){
								$(this).removeClass("on");
								$(".bookcube-input").hide();
							}else{
								$(this).addClass("on");
								$(".bookcube-input").show();
							}
						});
					});
					
				</script>
				<div class="sns-connect">
					<p>SNS 계정으로 신규 가입하기<span>SNS계정으로 로그인 시 해당 SNS 계정으로 북큐브에 자동 가입되며 간편하게 로그인이 가능합니다.</span></p>
					<a href="javascript:;" class="sns_login_btn">SNS 계정으로 가입하기</a>
				</div>
			</div>
		</div>
	</div>
</form>
</div>

<div id="find-pwd" class="login-pop">
<form onsubmit="return pw_search();">
	<div class="login-bg"></div>
	<div class="pop">
		<div class="pop-top">
			<a href="javascript:;" class="login-prev">prev</a>
			<a href="javascript:;" class="close">close</a>
		</div>
		<p class="title">비밀번호 찾기</p>
		<div class="join-wrap">
			<div class="join-info">
				<div class="js-join">
					<input type="text" name="" placeholder="아이디" class="strId">
					<p class="check"></p>
				</div>
				<div class="js-join">
					<input type="text" name="" placeholder="이메일" class="strMail">
					<p class="check"></p>
				</div>
			</div>
			<div class="login-btn">
				<input type="submit" value="확인">
			</div>
			<p class="info">북큐브 고객센터 : 1588-1925</p>
		</div>
	</div>
</form>
</div>

<div id="find-id" class="login-pop">
<form onsubmit="return id_search();">
	<div class="login-bg"></div>
	<div class="pop">
		<div class="pop-top">
			<a href="javascript:;" class="login-prev">prev</a>
			<a href="javascript:;" class="close">close</a>
		</div>
		<p class="title">아이디 찾기</p>
		<div class="join-wrap">
			<div class="join-info">
				<div class="js-join">
					<input type="text" name="" placeholder="이메일" class="strMail">
					<p class="check"></p>
				</div>
			</div>
			<div class="login-btn">
				<input type="submit" value="확인">
			</div>
			<p class="info">북큐브 고객센터 : 1588-1925</p>
		</div>
	</div>
</form>
</div>

<div id="id-result" class="login-pop">
<form>
	<div class="login-bg"></div>
	<div class="pop">
		<div class="pop-top">
			<a href="javascript:;" class="login-prev">prev</a>
			<a href="javascript:;" class="close">close</a>
		</div>
		<p class="title">아이디 조회 결과</p>
		<div class="find-result">
			<p></p>
		</div>
		<div class="login-btn">
			<input type="submit" class="member-login" value="로그인">
			<a href="javascript:;" class="find-pwd">비밀번호 찾기</a>
		</div>		
	</div>
</form>
</div>



<div id="pwd-result" class="login-pop">
	<div class="login-bg"></div>
	<div class="pop">
		<div class="pop-top">
			<a href="javascript:;" class="login-prev">prev</a>
			<a href="javascript:;" class="close">close</a>
		</div>
		<p class="title">비밀번호 조회 결과</p>
		<div class="find-result">
			<p><span></span>으로<br>비밀번호를 발송했습니다.</p>
		</div>
		<div class="login-btn">
			<a href="#" class="go-main">메인으로</a>
		</div>		
	</div>
</div>

<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login" style="display:none"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("tdoziaWOhdIeC0LICk28", httpsUrl +"/member/naver/naver.asp");

	naver_id_login.setPopup(); //Popup형태의 인증 진행
	naver_id_login.init_naver_id_login();

	var naver_url = $("#naver_id_login_anchor").attr("href");

	$("#login .naver a").attr("href", naver_url);
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->

<!-- 페이코 로그인 Script -->
<script type="text/javascript">
	var payco_client_id = "3RDL_pOgssXrawcbA2AG" ;
	var return_url = httpUrl +"/member/payco/payco_https.asp";
	var login_url = "https://id.payco.com/oauth2.0/authorize?response_type=code&client_id="+ payco_client_id +"&redirect_uri="+ escape(return_url) +"&serviceProviderCode=FRIENDS&userLocale=ko_KR"
	var sOption = "width=630, height=547, top=300, left=300,scrollbars=yes"

	 $(".login-btn.payco").on("click", function(e){
		var win = window.open(login_url, "payco", sOption);
	 });
</script>
<!--//페이코 로그인 Script -->

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1676308606031166',
      xfbml      : true,
      version    : 'v2.8'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

   $(".login-btn.facebook").on("click", function(e){
	   e.preventDefault();
		//FB.getLoginStatus(function(res){
			
		//});
		FB.login(function(res){
			if(res.status == "connected"){
				FB.api("/me?fields=email,name", function(res){
					//console.log(res.email);
					//console.log(res.name);
					//console.log(res.id);

					$.post("/data/_outside_join_yn.asp", {site_num : "51",ID : res.id}, function(data){						
						if (data.join_able_yn){
							sns_data_input("51", res.id, res.email, "페이스북");
						}else{
							sns_login('51',res.id,res.email);							
						}					
					}, "json");	

					//alert(res); 
				});
			}
		},{scope:"email"});
   });
</script>

<script>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('27b43a5f358f3c1f77e6002d11090c07');
	function loginWithKakao() {
	  // 로그인 창을 띄웁니다.
	  Kakao.Auth.login({
		success: function(authObj) {
		  Kakao.API.request({
			  url: '/v2/user/me',
			  success: function(res) {
				//alert(JSON.stringify(res.id));
				$.post("/data/_outside_join_yn.asp", {site_num : "21",ID : res.id}, function(data){						
					if (data.join_able_yn){
						sns_data_input("21", res.id, "", "카카오");
					}else{
						sns_login('21',res.id,'');						
					}					
				}, "json");	
			  },
			  fail: function(error) {
				//alert(JSON.stringify(error));
			  }
			});
		},
		fail: function(err) {
		  //alert(JSON.stringify(err));
		}
	  });
	};
  //]]>

function sns_data_input(site_num, res_id, res_email, site_name){
	$(".sns_input_site_id").val(site_num);
	$(".sns_input_id").val(res_id);
	var logo_name = "kakao";
	if (site_name == "네이버"){ logo_name = "naver";}
	if (site_name == "페이스북"){ logo_name = "facebook";}
	if (site_name == "페이코"){ logo_name = "payco";}
	$(".sns-logo").addClass(logo_name);
	$(".sns_input_email").val(res_email);
	$(".sns_input_title").val(site_name);	
	$(".sns-name").html(site_name);
	$("#login").hide();
	$("#login-success").show();
}

function sns_login(site_num, res_id, res_email){
	$.post("/data/_outside_login_process.asp", {site_num : site_num,ID : res_id, EMAIL : res_email}, function(data){						
	if(data.success){
		location.reload();
	}else{
		alert(data.message);
	}
	}, "json");
}

function login_submit(){
	var user_id = $("#login .strId").val();
	var user_pwd = $("#login .strPass").val();
	var user_login_save = $(".loginsave").val();
	var sns_input_site_id = $(".sns_input_site_id").val();
	var sns_input_id = $(".sns_input_id").val();
	var sns_sns_input_email = $(".sns_input_email").val();
	var loginsave = $(".loginsave").val();

	$.post("/data/_login.asp", {uid : user_id, upwd : user_pwd, loginsave : user_login_save, sns_site_id : sns_input_site_id, sns_id : sns_input_id, sns_email : sns_sns_input_email}, function(data){					
		if(data.success){
			window.location.reload();
		}else{
			alert(data.message);			
			$("#login .strPass").val('');								
		}
	}, "json");
	return false ;
}

function id_search(){
	var user_mail = $("#find-id .strMail").val();
	var user_type = "id_search";

	$.post("/data/_id_pwd_search.asp", {id_email : user_mail, search_type : user_type}, function(data){					
		if(data.success){
			txt = "<p>"+ data.name +"님의 아이디는<br /><span>"+ data.id +"</span>입니다.</p>";
			$("#id-result .find-result").html(txt);
			$("#find-id").hide();
			$("#id-result").show();
		}else{
			alert(data.message);
			$("#find-id .strMail").val("");				
		}
	}, "json");
	return false ; 
}


function pw_search(){
	var user_id = $("#find-pwd .strId").val();
	var user_mail = $("#find-pwd .strMail").val();
	var user_type = "pw_search";

	$.post("/data/_id_pwd_search.asp", {pw_id : user_id , pw_email : user_mail, search_type : user_type}, function(data){					
		if(data.success){
			txt = data.email_id +'@'+ data.email_domain;
			$("#pwd-result .find-result span").html(txt);
			$(".login-pop").hide();
			if($(".sns_input_site_id").val() == ""){
				$(".go-main").html('메인으로');
			}else{
				$(".go-main").html('로그인');
			}
			$("#pwd-result").show();
		}else{
			alert(data.message);
			$("#find-pwd .strId").val('');
			$("#find-pwd .strMail").val('');
			$("#find-pwd .strId").focus();
		}
	}, "json");
	return false;
}	

	$(function(){
		//로그인 팝업
		$(".pop-top .close").on("click",function(){
			$(this).parents().find(".login-pop").hide();	
		});
		$(".login-bg").on("click",function(){
			$(".login-pop").fadeOut(100);
		});				
		
		$(".js-join input").on("focus",function(){
			$(".js-join p.check").hide();
		});

		$(".pop-top .login-prev").on("click",function(){
			$(".login-pop").hide();
			$("#login").show();
			
		});
		
		$(".btnLogin").on("click",function(){
			$(".sns_input_site_id").val("");
			$(".sns_input_id").val("");
			$(".sns_input_email").val("");
			$(".sns_input_title").val("");
			$("#login").show();
			$("#login .strId").focus();
		});
		// 닫기
		$(".pop-top .close").on("click",function(){
			$(this).parents().find(".login-pop").hide();	
		});
		$(".login-bg").on("click",function(){
			$(".login-pop").fadeOut(100);
		});				
		$(".join-info input[type='text']:first").focus().css("border","1px solid #dc4510");
		
		$(".js-join input").on("focus",function(){
			$(".js-join p.check").hide();
			$(this).css("border","1px solid #dc4510");
		});
		$(".js-join input").on("blur",function(){
			$(this).css("border","1px solid #ccc");
		});

		$(".pop-top .prev").on("click",function(){
			$(".login-pop").hide();
			$("#login").show();
			
		});
		$(".find-id").on("click",function(){
			$(".login-pop").hide();
			$("#find-id").show();
			//$("#find-id .strMail").focus();
		});
		$(".find-pwd").on("click",function(){
			$(".login-pop").hide();
			$("#find-pwd").show();
			//$("#find-pwd .strId").focus();			
		});
		$(".member-login").on("click",function(){
			$(".login-pop").hide();
			if($(".sns_input_site_id").val() == ""){
				$("#login").show();
			}else{
				$("#login-success").show();
			}			
			
			//$("#login .strId").focus();
		});

		$(".go-main").on("click",function(){			
			if($(".sns_input_site_id").val() == ""){
				window.location.href = httpUrl ;
			}else{
				$(".login-pop").hide();
				$("#login-success").show();
			}			
		});		

		//sns 회원가입처리
		$(".sns_login_btn").on("click",function(){
			sns_login($(".sns_input_site_id").val(), $(".sns_input_id").val(), $(".sns_input_email").val());
		});		

		$(".bookcube-login").on("click",function(){
			var snsTitle = $(".sns_input_title").val();

			if(confirm("북큐브 ID와 " + snsTitle+ "계정을 연결하시겠습니까?" )){

				var user_id = $("#login-success .strLoginId").val();
				var user_pwd = $("#login-success .strLoginPass").val();
				var user_login_save = $("#login-success #strLoginSave").val();
				var sns_input_site_id = $(".sns_input_site_id").val();
				var sns_input_id = $(".sns_input_id").val();
				var sns_input_email = $(".sns_input_email").val();

				$.post("/data/_login.asp", {uid : user_id, upwd : user_pwd, loginsave : user_login_save, sns_site_id : sns_input_site_id, sns_id : sns_input_id, sns_email : sns_input_email}, function(data){		
					if(data.success){
						window.location.reload();
					}else{
						alert(data.message);
						//$("#login .strId").val('');
						$("#login-success .strPass").val('');					
						//$("#login .strId").focus();
					}
				}, "json");
			}
		});
	});	
</script>
	
		<!-- 
			장르에 따라 section에 클래스가 달라집니다.
			로맨스 <section class="romance">
			BL <section class="bl">
			무협/판타지 <section class="fanmu">
			만화 <section class="manhwa">
		-->