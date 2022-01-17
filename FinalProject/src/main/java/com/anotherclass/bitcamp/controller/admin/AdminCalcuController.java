package com.anotherclass.bitcamp.controller.admin;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anotherclass.bitcamp.service.admin.AdminCalcuService;
import com.anotherclass.bitcamp.vo.admin.AdminCalcuVO;

@Controller
public class AdminCalcuController {
	
	@Inject
	AdminCalcuService adminCalcuService;
	
	@RequestMapping("/admin/calcuList")
	public String adminCalcuList() {
		return "admin/calculate/calcu_list";
	}

	
	@RequestMapping("/adminCalcuPage")
	@ResponseBody
	public AdminCalcuVO adminCalcuPage(int nowPage) {
		AdminCalcuVO vo = adminCalcuService.countTotalAdminCalcu();
		vo.setNowPage(nowPage);

		return vo;
	}
	
	@RequestMapping("/selectAdminCalcuList")
	@ResponseBody
	public List<AdminCalcuVO> selectAdminCalcuList(AdminCalcuVO vo) {
		List<AdminCalcuVO> calcuList = adminCalcuService.selectAdminCalcuList(vo);

		return calcuList;
	}
	
	@RequestMapping("/updateCalcuList")
	@ResponseBody
	public void updateCalcuList(AdminCalcuVO vo) {
		int cnt = adminCalcuService.updateCalcuList(vo);
		System.out.println(cnt);
	}
	
	
	@RequestMapping("/creatorCalcuPage")
	@ResponseBody
	public AdminCalcuVO creatorCalcuPage(int nowPage) {
		AdminCalcuVO vo = adminCalcuService.countTotalCreatorCalcu();
		vo.setNowPage(nowPage);

		return vo;
	}
	
	@RequestMapping("/selectCreatorCalcuList")
	@ResponseBody
	public List<AdminCalcuVO> selectCreatorCalcuList(AdminCalcuVO vo) {
		List<AdminCalcuVO> calcuList = adminCalcuService.selectCreatorCalcuList(vo);

		return calcuList;
	}
	
}
