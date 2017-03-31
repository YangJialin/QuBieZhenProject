package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.SecendHandGoodsDto;
import com.qubiezhen.services.SecendHandGoodsService;
import com.qubiezhen.services.UserService;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;
import java.util.Map;

/**
 * Created by yangj on 2016/12/18.
 */
public class SecendHandGoodAction extends ActionSupport {
    private File uploadFile;
    private String uploadFileFileName;
    private String uploadFileContentType;
    private Map request;
    private SecendHandGoodsDto sgdto;
    private String province;
    private String city;
    private List<SecendHandGoodsDto> sgList;

    /**
     * 上传商品信息
     *
     * @return
     * @throws IOException
     */
    public String addSecendHandGoods() throws IOException {

        String realpath = ServletActionContext.getServletContext().getRealPath("/upload/imgs/goods");// 获得服务器端的路径
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
        this.sgdto.setGoodsLocation(province + "-" + city);
        this.sgdto.setGoodsImg(realpath + File.separator + uploadFileFileName);
        if (SecendHandGoodsService.addSecendHandGoodsService(sgdto)) {
            request.put("addUserMsg", "添加成功");
            return SUCCESS;
        }
        request.put("addUserMsg", "添加失败");
        return ERROR;
    }

    /**
     * 根据条件取得全部商品信息
     *
     * @return
     */
    public String querySecendHandGoodsList() {

        List<SecendHandGoodsDto> tempList = SecendHandGoodsService.getSecendHandGoodsList(sgdto);
        if (tempList.size() > 0) {
            this.sgList = tempList;
            return SUCCESS;
        }
        return ERROR;
    }

    /**
     * 查询商品详细信息
     *
     * @return
     */
    public String querySecendHandGoodsById() {

        SecendHandGoodsDto tempdto = SecendHandGoodsService.getSecendHandGoodsById(sgdto);
        if (tempdto != null) {
            this.sgdto = tempdto;
            return SUCCESS;
        }
        return ERROR;
    }

    /**
     * 删除商品
     *
     * @return
     */
    public String delete2HandGoods() {
        request = (Map) ActionContext.getContext().get("request");
        if (SecendHandGoodsService.deleteSecendHandGoodsService(sgdto)) {
            request.put("Msg", "删除成功");
            return SUCCESS;
        }
        request.put("Msg", "删除成功");
        return ERROR;
    }

    /**
     * 修改商品信息
     *
     * @return
     */
    public String modify2HandGoods() {
        request = (Map) ActionContext.getContext().get("request");
        if (SecendHandGoodsService.modifySecendHandGoods(sgdto)) {
            request.put("Msg", "修改成功");
            return SUCCESS;
        }
        request.put("Msg", "修改失败");
        return ERROR;
    }


    public SecendHandGoodsDto getSgdto() {
        return sgdto;
    }

    public void setSgdto(SecendHandGoodsDto sgdto) {
        this.sgdto = sgdto;
    }

    public List<SecendHandGoodsDto> getSgList() {
        return sgList;
    }

    public void setSgList(List<SecendHandGoodsDto> sgList) {
        this.sgList = sgList;
    }

    public Map getRequest() {
        return request;
    }

    public void setRequest(Map request) {
        this.request = request;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
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
