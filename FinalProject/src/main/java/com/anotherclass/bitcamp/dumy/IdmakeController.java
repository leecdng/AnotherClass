package com.anotherclass.bitcamp.dumy;



import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anotherclass.bitcamp.register.HashingSeting;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.register.RegisterService;

@Controller
@RequestMapping("/admin")
public class IdmakeController {
	
	private HashingSeting hashing = new HashingSeting();
	
	@Inject
	RegisterService registerService;
	
	@Inject
	DumyService dumyService;
	
	@RequestMapping("/ClassOptionSeting")
	public String classNumberList() {
	
		// 현재 전체 클래스를 가져와서 옵션생성 - 옵션은 mybatis에서 설정 필요 
		List<String> list = dumyService.classNumberList();	
		//Collections.shuffle(list);
//		for(int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i));
//			int cnt = dumyService.classOptionSeting(list.get(i));
//			System.out.println(cnt);
//		}
		
		// 위에서 설정된 옵션 List를 가져오기
		List<String> option= dumyService.optionNumber();
		List<String> member = dumyService.memberIdList();
		List<String> price = Arrays.asList("10000","26000","41000","12000","9000","10000","26000","41000","12000","9000","10000","26000","41000","12000","9000","10000","26000","41000","12000","9000","9000","10000","26000","41000","12000","9000","10000","26000","41000","12000","9000","9000","10000","26000","41000","12000","9000","10000","26000","41000","12000","9000");
		List<String> bank = Arrays.asList("국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드","국민은행","SC제일은행","경남은행","kb국민카드","신한카드");
		List<String> orderDate = Arrays.asList("2021-10-28 11:10","2021-10-28 15:10","2021-10-28 14:10","2021-10-28 14:10","2021-10-28 08:15","2021-10-28 17:10","2021-10-28 11:10","2021-10-28 15:10","2021-10-28 14:10","2021-10-28 14:10","2021-10-28 08:15","2021-10-28 17:10","2021-10-28 11:10","2021-10-28 15:10","2021-10-28 14:10","2021-10-28 14:10","2021-10-28 08:15","2021-10-28 17:10");
		
		Collections.shuffle(list);
		Collections.shuffle(member); 
		Collections.shuffle(price); 
		Collections.shuffle(bank);
		Collections.shuffle(orderDate);
		ClassOptionDumyVO vo = new ClassOptionDumyVO();
		HeadCountVO hdvo = new HeadCountVO();
		ClassLikeDumyVO clvo = new ClassLikeDumyVO();
		for(int i=0; i<7; i++) {
			//vo.setClassNumber(option.get(i));
			clvo.setMember_id(member.get(i));
			clvo.setClassNumber("1101");
			if(clvo.getMember_id()== dumyService.LikeList(clvo)) {
				System.out.println("--------------"+clvo.getMember_id());
				clvo.setMember_id(member.get(i+8));
			}
			//dumyService.classLikeInsert(clvo);
//			vo.setPrice(price.get(i));
//			vo.setPay_company(bank.get(i));
//			vo.setOrder_date(orderDate.get(i));
//			vo.setBuyNumber("153154");
//			dumyService.classOrdelSeting(vo);
			
//			hdvo.setClassNumber(option.get(i));
//			hdvo.setHeadCount(""+i+1);
//			dumyService.optionCountUpdate(hdvo);
			System.out.println("아이디:"+member.get(i));
			System.out.println("클래스:"+list.get(i));
		}

		return "test";
		}
	
	@RequestMapping("/makeIdcheck")
	public String testing()throws Exception  {
		RegisterVO vo = new RegisterVO();
		String idText="";
		int check = 0;
		for (int i = 0; i < 100; i++) { 
			if(i % 10 == 0) { 
				System.err.println(); 
			} 
			idText=text()+number();
			System.err.println(idText);
			vo.setMember_pw(idText);
			vo.setMember_id(idText);
			vo.setMember_name(nName());
			vo.setMember_tel("010"+"-"+num2()+"-"+num3());
			vo.setMember_email(idText+"@naver.com");
			//vo.setNick(nNick());
			vo.setMember_pw(hashing.setEncryption(idText,idText));
			check = registerService.userAccountJoin(vo);
			//check = registerService.creatorAccountJoin(vo);
			System.out.println("----------------------");
			System.out.println("비번:"+vo.getMember_pw());
			System.out.println("아이디:"+vo.getMember_id());
			System.out.println("이름:"+vo.getMember_name());
			System.out.println("전화번호:"+vo.getMember_tel());
			System.out.println("이메일:"+vo.getMember_email());
			//System.out.println("닉네임:"+vo.getNick());
			System.out.println("----------------------");
			System.out.println("업로드중--->"+check);
		}
		System.out.println();
		
		return idText;
	}
	
	public static String text() {
		String text =""; 
		String ran = "abcdefghijklmnopqrstuvwxyz";
		for(int i = 0; i < 6; i++) { 
			text += ran.charAt((int)(Math.random() * ran.length())); 
		} 
		return text;
	}
	
	// 홈페이지문의 
	// 좋아요수
	// 고구마 !
	// 클래스 1000 아이디
	public static String num2() {
		String text = ""; 
		String ran = "123456789";
		for(int i = 0; i < 4; i++) { 
			text += ran.charAt((int)(Math.random() * ran.length())); 
		} 
		return text;
	}
	
	public static String num3() {
		String text = ""; 
		String ran = "123456789";
		for(int i = 0; i < 4; i++) { 
			text += ran.charAt((int)(Math.random() * ran.length())); 
		} 
		return text;
	}
	
	public static String nameSeting() {
		String text =""; 
		String ran = "";
		for(int i = 0; i < 6; i++) { 
			text += ran.charAt((int)(Math.random() * ran.length())); 
		} 
		return text;
	}
	
	public static String number() {
		String number = (int)(Math.random() * 999)+1 +""; 
		return number;
	}
	
	public static String nNick() {
		List<String> 닉 = Arrays.asList("기분나쁜","기분좋은","신바람나는","상쾌한","짜릿한","그리운","자유로운","서운한","울적한","비참한","위축되는","긴장되는","두려운","당당한","배부른","수줍은","창피한","멋있는", "열받은","심심한","잘생긴","이쁜","시끄러운"); List<String> 네임 = Arrays.asList("사자","코끼리","호랑이","곰","여우","늑대","너구리","침팬치","고릴라","참새","고슴도치","강아지","고양이","거북이","토끼","앵무새","하이에나","돼지","하마","원숭이","물소","얼룩말","치타", "악어","기린","수달","염소","다람쥐","판다"); 
		Collections.shuffle(닉); 
		Collections.shuffle(네임); 
		String text = 닉.get(0)+네임.get(0); 
		return text; 
	} 
	
	public static String nName() { 
		List<String> 성 = Arrays.asList("김", "이", "박","김","성","이","장"); 
		List<String> 이름 = Arrays.asList("가", "강", "경", "고", "관", "광", "구", "규", "근", "기", "길", "나", "남", "노", "누", "다", "단", "달", "담", "대", "덕", "도", "동", "두", "라", "래", "로", "루", "리", "마", "만", "명", "무", "문", "미", "민", "바", "박", "백", "범", "별", "병", "보", "빛", "사", "산", "상", "새", "서", "석", "선", "설", "섭", "성", "세", "소", "솔", "수", "슬", "승", "시", "신", "아", "안", "애", "엄", "여", "연", "영", "예", "용","유", "윤", "은", "의", "이", "익", "인", "자", "잔", "장", "재", "전", "정", "제", "조", "주", "준", "지", "진", "찬", "창", "초", "춘", "충", "치", "하", "호", "홍", "화", "환", "회", "효", "훈", "휘", "희", "운", "모", "배", "부", "림", "봉", "혼", "황", "량", "린", "을", "비", "솜", "공", "면", "탁", "온", "디", "항", "후", "려", "균", "묵", "송", "욱", "휴", "언", "령", "섬", "들", "견", "추", "걸", "삼", "열", "웅", "분", "변", "양", "출", "타", "번", "식", "란", "더", "손", "술", "훔", "반", "빈", "실", "직", "흠", "학", "개"); 
		Collections.shuffle(성); 
		Collections.shuffle(이름); 
		return 성.get(0) + 이름.get(0) + 이름.get(1); 
		}
	}


