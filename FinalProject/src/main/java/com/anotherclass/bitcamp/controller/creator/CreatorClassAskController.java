package com.anotherclass.bitcamp.controller.creator;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anotherclass.bitcamp.service.creator.CreatorClassAskService;
import com.anotherclass.bitcamp.vo.creator.ClassListVO;
import com.anotherclass.bitcamp.vo.creator.CreatorCAskPagingVO;
import com.anotherclass.bitcamp.vo.creator.CreatorCAskVO;

@Controller
public class CreatorClassAskController {
	
	@Inject
	CreatorClassAskService creatorClassAskService;
	 
	
	//게시글 리스트
    @RequestMapping("creator/classAskManage")
    public ModelAndView boardList(CreatorCAskPagingVO pVo) {    	
    	ModelAndView mav = new ModelAndView();    	
    	//총레코드수
    	pVo.setTotalRecord(creatorClassAskService.totalRecordCount(pVo));     	
    	mav.addObject("pVo",pVo);       	
    	List<CreatorCAskVO> list = creatorClassAskService.boardPageSelect(pVo);
    	for(int i=0; i<list.size(); i++) {
    		CreatorCAskVO vo = list.get(i);
    		int a = creatorClassAskService.CAReplyCheck(vo.getClass_qna_no());
    		vo.setReplycheck(a);
    	}    	
    	mav.addObject("list",list);	    	
    	mav.setViewName("creator/classAsk/creator_ClassQna_list");
    	return mav;      
   }
    
    
	//제목누르면 글보기
	@RequestMapping("creator/classAskManage2")
	public ModelAndView CreatorQnAAskView(int no) {		
		ModelAndView mav = new ModelAndView();			
		CreatorCAskVO vo = creatorClassAskService.CAContent(no);
		int a = creatorClassAskService.CAReplyCheck(no);		
		vo.setReplycheck(a);		
		mav.addObject("vo",vo);
		mav.setViewName("creator/classAsk/creator_ClassQna_view");
		return mav;
	}
	//댓글
	@RequestMapping("/creatorAskReplyList")
	@ResponseBody
	public CreatorCAskVO  CreatorQnAAskReply(int no) {	
		int a = creatorClassAskService.CAReplyCheck(no);// 0이면 댓글 x 1이면 답글 있음
		CreatorCAskVO vo = new CreatorCAskVO();
		if(a==1) {
			vo = creatorClassAskService.CAReplyContent(no);			
		}else {
			vo.setClassqnacom_reply("답댓글을 입력 해주세요");
		}
		return vo;
	}
	
	@RequestMapping("/creatorAskReplyListEdit")
	@ResponseBody
	public int CreatorAskRepEdit(CreatorCAskVO vo) {
		int result =0;
		System.out.println(vo.getClassqnacom_reply()+"//"+vo.getClass_qna_no());
		creatorClassAskService.CAReplyEdit(vo);
		return result;
	}
	@RequestMapping("/creatorAskReplyDel")
	@ResponseBody
	public int CreatorAskRepDel(int no) {
		int result =0;
		
		creatorClassAskService.CAReplyDel(no);
		return result;
	}
	@RequestMapping("/creatorAskReplyWritee")
	@ResponseBody
	public int CreatorAskRepWrite(CreatorCAskVO vo) {
		int result =0;
		
		creatorClassAskService.CAReplyWrite(vo);
		return result;
	}
	
	//클래스리스트!!!!
	@RequestMapping("creator/classList")
	public ModelAndView ClassList(HttpSession  sess) {	
		String logid= (String)sess.getAttribute("creatorId");
		ModelAndView mav = new ModelAndView();			
		List<ClassListVO>  list = creatorClassAskService.classlist2(logid);
		
		for(int i=0; i<list.size(); i++) {
			ClassListVO vo = list.get(i);			
			vo = list.get(i);
			System.out.println(vo.getClass_no());

			vo = list.get(i);			

			int a = creatorClassAskService.ClasslikeCC(vo.getClass_no());
			int b = creatorClassAskService.ClassAskCC(vo.getClass_no());
		
			vo.setClasslikecount(a);
			vo.setClassclasscount(b);			
		}

		mav.addObject("list",list);
		mav.setViewName("creator/optionList/classList");
		return mav;
	}
}
