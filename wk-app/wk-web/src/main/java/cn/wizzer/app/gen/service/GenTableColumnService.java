package cn.wizzer.app.gen.service;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.entity.Gen_table_column;
import cn.wizzer.framework.base.service.BaseService;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

public interface GenTableColumnService extends BaseService<Gen_table_column> {

    List<Gen_table> getGenTableColumList();
    Map getGenTableColum(String id);
    Map newGenTableColum(Gen_table_column genTableColum);
    Map removeGenTableColum(Gen_table_column genTableColum);

    List<JSONObject> getDatabaseTableColumnList(String tableName);
}
