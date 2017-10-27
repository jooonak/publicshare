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
        //반납 요청하는 메서드 -JH
        System.out.println(dto);
        if(dto.getStatus().equals("onapply") || dto.getStatus().equals("onres")) {
            // 예약, 대여신청의 취소
            dto.setStatus("cancel");
        } else {
            // 반납 신청
            dto.setStatus("onreturn");
        }
        service.request(dto);
    }

    @GetMapping("/check")
    public List<Map<String, Object>> checkOnReturn(@SessionAttribute(value="member", required=false) MemberDTO dto){
        //내 소유의 책에 대해 반납 신청이 있는지 체크하고, 있을 때 그 책의 정보를 가져오는 메서드 -JH 
        return service.checkItem(dto.getMid());
    }

    @PostMapping("/returnconfirm")
    public void returnConfirm(@RequestBody ReservationDTO dto) {
        //반납 신청이 있을 때 반납 처리 하는 메서드 -JH
        service.returnConfirm(dto.getBno(), dto.getRno());
    }
    
    @PostMapping("/returnreject")
    public void returnReject(@RequestBody ReservationDTO dto) {
        //반납 신청이 있을 때 반납 거부 처리 하는 메서드 -JH
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
        //내가 반납 신청 했으나, 상대방에 의해 거절된 정보를 가져오는 메서드 -JH
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
        // 사용자의 과거 대여 이력(반납이 완료된 책에 대한 히스토리)_hb
        return service.loanHistoryList(dto.getMid());
    }

}