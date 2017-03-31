package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.services.UserService;


import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import java.io.*;
import java.util.Map;

/**
 * Created by yangj on 2016/12/5.
 */
public class UserAction extends ActionSupport implements SessionAware {
    private UserDTO udto = null;
    private Map<String, Object> session = null;
    private Map request;
    private File uploadFile;
    private String uploadFileFileName;
    private String uploadFileContentType;

    public String login() {
        UserDTO userDTO = UserService.loginService(udto);
        if (userDTO != null) {
            session.put("user", userDTO);
            return SUCCESS;
        }
        return ERROR;
    }

    public String register() {
        int i = UserService.registerService(udto);
        if (i > 0) {
            return SUCCESS;
        }
        return ERROR;
    }

    public String addUser() throws IOException {
        String realpath = ServletActionContext.getServletContext().getRealPath("/upload/imgs/icon");// 获得服务器端的路径
        //基于myFile创建一个文件输入流
        System.out.printf(realpath);
        InputStream is = new FileInputStream(uploadFile);
        // 设置目标文件
        System.out.printf(this.getUploadFileFileName());
        File file = new File(realpath);
        if (!file.exists()) {// 判断该文件是否存在
            file.mkdirs();// 如果不存在，创建文件夹
        }
        File toFile = new File(realpath, this.getUploadFileFileName());

        // 创建一个输出流
        OutputStream os = new FileOutputStream(toFile);
        //设置缓存
        byte[] buffer = new byte[1024];
        int length = 0;
        //读取myFile文件输出到toFile文件中
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
        System.out.println("上传文件名" + uploadFileFileName);
        System.out.println("上传文件类型" + uploadFileContentType);
        //关闭输入流
        is.close();
        //关闭输出流
        os.close();
        request = (Map) ActionContext.getContext().get("request");
        this.udto.setPicImg(realpath + File.separator + uploadFileFileName);
        System.out.printf(udto.getPicImg());
        if (UserService.addUserService(udto)) {
            request.put("addUserMsg", "添加成功");
            return SUCCESS;
        }
        request.put("addUserMsg", "添加失败");
        return ERROR;
    }

    public String modifyUserImg() throws IOException {
        String realpath = ServletActionContext.getServletContext().getRealPath("/upload/imgs/icon");// 获得服务器端的路径
        //基于myFile创建一个文件输入流
        InputStream is = new FileInputStream(uploadFile);
        // 设置目标文件
        File file = new File(realpath);
        if (!file.exists()) {// 判断该文件是否存在
            file.mkdirs();// 如果不存在，创建文件夹
        }
        File toFile = new File(realpath, this.getUploadFileFileName());

        // 创建一个输出流
        OutputStream os = new FileOutputStream(toFile);
        //设置缓存
        byte[] buffer = new byte[1024];
        int length = 0;
        //读取myFile文件输出到toFile文件中
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
        System.out.println("上传文件名" + uploadFileFileName);
        System.out.println("上传文件类型" + uploadFileContentType);
        //关闭输入流
        is.close();
        //关闭输出流
        os.close();
        request = (Map) ActionContext.getContext().get("request");
        String picPath = realpath + File.separator + uploadFileFileName;
        picPath = picPath.replaceAll("\\\\", "/");
        this.udto.setPicImg(picPath);
        System.out.printf(udto.getPicImg());
        if (UserService.modifyUserService(udto)) {
            udto = (UserDTO) session.get("user");
            udto.setPicImg(picPath);
            session.put("user", udto);
            request.put("Msg", "修改成功");
            return SUCCESS;
        }
        request.put("Msg", "修改失败");
        return ERROR;
    }

    public UserDTO getUdto() {
        return udto;
    }

    public void setUdto(UserDTO udto) {
        this.udto = udto;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }

    public File getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(File uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getUploadFileFileName() {
        return uploadFileFileName;
    }

    public void setUploadFileFileName(String uploadFileFileName) {
        this.uploadFileFileName = uploadFileFileName;
    }

    public String getUploadFileContentType() {
        return uploadFileContentType;
    }

    public void setUploadFileContentType(String uploadFileContentType) {
        this.uploadFileContentType = uploadFileContentType;
    }
}
