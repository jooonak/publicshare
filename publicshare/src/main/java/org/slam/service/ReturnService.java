package org.slam.service;

import java.util.List;
import java.util.Map;

import org.slam.dto.Criteria;
import org.slam.dto.MemberDTO;
import org.slam.dto.ReservationDTO;

public interface ReturnService {

	public List<Map<String, Object>> getList(Criteria cri, String mid);
	//���� �뿩�� å�� ����Ʈ�� �������� �޼���

	public void request(int rno, int lateFee);
	//���� �뿩�� å�� �ݳ���û�ϴ� �޼���

	public List<Map<String, Object>> checkItem(String mid);
	//���� �뿩���� �� å�� �ݳ���û�� ������ �� ����Ʈ�� �������� �޼���

	public void returnConfirm(int bno, int rno);
	//�ݳ� ��û�� ���� Ȯ���ϴ� �޼���

	public void acceptBookReserve(ReservationDTO dto);

	public void refuseBookReserve(ReservationDTO dto);

	public void returnReject(int bno);
	//�ݳ� ��û�� ���� �����ϴ� �޼���

	public List<Map<String, Object>> checkReturn(String mid);
	//�� �ݳ���û�� ���� ������ ����Ʈ�� �������� �޼���

	public void checkReject(int rno);

}
