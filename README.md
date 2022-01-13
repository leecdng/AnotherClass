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
+ <a href="-내-주변-클래스-찾기">내 주변 클래스 찾기 - 카카오 지도 API</a><br/>
+ <a href="#후기-게시판">후기 게시판 - 별점 등록, 댓글-답댓글 기능</a><br/>
+ <a href="#크리에이터관리자-메인">크리에이터/관리자 메인 화면</a><br/>
+ <a href="#크리에이터관리자-수익-정산-관리">크리에이터/관리자 수익 정산 관리</a><br/>


### 로그인
+ 보안을 위해 양방향 비대칭키 방식인 RSA 암호화를 사용했습니다.
+ 카카오 로그인 API, 네이버 로그인 API를 사용하여 SNS 계정을 통한 간편 가입과 로그인이 가능합니다.
### 사용자 메인
+ Swiper.js를 사용하여 터치나 스와이프 방식으로 슬라이드를 넘길 수 있게 구현했습니다.
+ SQL을 사용하여 좋아요 수, 후기 별점 평균, 날짜 순 등으로 정렬한 데이터 추출했습니다.
+ 카테고리와 서브카테고리 또한 SQL을 이용하여 불러왔습니다.
### 내 주변 클래스 찾기
+ 카카오 지도 API를 사용하여 marker와 infowindow를 통해 클래스의 위치와 정보를 함께 확인할 수 있습니다.
+ 지역 선택과 키워드 검색을 통해 원하는 클래스를 찾을 수 있으며, 검색을 할 때마다 목록과 지도에 해당하는 클래스들만 새롭게 표시됩니다.
+ pagination은 more 버튼을 통해 한 번에 10건씩 더 보여지며, 더이상 조회될 클래스가 없으면 more버튼은 사라집니다.
### 후기 게시판
+ 별점 등록은 간단하게 클릭으로 선택이 가능합니다.
+ 사진 파일 첨부
+ 댓글과 답댓글 기능
### 크리에이터/관리자 메인
+ chart.js
### 크리에이터/관리자 수익 정산 관리

---

## 기술 스택
<img src="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/> <img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=Oracle&logoColor=white"/>

---

## 발표 영상
+ <a href="https://youtu.be/GTm1BnCkjxo">발표 영상 바로 가기</a><br/>

<a href="https://youtu.be/GTm1BnCkjxo"><img src="https://user-images.githubusercontent.com/85078379/149211423-53537bc9-f785-48b9-ba33-b8bc8108ab2d.png" style="max-width:100%; width: 600px; align:left;" /></a>