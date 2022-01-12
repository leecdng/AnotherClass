<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <!-- 데이트피커 
   <script type="text/javascript" src="<%=request.getContextPath()%>/css/user/classCalendar/jquery-ui.min.js"></script>-->  
   <link rel="stylesheet" href="<%=request.getContextPath()%>/css/user/classCalendar/jquery-ui.css">
   <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk=" crossorigin="anonymous"></script> 

<style>
   div{margin:0;padding:0; box-sizing:border-box;}
   a:link, a:hover, a:visited{text-decoration:none; color:#333;}
   #Bcotainer{margin:0 auto; width:1200px; height:auto; display:flex;margin-top:50px;} /* 모든걸감싸는 큰박스*/
   
   #leftdiv{width:800px;margin:0;}
   
   #rightdiv{width:398px; position:relative;}
   
   #calssintro{width:100%;} /* 클래스대표사진 + 소개 컨테이너 */
   
   
   /*==================#leftdiv==================*/
   
   /* 클래스이미지 div */
   #d1{width:100%;height:100%;overflow:hidden;} /*높이,배경색 수정*/
   .asdf{width:100%; height:100%;}
   #d1>img{width:1000px;height:500px;object-fit:fill;} /*object-fit:cover ? fill?  ;*/

   #like{margin-top:-27px;}
   /* 클래스소개 div*/
   #d2{width:95%;overflow:auto;margin:0 auto;} 
   #d2>ul>li{padding-bottom:5px;} /* ===지울것===*/
   #d2 li:nth-child(1){margin-top:5px;font-weight:bold;color:#ff385c;} 
   #d2 li:nth-child(2){font-size:1.5rem; font-weight:bold;margin:5px 0 5px 0;}
   #d2 li:nth-child(3){font-size:1rem;padding-bottom:0px;white-space: pre-line;}
   
   #d2 li:nth-child(4)>div{width:100%;height:26px;}/*overflow:auto;*/
   #d2 li:nth-child(4)>div>div{float :left;}/*좋아요버튼+좋아요수*/   
   #d2 li:nth-child(4)>div>div:nth-child(1){width:88%; text-align:right; height:100%;} /*좋아요버튼 , 이미지*/
   #d2 li:nth-child(4)>div>div:nth-child(1)>img{width:24px;height:90%;}
   #d2 li:nth-child(4)>div>div:nth-child(2){width:7%; height:100%;color:#666;font-size:18px;padding-left:10px;} /*좋아요 수 */
   
   #d2 li:nth-child(5){width:100%;height:100%;color:#999;text-align:right;}
   
   #d2 li:nth-child(6){overflow:auto; border:1px solid red;} /*공유*/
   #d2 li:nth-child(6)>div{text-align:right;}
   
   /*강사이미지프로필 + 강사닉네임*/
   #d3{width:100%; height:105px; overflow:auto;border-top:1px solid #ddd;}
   #d3>div{float:left;}
   #d3 div:nth-child(1){width:30%;height:100%; padding:2%;} /*overflow:hidden : 선택시 네모로 안보이겡*/
   #d3 div:nth-child(1)>img{width:100%;height:100%;border-radius:100%;object-fit:fill;}
   #d3 div:nth-child(2){width:70%;height:100%;padding-left:2%;}  /* height..흠*  -> 가운데로 정렬*/    
   #d3 div:nth-child(2) a:link,  a:visited{text-decoration:none; color:#333;}
   #d3 div:nth-child(2) a:hover{color:#ff385c;}
   #d3 div:nth-child(2)>*{display:block;width:100%;}
   #d3 div:nth-child(2)>a{font-size:1.2rem;padding-top:25px;font-weight:bold;}

   
   /* 메뉴바 */
   #d4{width:100%;height:auto;overflow:auto;position:sticky;top:0px;background-color:white;r}
   #d4>ul{width:100%;height:auto;overflow:auto;}
   #d4 li{float:left; width:20%;height:50px;line-height:50px; text-align:center;border-bottom:1px solid #ddd;}   
   
   /*클레스 상세페이지 메뉴*/
   .menu{width:100%; min-height:200px;height:100%; border-bottom:1px solid #ddd; overflow:auto;padding-bottom:30px;} /*min-height*/   
   .menutitle{height:20px;line-height:20px;font-size:1.2rem;font-weight:bold;}
   
   #d5>div:nth-child(1)>span{display:inline-block;box-shadow:inset -11px #ff385c;}
   #d5>div:nth-child(2){ white-space: pre-line;text-align:center;}/*클래스소개*/
   #d5>div:nth-child(2) img{object-fit:fill;margin:20px 0 20px 0;}
   
   #d6>div:nth-child(2){white-space: pre-line}
   #d6>div:nth-child(2)>img{max-width:100%;max-height:500px;margin:20px 0 20px 0;}
   
   #d7>div:nth-child(2){margin:10px 0 10px 0;}
   
   #d9{width:100%;height:auto;}
   #d9>div{width:100%;height:100%;}
   #d9_2{padding: 15px;} /*fff0f5 ffe4e4*/
   #d9>div:nth-child(2n+1){margin-bottom:20px;}/*제목div*/   
   
   #creatormemberoneask{width:100%;height:auto;overflow:auto;}
   #creatormemberoneask>li{width:100%;}
   #creatormemberoneask>li>div{width:100%;height:120px;margin-bottom:15px;}
   #creatormemberoneask>li>div>div{float:left;height:100%;}
   #creatormemberoneask>li>div>div:nth-child(2n+1){width:15%;height:100%;}
   #creatormemberoneask>li>div>div:nth-child(2n+1)>img{width:100%;height:100%;border-radius:100%;}
   #creatormemberoneask>li>div>div:nth-child(2n+2){width:85%;height:100%;}
   #creatormemberoneask>li>div>div:nth-child(2n+2)>div{width:100%;}   
   #creatormemberoneask>li>div>div>div{width:100%;height:auto;}
   #creatormemberoneask>li>div>div>div:nth-child(2){overflow:auto;}
   #creatormemberoneask>li>div>div>div:nth-child(1)>label{display:inline-block;margin:5px 0 20px 15px;font-size:0.9rem;color:#666;}
   #creatormemberoneask>li>div>div>div:nth-child(2)>label{display:inline-block;margin-left:15px;}
   
   #d9>div:nth-child(3){width:100%;height:100%;border:2px solid #ddd;margin:20px 0 20px 0;padding:10px 0 10px 0; }
   #d9>div:nth-child(3)>span{display:block;margin:0 0 10px 36px;font-size:0.9rem;color:#333;}
   #d9>div:nth-child(3)>form>div{text-align:center;}/*padding-left:26px;*/
   #classMainAskTa{width:90%;height:100px;resize:none;overflow:auto;border-color:#ddd;}/*댓글작성하는부분*/
   #d9>div:nth-child(3)>form>input[type=button]{margin: 10px 0 0 36px;background-color:white;border:none;border:1px solid #999;width:100px;padding-top:5px;padding-bottom:5px;}
   textarea::placeholder {color:#999;}
   
   .askdiv909{border:1px solid #f0f0f0;padding:10px;}/*회원배경:회색*/
   .askdiv808{background-color: #f0f0f0;padding:10px;}/*강사배경 : 연핑크 or 연하늘*/

   .subaa{margin-top:30px; width:160px; height:170px; margin:10px;}
   #subpicture>div{float:left; width:180px; height:180px; margin-left:10px;}
   #subpicture{width:360px; height:400px; }
   /*==================#rightDiv==================*/
   
   /*rightDiv*/
   #rightConBox{width:96%;margin-left:10px; min-height:600px;height:auto; box-shadow: 0 0 8px rgba(0,0,0,0.3);position:sticky;top:50px;border-radius: 10px;}
   #rightConBox div{margin:0 auto;}
   
   /*달력 width:350px;*/   
   #datepicker{padding-top:25px;}
   
   /*클래스옵션목록*/
   #selectClassListd{width:350px;min-height:120px;height:auto;border:1px solid #f0f0f0;overflow:auto;} 
   #startdiv{width:350px;}
   #enddiv{width:350px;}
   #headcountdiv{width:350px;}
   /*버튼감싸고 있는div*/
   #buttonhomec{width:350px;display:flex;width:350px;}
   #buttonhomec input[type=button]{border:none;}
   #gobasketB{width:119px;height:38px;font-size:18px;margin:10px 30px 15px 0;boder:1px solid #ddd;background-color:#616060;color:#fff;}
   #gopayB{width:200px;height:38px;font-size:18px;margin:10px 0 15px 0;boder:1px solid #ddd;background-color:#616060;color:#fff;}
   
   #replysub{margin: 10px 0 15px 1040px;background-color:white;border:none;border:1px solid #999;width:100px;padding-top:5px;padding-bottom:5px;}
   #aaa{}
   #ada{padding-left:150px; color:#ff385c; margin-left:-50px;}
   

</style>
<script>
   $(function(){      
      
      $('#d4 li').click(function(){   
         $(this).children('a').css('color','#ff385c'); //글자색
         $(this).css('border-bottom','3px solid #ff385c'); //li밑줄색 
         
         $('#d4 li').not(this).children('a').css('color','black'); //글자색
         $('#d4 li').not(this).css('border-bottom','2px solid #999');   //li밑줄색 
      });
            
         

       
          });
       
       }); 
       
       function LikeCount(){ //좋아요리스트 셋팅
          console.log("좋아요수함수실행됨");
          var lUrl ="/another/classDetailLikeCount";
         var lParam ="no=${vo.class_no}";
         console.log(${vo.class_no });
         $.ajax({
            url : lUrl,
            data : lParam,
            success:function(t){//받아온 데이터를 r에 넣음,,,
                var tt = $(t)                
                tt.each(function(idx,vo3){                   
                   $("#likelikecount").html(vo3.class_count);                   
                   if(vo3.class_like_check==0){
                      //빈하트 //likeimgbox2
                      $("#likeimgbox2").attr("src", "img/jisu/ff385bigborderheart.png");
                   }else if(vo3.class_like_check==1){
                      //꽉찬하트
                      $("#likeimgbox2").attr("src", "img/jisu/ff385bigcheart.png");
                   }                
                });
             }         
         })
      }              
       function like_func(){ //로그인상태 -> 좋아요 버튼 눌렀을때          
          var hUrl ="/another/classDetailLikeFun";
          var hParam ="no=${vo.class_no}";
          $.ajax({
             url : hUrl,
            data : hParam,
            success:function(){
               LikeCount(); 
            }
          })          
       }             
       function  login_need(){//로그인x상태 -> 좋아요 버튼 눌렀을때
          alert("로그인 후 좋아요 가능합니다.");
       }              
       $('#likeimgbox2').click(function(){
          var logid = "${userId}";
          console.log(logid);
         if(logid=== null || logid=== ""){
            alert("로그인후 좋아요 가능합니다");
         }else{
            like_func();
         }          
       });
     //댓글작성 ajax
        $(document).on('click','#replysub',function(){
      
               var params = $("#replyFrm").serialize();
               $.ajax({
                  url:"/another/creatorAskReplyWritee",               
                  data:params, 
                  success:function(result){ 
                  
                        $("#classMainAskTa").val("");
                        alert("댓글 등록 되었습니다");
                        a = 1;
                        AskReply();
                     
                  },error:function(){
                     
                  }
               });
            
        });
   
      
      AskReply();
         
   });
</script>

<div id="Bcotainer">
   <!--  -->
   <div id="leftdiv">
      <div id="calssintro"> <!-- 클래스대표사진+소개글 , 강사프로필+강사닉네임 -->   
         <div id="d1"><img src="img/test/cand1.jpg"/></div> <!-- 클래스 이미지 -->
         <div id="d2"> <!-- 클래스 소개 -->
            <ul>
               <li>#케이크 캔들 #먹지마세요</li> <!-- 위치?대분류? --> <!-- 왼쪽정렬 -->
               <li>예쁜 케이크 모양 캔들</li> <!-- 짧은 소개글 *******************pre-wrap 아직 미설정-->
            
            </ul>
            
         </div> 
         
         <div id="d5" class="menu"> <!-- 클래스소개 -->
            <div class="menutitle"><span></span></div>
                  
            <div id="d1"><img class= "subaa" src="img/test/cand2.jpg"/></div> 
            <div>태우지 않아도 향기가 가득한 케이크 캔들과 디저트 캔들(까눌레, 마카롱, 아이스크림 중 택 1)을 선택해서 만들 수 있었어요</div>      
            <div id="d1"><img class= "subaa" src="img/test/cand3.jpg"/></div> 
            <div>나만의 특별한 힐링 시간이 필요해서 이 클래스를 참여하게 되었어요</div>
            <div id="d1"><img class= "subaa" src="img/test/cand4.jpg"/></div> 
            <div>캔들과 함께 향기로운 힐링의 시간을 가져서 행복했어요~~ 꼭 한번 참여해보세요 </div>   
         </div>

         <div id="d9" class="menu"> <!-- 문의 -->
            <div class="menutitle"><span>댓글</span></div>
            
            <div id="replyDivv">               
         </div>         
         
         <div style='border:1px solid #ddd;margin-top:100px;width:100%;'> <!-- 댓글작성 -->
               <span style='display: inline-block;margin: 18px 20px 15px 43px;'>댓글작성</span>
               <form method="post" id="replyFrm">
                  <div style='text-align:center;'><textarea name="community_com_reply" id="classMainAskTa" placeholder="자유롭게 작성해 주세요."></textarea></div><!-- classMainAskTa -->
                  <input type="button" id="replysub" value="작성완료"/>
                  <input type="hidden" name="community_no" value="${vo.community_no }"/><!-- 클래스 번호 --><!-- no -->
                  <input type="hidden" name="community_com_member_id" value="${member_id}"/>
               </form>
         </div>      
            <div id="d9_2"><!-- 댓글내용 -->
               <ul id="communitymemberoneask">
               
                  
               </ul>               
            </div>
            <div id="replyDivv">               
         </div>         
         
         <div style='border:1px solid #ddd;margin-top:100px;width:100%;'> <!-- 댓글작성 -->
            
            </div>
         </div>
      </div>      
   </div>
   <div id="rightdiv">
         <div id="rightConBox">
            <div id="d3"> <!-- 강사프로필 + 강사명 -->
            <div><img src="img/test/stu.png"/></div> <!-- 강사프로필이미지 -->   
            <div> <!-- 강사닉네임 -->   
               <a href="#"></a>
               <span id="aaa">asdf1234 님</span>
               <div id="ada">11</div>
               <li id="like">
                  
                  <div>
                  <!--    <div><img src="img/jisu/ff385bigborderheart.png" id="heartimg"/></div><!--  좋아요버튼, 좋아요수 --> <!-- 왼쪽정렬 -->
                  <!--    <div id="likelikecount">120</div> <!--? 흠...div안에있는게 맞나모르겟음... -->
                      <c:set var="logid" value="${logid}" />   
                        <c:if test="${empty logid}"> <!-- 로그인x -->
                           <div><a href='javascript: login_need();'><img src="img/jisu/ff385bigborderheart.png"/></a></div><!--  좋아요버튼, 좋아요수 --> <!-- 왼쪽정렬 -->
                        </c:if>
                        
                        <c:if test="${not empty logid}"><!-- 로그인o -->
                           <div><a href='javascript:  like_func();'><img src="img/jisu/ff385bigcheart.png"/></a></div><!--  좋아요버튼, 좋아요수 --> <!-- 왼쪽정렬 -->
                        </c:if>
                           <div id="likelikecount"></div> <!--? 흠...div안에있는게 맞나모르겟음... -->
                  </div>
               </li>
               
            </div>
            
         </div>
         <div id="subpicture">
            <div class="water"><img class= "subaa" src="img/test/cand1.jpg"/></div> 
            <div class="water"><img class= "subaa" src="img/test/cand2.jpg"/></div> 
            <div class="water"><img class= "subaa" src="img/test/cand3.jpg"/></div> 
            <div class="water"><img class= "subaa" src="img/test/cand4.jpg"/></div> 
            </div>
            <!-- <div style="display:none" id="inputdatebox"></div><!-- 선택된날짜입력될박스 -->
            <input type="text" id="inputdatebox" style="visibility:hidden;" />
         </div>
   </div>
</div>