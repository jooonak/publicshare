package org.slam.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Component
@Aspect
@Log
public class TimeChecker {
	//junit test�� �̿��Ͽ� aop ���� test�Ϸ�
	@Before("execution(* org.slam.mapper.*.*(..))")	//���� �ʿ�
	public void sample(JoinPoint jp) {
		log.info("============TimeChecker============");
		log.info(Arrays.toString(jp.getArgs()));
		log.info("============TimeChecker============");
	}
}
