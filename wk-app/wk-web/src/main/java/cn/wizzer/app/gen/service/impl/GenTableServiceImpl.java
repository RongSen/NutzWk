package cn.wizzer.app.gen.service.impl;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.service.GenTableService;
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
public class GenTableServiceImpl extends BaseServiceImpl<Gen_table> implements GenTableService {

    public GenTableServiceImpl(Dao dao) {
        super(dao);
    }

    @Override
    public List<Gen_table> getGenTableList() {
        return this.query();
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

    @Override
    public List<JSONObject> getDatabaseTableList() {
        Sql sql = Sqls.create("SELECT TABLE_NAME as tableName,TABLE_COMMENT as comments, concat(TABLE_NAME,': ',TABLE_COMMENT) as tableNameAndComments FROM information_schema.TABLES WHERE table_schema='nutzwk'");
        sql.setCallback(new SqlCallback() {
            @Override
            public Object invoke(Connection connection, ResultSet resultSet, Sql sql) throws SQLException {
                List<JSONObject> list = new ArrayList<>();
                while (resultSet.next()){
                    JSONObject obj = new JSONObject();
                    obj.put("tableName", resultSet.getString("tableName"));
                    obj.put("comments", resultSet.getString("comments"));
                    obj.put("tableNameAndComments", resultSet.getString("tableNameAndComments"));

                    list.add(obj);
                }
                return list;
            }
        });
        this.dao().execute(sql);

        return sql.getList(JSONObject.class);
    }
}
