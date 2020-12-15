<%@page import="vo.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String id = (String)session.getAttribute("id");
// 	MemberBean article = (MemberBean)request.getAttribute("article");
	ArrayList<MemberBean> articleList = (ArrayList<MemberBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int listCount = pageInfo.getListCount();
	
	
%> 
<jsp:include page="../include/header.jsp"/>
<style>
.koSort_on  {padding: 3px; margin: 2px; border-bottom: 2px solid black;}
.koSort_off  {padding: 2px; margin: 2px; color: gray;} 
.memSort_on  {padding: 3px; margin: 2px; color:#00ab94;}
.memSort_off  {padding: 2px; margin: 2px;color: gray;}
.ko-array{content:"";display:block;clear:both;}
.ko-array input[type='radio']{position:absolute;left:-9999px;width:17px;height:17px;}
.ko-array label{display:block;margin-left:20px;line-height:50px;height:50px;float:left;text-align:center;font-weight:600;font-size:14px;cursor:pointer;}
th.memSortTbody {font-size: 13px; font-weight: 500; padding: 3px;}

.btn2 {
    padding: 8px !important;
    margin-left: 670px;
    background-color: #069e89 !important;
    color: white;
    border-radius: 5px !important;
    font-weight: 500;
    font-size: 14px;
    border: 1px solid #72ada5 !important;
}

</style>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 고객관리</p>
        </div>
    </div>
    <div class="contents-wrap">
        <div class="customer" style="width:1400px; ">
            <h3 class="coTitle">고객관리</h3>
            <div class="customer-contents">
                <div class="customer-inner">
                    <table summary="공지사항" class="customer-table notice">
                        <caption>공지사항</caption>
                        <div class="list-sort">
							<div class="k-array">
							<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="전체"><span class="memSort_on">전체</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="이름순"><span class="memSort_off">이름순</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="아이디순"><span class="memSort_off">아이디순</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="상태"><span class="memSort_off">상태</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="등급"><span class="memSort_off">등급</span></label>
								
								</div>
							<div class="list-sort">	
								<div class="ko-array">
								<input type="radio" name="" id="">
								<label for="" class="radio1" data-sort="전체"><span class="koSort_off" onclick="memlist(this)" id="전체">전체</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio1" data-sort="ㄱ"><span class="koSort_on" onclick="memlist(this)" id="가">ㄱ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㄴ"><span class="koSort_off" onclick="memlist(this)" id="나">ㄴ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㄷ"><span class="koSort_off" onclick="memlist(this)" id="다">ㄷ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㄹ"><span class="koSort_off" onclick="memlist(this)" id="라">ㄹ</span></label>	
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅁ"><span class="koSort_off" onclick="memlist(this)" id="마">ㅁ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅂ"><span class="koSort_off" onclick="memlist(this)" id="바">ㅂ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅅ"><span class="koSort_off" onclick="memlist(this)" id="사">ㅅ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅇ"><span class="koSort_off" onclick="memlist(this)" id="아">ㅇ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅈ"><span class="koSort_off" onclick="memlist(this)" id="자">ㅈ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅊ"><span class="koSort_off" onclick="memlist(this)" id="차">ㅊ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅋ"><span class="koSort_off" onclick="memlist(this)" id="카">ㅋ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅌ"><span class="koSort_off" onclick="memlist(this)" id="타">ㅌ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅍ"><span class="koSort_off" onclick="memlist(this)" id="파">ㅍ</span></label>
								<input type="radio" name="" id="">
								<label for="" class="radio" data-sort="ㅎ"><span class="koSort_off" onclick="memlist(this)" id="하">ㅎ</span></label>							
								<label for="" class="radio" data-sort="등급">	<input type="button" name="reportChkBxRow" class="btn2" value="삭제" onclick="deleteReport()"></label>			
							
								</div>
	                        </div>
                        </div>
                        
                        <thead>
                            <tr>
                                <th scope="col" class="memSortTbody" abbr="선택" >선택</th>
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
                        <%for(int i = 0; i < articleList.size(); i++) {%>
                            <tr>
                                <th scope="col" class="memSortTbody" abbr="선택"><input type="checkbox" name="reportChkBxRow" id=<%=articleList.get(i).getId()%> > </th>
                                <th scope="col" class="memSortTbody" abbr="회원번호" id="num"><%=articleList.get(i).getNum()%></th>
                                <th scope="col" class="memSortTbody" abbr="아이디" id="id"><%=articleList.get(i).getId()%></th>
                                <th scope="col" class="memSortTbody" abbr="비밀번호" id="password"><%=articleList.get(i).getPassword()%></th>
                                <th scope="col" class="memSortTbody" abbr="이름" id="name"><%=articleList.get(i).getName()%></th>
                                <th scope="col" class="memSortTbody" abbr="이메일" id="email"><%=articleList.get(i).getEmail()%></th>
                                <th scope="col" class="memSortTbody" abbr="전화번호" id="phone"><%=articleList.get(i).getPhone()%></th>
                                <th scope="col" class="memSortTbody" abbr="생년월일" id="age"><%=articleList.get(i).getAge()%></th>
                                <th scope="col" class="memSortTbody" abbr="가입일" id="date"><%=articleList.get(i).getDate()%></th>
                                <th scope="col" class="memSortTbody" abbr="주소" id="address"><%=articleList.get(i).getAddress()%></th>
                                <th scope="col" class="memSortTbody" abbr="선호장르" id="catg"><%=articleList.get(i).getCatg()%></th>
                                <th scope="col" class="memSortTbody" abbr="상태" id="status"><%=articleList.get(i).getStatus()%></th>
                           <%} %>
                            </tr>
                        </tbody>
                    </table>
                    <div class="paging">
                        <a href="/customer.asp?page=notice&pageNum=1" class="arr" data-page-num="1"><img src="images/p-first.png"><span class="hide">처음페이지</span></a>
                        <a href="/customer.asp?page=notice&pageNum=1" class="arr prev" data-page-num="1"><img src="images/p-prev.png"><span class="hide">이전페이지</span></a>
                        <a href="/customer.asp?page=notice&pageNum=1" class="on fir" data-page-num="1">1</a>
                        <!-- 	<a href="/customer.asp?page=notice&pageNum=2" class="" data-page-num="2">2</a><a href="/customer.asp?page=notice&pageNum=3" class="" data-page-num="3">3</a><a href="/customer.asp?page=notice&pageNum=4" class="" data-page-num="4">4</a><a href="/customer.asp?page=notice&pageNum=5" class="" data-page-num="5">5</a><a href="/customer.asp?page=notice&pageNum=6" class="" data-page-num="6">6</a><a href="/customer.asp?page=notice&pageNum=7" class="" data-page-num="7">7</a><a href="/customer.asp?page=notice&pageNum=8" class="" data-page-num="8">8</a><a href="/customer.asp?page=notice&pageNum=9" class="" data-page-num="9">9</a><a href="/customer.asp?page=notice&pageNum=10" class="" data-page-num="10">10</a> -->
                        <a href="/customer.asp?page=notice&pageNum=11" class="arr next" data-page-num="11">
                            <img src="images/p-next.png"><span class="hide">다음페이지</span></a>
                        <a href="/customer.asp?page=notice&pageNum=27" class="arr" data-page-num="27"><img src="images/p-last.png"><span class="hide">마지막페이지</span></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<script type="text/javascript">
function memlist(nameForm) {
	var name = nameForm.value
	var num = document.getElementById('num');
	var id = document.getElementById('id');
	var name = document.getElementById('name');
	var password = document.getElementById('password');
	var email = document.getElementById('email');
	var phone = document.getElementById('phone');
	var catg = document.getElementById('catg');
	var age = document.getElementById('age');
	var address = document.getElementById('address');
	var date = document.getElementById('date');
	var status = document.getElementById('status');
	
	
/* 	$.ajax({
	       type:"POST",
	       url:"MemNameList.me",
	       async: false, 
	       data : {
	              id : id
	          }, 

	       success : function(resultObj) { */
	    	   $(document).ready(function(){
	    	   $('.전체').click(function(){
	   			$.getJSON('json2.jsp',function(rdata){
	   				$.each(rdata,function(index,item){
	   					$('table').append("<tr><td>"+item.num+"</td><td>"+item.id+"</td><td>"+item.name+"</td><td>"+item.password
	   							         +"</td></tr>"+item.email+"</td></tr>"+item.phone+"</td></tr>"+item.catg+"</td></tr>"
	   							      +item.age+"</td></tr>"+item.address+"</td></tr>"+item.date+"</td></tr>"+item.status+"</td></tr>");
	   					
					});
				});
			});
		});
/* 	   				});
	   			});
	   		});
		    },
	        /* error: function(request,status,error,resultObj){
	              alert("code:"+request.status+"\n"+"error:"+error+"message:"+request.responseText+"\n"+"error:"+error);
	        } 
	 })
	
	 */
	
}
function deleteReport(){
    var cnt = $("input[name='reportChkBxRow']:checked").length;
    var arr = new Array();
    $("input[name='reportChkBxRow']:checked").each(function() {
        arr.push($(this).attr('id'));
    });
    if(cnt == 0){
        alert("선택된 글이 없습니다.");
    }
    else{
        $.ajax = {
      		type:"POST",
            url: "MemberDeletePro.me",
            data: "RPRT_ODR=" + arr + "&CNT=" + cnt,
            dataType:"json",
            success: function(jdata){
                if(jdata != 1) {
                    alert("삭제 오류");
                }
                else{
                    alert("삭제 성공");
                }
            },
            error: function(){alert("서버통신 오류");}
        };
    }
}
</script>
<jsp:include page="../include/footer.jsp"/>