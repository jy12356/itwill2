 <script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(function(){
           // BIN 리뷰 리스트 호출
          function getReply(){
             var basicCode = "<%=basicCode%>";
             var reviewPage = "";
             var active = $('.active').text();
             $.ajax({
                url: "ProdReviewList.po", // 요청 url
                   type: "POST", // post 방식
                   data: {
                      basicCode : basicCode,
                      reviewPage : reviewPage,
                      active : active
                   },
                   success: function (json) { 
                      json = json.replace(/\n/gi,"\\r\\n");
                      $("#replyList").text(""); 
                      var obj = JSON.parse(json); 
                      var replyList = obj.replyList; 
                      var output = ""; 
                      for (var i = 0; i < replyList.length; i++) {
                          for (var j = 0; j < replyList[i].length; j++) {
                              var reply = replyList[i][j];
                              if(j==0){
                                 if(reply.hasImg){
                                    output += "<div class='content'><div class='signin-cont cont'>";
                                 }else{
                               output += "<div class='content'><div class='signup-cont cont'>";
                                 }
                              }else if(j == 1){
                                 output += "<ul class='PR15N01-review-wrap'><li id='power_review_block995509' class='power-review-list-box'><dl class='desc'>"
                              +"<dt class='first' >작성자</dt><dd>"+reply.id+"</dd>";
                              }else if(j == 2){
                                 output += "<dt>작성일</dt><dd>"+reply.date+"</dd></dl>";
                              }else if(j == 3){
                                 output += "<div class='hd-box'><div class='star-icon'><span class='mini_rat'><input type='number' class='rating text-default' value='"
                                 + reply.starScore +"'data-readonly /></span><span class='survey'>아주만족</span></div></div>";
                              }else if(j == 4){
                                 output += "<div class='pr-options' style='display: none;'><dl><dt class='emp'>구매한 옵션</dt><dd class='emp'>컬러 : BLACK, 사이즈 : S</dd></dl></div>"
                                    +"<div class='content'><p class='content_p'><a href='javascript:power_review_more('995509', '00000');' class='more-options' id='review_content'>"+reply.content+"</a>"
                                    +"<a class='pr-close' href='javascript:power_review_more_close('995509');'>... <span>닫기</span></a></p><div class='ctr'></div></div>";
                              }else if(j == 5){
                                 output += "<div class='photo-list'><ul><li><a href='javascript:power_review_view_show('995509', '00000', '0', 'detail');''>"
                                    +"<img src='product/reviewUploadImg/"+reply.product_img +"'></a><div class='attach-preview'></div></li></ul></div>";
                                 output += "<div class='reply'><span class='pr-txt'>이 리뷰가 도움이 되셨나요?</span><a class='yes' href='javascript:power_review_good('995509', 'N', 'shopdetail');''><span>0</span></a>"
                                    +"<a class='no' href='javascript:power_review_bad('995509', 'N', 'shopdetail');''><span>0</span></a></div></li></ul>";
                              }else if(j == 6){
                                 output +="<a href='ProdReviewDelete.po?num="+reply.num+"&basicCode="+"<%=basicCode%>"+"'>삭제</a><br></div></div><br><br>";
                              }
                        };
                      };
                          $("#review_list").html(output); 
                          $(".review_count").html(i);
                   },
               error: function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
             })
          }
          getReply(); // 해당 페이지 실행 시 해당 함수 호출
})
</script>