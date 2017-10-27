package org.slam.web;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReplyDTO;
import org.slam.dto.ReservationDTO;
import org.slam.service.ReturnService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

@RestController
@RequestMapping("/myreturn/*")

public class ReturnRestController {

    @Inject
    ReturnService service;
    
    @PostMapping("/request")
    public void returnRequest(@RequestBody ReservationDTO dto) {
        //�ݳ� ��û�ϴ� �޼��� -JH
        System.out.println(dto);
        if(dto.getStatus().equals("onapply") || dto.getStatus().equals("onres")) {
            // ����, �뿩��û�� ���
            dto.setStatus("cancel");
        } else {
            // �ݳ� ��û
            dto.setStatus("onreturn");
        }
        service.request(dto);
    }

    @GetMapping("/check")
    public List<Map<String, Object>> checkOnReturn(@SessionAttribute(value="member", required=false) MemberDTO dto){
        //�� ������ å�� ���� �ݳ� ��û�� �ִ��� üũ�ϰ�, ���� �� �� å�� ������ �������� �޼��� -JH 
        return service.checkItem(dto.getMid());
    }

    @PostMapping("/returnconfirm")
    public void returnConfirm(@RequestBody ReservationDTO dto) {
        //�ݳ� ��û�� ���� �� �ݳ� ó�� �ϴ� �޼��� -JH
        service.returnConfirm(dto.getBno(), dto.getRno());
    }
    
    @PostMapping("/returnreject")
    public void returnReject(@RequestBody ReservationDTO dto) {
        //�ݳ� ��û�� ���� �� �ݳ� �ź� ó�� �ϴ� �޼��� -JH
        service.returnReject(dto.getRno());
    }
    
    @PostMapping("/reserveconfirm")
    public void confirm(@RequestBody ReservationDTO dto) {
        service.acceptBookReserve(dto);
    }
    
    
    @PostMapping("/reservereject")
    public void reject(@RequestBody ReservationDTO dto) {
        service.refuseBookReserve(dto);
    }
    
    @GetMapping("/checkReturn")
    public List<Map<String, Object>> checkReturn(@SessionAttribute(value="member", required=false) MemberDTO dto){
        //���� �ݳ� ��û ������, ���濡 ���� ������ ������ �������� �޼��� -JH
        return service.checkReturn(dto.getMid());
    }
    
    @PostMapping("/checkreject")
    public void checkReject(@RequestBody ReservationDTO dto) {
        service.checkReject(dto.getRno());
    }
    
    @GetMapping("/list/{status}/{page}")
    public List<Map<String, Object>> List(@PathVariable("page") int page, @PathVariable("status") String status,
            @SessionAttribute(value = "member", required = false) MemberDTO member){
        return service.getList(page, status, member.getMid());
    }
    
    @GetMapping("/loanHistoryList")
    public List<Map<String, Object>> loanHistoryList(@SessionAttribute(value = "member", required = false) MemberDTO dto) {
        // ������� ���� �뿩 �̷�(�ݳ��� �Ϸ�� å�� ���� �����丮)_hb
        return service.loanHistoryList(dto.getMid());
    }

}