<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<jsp:include page="../include/header.jsp" />
<style type="text/css">
li>#pieCatg {
	float: left;
}

li>#bar {
	float: right;
}

.mem-array {
	
}

.mem-array:after {
	content: "";
	display: block;
	clear: both;
}

.mem-array input[type='radio'] {
	position: absolute;
	left: -9999px;
	width: 17px;
	height: 17px;
}

.mem-array label {
	display: block;
	margin-left: 20px;
	line-height: 50px;
	height: 50px;
	float: left;
	text-align: center;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
}

.mem-array label span {
	padding: 2px;
	margin: 2px;
	color: gray;
}

.mem-array label .on {
	padding: 3px;
	margin: 2px;
	border-bottom: 2px solid black;
}

.mem-array label span {
	padding: 2px;
	margin: 2px;
	color: gray;
}

.mem-array label .on {
	padding: 3px;
	margin: 2px;
	border-bottom: 2px solid black;
}

.ko-array {
	
}

.ko-array:after {
	content: "";
	display: block;
	clear: both;
}

.ko-array input[type='radio'] {
	position: absolute;
	left: -9999px;
	width: 17px;
	height: 17px;
}

.ko-array label {
	display: block;
	margin-left: 20px;
	line-height: 50px;
	height: 50px;
	float: left;
	text-align: center;
	font-weight: 600;
	font-size: 14px;
	cursor: pointer;
}

.ko-array label span {
	padding: 2px;
	margin: 2px;
	color: gray;
}

.ko-array label .on {
	padding: 3px;
	margin: 2px;
	border-bottom: 2px solid black;
}

.ko-array label span {
	padding: 2px;
	margin: 2px;
	color: gray;
}

.ko-array label .on {
	padding: 3px;
	margin: 2px;
	border-bottom: 2px solid black;
}

th.memSortTbody {
	font-size: 13px;
	font-weight: 500;
	padding: 3px;
}

.btn2 {
	padding: 8px !important;
	margin-top: 15px;
	background-color: #069e89 !important;
	color: white;
	border-radius: 5px !important;
	font-weight: 500;
	font-size: 14px;
	border: 1px solid #72ada5 !important;
}

.container{margin:0 auto; width:80%;}
.tab_tit{padding-top:20px; border-bottom:1px solid #777;}
.tab_tit::after{content:''; display:block; clear:both;}
.tab_tit li{float: left;width: 150px;height: 32px;text-align: center;line-height: 32px; cursor:pointer}
.tab_tit li::after{content:''; display:none; clear:both; width:100%; height:3px; background:#48474e;}
.tab_tit li.on::after{display:block;}

.cnt{display:none; padding:40px 10px;} 
.cnt.on{display:block; padding:40px 10px;}
.cnt h2{font-size:20px; font-weight:800;}
.cnt ul{padding:20px 0px;}
.cnt ul li{line-height:22px;}
.cnt ul li::before{content: '';display: inline-block;margin-top: 9px;margin-right: 9px;width: 5px;height: 5px;background: #2f4394;border-radius: 50%;vertical-align: top;}
</style>

<%
/* MemberDAO memberDao = MemberDAO.getInstance();

JSONArray jsonArray = memberDao.memberListCal(); */
	// String id = (String)session.getAttribute("id");
// 	MemberBean article = (MemberBean)request.getAttribute("article");

ArrayList<MemberBean> articleList = (ArrayList<MemberBean>) request.getAttribute("articleList");
/* PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount(); */
SimpleDateFormat sdf = new SimpleDateFormat("yy.MM.dd");
String id= (String)session.getAttribute("id");
PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
int listCount = pageInfo.getListCount();

 	String name1 = "전체";
	/* if(request.getParameter("name1")!=null){
		name1 = request.getParameter("name1");
	} */
	String id1 = "전체";
	if(request.getParameter("id")!=null){
		id1 = request.getParameter("id");
	} 
	String state = "*";
	if(request.getParameter("state")!=null){
		state = request.getParameter("state");
	} 
	
%> 
<section class="sub">
	<div class="category-nav">
		<div class="category-nav-inner">
			<p>HOME &gt; 관리자페이지 &gt; 고객관리</p>
		</div>
	</div>
	<div class="contents-wrap">
		<div class="mypage">
			<div class="mypage-top">
				<div class="detail-inner">
					<h3>관리자페이지</h3>
					
					<div class="mypage-box-bottom">
						<div>
							<ul>
								<li>
									<span class="kakaotalk">로그인정보</span> <!-- bookcube,kakaotalk,naver,twitter,facebook,payco-->
									<p><span><%=id %> 님</span></p>
								<a href="MemberModifyForm.me?id=<%=id %>" class="btn">회원정보</a>
								</li>			
								<li>
									<h4>회원관리</h4>
									<ul>
										<li><a href="MemberList.me" class="on">회원목록</a></li>
										<li><a href="Return.rn" class="">대출반납관리</a></li>
									</ul>
								</li>
								<li>
									<h4>책정보 관리 </h4>
									<ul>
										<li><a href="BookWriteForm.bok" class="">책등록</a></li>
										<li><a href="RequestList.rq" class="">희망도서</a></li>
										<li><a href="NoticeBoardList.not?page=1" class="">게시글</a></li>
										<li><a href="QnaList.qna" class="">QnA</a></li>
									</ul>
								</li>
							</ul>
						</div>
						
					</div>
				</div>
			</div>
			<div class="customer" style="width: 1400px;">
				
				
				<ul class="tab_tit">
				    <li class="on" data-tab="tab1">고객관리</li>
				    <li data-tab="tab2" onclick="javascript:test()">대시보드</li>
				  </ul>
				
				
				<div id="tab1" class="cnt on"><h3 class="coTitle">고객관리</h3>
				<div class="customer-contents">
					<div class="customer-inner">




						<table summary="공지사항" class="customer-table notice">
							<caption>공지사항</caption>
							<thead>
								<tr>
									<th scope="col" class="memSortTbody" abbr="선택">선택</th>
									<th scope="col" class="memSortTbody" abbr="회원번호">회원번호</th>
									<th scope="col" class="memSortTbody" abbr="아이디">아이디</th>
									<th scope="col" class="memSortTbody" abbr="비밀번호">비밀번호</th>
									<th scope="col" class="memSortTbody" abbr="이름">이름</th>
									<th scope="col" class="memSortTbody" abbr="이메일">이메일</th>
									<th scope="col" class="memSortTbody" abbr="전화번호">전화번호</th>
									<th scope="col" class="memSortTbody" abbr="생년월일">생년월일</th>
									<th scope="col" class="memSortTbody" abbr="가입일">가입일</th>
									<th scope="col" class="memSortTbody" abbr="주소">주소</th>
									<th scope="col" class="memSortTbody" abbr="선호장르">선호장르</th>
									<th scope="col" class="memSortTbody" abbr="상태">상태</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int i = 0; i < articleList.size(); i++) {
								%>
								<tr>
									<th scope="col" class="check_box" abbr="선택"><input
										type="checkbox" name="inter_num" id="checkbox_num"
										value=<%=articleList.get(i).getNum()%>></th>
									<th scope="col" class="memSortTbody" abbr="회원번호" id="num"><%=articleList.get(i).getNum()%></th>
									<th scope="col" class="memSortTbody" abbr="아이디" id="id"><%=articleList.get(i).getId()%></th>
									<th scope="col" class="memSortTbody" abbr="비밀번호" id="password"><%=articleList.get(i).getPassword()%></th>
									<th scope="col" class="memSortTbody" abbr="이름" id="name"><%=articleList.get(i).getName()%></th>
									<th scope="col" class="memSortTbody" abbr="이메일" id="email"><%=articleList.get(i).getEmail()%></th>
									<th scope="col" class="memSortTbody" abbr="전화번호" id="phone"><%=articleList.get(i).getPhone()%></th>
									<th scope="col" class="memSortTbody" abbr="생년월일" id="age"><%=articleList.get(i).getAge()%></th>
									<th scope="col" class="memSortTbody" abbr="가입일" id="date"><%=sdf.format(articleList.get(i).getDate())%></th>
									<th scope="col" class="memSortTbody" abbr="주소" id="address"><%=articleList.get(i).getAddress()%></th>
									<th scope="col" class="memSortTbody" abbr="선호장르" id="catg"><%=articleList.get(i).getCatg()%></th>
									<th scope="col" class="memSortTbody" abbr="상태" id="state"><%=articleList.get(i).getState()%></th>
									<%
										}
									%>
								</tr>
						</table>
						</tbody>
						<label for="" class="radio" data-sort="등급"> <input
							type="button" name="reportChkBxRow" class="btn2" value="삭제"
							onclick="deleteListMem(); return false;"></label>
						<div class="paging">
						
							<a href="MemberList.me?page=1" class="arr" data-page-num="1">
										<img src="images/p-first.png"><span class="hide">처음페이지</span>
								</a>
							<%if(nowPage <=1) {%>
									
                            		<a href="MemberList.me?page=<%=nowPage%>" class="arr prev" data-page-num="1">
										<img src="images/p-prev.png"><span class="hide">이전페이지</span>
									</a>
								<%}else{%>
								<a href="MemberList.me?page=<%=nowPage - 1 %>" class="arr prev" data-page-num="1">
										<img src="images/p-prev.png"><span class="hide">이전페이지</span>
									</a>
								
								<%} %>
								
								<%for(int i = startPage; i <= endPage; i++) { 
										if(i == nowPage) { %>
											<a href="MemberList.me?page=<%=i%>" class="on" data-page-num="<%=i%>"><%=i%></a>
										<%} else { %>
											<a href="MemberList.me?page=<%=i%>" class="" data-page-num="<%=i%>"><%=i%></a>
										<%} %>
								<%} %>
								
                            	<%if(nowPage >= maxPage) { %>
									<a href="MemberList.me?page=<%=nowPage%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
	                            <%}else{%>   
	                            	<a href="MemberList.me?page=<%=nowPage + 1%>" class="arr next" data-page-num="11">
	                            		<img src="images/p-next.png"><span class="hide">다음페이지</span>
	                            	</a>
                            	<%} %>
	                            	<a href="MemberList.me?page=<%=maxPage%>" class="arr" data-page-num="781">
                                		<img src="images/p-last.png"><span class="hide">마지막페이지</span>
                               		</a>
						</div>
					</div>
					</div>
					</div>
					
					
					
					 <div id="tab2" class="cnt">
					<h3 class="coTitle">대시보드 </h3>
						<table>
							<!-- <table class="columns"> -->
							<tr>
								<td><div id="chart1" style="padding: 10px;"></div></td>
								<td><div id="chart2" style="padding: 10px;"></div></td>
							</tr>
							<tr>
								<td><div id="chart3" style="padding: 10px;"></div></td>
								<td><div id="chart4" style="padding: 10px;"></div></td>
							</tr> 
						</table>
						</div>
						
						
						
						
				</div>
				</div>
			</div>
	</section>
    
	<!-- <script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
	function drawGraph() {
	
	google.load("visualization", "1", {packages:["corechart"]}); 
    google.setOnLoadCallback(drawChart); 
    
    function drawChart() {
	       var queryObjectLen="";
	       // 리스트 생성
	       var arr1 = new Array() ;
	       var arr2 = new Array() ;
	       var arr3 = new Array() ;
	       var arr4 = new Array() ;
	       
	       $.ajax({
	    	   
    	    type: "POST", 
			url : "MemberListCal.me",
			dataType : "json",
			success : function(data) {
				
				$.each(data, function( index, responseObj){ 

				    // 객체 생성
			        var obj1 = new Object() ;
					    obj1.catg_count = responseObj.catg_count;
					    obj1.catg = responseObj.catg;


		            // 리스트에 생성된 객체 삽입
					if(obj1.catg_count !=  undefined || obj1.catg != undefined){
		            	arr1.push(obj1) ;
					}

		 	        var obj2 = new Object() ;
		            obj2.date = responseObj.date;
					obj2.id_count = responseObj.id_count;
					if(obj2.date !=  undefined || obj2.id_count != undefined){
		            	arr2.push(obj2) ;
					}
					

			        var obj3 = new Object() ;	
		            obj3.qna_genre = responseObj.qna_genre;
					obj3.qna_count = responseObj.qna_count;

					if(obj3.qna_genre !=  undefined || obj2.qna_count != undefined){
						arr3.push(obj3) ;
					}
					

				    var obj4 = new Object() ;
		            obj4.retal_count = responseObj.retal_count;
					obj4.s_date = responseObj.s_date;

					if(obj4.retal_count !=  undefined || obj4.s_date != undefined){
						arr4.push(obj4) ;
					}
		            
		            					
				});
				 // String 형태로 변환
		        var jsonData1 = JSON.stringify(arr1) ;
		        var jsonData2 = JSON.stringify(arr2) ;
		        var jsonData3 = JSON.stringify(arr3) ;
		        var jsonData4 = JSON.stringify(arr4) ;
		        
	        var data = new google.visualization.DataTable();
			data.addColumn("string", "catg");
			data.addColumn("number", "catg_count");
			for (var i = 0; i < arr1.length; i++) {
				var catg = JSON.parse(jsonData1)[i].catg;
				var catg_count = JSON.parse(jsonData1)[i].catg_count; 
				data.addRows([ [catg, parseInt(catg_count) ] ]);
			}
			
			var data2 = new google.visualization.DataTable();
			data2.addColumn("string", "date");
			data2.addColumn("number", "id_count");
			for (var i = 0; i < 7; i++) {
				var date = JSON.parse(jsonData2)[i].date; 
				var id_count = JSON.parse(jsonData2)[i].id_count;
				data2.addRows([ [ date, parseInt(id_count) ] ]);
			}
			
			var data3 = new google.visualization.DataTable();
			data3.addColumn("string", "qna_genre");
			data3.addColumn("number", "불만사항");
			data3.addColumn("number", "취소/환불");
			data3.addRows([ 
				[ 'Jan' , 15, 4 ],   
		        [ 'Feb' , 14, 2 ],   
		        [ 'Mar' , 13, 5 ],   
		        [ 'Apr' , 14, 5 ],
		        [ 'May' , 13, 12 ],   
		        [ 'Jun' , 15, 14 ],   
				[ 'Jul' , 12, 15 ],   
		        [ 'Aug' , 11, 8 ],
		        [ 'Sep' , 17, 6 ],   
		        [ 'Oct' , 21, 6 ],   
		        [ 'Nov' , 12, 8 ],   
		        [ 'Dec' , 11, 5 ] 
				]);
			for (var i = 0; i < arr3.length; i++) {
				var qna_genre = JSON.parse(jsonData3)[i].qna_genre;
				var qna_count = JSON.parse(jsonData3)[i].qna_count;
			}
			
			var data4 = new google.visualization.DataTable();
			data4.addColumn("string", "월");
			data4.addColumn("number", "대여수");
			data4.addRows([ 
				  [ 'Jan' , 523 ],   
		          [ 'Feb' , 535 ],   
		          [ 'Mar' , 582 ],   
		          [ 'Apr' , 515 ],
		          [ 'May' , 593 ],   
		          [ 'Jun' , 551 ],   
		          [ 'Jul' , 606 ],   
		          [ 'Aug' , 591 ],
		          [ 'Sep' , 562 ],   
		          [ 'Oct' , 591 ],   
		          [ 'Nov' , 521 ],   
		          [ 'Dec' , 585 ] ]);
			
			var options = {
				title : "회원들의 장르별 선호도",
				is3D : true,
				width: 700,
		        height: 400,
		        backgroundColor: '#e6e6ff'
			};
			
			var options2 = {
		        is3D : true,
				title : '가입자수 추이 ',
				width: 700,
		        height: 400,
		        role: 'annotation' ,
		       /*  role: 'tooltip', */
		        /* bar: {groupWidth: "70%"}, */
		        legend: { position: "none" }, 
		        colors : [ "red"],
		        trendlines: {
		            0: {
		              type: 'exponential',
		              visibleInLegend: true,
		            }
		          },
		          hAxis: {
		              slantedText: true,
		              slantedTextAngle: 20,
		              gridlines: {count: 7}
		           },
		           animation:{
			        	  duration: 1500,
			              easing: 'out',
			              startup: true
	                   },
		           backgroundColor: '#ffe6ff'
	        };
			
			var options3 = {
				is3D : true,
				title : "불만사항 접수 ",
				width: 700,
		        height: 400,
	            
	          bar: { groupWidth: "90%" },
	          backgroundColor: '#ffffe6',
	          animation:{
	        	  duration: 1500,
	              easing: 'out',
	              startup: true
               }
			};
			
			var options4 = {
					/* is3D : true, */
					title : '월별 배송량 ',
					width: 700,
			        height: 400,
			        role: 'annotation' ,
			        legend: { position: "none" }, 
			        trendlines: {
			            0: {
			              type: 'exponential',
			              visibleInLegend: true,
			            }
			          },
			          animation:{
			        	  duration: 1500,
			              easing: 'out',
			              startup: true
	                   },
			          backgroundColor: '#f1f8e9'  
		        };
			
			var chart1 =  new google.visualization.PieChart(document.getElementById("chart1"));
            chart1.draw(data,options);

			var chart2 =  new google.visualization.BarChart(document.getElementById("chart2"));
			chart2.draw(data2,options2);

			var chart3 =  new google.visualization.AreaChart(document.getElementById("chart3"));
			chart3.draw(data3,options3);

			var chart4 =  new google.visualization.LineChart(document.getElementById("chart4"));
			chart4.draw(data4,options4);
			},
			
	       	
		error: function (xhr, type,data,queryObject) {
	           alert(data+"~~~"+queryObject)

	         }
	       });
	     };
	}
     function test() {
    	  drawGraph();
    	  document.getElementById("chart1").style.display = "block";
    	  document.getElementById("chart2").style.display = "block";
    	  document.getElementById("chart3").style.display = "block";
    	  document.getElementById("chart4").style.display = "block";
    	  }
	     
	     
	function deleteListMem(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
			var inter_num = [];
			if ($('.check_box input[type="checkbox"]:checked').length > 0) {
				$('.check_box input[type="checkbox"]:checked').each(function(){
					inter_num.push($(this).attr("value"));  
				});
			}else{
				alert("게시물을 선택해주시길 바랍니다.");
				return false;	            	
			};	
			var interArr = {"inter_num" :inter_num};
			$.ajax({
				url : "MemListDelete.me",
				type : "post",
				dataType: 'text',
				data : interArr,
				success : function(){
					location.href = "MemberList.me";
				},error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }

			});
		} 
    };
	
    
    
    $(function() {
    	  $('ul.tab_tit li').click(function() {
    	    var onTab = $(this).attr('data-tab');
    	    $('ul.tab_tit li').removeClass('on');
    	    $('.cnt').removeClass('on');
    	    $(this).addClass('on');
    	    $('#' + onTab).addClass('on');
    	  })
    	}); 
	</script>
</html>
<jsp:include page="../include/footer.jsp" />
