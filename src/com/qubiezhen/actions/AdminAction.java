package com.qubiezhen.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.qubiezhen.dao.dto.AdminDto;
import com.qubiezhen.dao.dto.UserDTO;
import com.qubiezhen.services.AdminLoginService;
import com.qubiezhen.services.UserService;

import java.util.Map;

/**
 * Created by yangj on 2016/12/12.
 */
public class AdminAction extends ActionSupport {
    private AdminDto adto = null;
    private Map session = null;
    private UserDTO udto = null;


    public String login() {
        AdminDto adminDto = AdminLoginService.loginService(adto);
        if (adminDto != null) {
            this.adto = adminDto;
            session = ActionContext.getContext().getSession();
            session.put("admin", adto);
            return SUCCESS;
        }
        return ERROR;
    }

    public String logout() {
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.remove("admin");
        return SUCCESS;
    }

    public String modifyUser() {
        UserService.modifyUserService(udto);
        return SUCCESS;
    }

    public String deleteUser() {
        if (UserService.deleteUserService(udto)) {
            return SUCCESS;
        }
        return ERROR;
    }

    public AdminDto getAdto() {
        return adto;
    }

    public void setAdto(AdminDto adto) {
        this.adto = adto;
    }

    public Map getSession() {
        return session;
    }

    public UserDTO getUdto() {
        return udto;
    }

    public void setUdto(UserDTO udto) {
        this.udto = udto;
    }
}
