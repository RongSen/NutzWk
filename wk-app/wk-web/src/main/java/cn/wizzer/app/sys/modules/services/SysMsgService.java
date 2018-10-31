package cn.wizzer.app.sys.modules.services;

import cn.wizzer.app.sys.modules.models.Sys_msg;
import cn.wizzer.framework.base.service.BaseService;

import java.util.List;
import java.util.Map;

public interface SysMsgService extends BaseService<Sys_msg> {

    List<Sys_msg> getSysMsgList();
    Map getSysMsgById(String id);

    void save(Sys_msg msg);
}
