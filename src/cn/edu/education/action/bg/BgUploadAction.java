package cn.edu.education.action.bg;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.edu.education.action.base.BaseAction;
import cn.edu.education.domain.Content;
import cn.edu.education.service.ContentService;
import cn.edu.education.util.ResponseUtil;

@Controller("bgUploadAction")
@Scope("prototype")
public class BgUploadAction extends BaseAction<Content>{
	
	//上传文件需要用到的
	//上传文件  
    private File upload;  
    //上传文件的类型  
    private String uploadContentType;  
    //上传文件的名称  
    private String uploadFileName; 
    
    private String url1;
    private int deleted1;
    
    private long contentId;
    private String delIds;// 批量删除数据的序列号
    
    @Resource(name="contentService")
    private ContentService contentService;
    public String add()throws Exception{
    	//System.out.println("BgUploadAction_add"+url1+"-"+deleted1);
    	JSONObject result=new JSONObject();
    	Content content = new Content();
    	BeanUtils.copyProperties(this.getModel(), content);
    	UUID uuid = UUID.randomUUID();  
        String str = uuid.toString();  
    	String pic = str+"."+uploadFileName.split(".")[1];
    	
    	String pictStr = "http://localhost:8080/education_upload/"+pic;
    	content.setPictureurl(pictStr);
    	content.setUrl(url1);
    	content.setDeleted(deleted1);
    	//声明文件上传的路径  
        String path = "D:\\apache-tomcat-7.0.42\\webapps\\ROOT\\education_upload";  
        //根据路径名创建一个文件  
          File file = new File(path);  
          //判断file是否存在，如果不存在，则自动创建一个  
   
          if(!file.exists()){  
          file.mkdirs();  
          }  
   
         //通过调用copyFile()方法将指定的文件copy到指定的路径中  
          try {
			FileUtils.copyFile(upload, new File(file, pic));  
			this.contentService.saveContent(content);
			result.put("success", "true");
		} catch (Exception e) {
			result.put("errorMsg", "添加失败");
			e.printStackTrace();
		}
          try {
  			ResponseUtil.write(ServletActionContext.getResponse(), result);
  		} catch (Exception e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
          return null;
    }
    
    public String update(){
    	JSONObject result=new JSONObject();
    	Content content = new Content();
    	BeanUtils.copyProperties(this.getModel(), content);
    	System.out.println(uploadFileName.split("\\.")[1]);
    	UUID uuid = UUID.randomUUID();  
        String str = uuid.toString();  
        System.out.println(str);
    	String pic = str+"."+uploadFileName.split("\\.")[1];
    	
    	String pictStr = "http://localhost:8080/education_upload/"+pic;
    	content.setPictureurl(pictStr);
    	content.setUrl(url1);
    	content.setDeleted(deleted1);
    	content.setId(contentId);
    	//声明文件上传的路径  
        String path = "D:\\apache-tomcat-7.0.42\\webapps\\ROOT\\education_upload";   
        //根据路径名创建一个文件  
          File file = new File(path);  
          //判断file是否存在，如果不存在，则自动创建一个  
   
          if(!file.exists()){  
          file.mkdirs();  
          }  
   
         //通过调用copyFile()方法将指定的文件copy到指定的路径中  
          try {
			FileUtils.copyFile(upload, new File(file, pic));  
			this.contentService.updateContent(content);
			result.put("success", "true");
		} catch (Exception e) {
			result.put("errorMsg", "修改失败");
			e.printStackTrace();
		}
          try {
  			ResponseUtil.write(ServletActionContext.getResponse(), result);
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
          return null;
    }
    public String delete(){
    	JSONObject result=new JSONObject();
		String[] ids = delIds.split(",");
		try {
			for(int i=0;i<ids.length;i++){
				this.contentService.deleteContent(Long.parseLong(ids[i]));
			}
			result.put("success", "true");
			result.put("delNums", ids.length);
		} catch (Exception e) {
			result.put("errorMsg", "删除失败");
			e.printStackTrace();
		}
		try {
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public int getDeleted1() {
		return deleted1;
	}

	public void setDeleted1(int deleted1) {
		this.deleted1 = deleted1;
	}

	public long getContentId() {
		return contentId;
	}

	public void setContentId(long contentId) {
		this.contentId = contentId;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	


}
