package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.education.dao.ContentDao;
import cn.edu.education.domain.Content;
import cn.edu.education.service.ContentService;
import cn.edu.education.util.JsonDateValueProcessor;

@Service("contentService")
public class ContentServiceImpl implements ContentService{

	@Resource(name="contentDao")
	private ContentDao contentDao;
	@Override
	public Collection<Content> getTopicContents() {
		return this.contentDao.getContentsByChannel(2);
	}

	@Override
	public Collection<Content> getPrizeContents() {
		return this.contentDao.getContentsByChannel(3);
	}

	@Override
	public Collection<Content> getSlidesContents() {
		return this.contentDao.getContentsByChannel(1);
	}

	@Override
	public Content getContentById(Serializable id) {
		return (Content) this.contentDao.getEntityById(id);
	}

	@Override
	public Collection<Content> getAllContent() {
		return this.contentDao.getAllEntity();
	}

	@Override
	public void saveContent(Content content) {
		this.contentDao.saveEntity(content);
	}

	@Override
	public void updateContent(Content content) {
		this.contentDao.updateEntity(content);
	}

	@Override
	public void deleteContent(Serializable id) {
		this.contentDao.deleteEntity(id);
	}

	@Override
	public JSONObject getResult(int rows, int page, Content content) {
		int total = this.getAllContent().size();
		int offset = rows * (page-1);
		List<Content> list = this.contentDao.bgQueryByPage(offset, rows, content);
		JSONObject result = new JSONObject();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class , new JsonDateValueProcessor());
		JSONArray jsonArray = JSONArray.fromObject(list,jsonConfig);
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}

}
