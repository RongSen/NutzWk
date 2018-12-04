package cn.wizzer.app.gen.service.impl;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.entity.Gen_table_column;
import cn.wizzer.app.gen.service.GenTableColumnService;
import cn.wizzer.app.gen.util.Utils;
import cn.wizzer.framework.base.service.BaseServiceImpl;
import org.json.JSONObject;
import org.nutz.dao.Dao;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.ioc.loader.annotation.IocBean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

    @Override
    public List<JSONObject> getDatabaseTableColumnList(String tableName) {

        Sql sql = Sqls.create("SELECT " +
                "t.COLUMN_NAME AS columnName, " +
                "t.COLUMN_TYPE AS columnType " +
                "(CASE WHEN t.IS_NULLABLE = 'YES' THEN '1' ELSE '0' END) AS isNull, " +
                "t.ORDINAL_POSITION * 10) AS columnSort," +
                "t.COLUMN_COMMENT AS comments," +
            "FROM information_schema.`COLUMNS` t " +
            "WHERE t.TABLE_SCHEMA = (select database()) AND t.TABLE_NAME = ($tableName) ORDER BY t.ORDINAL_POSITION ");

        sql.setVar("tableName",tableName);
        sql.setCallback(new SqlCallback() {
            @Override
            public Object invoke(Connection connection, ResultSet resultSet, Sql sql) throws SQLException {
                List<JSONObject> list = new ArrayList<>();
                while (resultSet.next()){
                    JSONObject obj = new JSONObject();
                    obj.put("columnName", resultSet.getString("columnName"));
                    obj.put("columnLabel", resultSet.getString("columnLabel"));
                    obj.put("columnType", resultSet.getString("columnType"));
                    obj.put("columnSort", resultSet.getString("columnSort"));
                    obj.put("attrType", Utils.convertToJavaDataType(resultSet.getString("attrType")));
                    obj.put("attrName", Utils.camelCaseName(resultSet.getString("attrName")));
                    obj.put("isPk", resultSet.getString("isPk"));

                    list.add(obj);
                }
                return list;
            }
        });
        this.dao().execute(sql);

        return sql.getList(JSONObject.class);
    }
}
