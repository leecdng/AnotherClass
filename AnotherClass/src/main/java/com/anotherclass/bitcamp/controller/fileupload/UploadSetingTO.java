package com.anotherclass.bitcamp.controller.fileupload;

import javax.servlet.http.HttpServletRequest;

public class UploadSetingTO {
	
	private String pathSeting;

	public String getPathSeting(HttpServletRequest req) {
		pathSeting = req.getSession().getServletContext().getRealPath("/img/test/"); //이클립스 메타데이터 위치
		return pathSeting;
	}
}
