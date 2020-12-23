<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<section class="sub">
    <div class="category-nav">
        <div class="category-nav-inner">
            <p>HOME > 책등록</p>
        </div>
    </div>
  
    <div class="contents-wrap">
        <div class="customer">
            <h3 class="subTit">책등록</h3> 
            <div class="customer-contents">
                <div class="customer-inner">
                	<div class="bookregiSearch-inner">
	                	<div class="bookregiSearch mb10">
	          				<input type="text" name="searchString"  placeholder="검색어를 입력하세요" id="search_input" class="search_input" style="ime-mode:active;">
							<input type="button" id="btn-movies-find">
	                	</div>
	                	<div class="serachBookResult">
	                		<table summary="책검색결과" class="customer-table notice">
		                        <caption>게시판</caption>
		                        <colgroup>
		                            <col width="5%">
		                            <col width="20%">
		                            <col width="25%">
		                            <col width="10%">
		                            <col width="10%">
		                            <col width="10%">
		                            <col width="10%">
		                        </colgroup>
		                        <thead>
		                            <tr>
		                                <th scope="col"></th>
		                                <th scope="col">제목</th>
		                                <th scope="col">내용</th>
		                                <th scope="col">저자</th>
		                                <th scope="col">ISBN</th>
		                                <th scope="col">출판사</th>
		                                <th scope="col">출판일</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        </tbody>
		                    </table>	
							<div class="btn_inner">
							    <input type="button" class="btn srappend" value="보내기">
							</div>
	                	</div>
                	</div>
                	
                	<form action="BookWritePro.bok" method="post" name="bookRegForm" enctype="multipart/form-data">
                		<div class="one-ps pb10">
                			<p>
								* 항목은 필수 입력 항목입니다.
							</p>
						</div>
	                    <table summary="책등록" class="customer-notice bookRgTb">
	                        <caption>책등록</caption>
	                        <colgroup>
	                            <col width="15%">
	                            <col width="35%">
	                            <col width="15%">
	                            <col width="35%">
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <td class="th"><span class="point">*</span>책제목</td>
	                                <td colspan="3" class="td">
	                                	<input type="text" name="title" id="rgTitle" required="required" value="">
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>대분류</td>
	                            	<td class="categ1 td">
	                            		<select name="catg1" required="required">
	                            			<option value="" data-tab="cateDef">선택해주세요.</option>
	                            			<option value="소설" data-tab="novel">소설</option>
	                            			<option value="인문/경제" data-tab="he">인문/경제</option>
	                            			<option value="과학/IT" data-tab="si">과학/IT</option>
	                            			<option value="취미" data-tab="hby">취미</option>
	                            			<option value="만화/웹소설" data-tab="cwn">만화/웹소설</option>
	                            		</select>
	                            	</td>
	                            	<td class="th"><span class="point">*</span>소분류</td>
	                            	<td class="categ2 td">
	                            		<select id="cateDef" class="catg2" name="catg2"> 
	                            			<option value="def">선택해주세요.</option>
	                            		</select>
	                            	</td>
	                            </tr>
   	                    
	                            <tr>
	                            	<td class="th"><span class="point">*</span>저자</td>
	                            	<td class="td"><input type="text" name="author" id="rgAuthor" required="required" value=""></td>
	                            	<td class="th"><span class="point">*</span>출판사</td>
	                            	<td class="td"><input type="text" name="publisher" id="rgPublisher" required="required" value=""></td>
	                            </tr>
	                            <tr>
	                            	<td class="th">저자 정보</td>
	                            	<td class="td" colspan="3">
	                            	 	<textarea rows="" cols="" id="rgAuthor_info" name="author_info"></textarea>
	                            	</td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>ISBN번호</td>
	                            	<td class="td"><input type="text" id="rgIsbn" name="isbn" required="required" value=""></td>
	                            	<td class="th"><span class="point">*</span>출판날짜</td>
	                            	<td class="td cal"><input type="text" id="pubDatePicker" name="pubdate" required="required" value=""></td>
	                            </tr>
	                            <tr>
	                                <td class="th">목차</td>
	                                <td colspan="3" class="">
	                                    <textarea rows="" cols="" id="rgIndex" name="index" value=""></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="th">요약내용</td>
	                                <td colspan="3">
	                                    <textarea rows="" cols="" id="rgDescription" name="description" value=""></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td class="th"><span class="point">*</span>이미지 파일</td>
	                            	<td colspan="3">
	                            		<input type="file" id="rgImage" name="image" required="required" value="">
	                            	</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    

	                    <div class="default-btn-wrap">
	                   	    <input type="submit" class="btn" value="작성">
	                        <a href="BookList.bok" class="btn">목록</a>
	                        <a href="board.jsp" class="btn">다시쓰기</a>
	                    </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</section>
<script type="text/javascript">
	    $(function () { 
			$('#btn-movies-find').click(function () {
				var keyword = $('#search_input').val(); 
				$.ajax({ 
					type: 'POST', 
					url: 'BookNaverAPISearch.bok',
					data: {keyword : keyword},
					dataType:"JSON",
					success: function(result){
						if(result.length > 0){
							$(".serachBookResult table tbody").text("");
							alert("총"+result.length+"개가 검색 되었습니다.");
							$.each(result,function(index,arrjson){
								$(".serachBookResult table tbody").append(
										'<tr><td><input type="checkbox" onclick="oneCheckbox(this)" class="oneCheckbox" value="'+arrjson.isbn+'" name="searbookCh">'
										+'</td><td class="hidden">'+arrjson.image
										+'</td><td><a class="overf_width200" href="'+arrjson.link+'" target="_balnk">'
										+arrjson.title+'</a></td><td><p class="overf_line3">'
										+arrjson.description+'</p></td><td><p class="overf_width60">'
										+arrjson.author+'</p></td><td>'
										+arrjson.isbn+'</td><td><p class="overf_width100">'
										+arrjson.publisher+'</p></td><td>'
										+arrjson.pubdate+'</td></tr>'
								);
							});	
						}else{
							alert("검색결과가 없습니다.");
						}
						
					},
					error: function(request,status,error){
	   		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }
				});
			});  

		});
    </script>
<script type="text/javascript">



$(document).ready( function() {
	
	
    $( "#pubDatePicker" ).datepicker({});
    
   
    $(".categ1 select").on("change",function(){
    	var catval = $(this).val();
    	var sel1 = ['소설','에세이','여행','시'];
    	var sel2 = ['자기개발','경영','경제','마케팅','역사','철학','종교','정치','예술','인문'];
    	var sel3 = ['수학','과학','IT비즈니스','자격증','프로그래밍'];
    	var sel4 = ['건강','요리','스포츠','결혼/임신/출산','기타'];
    	var sel5 = ['만화','웹소설'];
    	$('.smcatg').remove();
    	if(catval == "소설"){
    		$.each(sel1,function(i,item){
    			$('.catg2').append('<option class="smcatg" value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "인문/경제"){
    		$.each(sel2,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "과학/IT"){
    		$.each(sel3,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "취미"){
    		$.each(sel4,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}else if(catval == "만화/웹소설"){
    		$.each(sel5,function(i,item){
    			$('.catg2').append('<option class="smcatg"  value="'+item+'">'+item+'</option>')
    		});
    	}
   	})
    
});
</script>
<script type="text/javascript">
	//다중 체크 안되게 방지
	$(document).on('click', '.oneCheckbox', function(){
		$(".oneCheckbox").not(this).prop("checked", false);
	});
	$(document).on('click','.srappend',function(){
		var rowData = new Array();
		var tdArr = new Array();
		var checkbox = $('.serachBookResult table tbody input[type="checkbox"]:checked');
		var image ="";
		var title ="";
		var description ="";
		var author ="";
		var isbn ="";
		var publisher ="";
		var pubdate ="";
		$("#rgTitle").val(title);
		$("#rgDescription").html(description);
		$("#rgAuthor").val(author);
		$("#rgIsbn").val(isbn);
		$("#rgPublisher").val(publisher);
		$("#pubDatePicker").val(pubdate);
		$("#rgImage").val(image);
		// 체크된 체크박스 값을 가져온다
		if(checkbox.length > 0){
		checkbox.each(function(i) {

			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// 체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			image = td.eq(1).text();
			title = td.eq(2).text();
			description = td.eq(3).text();
			author = td.eq(4).text();
			isbn = td.eq(5).text();
			publisher = td.eq(6).text();
			pubdate = td.eq(7).text();
			
			isbn = isbn.replace(/ /gi, "");
			var year = pubdate.substr(0,4);
		    var month = pubdate.substr(4,2);
		    var day = pubdate.substr(6,2);
		    pubdate=year + "-" + month + "-" + day
			
		});
			$("#rgTitle").val(title);
			$("#rgDescription").html(description);
			$("#rgAuthor").val(author);
			$("#rgIsbn").val(isbn);
			$("#rgPublisher").val(publisher);
			$("#pubDatePicker").val(pubdate);
			$("#rgImage").val(image);
		}else{
			alert("체크박스 선택을 해주시길 바랍니다.")
		}
		
	});
</script>

<jsp:include page="../include/footer.jsp"/>
