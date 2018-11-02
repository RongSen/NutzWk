package cn.wizzer.app.sys.modules.services.impl;

import cn.wizzer.app.sys.modules.models.Sys_msg;
import cn.wizzer.app.sys.modules.services.SysMsgService;
import cn.wizzer.framework.base.service.BaseServiceImpl;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.ioc.loader.annotation.IocBean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@IocBean(args = {"refer:dao"})
public class SysMsgServiceImpl extends BaseServiceImpl<Sys_msg> implements SysMsgService {

    public SysMsgServiceImpl(Dao dao) {
        super(dao);
    }

    @Override
    public List<Sys_msg> getSysMsgList() {
        return this.query(Cnd.where("delFlag","=", false));
    }

    @Override
    public Map getSysMsgById(String id) {
        Sys_msg msg = this.fetch(Cnd.where("id","=",id));

        return  msg == null ? new HashMap() : this.getMap(Sqls.create("select * from sys_msg where id = @id order by opAt desc").setParam("id", msg.getId()));
    }

    @Override
    public void save(Sys_msg msg) {

        dao().insert(msg);
    }
}
