package cn.wizzer.app.gen.service.impl;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.entity.Gen_table_column;
import cn.wizzer.app.gen.service.GenTableColumnService;
import cn.wizzer.framework.base.service.BaseServiceImpl;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.IocBean;

import java.util.List;
import java.util.Map;

@IocBean(args = {"refer: dao"})
public class GenTableColumnServiceImpl extends BaseServiceImpl<Gen_table_column> implements GenTableColumnService {

    public GenTableColumnServiceImpl(Dao dao) {
        super(dao);
    }

    @Override
    public List<Gen_table> getGenTableColumList() {
        return null;
    }

    @Override
    public Map getGenTableColum(String id) {
        return null;
    }

    @Override
    public Map newGenTableColum(Gen_table_column genTableColum) {
        return null;
    }

    @Override
    public Map removeGenTableColum(Gen_table_column genTableColum) {
        return null;
    }
}
