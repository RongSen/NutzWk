package cn.wizzer.app.gen.service.impl;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.service.GenTableService;
import cn.wizzer.framework.base.service.BaseServiceImpl;
import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.IocBean;

import java.util.List;
import java.util.Map;

@IocBean(args = {"refer: dao"})
public class GenTableServiceImpl extends BaseServiceImpl<Gen_table> implements GenTableService {

    public GenTableServiceImpl(Dao dao) {
        super(dao);
    }

    @Override
    public List<Gen_table> getGenTableList() {
        return this.query(Cnd.where("delFlag","=",false));
    }

    @Override
    public Map getGenTable(String id) {
        return null;
    }

    @Override
    public Map newGenTable(Gen_table genTable) {
        return null;
    }

    @Override
    public Map removeGenTable(Gen_table genTable) {
        return null;
    }
}
