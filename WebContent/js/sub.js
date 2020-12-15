
$(document).ready(function(){
	
	//댓글 입력창
	$(".cmtModi").hide();
	$(".cmtRly").hide();
	//댓글 수정입력창 보이기
	$(".comment_modi_show").on("click", function() {
		$(".cmtModi").hide();
		$(".cmtRly").hide();
		var modi = $(this).parent().parent().parent().parent().next();
	    if (modi.css("display") == "none") {
	        $(this).parent().parent().parent().parent().next().show();
	    } else {
	        $(this).parent().parent().parent().parent().next().hide();
	    }
	    if ($(this).data("comment-count") > 0) {
	        if (modi.css("display") == "none") {
	            $(this).parent().parent().parent().parent().next().next().next().show();
	        } else {
	            $(this).parent().parent().parent().parent().next().next().next().hide();
	        }
	
	    }
	});
	
	//대댓글 입력창 보이기
	$(".comment_write_show").on("click", function() {
		
		$(".cmtModi").hide();
		$(".cmtRly").hide();
		var reply = $(this).parent().parent().parent().parent().next().next();
	    if (reply.css("display") == "none") {
	        $(this).parent().parent().parent().parent().next().next().show();
	    } else {
	        $(this).parent().parent().parent().parent().next().next().hide();
	    }
	    if ($(this).data("comment-count") > 0) {
	        if (reply.css("display") == "none") {
	            $(this).parent().parent().parent().parent().next().next().next().show();
	        } else {
	            $(this).parent().parent().parent().parent().next().next().next().hide();
	        }
	
	    }
	});
	//댓글 입력창 보이기(수정)
	$(".comment_modify").on("click", function() {
	    if ($.cookie("user_num")) {
	        $(this).parent().parent().parent().parent().hide();
	        $(this).parent().parent().parent().parent().next().show();
	    } else {
	        goLogin("", "로그인 후 이용가능합니다.\n로그인 하시겠습니까?");
	        //							alert('로그인 후 이용가능합니다.');
	        return;
	    }
	});
	//상세페이지 스크롤 이벤트
	var fix = {};
	fix = {
		init : function(){
			this.scroll();
			this.animate();
			this.off();
		},
		el :{
			payFix : $(".fix-series"), // 시리즈 리스트 위 가격 정보
			payFixWrap : $(".fix-series-wrap"), // 시리즈 리스트 위 가격 정보 높이값 고정해주는 박스
			tab : $(".detail-nav"),
			seriesTab : $(".d-series-tab"), 
			tabLen : $(".scroll-tab li").length,
			tabLi : $(".scroll-tab li"),
			fixHeight : $(".detail-nav").outerHeight()
		},
		off : function(){
			var _that = this;
			setTimeout(function(){
				for(var i = 1; i<=_that.el.tabLen;i++){
					_that.top["tab"+i] = $(".d-tab").eq(i-1).offset().top - _that.el.fixHeight;
				}
				if($(".publish-book").length > 0){
					$(".all-volume p span").css("cursor","pointer");
				}
			},1000);
		},
		top : {
			// top 객체에 각 탭의 갯수 만큼 key,value 생성과 각종 위치값 들어갑니다.
		},
		scroll : function(){
				var _that = this;
				var step = 0;
				$(window).scroll(function(){
					var scrollTop = $(window).scrollTop();
					for(var i = 1; i<=_that.el.tabLen;i++){
						_that.top["tab"+i] = $(".d-tab").eq(i-1).offset().top - _that.el.fixHeight;
					}
	
					if(_that.top.tab1 <= scrollTop){
						_that.el.tab.css({"position":"fixed","left":0,"top":0});
					}else{
						_that.el.tab.css("position","static");
					}
	
					if($(".d-list").length > 0){ //  시리즈 리스트가 있음.
						_that.top["fix"] = _that.el.payFixWrap.offset().top - _that.el.fixHeight;
						_that.top["seriesTab"] = _that.el.seriesTab.offset().top - _that.el.fixHeight;
						if(_that.top.fix <=scrollTop){
							_that.el.payFix.css({"position":"fixed","left":"0","top":_that.el.fixHeight,"border-bottom":"1px solid #f4f4f4","box-shadow":"0 2px 8px 2px rgba(0,0,0,.2)"}).addClass("on");
							_that.el.payFix.find("div:first").css({"width":"880px","margin":"0 auto"});
						}else{
							_that.el.payFix.css({"position":"static","border-bottom":"none","margin-left":"0","box-shadow":"none"}).removeClass("on");
						}
	
						if($(".d-list").offset().top + ($(".d-list").next().offset().top - $(".d-list").offset().top) - 100 <=scrollTop){
							_that.el.payFix.fadeOut(300);
						}else{
							_that.el.payFix.fadeIn(300);
						}
	
						
					}
	
					for(var len = 1; len <=_that.el.tabLen; len++){
						if(eval("_that.top.tab"+len)<=scrollTop+1){
							_that.el.tabLi.removeClass("on");
							_that.el.tabLi.eq(len-1).addClass("on");
						}else{
							_that.el.tabLi.eq(len-1).removeClass("on");
						}
					}
					if(eval("_that.top.tab"+1)>=scrollTop+1){
						_that.el.tabLi.eq(0).addClass("on");
					}
				});
		},
		animate : function(){
				var _that = this;
				_that.el.tabLi.find("a").on("click",function(){
					var scrollTop = $(window).scrollTop();
					var idx = $(this).parent().index()+1;
					for(var i = 1; i<=_that.el.tabLen;i++){
						_that.top["tab"+i] = $(".d-tab").eq(i-1).offset().top - _that.el.fixHeight;
					}
					$('html, body').animate({scrollTop: eval("_that.top.tab"+idx)}, 0);
				});
				$(".review-user").on("click",function(){
					var scrollTop = $(window).scrollTop();
					$('html, body').animate({scrollTop: eval("_that.top.tab"+_that.el.tabLen)}, 0);
				});
				$(".all-volume p span").on("click",function(){
					var scrollTop = $(window).scrollTop();
					if($(".publish-book").length > 0){
						var pub = $(".publish-book").offset().top - 140;
						$('html, body').animate({scrollTop: pub}, 0);	
					}else{
						return
					}
				});
		}
	};
	
	fix.init();
	
	/*댓글더보기 */
//	$(".d-more").on("click",function(){	
//		$(this).hide();
//		$(this).parent().find("li").show();	
//		return false;
//	});
});