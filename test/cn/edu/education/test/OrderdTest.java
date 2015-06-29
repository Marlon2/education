package cn.edu.education.test;

import org.junit.Test;

import cn.edu.education.domain.Orderd;
import cn.edu.education.service.OrderdService;

public class OrderdTest extends BaseSpring{
	
	@Test
	public void testOrderd(){
		OrderdService orderdService = (OrderdService)context.getBean("orderdService");
		Orderd order = orderdService.getOrderdById(2L);
		System.out.println(order.getBanji().getClassname());
	}
	
	public void test2(){
		OrderdService orderdService = (OrderdService)context.getBean("orderdService");
		//orderdService.
	}

}
