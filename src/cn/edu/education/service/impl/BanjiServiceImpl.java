package cn.edu.education.service.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import cn.edu.education.dao.BanjiDao;
import cn.edu.education.domain.Banji;
import cn.edu.education.service.BanjiService;
import cn.edu.education.util.PageBean;

@Service("banjiService")
public class BanjiServiceImpl implements BanjiService{

	@Resource(name="banjiDao")
	private BanjiDao banjiDao;
	@Override
	public Banji getBanjiById(Serializable id) {
		return (Banji) this.banjiDao.getEntityById(id);
	}

	@Override
	public Collection<Banji> getAllBanji() {
		return this.banjiDao.getAllEntity();
	}

	@Override
	public void saveBanji(Banji banji) {
		this.banjiDao.saveEntity(banji);
	}

	@Override
	public void updateBanji(Banji banji) {
		this.banjiDao.updateEntity(banji);
	}

	@Override
	public void deleteBanji(Serializable id) {
		this.banjiDao.deleteEntity(id);
	}

	@Override
	public PageBean<Banji> getPageBean(int pageSize, int page) {
		PageBean<Banji> pageBean = new PageBean<Banji>();
        
        int allRows = this.banjiDao.getAllEntity().size();
        System.out.println("总记录数:"+allRows);
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        System.out.println("总页数:"+totalPage);
        int currentPage = pageBean.getCurPage(page);
        System.out.println("当前页:"+currentPage);
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        System.out.println("offset:"+offset);
        
        List<Banji> list= this.banjiDao.queryByPage( offset, pageSize);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        
        return pageBean;
	}
	
	/*@Override
	public PageBean<Banji> getPageBean(int pageSize, int page, Long sid) {
		PageBean<Banji> pageBean = new PageBean<Banji>();
        int allRows = this.banjiDao.get
        System.out.println("总记录数:"+allRows);
        int totalPage = pageBean.getTotalPages(pageSize, allRows);
        System.out.println("总页数:"+totalPage);
        int currentPage = pageBean.getCurPage(page);
        System.out.println("当前页:"+currentPage);
        int offset = pageBean.getCurrentPageOffset(pageSize, currentPage);
        System.out.println("offset:"+offset);
        List<Long> bidlist = new ArrayList<Long>();
        for(int i=0;i<ids.length;i++){
        	bidlist.add(Long.parseLong(ids[i]));
        }
        List<Banji> list= this.banjiDao.queryByPage(offset, pageSize, bidlist);
        pageBean.setList(list);
        pageBean.setAllRows(allRows);
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalPage(totalPage);
        
        return pageBean;
	}*/
	
	@Override
	public JSONObject getResult(int rows, int page, Banji banji) {
		int total = this.getAllBanji().size();
		int offset = rows * (page-1);
		List<Banji> list = this.banjiDao.bgQueryByPage(offset, rows, banji);
		JSONArray jsonArray  = new JSONArray();
		for (Banji banji2 : list) {
			JSONObject mapObj = new JSONObject();
			mapObj.put("bid", banji2.getBid());
			mapObj.put("number", banji2.getNumber());
			mapObj.put("gradename", banji2.getGrade().getName());
			mapObj.put("classname", banji2.getClassname());
			mapObj.put("description", banji2.getDescription());
			mapObj.put("studentnumber", banji2.getStudentnumber());
			mapObj.put("signnumber", banji2.getSignnumber());
			mapObj.put("classnumber", banji2.getClassnumber());
			mapObj.put("startdate", banji2.getStartdate()+"");
			mapObj.put("enddate", banji2.getEnddate()+"");
			mapObj.put("startime", banji2.getStartime());
			mapObj.put("address", banji2.getAddress());
			mapObj.put("price", banji2.getPrice());
			mapObj.put("remark",banji2.getRemark());
			jsonArray.add(mapObj);
		}
		JSONObject result = new JSONObject();
		result.put("rows", jsonArray);
		result.put("total", total);
		return result;
	}

	

}
