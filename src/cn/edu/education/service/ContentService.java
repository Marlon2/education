package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Content;

public interface ContentService {

	public Content getContentById(Serializable id);
	public Collection<Content> getAllContent();
	public void saveContent(Content content);
	public void updateContent(Content content); 
	public void deleteContent(Serializable id);
	
	//获取今日话题
	public Collection<Content> getTopicContents();
	//获取奖项内容
	public Collection<Content> getPrizeContents();
	//获取滑动页面内容
	public Collection<Content> getSlidesContents();
	public JSONObject getResult(int rows, int page, Content content);
}
