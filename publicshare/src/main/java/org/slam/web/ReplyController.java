package org.slam.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Update;
import org.slam.dto.BookDTO;
import org.slam.dto.Criteria;
import org.slam.dto.ReplyDTO;
import org.slam.service.ReplyService;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/reply/*")
@Log
public class ReplyController {

	@Inject
	ReplyService service;

	// ��� ����Ʈ
	@GetMapping("/{bno}/list/{page}")
	public List<ReplyDTO> list(@PathVariable("bno") int bno, @PathVariable("page") int page) {

		return service.listPage(new Criteria(page), bno);
	}

	// ��� ����
	@PostMapping("/new")
	public void addReply(@RequestBody ReplyDTO dto) {

		service.register(dto);
	}

	// ����
	@DeleteMapping("/{reno}")
	public void removeReply(@PathVariable("reno") int reno) {

		service.remove(reno);
	}

	// ����
	@PutMapping("/{reno}")
	public void updateReply(@PathVariable("reno") int reno, @RequestBody ReplyDTO dto) {
		log.info(reno + "");
		service.update(dto);
	}

	// ���� �Է�
	@PostMapping("/rereply/{reno}")
	public void addReReply(@RequestBody ReplyDTO dto) {
		
		service.reReplyUpdate(dto);
	}
}
