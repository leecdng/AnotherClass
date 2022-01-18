package com.anotherclass.bitcamp.register;

import java.security.PrivateKey;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.register.RegisterService;

@Controller
public class RegisterController {
	private HashingSeting hashing = new HashingSeting();
	
	@Inject
	RegisterService registerService;
	
	
	@RequestMapping("/register")
	public String register() {
		return "register/userRegister";
	}
	
	@RequestMapping("/registerCreator")
	public String registerCreator() {
		return "register/creatorRegister";
	}
	
	@RequestMapping(value="/register/check", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(RegisterVO vo, String id) {
		vo.setMember_id(id);
		registerService.logIdCheck(vo);
		String cnt =vo.getAdditional_information_one();
		return cnt;
	}
	
	// 유저 회원가입
	@RequestMapping(value="/userJoin",method=RequestMethod.POST)
	public ModelAndView userJoin(RegisterVO vo)throws Exception {
		ModelAndView mav = new ModelAndView();
		vo.setMember_pw(hashing.setEncryption(vo.getMember_pw(),vo.getMember_id()));
		int check = registerService.userAccountJoin(vo);
		if(check>0) {
			
		}else{
			
		}
		mav.setViewName("redirect:/");
		return mav;
	}
	
	// 강사 회원가입
	@RequestMapping(value="/creatorJoin",method=RequestMethod.POST)
	public ModelAndView creatorJoin(RegisterVO vo)throws Exception {
		ModelAndView mav = new ModelAndView();
		vo.setMember_pw(hashing.setEncryption(vo.getMember_pw(),vo.getMember_id()));
		int check = registerService.creatorAccountJoin(vo);
		if(check>0) {
			
		}else{
			
		}
		mav.setViewName("redirect:/");
		return mav;
	}
	
	// 회원 로그인폼
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request) {
		Rsa rsa = new Rsa();
		rsa.initRsa(request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("logType", "1");
		mav.setViewName("/register/loginForm");
		return mav;
	}
	
	// 강사 로그인폼
	@RequestMapping(value = "/creatorLogin")
	public ModelAndView creatorLogin(HttpServletRequest request) {
		Rsa rsa = new Rsa();
		rsa.initRsa(request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("logType", "2");
		mav.setViewName("/register/loginForm");
		return mav;
	}
	
	// 관리자 로그인폼
	@RequestMapping(value = "/adminLogin")
	public ModelAndView  adminLogin(HttpServletRequest request) {
		Rsa rsa = new Rsa();
		rsa.initRsa(request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("logType", "3");
		mav.setViewName("/register/loginFormAdmin");
		return mav;
	}
	
	// 로그인 시 복호화 -- 회원/강사
	public void rsaLog(RegisterVO vo, HttpSession session) throws Exception{
		Rsa rsa = new Rsa();
		// 로그인 전 세션에 저장된 개인키 가져오기
		PrivateKey privateKey = (PrivateKey) session.getAttribute(Rsa.RSA_WEB_KEY);
//		System.out.println("암호화id : " + vo.getMember_id());
//		System.out.println("암호화pw : " + vo.getMember_pw());
		// 복호화
		String memberId = rsa.decryptRsa(privateKey, vo.getMember_id());
		String memberPw = rsa.decryptRsa(privateKey, vo.getMember_pw());
//		System.out.println("복호화id : " + memberId);
//		System.out.println("복호화pw : " + memberPw);

		// 해싱
		String hashingPw = hashing.setEncryption(memberPw, memberId);
		
		vo.setMember_id(memberId);
		vo.setMember_pw(hashingPw);
	}
	
	
	// 회원/강사 로그인 실행
	@RequestMapping(value = "/loginOk", method = RequestMethod.POST)
	public ModelAndView loginOk(RegisterVO vo, HttpSession session) throws Exception{
		System.out.println("로그인");
		if(vo.getSns_type()==null || vo.getSns_type().equals("")) { // 일반 로그인 시
			rsaLog(vo, session); // 복호화
		} else {
			String hashingPw = hashing.setEncryption("snspassword", vo.getMember_id()); // 임의 비밀번호
			vo.setMember_pw(hashingPw);
		}
		
		ModelAndView mav = new ModelAndView();
		RegisterVO logvo = new RegisterVO();
		logvo = registerService.loginMember(vo); // 로그인 계정 조회
		
		if(logvo!=null) { // 기존 계정 있을 시
			if(logvo.getMember_img()==null || logvo.getMember_img().equals("")) {  // 프로필 없을 때 기본 이미지
				logvo.setMember_img("/img/etc/basic_profile.png");				
			}
			if(vo.getLogType().equals("1")) {  // 회원
				session.setAttribute("userId", logvo.getMember_id());
				session.setAttribute("userNick", logvo.getNick());
				session.setAttribute("userImg", logvo.getMember_img());
				session.setAttribute("userLog", "Y");
				if(vo.getSns_type()!=null) {
					session.setAttribute("userSnsType", vo.getSns_type());
				};
				mav.setViewName("redirect:/");	
				
			} else if(vo.getLogType().equals("2")) { // 강사
				session.setAttribute("creatorId", logvo.getMember_id());
				session.setAttribute("creatorNick", logvo.getNick());
				session.setAttribute("creatorImg", logvo.getMember_img());
				session.setAttribute("creatorLog", "Y");
				if(vo.getSns_type()!=null) {
					session.setAttribute("creatorSnsType", vo.getSns_type());
				}
				mav.setViewName("redirect:/creator/");		
			}			
		} else { // 기존 계정 없을 시
			if(vo.getSns_type()!=null && !vo.getSns_type().equals("")) { // 첫 sns 로그인 (가입)
				int cnt=0;
				if(vo.getLogType().equals("1")) { // 회원
					cnt = registerService.userAccountJoin(vo); // sns 회원 등록
					if(cnt>0) {
						session.setAttribute("userId", vo.getMember_id());
						session.setAttribute("userNick",vo.getNick());
						session.setAttribute("userImg", vo.getMember_img());
						session.setAttribute("userLog", "Y");
						session.setAttribute("userSnsType", vo.getSns_type());
						mav.addObject("msgType", "1"); // 회원가입 완료 메세지
					} else {
						mav.addObject("msgType", "2"); // 회원가입 실패 메세지
					}
				} else if(vo.getLogType().equals("2")) { // 강사
					cnt = registerService.creatorAccountJoin(vo); // sns 강사 등록
					if(cnt>0) {
						session.setAttribute("creatorId", vo.getMember_id());
						session.setAttribute("creatorNick", vo.getNick());
						session.setAttribute("creatorImg", vo.getMember_img());
						session.setAttribute("creatorLog", "Y");
						session.setAttribute("creatorSnsType", vo.getSns_type());
						mav.addObject("msgType", "1"); // 회원가입 완료 메세지
					} else {
						mav.addObject("msgType", "2"); // 회원가입 실패 메세지
					}
				}
				mav.setViewName("/register/registerResult");
			} else { // sns 계정 아니고 일반 계정도 일치하지 않을 때
				if(vo.getLogType().equals("1")) { // 회원
					mav.addObject("logTypeStr", "회원");
				} else if(vo.getLogType().equals("2")) { // 강사
					mav.addObject("logTypeStr", "크리에이터");
				}
				mav.setViewName("/register/loginResult"); // 로그인 폼 페이지로 돌아가기
			}
		}
		return mav;
	}
	
	
	// 관리자 로그인 실행
	@RequestMapping(value = "/adminLoginOk", method = RequestMethod.POST)
	public ModelAndView adminLoginOk(RegisterVO vo, HttpSession session) throws Exception{
		rsaLog(vo, session); // 복호화

		ModelAndView mav = new ModelAndView();
		RegisterVO logvo = new RegisterVO();
		logvo = registerService.loginAdmin(vo); // 관리자 로그인 계정 조회
		if(logvo!=null) {
			session.setAttribute("adminId", logvo.getMember_id());
			session.setAttribute("adminLog", "Y");
			mav.setViewName("redirect:/admin/");		
		} else {
			mav.addObject("logTypeStr", "관리자");
			mav.setViewName("/register/loginResult");
		}
		return mav;
	}

	
	// 네이버 로그인 콜백 - 회원 로그인
	@RequestMapping(value = "/callback_user", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback_user() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("logType", "1");
		mav.setViewName("/register/callback");
		System.out.println("실행1");
		return mav;
	}
	
	// 네이버 로그인 콜백 - 크리에이터 로그인
	@RequestMapping(value = "/callback_creator", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback_creator(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("logType", "2");
		mav.setViewName("/register/callback");
		System.out.println("실행2");
		return mav;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		session.removeAttribute("userNick");
		session.removeAttribute("userImg");
		session.removeAttribute("userLog");
		session.removeAttribute("userSnsType");
		return "redirect:/";
	}
	
	// 강사 로그아웃
	@RequestMapping(value = "/creatorLogout")
	public String creatorLogout(HttpSession session) {
		session.removeAttribute("creatorId");
		session.removeAttribute("creatorNick");
		session.removeAttribute("creatorImg");
		session.removeAttribute("creatorLog");
		session.removeAttribute("creatorSnsType");
		return "redirect:/creator/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/adminLogout")
	public String adminLogout(HttpSession session) {
		session.removeAttribute("adminId");
		session.removeAttribute("adminLog");
		return "redirect:/admin/";
	}
	
}




















