package com.anotherclass.bitcamp.controller.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.user.UserPayService;
import com.anotherclass.bitcamp.vo.user.BasketVO;
import com.anotherclass.bitcamp.vo.user.UserPayVO;


@Controller
public class UserPayController {
	@Inject 
	UserPayService userPayService;

	
	@RequestMapping(value= "/PayPage", method = RequestMethod.POST)
	public ModelAndView payPage(UserPayVO vo ) {		
		ModelAndView mav = new ModelAndView();
		
		
		List<UserPayVO> list2 =  userPayService.userPayAllselect(vo.getClassNoPayList());
		for(int i=0; i<list2.size(); i++) {
			UserPayVO vo3=list2.get(i);
			int a = vo3.getClass_price();
			double b = a*0.01;
			int c = (int)Math.round(b);
			vo3.setSavePoint(c);
		}		
		mav.addObject("list",list2); 				
		
		
		List<UserPayVO> list =  userPayService.userPayAllselect(vo.getClassNoPayList());		
		int sum = 0;
		for(int i=0; i<list.size(); i++) {
			UserPayVO vo2=list.get(i);
			sum += vo2.getClass_price();
		}
		System.out.println(sum);		
		mav.addObject("sum", sum);				
		
		
		int sum2 = 0;
		for(int i=0; i<list2.size(); i++) {
			UserPayVO vo4=list2.get(i);
			sum2 += vo4.getSavePoint();
		}
		System.out.println(sum2);		
		mav.addObject("sum2", sum2);	
		
		mav.setViewName("/user/pay/payPage_info");
		return mav;
	}
	
	
	@RequestMapping(value= "/PayPage2", method = RequestMethod.POST)
	public ModelAndView payPage2(int no) {
		ModelAndView mav = new ModelAndView();
		List<UserPayVO> list8=  userPayService.userPayoneSelect(no);
		
			UserPayVO vo2=list8.get(0);
			int a = vo2.getClass_price();
			double b = a*0.01;
			int c = (int)Math.round(b);
			vo2.setSavePoint(c);
			
		mav.addObject("list",vo2); 			
		mav.setViewName("/user/pay/payPage_info");
		return mav;
	}
	
	@RequestMapping("/memInfo")
	@ResponseBody
	public UserPayVO ajaxMemInfo(String logid) {
		UserPayVO vo =  userPayService.userInfo(logid);
		return vo;
		
	}

	@RequestMapping(value="/basketResult")
	public String basketResult() {
		return "/result/BasketResult";
	}
	
	@RequestMapping("/InsertBasketDB")
	@ResponseBody
	public ModelAndView ajaxInsertBasket(UserPayVO vo, HttpSession session) {
		
		ModelAndView  mav = new ModelAndView();
		
		String member_id = (String)session.getAttribute("userId"); 
		BasketVO bvo = new BasketVO();
		int[]te= vo.getClassNoPayList();
		bvo.setMember_id(member_id);
		bvo.setHeadcount(1);
		
		int cnt = 0;
		for(int i=0; i<te.length; i++) {
			bvo.setClass_option_no(te[i]);
			cnt = userPayService.testBasket(bvo);
		}
		
		
		mav.addObject("cnt",cnt);
		mav.setViewName("redirect:basketResult");
		return mav;
		
	}
	
	@RequestMapping("/DeleteBasketDB")
	public ModelAndView basketDel(UserPayVO vo, HttpSession session) {
		
		ModelAndView  mav = new ModelAndView();
		String member_id = (String)session.getAttribute("userId"); 
		BasketVO bvo = new BasketVO();
		int[]te= vo.getClassNoPayList();
		bvo.setMember_id(member_id);	
		int cnt = 0;
		for(int i=0; i<te.length; i++) {
			bvo.setClass_option_no(te[i]);
			cnt = userPayService.delBasket(bvo);//디비에서삭제
		}			
		mav.addObject("cnt",cnt);
		mav.setViewName("redirect:basketResult");
		return mav;		
	}
	
	
	@RequestMapping("/delOneClass")
	@ResponseBody
	public int DelOneClass(int no) {
		int result =0;
		result = userPayService.delOneBasket(no);		
		return result;
	}
	
	//결제하고나서오는곳
	@RequestMapping("/SaveOrder1")
	@ResponseBody
	public int saveOrder(String imp_uid, String merchant_uid, String test,String total_price,String card_num,HttpSession session) {
		String member_id = (String)session.getAttribute("userId");
		int result = 0;
		
		String str = test;
		String[] str2 = str.split(",");
		
		for(int i=0; i<str2.length; i++) {
			System.out.println(str2[i]);
		}
		
		UserPayVO vo = new UserPayVO();
		vo.setMember_id(member_id);
		vo.setCard_num(card_num);
		vo.setMerchant(merchant_uid);		
		//headcount
		//use_point
		
		for(int i=0; i<str2.length; i++) {
			vo.setClass_option_no(Integer.parseInt(str2[i]));
			
			int classprice = userPayService.getClassNo(vo.getClass_option_no());
			vo.setTotal_price(classprice);
			double a = classprice*0.01;
			int b = (int)Math.round(a);
			vo.setCharge(b);
			userPayService.oneClassOrder(vo);
			userPayService.addHeadCount(Integer.parseInt(str2[i]));
		}
		return result;
	}
	
	
	
	@RequestMapping("/SaveOrder2")
	@ResponseBody
	public int saveOrder2(String imp_uid,String merchant_uid,String total_price,String card_num,int class_option_no,String test ,HttpSession session) {
		String member_id = (String)session.getAttribute("userId"); 
		int result = 0;
		UserPayVO vo = new UserPayVO();
		vo.setMember_id(member_id);
		vo.setClass_option_no(class_option_no);
		//headcount
		//use_point
		vo.setTotal_price(Integer.parseInt(total_price));
		
		double a = vo.getTotal_price()*0.01;
		int b = (int)Math.round(a);
		vo.setCharge(b);
		
		vo.setCard_num(card_num);
		vo.setMerchant(merchant_uid);
		
		result = userPayService.oneClassOrder(vo);
		int aaa =userPayService.addHeadCount(class_option_no);
		
		
		return result;
	}
	
	
	@RequestMapping("/payEnd")//주문내역	
	public String payEnd() {
		System.out.println("33");
		return "user/pay/payEnd";
	}
	
}
