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
										<li><a href="http://localhost:8080/itwill2th/MemberList.me" class="">회원목록</a></li>
										<li><a href="BookDibsList.bok" class="">대출관리</a></li>
										<li><a href="Return.rn" class="">대출관리</a></li>
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
				<h3 class="coTitle">고객관리</h3>
				<div class="customer-contents">
					<div class="customer-inner">
						<table summary="공지사항" class="customer-table notice">
							<!-- <table class="columns"> -->
							<tr>
								<td><div id="chart1" style="background-color :blue;"></div></td>
							</tr>
							<tr>
								<td><div id="chart2" style="background-color :orange;"></div></td>
							</tr>
							<tr>
								<td><div id="chart3" style="background-color :blue;"></div></td>
							</tr>
							<tr>
								<td><div id="chart4" style="background-color :orange;"></div></td>
							</tr> 
							
							<!--  </table> -->

						</table>




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
									<th scope="col" class="memSortTbody" abbr="선택"><input
										type="checkbox" name="check_box" id="check_box"
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
							onclick="deleteListMem()"></label>
						<div class="paging">
							<a href="/customer.asp?page=notice&pageNum=1" class="arr"
								data-page-num="1"><img src="images/p-first.png"><span
								class="hide">처음페이지</span></a> <a
								href="/customer.asp?page=notice&pageNum=1" class="arr prev"
								data-page-num="1"><img src="images/p-prev.png"><span
								class="hide">이전페이지</span></a> <a
								href="/customer.asp?page=notice&pageNum=1" class="on fir"
								data-page-num="1">1</a>
							<!-- 	<a href="/customer.asp?page=notice&pageNum=2" class="" data-page-num="2">2</a><a href="/customer.asp?page=notice&pageNum=3" class="" data-page-num="3">3</a><a href="/customer.asp?page=notice&pageNum=4" class="" data-page-num="4">4</a><a href="/customer.asp?page=notice&pageNum=5" class="" data-page-num="5">5</a><a href="/customer.asp?page=notice&pageNum=6" class="" data-page-num="6">6</a><a href="/customer.asp?page=notice&pageNum=7" class="" data-page-num="7">7</a><a href="/customer.asp?page=notice&pageNum=8" class="" data-page-num="8">8</a><a href="/customer.asp?page=notice&pageNum=9" class="" data-page-num="9">9</a><a href="/customer.asp?page=notice&pageNum=10" class="" data-page-num="10">10</a> -->
							<a href="/customer.asp?page=notice&pageNum=11" class="arr next"
								data-page-num="11"> <img src="images/p-next.png"><span
								class="hide">다음페이지</span></a> <a
								href="/customer.asp?page=notice&pageNum=27" class="arr"
								data-page-num="27"><img src="images/p-last.png"><span
								class="hide">마지막페이지</span></a>
						</div>
					</div>

				</div>

			</div>
	</section>
    
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
	google.load("visualization", "1.0", {
	     callback: function () {
	       var queryObject="";
	       var queryObjectLen="";
	      
	       $.ajax({
			url : "MemberListCal.me",
			dataType : "json",
			success : function(resultObj) {
				queryObject = eval("(" + JSON.stringify(data) + ")");  
				queryObject =JSON.stringify(queryObject) ;
				queryObjectLen = queryObject.opdetails.length;
				

			var data = new google.visualization.DataTable();
			data.addColumn("string", "catg");
			data.addColumn("number", "catg_count");
			for (var i = 0; i < queryObjectLen; i++) {
				var catg = queryObject.opdetails[i].catg;
				var catg_count = queryObject.opdetails[i].catg_count;
				data.addRows([ [ catg, parseInt(catg_count) ] ]);
			}
			
			var data2 = new google.visualization.DataTable();
			data2.addColumn("string", "date");
			data2.addColumn("number", "id_count");
			for (var i = 0; i < queryObjectLen; i++) {
				var date = queryObject.opdetails[i].date;
				var id_count = queryObject.opdetails[i].id_count;
				data2.addRows([ [ date, parseInt(id_count) ] ]);
			}
			
			var data3 = new google.visualization.DataTable();
			data3.addColumn("string", "qna_genre");
			data3.addColumn("number", "qna_count");
			for (var i = 0; i < queryObjectLen; i++) {
				var qna_genre = queryObject.opdetails[i].qna_genre;
				var qna_count = queryObject.opdetails[i].qna_count;
				data3.addRows([ [ qna_genre, parseInt(qna_count) ] ]);
			}
			
			var data4 = new google.visualization.DataTable();
			data4.addColumn("string", "s_date");
			data4.addColumn("number", "retal_count");
			for (var i = 0; i < queryObjectLen; i++) {
				var s_date = queryObject.opdetails[i].s_date;
				var retal_count = queryObject.opdetails[i].retal_count;
				data4.addRows([ [ s_date, parseInt(retal_count) ] ]);
			}
			
			var options = {
				title : "1번 그래프_선호장르",
				colors : [ "green", "yellow" ],
				hAxis : {
					title : "Location11"
				},
				vAxis : {
					title : "No. of Posts11"
				}
			};
			
			var options2 = {
				title : "2번 그래프_가입자수증가",
				   curveType: "function", 
				colors : [ "green", "yellow" ],
				hAxis : {
					title : "Location22"
				},
				vAxis : {
					title : "No. of Posts22"
				} 
			};
			
			var options3 = {
				title : "3번 그래프_불만사항 접수",
				colors : [ "green", "yellow" ],
				hAxis : {
					title : "Location33"
				},
				vAxis : {
					title : "No. of Posts33"
				}
			};
			
			var options4 = {
				title : "4번 그래프_대출 그래프",
				colors : [ "green", "yellow" ],
				hAxis : {
					title : "Location44"
				},
				vAxis : {
					title : "No. of Posts44"
				}
			};
			
			var chart1 =  new google.visualization.PieChart(document.getElementById("chart1"));
	           chart1.draw(data,options);

			var chart2 =  new google.visualization.LineChart(document.getElementById("chart2"));
			chart2.draw(data2,options2);

			var chart3 =  new google.visualization.PieChart(document.getElementById("chart3"));
			chart3.draw(data3,options3);

			var chart4 =  new google.visualization.PieChart(document.getElementById("chart4"));
			chart4.draw(data4,options4);
			
		},
		error: function (xhr, type,data,queryObject) {
	           alert(data+"~~~"+queryObject)
	         }
	       });
	     },
	     packages:["corechart"]
	});
    
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
						location.href = "BookDibsList.bok";
					},error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }`

				});
			} 
	    };
	    
//$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    
 //   $("input:radio[name=memLiName]").click(function(){
 //
 //       if($("input[name=memLiName]:checked").val() == "1"){
 //           $("div[id=memLiNameList]").attr("disabled",true);
            // radio 버튼의 value 값이 1이라면 활성화 div class="list-sort" id="memLiNameList"
 
//        }else if($("input[name=radio]:checked").val() == "0"){
//              $("div[id=memLiNameList]").attr("disabled",false);
            // radio 버튼의 value 값이 0이라면 비활성화
//        }
//    });
//});
	    
//$(document).ready(function(){
//	$("input:radio[id=memLiName]").click(function(){
//		$("div[id=memLiNameList]").attr("disabled",true);
		
//	})
//})    
	    
	</script>
</html>
<jsp:include page="../include/footer.jsp" />
