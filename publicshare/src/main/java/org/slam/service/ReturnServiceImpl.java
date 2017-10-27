package org.slam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slam.dto.Criteria;
import org.slam.dto.ReservationDTO;
import org.slam.mapper.ResBookMapper;
import org.slam.mapper.ReturnMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReturnServiceImpl implements ReturnService{

    @Inject
    ReturnMapper returnMapper;
    
    @Inject
    ResBookMapper resBookMapper;
    
    @Override
    public Criteria setCri(Criteria cri, String mid) {
        cri.setTotal(returnMapper.getTotal(mid));
        return cri;
    }

    @Transactional
    @Override
    public void request(ReservationDTO dto) {
        if(dto.getStatus().equals("cancel")) {
            resBookMapper.updateResCntDown(dto.getBno());
        }
        System.out.println(dto);
        returnMapper.request(dto);
    }

    @Override
    public List<Map<String, Object>> checkItem(String mid) {
        return returnMapper.checkItem(mid);
    }
    
    @Transactional
    @Override
    public void returnConfirm(int bno, int rno) {
        returnMapper.returnConfirm(bno, rno);
        resBookMapper.updateResCntDown(bno);
    }

    @Override
    public void returnReject(int rno) {
        returnMapper.returnReject(rno);
    }

    @Override
    public void acceptBookReserve(ReservationDTO dto) {
        resBookMapper.confirmUpdateApplyData(dto.getRno());
    }
    
    @Transactional
    @Override
    public void refuseBookReserve(ReservationDTO dto) {
        resBookMapper.rejectUpdateApplyData(dto);
        resBookMapper.updateResCntDown(dto.getBno());
    }

    @Override
    public List<Map<String, Object>> checkReturn(String mid) {
        return returnMapper.checkReturn(mid);
    }

    @Override
    public void checkReject(int rno) {
        returnMapper.checkReject(rno);
    }

    @Override
    public List<Map<String, Object>> getList(int page, String status, String mid) {
        int skip = (page - 1) * 8;
        return returnMapper.getList(skip, status, mid);
    }

    @Override
    public List<Map<String, Object>> loanHistoryList(String mid) {
        
        return returnMapper.loanHistoryList(mid);
    }
}
