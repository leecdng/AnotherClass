package com.anotherclass.bitcamp.controller.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.register.HashingSeting;
import com.anotherclass.bitcamp.register.RegisterVO;
import com.anotherclass.bitcamp.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class NoticeManagementController {

	@RequestMapping(value="/noticeManagement")
	public String noticeManagement() {
		return "admin/BoardManagement/noticeManagement";
	}
	
	@RequestMapping(value="/faqManagement")
	public String faqManagement() {
		return "admin/BoardManagement/faqManagement";
	}
	
	@RequestMapping(value="/inquiryManagement")
	public String inquiryManagement() {
		return "admin/BoardManagement/inquiryManagement";
	}
	

	
}