package org.spring.my.advice;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/*
 * AOP구현
 * @Component:spring이 자동생성해주는 기능
 * @Aspect:AOP기능, 공통관심사
 */

@Component
@Aspect
public class AopAdvice {
	
	/*
	 * 로거대신하여 출력
	 * @Before : ~하기전에
	 * execution : 실행할텐데,
	 * 표현식()> 첫번째 * : 반환형, 두번째 * : service 패키지 안 모든것이 적용
	 * 세번째 * : 메소드명, (..) : 매개변수
	 */
	@Before("execution(* org.spring.my.controller.*.*(..))")
	public void beforeLogDAO(JoinPoint jp) { //실제 실행되는 객체 출력
		System.out.println("---------------");
		System.out.println(jp.getSignature().toLongString()); //어떤 객체가 실행되었는지 출력 
		System.out.println("매개변수: "+Arrays.toString(jp.getArgs())); //입력된 매개변수를 출력
	}
	
	/*
	 * 리턴값받기
	 * @AfterReturning : 정상수행 후 리턴되는 값 출력
	 */
	@AfterReturning(pointcut = "execution(* org.spring.my.service.*.*(..))",
					returning = "rObj")
	public void afterLogService(JoinPoint jp, Object rObj) {
		if (rObj != null) {
			System.out.println("---------------");
			System.out.println(jp.getSignature().toLongString());
			System.out.println("리턴값: "+rObj.toString());
		}
	}
	
	/*
	 * 리턴값받기
	 * @AfterThrowing : 예외가 발생되었을 때
	 */
	@AfterThrowing(pointcut = "execution(* org.spring.my.service.*.*(..))",
					throwing = "eObj")
	public void exceptionLog(JoinPoint jp, Exception eObj) {
		System.out.println("---------------");
		System.out.println(jp.getSignature().toLongString());
		System.out.println("예외값: "+eObj.toString());
	}
	
	/*
	 * 모듈의 소요시간 체크
	 */
//	@Around("execution(* org.spring.my.service.FileServiceImpl.*(..))")
//	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
//		System.out.println("-------소요시간-------");
//		long startTime = System.currentTimeMillis();
//		System.out.println("시작시간: "+startTime);
//		
//		Object result = pjp.proceed(); //메소드를 실행
//		
//		long endTime = System.currentTimeMillis();
//		System.out.println("끝난시간: "+endTime);
//		
//		System.out.println("소요시간: "+(endTime-startTime));
//
//		System.out.println("---------------");
//		
//		//호출한 메소드에 전달
//		return result;
//	}
	
	
}
