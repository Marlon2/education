package cn.edu.education.test;

import org.junit.Test;

import cn.edu.education.domain.Content;
import cn.edu.education.service.ContentService;

public class ContentTest  extends BaseSpring{

	@Test
	public void testContentById(){
		ContentService contentService = (ContentService) context.getBean("contentService");
		Content content = contentService.getContentById(11L);
		System.out.println(content.getTitle());
	}
}
