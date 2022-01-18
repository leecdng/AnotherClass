package com.anotherclass.bitcamp.controller.fileupload;

import java.io.File;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("/FileUpload")
public class FileController {
	
	@PostMapping(value="/imageUploadUrl" , produces="application/json")
	@ResponseBody
	public JsonObject uploadFileUpload(@RequestParam("file") MultipartFile mulitpartFile, HttpServletRequest req) {
		
		UploadSetingTO uploadTo = new UploadSetingTO();
		JsonObject jsonOb = new JsonObject();
		String path = uploadTo.getPathSeting(req); //이클립스: 메타데이터 위치 // 톰캣 : 톰캣 내부 위치 
		String originFileName = mulitpartFile.getOriginalFilename(); //파일이름
		String extension = originFileName.substring(originFileName.lastIndexOf(".")); 
		String saveFileName = UUID.randomUUID() + extension; // 저장되는 파일명  랜덤 + 파일명
		File targetFile = new File(path+saveFileName);
		try {
			InputStream fileStream = mulitpartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonOb.addProperty("url", "/anotherImage/"+saveFileName);
			jsonOb.addProperty("responseCode", "success");
		}catch(Exception e){
			FileUtils.deleteQuietly(targetFile);
			System.out.println(e+"파일업로드 실패"+"|| File Upload Fail");
			jsonOb.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonOb;
	}
	@RequestMapping("/testingMenu3")
	public String testing2() {
		
		return "creator/board";
	}
}
