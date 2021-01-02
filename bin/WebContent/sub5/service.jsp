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
                    <div class="customer-contents">
                        <div class="customer-use-wrap">
                            <ul class="customer-s-menu service">
                                <li><a href="javascript:;" class="on">북큐브 캐시데이</a></li>
                                <!--li><a href="javascript:;" class="">10년소장 서비스</a></li-->
                                <li><a href="javascript:;" class="">회원 혜택</a></li>
                                <li><a href="javascript:;" class="">선물하기 기능</a></li>
                                <!-- 					<li><a href="javascript:;" class="">기다리면 무료</a></li> -->
                                <!-- 					<li><a href="javascript:;" class="">편리한 이용팁</a></li> -->
                                <!-- 					<li><a href="javascript:;" class="">앱/뷰어 활용법</a></li> -->
                            </ul>
                            <div class="customer-use">
                                <div class="bookcube-use">
                                    <div style="display: block;">
                                        <div class="bookcube-service">
                                            <img src="../images/service-1.jpg">
                                        </div>
                                        <div class="bookcube-service-img">
                                            <img src="../images/service-content-1.jpg">
                                        </div>
                                    </div>
                                    <!--div style="display: none;">
							<div class="bookcube-service">
								<img src="../images/service-2.jpg">
							</div>
							<div class="bookcube-service-img">
								<img src="../images/service-content-2.jpg">
							</div>
						</div-->
                                    <div style="display: none;">
                                        <div class="bookcube-service">
                                            <img src="../images/service-3.jpg">
                                        </div>
                                        <div class="bookcube-service-img">
                                            <img src="../images/service-content-3.jpg" usemap="#sc3">
                                            <map name="sc3">
                                                <area shape="RECT" coords="258,1834,641,1905" href="https://www.bookcube.com/member_info.asp" title="본인인증">
                                            </map>
                                        </div>
                                    </div>
                                    <div style="display: none;">
                                        <div class="bookcube-service">
                                            <img src="../images/service-4.jpg">
                                        </div>
                                        <div class="bookcube-service-img">
                                            <img src="../images/service-content-4.jpg">
                                        </div>
                                    </div>
                                    <!-- 기다리면 무료 -->
                                    <div>
                                        <div class="bookcube-service">
                                            <img src="../images/service-wait.jpg">
                                        </div>
                                        <div class="bookcube-service-img">
                                            <img src="../images/service-content-wait.jpg">
                                        </div>
                                    </div>
                                    <div style="display: none;">
                                        <div class="bookcube-service">
                                            <img src="../images/service-5.jpg">
                                        </div>
                                        <div class="bookcube-service-img">
                                            <img src="../images/service-content-5.jpg">
                                        </div>
                                    </div>
                                    <div style="display: none;">
                                        <div class="bookcube-service">
                                            <img src="../images/service-6.jpg">
                                        </div>
                                        <div class="bookcube-service-img">
                                            <img src="../images/service-content-6.jpg">
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $(function() {
                                        var _sMenu = $(".customer-s-menu li");
                                        var _useDiv = $(".bookcube-use > div");
                                        _sMenu.on("click", function() {
                                            var idx = $(this).index();
                                            _sMenu.find("a").removeClass("on");
                                            $(this).find("a").addClass("on");
                                            _useDiv.hide();
                                            _useDiv.eq(idx).show();
                                            return false;
                                        });

                                        var hash = ["#cash", "#benefit", "#gift", "#wait", "#tip", "#app"];
                                        for (var i in hash) {
                                            if (window.location.hash == hash[i]) {
                                                $(".customer-s-menu li").find("a").removeClass("on");
                                                $(".customer-s-menu li").eq(i).find("a").addClass("on");
                                                $(".bookcube-use > div").hide();
                                                $(".bookcube-use > div").eq(i).show();
                                            }
                                        }
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</section>
<jsp:include page="../include/footer.jsp"/>