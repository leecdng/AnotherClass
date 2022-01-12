<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="<%=request.getContextPath()%>/css/user/classMap.css" rel="stylesheet" type="text/css"/>


<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>


<article id="container">
	<div class="class-map-wrap">
		<section id="class-map-view">
			
		</section>
		<section class="class-map-list">
			<div class="class-list1-top">
				<h3 class="text-h3">내 주변 클래스</h3>
				<div class="class-search">
					<input class="class-search-bar" type="text" placeholder="관심있는 취미를 찾아보세요." />
					<div class="filter">
						<!-- <input class="place-select select-btn" type="button" value="지역 선택" />-->
						<select class="select-place select-menu">
							<option>전체 지역</option>
							<option>서울</option>
							<option>부산</option>
							<option>인천</option>
							<option>대구</option>
							<option>광주</option>
							<option>울산</option>
							<option>대전</option>
							<option>세종</option>
							<option>경기</option>
							<option>강원</option>
							<option>충북</option>
							<option>충남</option>
							<option>전북</option>
							<option>전남</option>
							<option>경북</option>
							<option>경남</option>
							<option>제주</option>
						</select>
						<select class="select-category select-menu">
							<option>전체 카테고리</option>
						</select>
					</div>
					<input class="class-search-btn" type="button" value="검색" />
				</div>
			</div>
			
			<div class="class-list1">
				<ul id="placesList">
					<!-- 클래스 목록 -->
				</ul>
				<div class="more" style="display:none;">
					<button type="button">+ more</button>
				</div>
				<div class="no-result-txt" style="display:none;">
					검색 결과가 없습니다.
				</div>
			</div>
		</section>
		
	</div>
</article>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=033542c9317694f8d1bb2f13c3b67a2a&libraries=services"></script>
<script>

// 금액 숫자 3자리 단위마다 콤마(,) 찍기
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


$(document).ready(function(){

	
	var map;
	var geocoder;
	
	// 마커를 담을 배열입니다
	var markers = [];
	var infoArr=[]; // infoWindow 담을 배열
	var j=0;
	
	// 클래스 목록 정보 담을 배열
	var cateL_arr=[]; // 대분류 카테고리
	var category_arr = []; // 중분류 카테고리
	var classNo_arr = []; // 클래스 번호
	var className_arr = []; // 클래스 이름
	var nick_arr = []; // 강사 닉네임
	var likeCnt_arr = []; // 좋아요 수
	var starAvg_arr = []; // 별점 평균
	var classPrice_arr = []; // 클래스 가격
	var addr_arr = []; // 주소
	var classImg_arr = []; // 썸네일
	
	var listCnt = 5; // 목록에서 한 번에 보여줄 클래스 개수
	
	// 검색 정보 보낼 변수
	var keyword=''; // 검색어
	var local=''; // 선택 지역
	var cate_name=''; // 선택 카테고리
	var cateL_name=''; // 선택 카테고리 대분류 (중분류 전체)
	
	
	initMap(); // 지도 생성
	
	
	// 검색 버튼 클릭 시
	$('.class-search-btn').click(function(){
		keyword = $('.class-search-bar').val();
		local = $('.select-place').val();
		cate_name = $('.select-category').val();
		if(local == '전체 지역'){ 
			local = ''; 
		}
		if(cate_name == '전체 카테고리'){
			cate_name = '';
			cateL_name= '';
		} else {
			if(cate_name.indexOf('전체')!= -1){ // 중분류 전체 선택 시
				cateL_name = cate_name.replace(' 전체', ''); // 대분류명만 저장
				cate_name = ''; // 중분류명 지우기
			} else{
				cateL_name = ''; // 대분류명 지우기
			}
		}
		
		setClassList(); // 목록과 지도 마커, 인포윈도우 세팅
	});
	
	
	// 클래스 목록 가져오기
	function setClassList(){
		var url = '<%=request.getContextPath()%>/classMap/list';
		var params = 'keyword=' + keyword + '&local=' + local + '&cateL_name=' + cateL_name + '&category_name=' + cate_name;
		$.ajax({
			url: url,
			data: params,
			async:false,
			success: function(result){
				var r = $(result);
				var tag='';
				
				$('#placesList').html(''); // 클래스 목록 지우기
				deleteMarkers(); // 기존의 모든 마커 지우기
				closeInfoWindow(); // 모든 인포윈도우 닫기
				
				if(r.length == 0){ // 검색 결과가 없으면
					$('.more').hide();
					$('.no-result-txt').show();
				}
				
				r.each(function(idx){
					// 전역변수 배열에 해당 값 담기
					cateL_arr[idx] = r[idx].cateL_name;
					category_arr[idx] = r[idx].category_name;
					classNo_arr[idx] = r[idx].class_no;
					className_arr[idx] = r[idx].class_name;
					nick_arr[idx] = r[idx].nick;
					likeCnt_arr[idx] = r[idx].like_cnt;
					starAvg_arr[idx] = r[idx].star_avg;
					classPrice_arr[idx] = numberWithCommas(r[idx].class_price);
					addr_arr[idx] = r[idx].class_addr1;
					classImg_arr[idx] = r[idx].class_thumb;

					if( idx < listCnt ){ // 처음 보여줄 클래스 목록
						tag = '<li>';
						tag += '<div class="class-list-thumb"><a href="<%=request.getContextPath()%>/classDetailView?no=' + r[idx].class_no + '" target="_blank"><img src="' + r[idx].class_thumb + '"/></a></div>';
						tag += '<div class="class-list-info">';
						tag += '<div class="class-category">' + r[idx].cateL_name + ' > ' + r[idx].category_name + '</div>';
						tag += '<div class="class-name"><a href="<%=request.getContextPath()%>/classDetailView?no=' + r[idx].class_no + '" target="_blank">' + r[idx].class_name + '</a></div>';
						tag += '<div class="class-creator">' + r[idx].nick + '</div>';
						tag += '<div class="class-point">';
						tag += `<div class="class-back-star">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>
								<div class="class-front-star" style="width:` + (r[idx].star_avg/5) * 80 + `px">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</div>`;
						tag += r[idx].star_avg.toFixed(1) + '</div>';
						tag += '<div class="class-like">♥ ' + r[idx].like_cnt + '</div>';
						tag += '<div class="class-addr">' + r[idx].class_addr1 + '</div>';
						tag += '<div class="class-price">' + numberWithCommas(r[idx].class_price) + '원</div>';
						tag += '</div>';
						tag += '</li>';	
						$('#placesList').append(tag); // 목록 추가
						//if(r[idx].star_avg>0){ // 별점 비율 바꾸기
						//	$('.class-front-star').css('width', ((r[idx].star_avg/5) * 80) + 'px');
						//} else{
						//	$('.class-front-star').css('width', '0px');
						//}
						$('.no-result-txt').hide(); // 결과 없음 내용 숨기기
						$('.more').show(); // 더보기 버튼 보이기
						if(idx >= r.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
							$('.more').hide();
						}
					}
					var n=1;
					$('.more > button').click(function(){ // more 버튼 클릭 시 보여줄 클래스 목록
						n++;
						if( idx >= listCnt*(n-1) && idx <= (listCnt*n-1) ){
							tag = '<li>';
							tag += '<div class="class-list-thumb"><a href="<%=request.getContextPath()%>/classDetailView?no=' + r[idx].class_no + '" target="_blank"><img src="' + r[idx].class_thumb + '"/></a></div>';
							tag += '<div class="class-list-info">';
							tag += '<div class="class-category">' + r[idx].cateL_name + ' > ' + r[idx].category_name + '</div>';
							tag += '<div class="class-name"><a href="<%=request.getContextPath()%>/classDetailView?no=' + r[idx].class_no + '" target="_blank">' + r[idx].class_name + '</a></div>';
							tag += '<div class="class-creator">' + r[idx].nick + '</div>';
							tag += '<div class="class-point">';
							tag += `<div class="class-back-star">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</div>
									<div class="class-front-star" style="width:` + (r[idx].star_avg/5) * 80 + `px">
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
										<i class="fas fa-star"></i>
									</div>`;
							tag += r[idx].star_avg.toFixed(1) + '</div>';
							tag += '<div class="class-like">♥ ' + r[idx].like_cnt + '</div>';
							tag += '<div class="class-addr">' + r[idx].class_addr1 + '</div>';
							tag += '<div class="class-price">' + numberWithCommas(r[idx].class_price) + '원</div>';
							tag += '</div>';
							tag += '</li>';	
							//if(r[idx].star_avg>0){ // 별점 비율 바꾸기
							//	$('.class-front-star').css('width', ((r[idx].star_avg/5) * 80) + 'px');
							//} else{
							//	$('.class-front-star').css('width', '0px');
							//}
							$('#placesList').append(tag); // 목록 추가
							$('.no-result-txt').hide(); // 결과 없음 내용 숨기기
							$('.more').show(); // 더보기 버튼 보이기
							if(idx >= r.length-1){ // 남은 클래스가 없으면 more 버튼 숨기기
								$('.more').hide();
							}
						}
					});
					
					// 주소 - 좌표 변환 + 마커 + 인포윈도우 생성
					setMapPosition(cateL_arr[idx], category_arr[idx], classNo_arr[idx], className_arr[idx], nick_arr[idx], likeCnt_arr[idx], starAvg_arr[idx], classPrice_arr[idx], addr_arr[idx], classImg_arr[idx], idx);
					
				}); //each
			}, error: function(e){
				console.log('리스트 불러오기 에러');
			}
		}); // ajax
	}
	
	// 지도 생성
	function initMap(){
		var latitude = 37.566826;
		var longitude = 126.9786567;
		

		var mapContainer = document.getElementById('class-map-view'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };  
	
		// 지도 생성    
		map = new kakao.maps.Map(mapContainer, mapOption); 
		
		geocoder = new kakao.maps.services.Geocoder();
		// 클래스 목록 불러오기
		setClassList();
		
	} // initMap
	

	
	
	// 주소 - 좌표 변환 + 마커 + 인포윈도우 생성
	function setMapPosition(cateL, category, classNo, className, nick, likeCnt, starAvg, classPrice, addr, classImg, idx){
		// 주소로 좌표를 검색
		geocoder.addressSearch( addr , function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
				
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
		        
		        
		        // 결과값으로 받은 위치를 마커로 표시
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
				
		        var markerInfo = '<div class="markerInfo">';
		        markerInfo += '<a class="marker-class-no" href="<%=request.getContextPath()%>/classDetailView?no=' + classNo + '" target="_blank"></a>'
		        markerInfo += '<div class="marker-class-img"><img src="' + classImg + '"/></div>';
		        markerInfo += '<div class="marker-class-info">'
		        markerInfo += '<div class="marker-class-category">' + cateL + ' > ' + category + '</div>'
		        markerInfo += '<div class="marker-class-name">' + className + '</div>';
		        markerInfo += '<div class="marker-class-creator">' + nick + '</div>';
		       // markerInfo += '<div class="marker-class-like">' + '♥ ' + likeCnt + ' + '</div>';
		        markerInfo += '<div class="marker-class-addr">' + addr + '</div>';
		       // markerInfo += '<div class="marker-class-point">' + '★★★★★' + starAvg + '</div>';
		        markerInfo += '<div class="marker-class-price">' + classPrice + '원</div>';
		        markerInfo += '</div>';
		        // 인포윈도우로 장소에 대한 설명 표시
		        var infowindow = new kakao.maps.InfoWindow({
		            content: markerInfo
		        });
		        
		        markers[idx] = marker; // 마커 담기
		        infoArr[idx] = infowindow; // 인포윈도우 배열에 담기
		        		        
		        kakao.maps.event.addListener(marker, 'click', function() {
		        	closeInfoWindow(); // 모든 인포윈도우 닫기
		        	infowindow.open(map, marker); // 마커 위에 현재 인포윈도우 표시
		        });

		    	// 지도 클릭 이벤트 - 인포윈도우 닫기
				kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
					infowindow.close(); // 인포윈도우 닫기
				});	
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		        
		    } //if
		});   
	
	} //setMapPosition
	
	
	// 모든 인포윈도우 닫는 함수
    function closeInfoWindow() {
    	for(var z=0; z<infoArr.length; z++){
			infoArr[z].close();
	    }
    }
	
 	// 모든 마커를 지도에서 제거하는 함수
    function deleteMarkers() {
    	for(var z=0; z<markers.length; z++){
			markers[z].setMap(null);
	    }
    }
	
	
	// 클래스목록 마우스오버 시 지도 중심 위치 이동시키기
	function moveCenter(addr){
		geocoder.addressSearch( addr , function(result, status) {
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		        map.setCenter(coords);
		     }
		});
	}
	
	
	// 클래스 목록 마우스오버 이벤트 - 해당 마커 중심 지도, 인포윈도우 열기
	$(document).on('mouseenter', '#placesList > li', function(){
		var li_idx = $(this).index();
		moveCenter($(this).children('.class-list-info').children('.class-addr').text()); // 지도 중심 이동시키기
		kakao.maps.event.trigger(markers[li_idx], 'click'); // 마커 클릭 이벤트 강제 실행 - 인포윈도우 열기
	});
	
	
	
	
	// 대분류 카테고리 세팅
	var url = '<%=request.getContextPath()%>/cateL';
	$.ajax({
		url: url,
		success: function(result){
			var r = $(result);
			var tag='';
			if(r.length!=0){
				r.each(function(idx){
					tag = `<optgroup label="` + r[idx].category_name + `">`;
					tag +=	`<option>` + r[idx].category_name + ` 전체</option>`;
					tag += `</optgroup>`;
					
					$('.select-category').append(tag);
					
					
					// 중분류 카테고리 세팅
					var url2 = '<%=request.getContextPath()%>/cateS';
					var params2 = 'category1_no='+ r[idx].category1_no;
					$.ajax({
						url: url2,
						data: params2,
						success: function(result2){
							
							
							var rr = $(result2);
							//var opt_idx; 
							var optgroup = $('.select-category').children('optgroup');
							if(rr.length!=0){
								rr.each(function(idx2){
									var opt_idx = Math.floor(rr[idx2].category_no / 100)-1;
									optgroup.eq(opt_idx).append('<option>' + rr[idx2].category_name + '</option>');
								});
							}
						}, error: function(e){
							console.log('카테고리 불러오기 에러', e.responseText);
						}
					}); // 중분류 ajax
					
					
				}); // 대분류 each
			}
		}, error: function(e){
			console.log('카테고리 불러오기 에러', e.responseText);
		}
	}); // 대분류 ajax

	

}); //
	
	
</script>