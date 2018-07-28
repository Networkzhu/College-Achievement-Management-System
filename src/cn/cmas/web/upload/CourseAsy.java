package cn.cmas.web.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.constant.UploadXlsxFilePath;
import cn.cmas.service.TransformFromXlsxToDB;

@SuppressWarnings("serial")
public class CourseAsy extends ActionSupport {

	private File courseInfo;
	private String courseInfoContentType;
	private String courseInfoFileName;
    private String message = "文件数据已导入！小哥哥小姐姐们记得刷新哦！";
   
    @Override
    public String execute() throws Exception {
        String path = UploadXlsxFilePath.UP_LOAD_XlSX_PATH;
        try {
            File f = this.getCourseInfo();
            if(f == null) {
            	message="文件不为空！";
            	return ERROR;
            }
            if(!this.getCourseInfoFileName().endsWith(".xlsx")){
                message="文件格式不允许!";
                return ERROR;
            }
            FileInputStream inputStream = new FileInputStream(f);
            FileOutputStream outputStream = new FileOutputStream(path + File.separator+ this.getCourseInfoFileName());
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);
            }
            inputStream.close();
            outputStream.flush();
            outputStream.close();
            File ff = new File(path + File.separator+ this.getCourseInfoFileName());
            try {
            	String infos = TransformFromXlsxToDB.courseInfos(courseInfoFileName);
            	if(infos.equals("colNumError")) {
					message = "文件的数据格式有误！";
					ff.delete();
					return ERROR;
				}
			} finally{
				ff.delete();
			}
        } catch (Exception e) {
            e.printStackTrace();
            message = "数据导入失败";
        }
        return SUCCESS;
    }
	public File getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(File courseInfo) {
		this.courseInfo = courseInfo;
	}
	public String getCourseInfoFileName() {
		return courseInfoFileName;
	}
	public void setCourseInfoFileName(String courseInfoFileName) {
		this.courseInfoFileName = courseInfoFileName;
	}
	public String getCourseInfoContentType() {
		return courseInfoContentType;
	}
	public void setCourseInfoContentType(String courseInfoContentType) {
		this.courseInfoContentType = courseInfoContentType;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}