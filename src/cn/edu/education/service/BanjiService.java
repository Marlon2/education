package cn.edu.education.service;

import java.io.Serializable;
import java.util.Collection;

import net.sf.json.JSONObject;
import cn.edu.education.domain.Banji;
import cn.edu.education.util.PageBean;

public interface BanjiService {

	public Banji getBanjiById(Serializable id);
	public Collection<Banji> getAllBanji();
	public void saveBanji(Banji banji);
	public void updateBanji(Banji banji);
	public void deleteBanji(Serializable id);
	public PageBean<Banji> getPageBean(int pageSize, int page);
	public JSONObject getResult(int rows, int page, Banji banji);
}
