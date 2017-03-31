package com.qubiezhen.dao.dto;

import java.sql.Date;

/**
 * Created by yangj on 2016/12/26.
 */
public class NoticeDto {
    private Integer noticeId;
    private String noticeTitle;
    private String noticeDetails;
    private String noticeImg;
    private Integer createAdminId;
    private Date createTime;
    private Date createTimeLow;

    public Date getCreateTimeHigh() {
        return createTimeHigh;
    }

    public void setCreateTimeHigh(Date createTimeHigh) {
        this.createTimeHigh = createTimeHigh;
    }

    private Date createTimeHigh;

    public Date getCreateTimeLow() {
        return createTimeLow;
    }

    public void setCreateTimeLow(Date createTimeLow) {
        this.createTimeLow = createTimeLow;
    }

    public Integer getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(Integer noticeId) {
        this.noticeId = noticeId;
    }

    public String getNoticeTitle() {
        return noticeTitle;
    }

    public void setNoticeTitle(String noticeTitle) {
        this.noticeTitle = noticeTitle;
    }

    public String getNoticeDetails() {
        return noticeDetails;
    }

    public void setNoticeDetails(String noticeDetails) {
        this.noticeDetails = noticeDetails;
    }

    public String getNoticeImg() {
        return noticeImg;
    }

    public void setNoticeImg(String noticeImg) {
        this.noticeImg = noticeImg;
    }

    public Integer getCreateAdminId() {
        return createAdminId;
    }

    public void setCreateAdminId(Integer createAdminId) {
        this.createAdminId = createAdminId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
