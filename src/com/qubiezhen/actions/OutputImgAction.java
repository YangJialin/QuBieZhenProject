package com.qubiezhen.actions;

import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;

/**
 * Created by yangj on 2016/12/23.
 */
public class OutputImgAction {

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    private String imgpath;

    public String viewImages() {
        HttpServletResponse response = null;
        ServletOutputStream out = null;
        try {
            FileInputStream hFile = new FileInputStream(imgpath); // 以byte流的方式打开文件 d:\1.gif
            int i = hFile.available(); //得到文件大小
            byte data[] = new byte[i];
            hFile.read(data); //读数据
            hFile.close();

            response = ServletActionContext.getResponse();
            response.setContentType("image/*"); //设置返回的文件类型
            out = response.getOutputStream();
            out.write(data);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        }
        return null;
    }
}
