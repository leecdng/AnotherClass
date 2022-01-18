package com.anotherclass.bitcamp.controller.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.anotherclass.bitcamp.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	@RequestMapping("/")
	public String admin() {
		return "admin/admin";
	}
	
}
