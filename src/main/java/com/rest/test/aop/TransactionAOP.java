package com.rest.test.aop;

import java.util.HashMap;
import java.util.Map;

import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.interceptor.NameMatchTransactionAttributeSource;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionAttribute;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class TransactionAOP {
	@Autowired
	private TransactionManager tm;
	
	@Bean
	TransactionInterceptor transactionInterceptor() {
		TransactionInterceptor txInterceptor = new TransactionInterceptor();
		RuleBasedTransactionAttribute txAttribute = new RuleBasedTransactionAttribute();
		
		Map<String, TransactionAttribute> methodMap = new HashMap<>();
		methodMap.put("insert*", txAttribute);
		methodMap.put("add*", txAttribute);
		methodMap.put("save*", txAttribute);
		methodMap.put("update*", txAttribute);
		methodMap.put("modify*", txAttribute);
		methodMap.put("delete*", txAttribute);
		methodMap.put("remove*", txAttribute);
		
		NameMatchTransactionAttributeSource txAttributeSource = new NameMatchTransactionAttributeSource();
		txAttributeSource.setNameMap(methodMap);
		txInterceptor.setTransactionAttributeSource(txAttributeSource);
		txInterceptor.setTransactionManager(tm);
		return txInterceptor;
	}
	
	@Bean
	Advisor advisor() {
		AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
		pointcut.setExpression("execution(* com.rest.test..*Service.*(..))");
		DefaultPointcutAdvisor advisor = new DefaultPointcutAdvisor(pointcut, transactionInterceptor());
		return advisor;
	}
}
