<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
   
<style>
.faqWrap {
    position: relative;
    background: #f5f0e9;
}
.listStyleD {
	padding:20px 20px 20px 20px;
	border : 1px solid #e2dfdc;
	margin: 20px;
}
.listStyleD li {
	
}
.listStyleD li .answerCont {
    display: none;
    padding: 20px 0;
    position: relative;
    padding-left: 40px;
    font-size: 14px;
    line-height: 24px;
    border-top: 1px solid #e2dfdc;
    padding: 10px 10px 30px 10px;
}
td, div, p, li, dt, dd, input, textarea, select, h1, h2, h3, h4, h5 {
    font-weight: normal;
    word-break: break-all;
}
#fag {
    margin: 50px auto;
    width:1200px;
    padding-left: 0px;
}
.fagArea {
    position: relative;
    margin: 0 auto;
    max-width: 1180px;
    z-index: 1;
}
@media (max-width: 1200px)
.fagArea .fagCont {
    margin: 40px 20px 0 20px;
}

.fagArea .fagCont {
    margin-top: 40px;
}

td, div, p, li, dt, dd, input, textarea, select, h1, h2, h3, h4, h5 {
    font-weight: normal;
    word-break: break-all;
}


element.style {
}
ul, ol, li {
    list-style: none;
}
form, input, p, h1, h2, h3, h4, h5, h6, ul, ol, li, dl, dt, dd {
    margin: 0;
    padding: 0;
}
* {
    word-break: break-all;
    box-sizing: border-box;
}
user agent stylesheet
ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
td, div, p, li, dt, dd, input, textarea, select, h1, h2, h3, h4, h5 {
    font-weight: normal;
    word-break: break-all;
}
<style>
body, table, input, select, textarea {
    font-family: NotoSans, "맑은 고딕", "Malgun Gothic", NanumGothic, Dotum, 돋움, gulim, 굴림, Helvetica, sans-serif;
    font-size: 13px;
    font-weight: normal;
    color: rgb(98, 96, 95);
}

.q{color:#ff385c;font-size: 1.2em; font-weight: bold; padding-right:10px;}

.wrapper{}
a.answer{display: inline-block;
    margin-bottom: 5px;}
    
    	.bigTitle {
    width: 100%;
    text-align: center;
    padding-bottom: 20px;
}
.h1style {
    display: block;
    font-size: 32px;
    margin-block-start: 0.9rem;
    margin-block-end: 0.9rem;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
</style>

 


	

	 
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" type="image/x-icon" sizes="32x32" href="/images/common/favicon_32.png" />
<link rel="icon" type="image/x-icon" sizes="196x196" href="/images/common/favicon_196.png" />
<link rel="apple-touch-icon-precomposed" sizes="32x32"  href="/images/common/favicon_32.png">
<link rel="apple-touch-icon-precomposed" sizes="196x196" href="/images/common/favicon_196.png"> 

 
<title> FAQ | PaulBassett</title>

<link rel="stylesheet" href="/css/fonts.css?time=1634545175563" type="text/css" media="all" /> 
<link rel="stylesheet" href="/css/common.css?time=1634545175563" type="text/css" media="all" />
<link rel="stylesheet" href="/css/layout.css?time=1634545175563" type="text/css" media="all" />
<link rel="stylesheet" href="/css/swiper.css?time=1634545175563" type="text/css" media="all" /> 
<link rel="stylesheet" href="/css/slick.css?time=1634545175563" type="text/css" media="all" />
<link rel="stylesheet" href="/css/animate.css?time=1634545175563" type="text/css" media="all" />
<link rel="stylesheet" href="/css/content.css?time=1634545175563" type="text/css" media="all" />
<script src="/js/jquery-3.1.1.min.js"></script>
<script src="/js/imagesloaded.pkgd.js"></script>
<script src="/js/common.js"></script>
<script src="/js/ui.js?time=1634545175563"></script>
<script src="/js/jquery.mousewheel.js"></script>
<script src="/js/swiper.min.js"></script>
<script src="/js/slick.js"></script>

<script>
function _jssoCompleted(data, code){
	if (data != "") {
		 $.ajax({
			url : "/member/loginSSO.pb",
			data: {"data":data},
			type: "POST",
			dataType : "json",
			async: false,
			success : function(data) {
				var url = location.href;
				if (data.succeed) {
					window.location.reload(true);
				}else{
				}
			}
		});
	}
}
</script>	

<script type="text/javascript" src="https://sso.maeildo.com:3443/findCookie.jsp?j_sso_q=LMs%2Fs9vbTjSbIUPzqtZrCyNevg%2B0l5R9mt5gx7sHSq%2BjP9c8VaERUxg%2FUfXGRj36v7VoJtF1kB9TLqlLtqx21GpUeUJaMnh1Ulc3VEp3ZGt4VU5ESkEzemNYL05mdFQ4Y2JoQlpNZHorV3c9"></script>

	 
<script>
$(function(){
	$(".listStyleD li a").click(function(){
		if(!$(this).parent().hasClass("on")) {
			$(".listStyleD li").removeClass("on");
			$(".listStyleD li").find(".answerCont").slideUp();
			$(this).parent().addClass("on");
			$(this).parent().find(".answerCont").slideDown();
		} else {
			$(this).parent().removeClass("on");
			$(this).parent().find(".answerCont").slideUp();
		}
		return false;
	});
	
});
</script>
</head>
<body class="bgNone">
<div id="wrapper">
	    

		     

<script>
$(function(){
	
	if($("#mainWrap").length < 1){	
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			if(scrollTop > 0){
				$("#headerWrap").addClass("on")
			}else{
				$("#headerWrap").removeClass("on")
			}
		});
	}
	$("#gnb>ul").bind("mouseenter focusin", function(){
		$(this).parents("#headerWrap").addClass("styleB");
		$("#gnb>ul").parent().addClass("on");
		return false;
	})
	.bind("mouseleave focusout" , function(){
		$(this).parents("#headerWrap").removeClass("styleB");
		$("#gnb>ul").parent().removeClass("on");
		return false;
	});
});
</script>

<div class="bigTitle"><span class="h1style" >공지사항</span></div>

<div id="fag">
			<div class="fagCont">
			
							
					
				<c:forEach var="vo" items="${list }">	
				<ul class="listStyleD">
						<li><a href="#" class="answer"><span class="q">Q</span>${vo.title}</a>
							<div class="answerCont">
								<span class="answer">A</span><p><span style="font-family: 나눔고딕, NanumGothic;">${vo.content}</span></p>
							</div>
						</li>
					</ul>
				</c:forEach>
					
					
			
			</div>
	 		<!-- paging -->
	 		
			
		</div>
		<!-- //fagArea -->
		<!-- //내용영역 -->
	</div>
	
	    

</div>     

</body>
</html>