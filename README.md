# AnotherClass
파이널 웹 프로젝트 - 취미 클래스 예약 웹사이트

![user_main](https://user-images.githubusercontent.com/85078379/149211943-a057ec8f-1925-4cb8-844d-0db49015be29.png)

## 프로젝트 소개
+ 매일 반복되는 똑같은 일상에 다양한 취미 클래스를 통해 새로운 경험을 제공합니다.
+ 내 주변에 있는 클래스의 위치 확인과 다양한 취미 클래스를 한눈에 볼 수 있고, 원하는 날짜에 취미 클래스 예약 결제가 가능한 서비스를 제공합니다.
+ 커뮤니티 공간을 통해 회원 간 소통하여 수강 후기와 취미 활동의 즐거움에 대한 가치를 공유하여 서로에게 도움이 되는 목적을 두었습니다.
+ <a href="https://github.com/leecdng/Covid-19_Project/blob/master/3%EC%A1%B0%20UI%EA%B5%AC%ED%98%84.pdf">프로젝트 PPT 파일</a>을 참고해 주세요.

## 개발 기간 및 인원
+ 개발 기간 : 2021/10/01 ~ 2021/10/29
+ 개발 인원 : 5명

---
## 주요 기능
회원
+ 회원가입 - SHA-256 암호화
+ 로그인 - RSA 암호화 / 카카오, 네이버 로그인 API
+ 내 주변 클래스 찾기 - 카카오 지도 API
+ 장바구니 / 예약 결제 - 아임포트 API
+ 후기게시판 - 별점 등록, 댓글-답댓글 기능
+ 커뮤니티 게시판

크리에이터
+ 클래스 개설 및 관리 - Summer Note
+ 클래스 문의 및 후기 관리
+ 수익 정산 관리 - Chart.js

관리자
+ 전체 클래스 관리
+ 회원 및 크리에이터 관리
+ 결제 관리
+ 정산 관리
+ 고객 문의 관리

---

## 맡은 기능
+ <a href="#로그인">로그인 - RSA 암호화 / 카카오, 네이버 로그인 API</a><br/>
+ <a href="#사용자-메인">사용자 메인 - Swiper.js</a><br/>
+ <a href="#내-주변-클래스-찾기">내 주변 클래스 찾기 - 카카오 지도 API</a><br/>
+ <a href="#후기-게시판">후기 게시판 - 별점 등록, 댓글-답댓글 기능</a><br/>
+ <a href="#크리에이터관리자-메인">크리에이터/관리자 메인 화면</a><br/>
+ <a href="#크리에이터관리자-수익-정산-관리">크리에이터/관리자 수익 정산 관리</a><br/>


### 로그인
+ 보안을 위해 양방향 비대칭키 방식인 RSA 암호화를 사용했습니다. (암호문을 확인하기 위해 임의로 alert을 띄웠습니다.)
  
  ![login_04](https://user-images.githubusercontent.com/85078379/149461002-17bffd17-c20d-4e18-a8e9-fb7ddd5b8342.gif)

+ 카카오 로그인 API, 네이버 로그인 API를 사용하여 SNS 계정을 통한 간편 가입과 로그인이 가능합니다.
  
### 사용자 메인
+ Swiper.js를 사용하여 터치나 스와이프 방식으로 슬라이드를 넘길 수 있게 구현했습니다.
  
  ![main1](https://user-images.githubusercontent.com/85078379/149463783-956efd0b-d03d-4283-b440-f94af6610108.gif)

+ SQL을 사용하여 좋아요 수, 후기 별점 평균, 날짜 순 등으로 정렬한 데이터 추출했습니다.
+ 카테고리와 서브카테고리 또한 Ajax을 이용하여 카테고리 DB를 불러왔습니다.
  
  ![main_cate2](https://user-images.githubusercontent.com/85078379/149464116-d34405a2-41dc-4f89-b541-fa8607477358.gif)

  

### 내 주변 클래스 찾기
+ 카카오 지도 API를 사용하여 marker와 infowindow를 통해 클래스의 위치와 정보를 함께 확인할 수 있습니다.
  
  ![classmap_01](https://user-images.githubusercontent.com/85078379/149467085-640079de-40a8-4ecb-9d2d-8ace91ef59d1.gif)

  
+ 지역 선택과 키워드 검색을 통해 원하는 클래스를 찾을 수 있으며, 검색을 할 때마다 목록과 지도에 해당하는 클래스들만 새롭게 표시됩니다.
  
  ![classmap_02](https://user-images.githubusercontent.com/85078379/149468165-26ba507e-f7ad-45d1-92aa-73d9c64247ac.gif)

+ pagination은 more 버튼을 통해 한 번에 10건씩 더 보여지며, 더이상 조회될 클래스가 없으면 more버튼은 사라집니다.
  
  ![classmap_03](https://user-images.githubusercontent.com/85078379/149469120-b2f48d41-b250-4c1d-8d76-b5388635a377.gif)
  
### 후기 게시판
+ 별점 등록은 간단하게 클릭으로 선택이 가능합니다.
+ 
  ![review_01](https://user-images.githubusercontent.com/85078379/149708208-ec99a886-6553-4e0d-8537-c65aaeded219.gif)

+ 사진 파일 첨부하면 해당 이미지가 바로 조회되고, 삭제 클릭 시 해당 이미지가 사라집니다.

  <img src="https://user-images.githubusercontent.com/85078379/149709292-5fe82e61-6b41-4106-acf2-3c56ea03818f.png" width="750"/>

+ Ajax를 이용하여 후기에 댓글과 답댓글을 등록 또는 삭제 후 바로 업데이트 된 결과를 조회할 수 있습니다. 답댓글이 있는 댓글 삭제 시 '삭제된 댓글입니다.'라는 내용으로 조회됩니다.

  ![review_03](https://user-images.githubusercontent.com/85078379/149710792-7d56361a-b72a-4ee9-8335-cb5d3bb079a7.gif)

  
### 크리에이터/관리자 메인
+ chart.js
### 크리에이터/관리자 수익 정산 관리

---

## 기술 스택
+ 

---

## 발표 영상
+ <a href="https://youtu.be/GTm1BnCkjxo">발표 영상 바로 가기</a><br/>

  <a href="https://youtu.be/GTm1BnCkjxo"><img src="https://user-images.githubusercontent.com/85078379/149211423-53537bc9-f785-48b9-ba33-b8bc8108ab2d.png" style="max-width:100%; width: 600px; align:left;" /></a>
