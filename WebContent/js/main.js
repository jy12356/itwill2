$(document).ready(function() {
	
	
		
//	//알리미
//	$("#alarm_view").attr("src", "/main/_alarm.asp");
//	var timer = 0;
//	$(".alarm").on("mouseenter",function(){
//		var speed = Math.abs(timer-$.now());
//		if(speed > 300) {
//			timer = $.now();
//			$("#alarm_view").attr("src", "/main/_alarm.asp");
//			if($(".my-wrap").css("display")== "block"){
//				$(".my-wrap").fadeOut();
//			}
//			$(".alarm_layer_box").fadeIn();
//		}
//	});
	$(".alarm_layer_box").on("mouseleave",function(){
		var speed = Math.abs(timer-$.now());
		if(speed > 300) {
			timer = $.now();
			$(this).fadeOut();
		}
	});

	//마이페이지 레이어팝업
	var timer = 0;
	$(".mypop.on").on("mouseenter",function(){
		var speed = Math.abs(timer-$.now());
		if(speed > 300) {
			timer = $.now();
			if($(".alarm_layer_box").css("display")== "block"){
				$(".alarm_layer_box").fadeOut();
			}
			$(".my-wrap").fadeIn();
		}
	});
	$(".my-wrap").on("mouseleave",function(){
		var speed = Math.abs(timer-$.now());
		if(speed > 300) {
			timer = $.now();
			$(this).fadeOut();
		}
	});

	$(".btnLogOut").on("click",function(){
		$.post("/data/_logout.asp",{} , function(data){					
			if(data.success){
				window.location.href = httpUrl+"/main.asp";
			}else{
				alert(data.message);
			}
		}, "json");
	});
	
	//카테고리		
	$(".h-bottom-left ul > li").on("click",function(){
		
		$(".m-category").slideDown();	
	});
	$(".category-close").on("click",function(){
		$(".m-category").slideUp();		
	});
	
    $('.realtime-hot-list ul > li ').removeClass("open");
    $('.realtime-hot-list ul > li ').hover(function() {
        $(this).toggleClass("open");
    });

    $('.slider-event').slick({
        slide: 'li', //슬라이드 되어야 할 태그 ex) div, li 
        infinite: true, //무한 반복 옵션	 
        slidesToShow: 3, // 한 화면에 보여질 컨텐츠 개수
        slidesToScroll: 1, //스크롤 한번에 움직일 컨텐츠 개수
        speed: 100, // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
        arrows: true, // 옆으로 이동하는 화살표 표시 여부
        autoplay: true, // 자동 스크롤 사용 여부
        autoplaySpeed: 10000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
        pauseOnHover: true, // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
        draggable: true, //드래그 가능 여부 

        responsive: [ // 반응형 웹 구현 옵션
            {
                breakpoint: 960, //화면 사이즈 960px
                settings: {
                    //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 768, //화면 사이즈 768px
                settings: {
                    //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                    slidesToShow: 2
                }
            }
        ]

    });

    //팝업
    var $pop = null;
    var pop = {
        open: function(item) {
            $pop = $(item);
            $pop.removeClass("blind");
        },
        close: function(item) {
            $pop = $(item);
            $pop.addClass("blind");
        }
    }
	//메인슬리이드
	$(function() {
	    for (var l = 0, e = ($(window).outerWidth(), $(".slider ul li").width()), i = $(".slider ul li").length, 
						s = $(".slider ul li").width() * i, t = 0, r = "", f = i / 2, n = 0, a = 0, 
						d = $(".hot-inner").offset().left, c = 0; c < i; c++) {
	        var o = $(".slider ul li").eq(c).index();
	        if (i % 2 == 1) {
	            var u;
	            o < (u = Math.ceil(f)) ?
	                (n += e, $(".slider ul li").eq(o).css("left", n + (s / 2 - e / 2) - e)) :
	                o >= u && (a += e, $(".slider ul li").eq(o).css("left", a - e))
	        } else
	            o < f ?
	            (n += e, $(".slider ul li").eq(o).css("left", n + s / 2 - e)) :
	            (a += e, $(".slider ul li").eq(o).css("left", a - e))
	
	    }
	    i % 2 == 1 ?
	        $(".slider ul").css({
	            width: s,
	            left: -s / 2 + e / 2 + d
	        }) :
	        $(".slider ul").css({
	            width: s,
	            left: -s / 2 + d
	        });
	    for (c = 1; c <= i; c++)
	        r += "<a href='javascript:;'>" + c + "</a>",
	        $(".paging").html(r);
	
	    var h = $(".paging a").length;
	    $(".paging a:first").addClass("on"),
	        $(".next").on("click", function(i) {
	            Math.abs(t - $.now()) > 300 && (t = $.now(), l++, $(".slider ul li").each(function() {
	                var l = $(this).css("left");
	                l <= "0px" ?
	                    $(this).stop().animate({
	                        left: s - e
	                    }, 0) :
	                    $(this).stop().animate({
	                        left: "-=" + e + "px"
	                    }, 300)
	            }), l > h - 1 && (l = 0))
	        }),
	        $(".prev").on("click", function(i) {
	            Math.abs(t - $.now()) > 300 && (t = $.now(), l--, $(".slider ul li").each(function() {
	                var l = $(this).css("left");
	                l == s - e + "px" ?
	                    $(this).stop().animate({
	                        left: 0
	                    }, 0) :
	                    $(this).stop().animate({
	                        left: "+=" + e + "px"
	                    }, 300)
	            }), l < 0 && (l = h - 1))
	        }),
	        $(window).resize(function() {
	            for (var l = $(".hot-inner").offset().left, t = 0, r = 0, n = 0; n < i; n++) {
	                var a = $(".slider ul li").eq(n).index();
	                if (i % 2 == 1) {
	                    var d;
	                    a < (d = Math.ceil(f)) ?
	                        (t += e, $(".slider ul li").eq(a).css("left", t + (s / 2 - e / 2) - e)) :
	                        a >= d && (r += e, $(".slider ul li").eq(a).css("left", r - e))
	                } else
	                    a < f ?
	                    (t += e, $(".slider ul li").eq(a).css("left", t + s / 2 - e)) :
	                    (r += e, $(".slider ul li").eq(a).css("left", r - e))
	
	            }
	            i % 2 == 1 ?
	                $(".slider ul").css({
	                    width: s,
	                    left: -s / 2 + e / 2 + l
	                }) :
	                $(".slider ul").css({
	                    width: s,
	                    left: -s / 2 + l
	                })
	        })
	});
});

