package cn.wizzer.app.gen.service;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.framework.base.service.BaseService;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface GenTableService extends BaseService<Gen_table> {

    List<Gen_table> getGenTableList();
    List<JSONObject> getDatabaseTableList();
    Map getGenTable(String id);
    Map newGenTable(Gen_table genTable);
    Map removeGenTable(Gen_table genTable);
}
