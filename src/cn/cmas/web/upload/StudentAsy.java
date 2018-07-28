package cn.cmas.web.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import com.opensymphony.xwork2.ActionSupport;

import cn.cmas.constant.UploadXlsxFilePath;
import cn.cmas.service.TransformFromXlsxToDB;

@SuppressWarnings("serial")
public class StudentAsy extends ActionSupport {

	private File studentInfo;
	private String studentInfoContentType;
	private String studentInfoFileName;
    private String message = "文件数据已导入！小哥哥小姐姐们记得刷新哦！";
   
    @SuppressWarnings("deprecation")
    @Override
    public String execute() throws Exception {
    	
        String path = UploadXlsxFilePath.UP_LOAD_XlSX_PATH;
        try {
            File f = this.getStudentInfo();
            if(f == null) {
            	message="文件不为空！";
            	return ERROR;
            }
            if(!this.getStudentInfoFileName().endsWith(".xlsx")){
                message="文件格式不允许!";
                return ERROR;
            }
            FileInputStream inputStream = new FileInputStream(f);
            FileOutputStream outputStream = new FileOutputStream(path + File.separator+ this.getStudentInfoFileName());
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);
            }
            inputStream.close();
            outputStream.flush();
            outputStream.close();
            File ff = new File(path + File.separator+ this.getStudentInfoFileName());
            try {
				String infos = TransformFromXlsxToDB.studentInfos(studentInfoFileName);
				if(infos.equals("colNumError")) {
					message = "文件的数据格式有误！";
					ff.delete();
					return ERROR;
				}
			} finally {
				ff.delete();
			}
        } catch (Exception e) {
            e.printStackTrace();
            message = "数据导入失败";
        }
        return SUCCESS;
    }
	public File getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(File studentInfo) {
		this.studentInfo = studentInfo;
	}
	public String getStudentInfoContentType() {
		return studentInfoContentType;
	}
	public void setStudentInfoContentType(String studentInfoContentType) {
		this.studentInfoContentType = studentInfoContentType;
	}
	public String getStudentInfoFileName() {
		return studentInfoFileName;
	}
	public void setStudentInfoFileName(String studentInfoFileName) {
		this.studentInfoFileName = studentInfoFileName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}