package org.slam.web;

import java.io.Console;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/upload/*")
public class UploadController {
	
	@PostMapping("/")
	public String upload(MultipartFile file) {
		
		try {
			OutputStream out = new FileOutputStream("D:\\publicshare\\"+ file.getOriginalFilename());
			
			FileCopyUtils.copy(file.getInputStream(), out);
			
			
		} catch (Exception e) {
			log.info(""+e.getMessage());
			e.printStackTrace();
		}

		return "file upload complete";

	}
	
}
