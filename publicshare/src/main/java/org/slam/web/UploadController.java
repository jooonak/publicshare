package org.slam.web;

import java.awt.image.BufferedImage;
import java.io.Console;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Delete;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.java.Log;


//�̹��� ���ε�� ����� Ȯ���ڿ� �⺻ �̹��� ������ Ȯ���ڰ� �ٸ� ��찡 �߻���...(������� ���� .jpg) �߰� ���� �ʿ�(sb)
@Log
@RestController
@RequestMapping("/upload/*")
public class UploadController {
	
	@GetMapping("/thumb/{thumbName:.+}")
	public byte[] showThumb(@PathVariable("thumbName") String thumbName) {
		log.info("showThumb: "+ thumbName);
		try {
			File file = new File("D:\\publicshare\\s_"+thumbName);
			return FileUtils.readFileToByteArray(file);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/image/{image:.+}")
	public byte[] showIamge(@PathVariable("image") String image) {
		log.info("showimage: "+ image);
		try {
			File file = new File("D:\\publicshare\\"+image);
			return FileUtils.readFileToByteArray(file);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	@PostMapping("/new")
	public Map<String, String> upload(MultipartFile file) {
		if(!file.getContentType().contains("image")) {
			
			return null;
		}

		try {
			
			System.out.println(file.getContentType());
			
			String uploadName = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
			String ThumbnailName = "s_"+ uploadName;
			
			System.out.println(uploadName);
			
			OutputStream out = new FileOutputStream("D:\\publicshare\\"+ uploadName);
			
			FileCopyUtils.copy(file.getInputStream(), out);
			
			BufferedImage origin = ImageIO.read(file.getInputStream());
			
			//����� ��Ȯ�� ���� ũ��� �����ϴ� �޼ҵ�, Scalr.Method.ULTRA_QUALITY, Scalr.Mode.FIT_EXACT�� ����
			//https://github.com/rkalla/imgscalr/issues/74
			BufferedImage destImg = Scalr.resize(origin, Scalr.Method.ULTRA_QUALITY, Scalr.Mode.FIT_EXACT, 400, 273);
			
			//���� ����� Ȯ���ڴ� jpg�ӿ��� �ұ��ϰ� �������� ���޵Ǵ� Ȯ���ڴ� ���� �̹����� Ȯ���ڸ� ���󰡰� �ȴ�. 
			//�̴� �����̹����� jpg�� ��쿡�� ������ ������, png �� �ٸ� Ȯ������ ��� ������ �߻��ϱ� ������ �ڵ� ������ �ʿ��ϴ�.
			ImageIO.write(destImg, "jpg", new FileOutputStream("D:\\publicshare\\"+ThumbnailName));
			
			Map<String, String> map = new HashMap<String, String>();
			
			map.put("uploadName", uploadName);
			map.put("thumbName", ThumbnailName);
			System.out.println(map);
			return map;
			
		} catch (Exception e) {
			log.info(""+e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	@DeleteMapping("/delete")
	public void upload(@RequestBody String origin) {
		System.out.println("delete"+origin);
	}
}
