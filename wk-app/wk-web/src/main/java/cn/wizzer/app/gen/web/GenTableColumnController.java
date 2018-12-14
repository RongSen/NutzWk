package cn.wizzer.app.gen.web;

import cn.wizzer.app.gen.service.GenTableColumnService;
import cn.wizzer.framework.page.OffsetPager;
import cn.wizzer.framework.page.datatable.DataTableColumn;
import cn.wizzer.framework.page.datatable.DataTableOrder;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.json.JSONObject;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.entity.Record;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Sql;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.lang.Strings;
import org.nutz.lang.util.NutMap;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import java.util.List;
import java.util.Map;

@IocBean
@At("/gen/tableColumn")
public class GenTableColumnController {

    private static final Log log = Logs.get();

    @Inject
    private GenTableColumnService genTableColumnService;

    @At("")
    @Ok("beetl:/modules/gen/tableColumn/index.html")
    @RequiresPermissions("")
    public Object index(){
        return genTableColumnService.getGenTableColumList();
    }

    @At("/getDatabaseTableColumnList")
    @Ok("json:full")
    @RequiresPermissions("sys.devtools.gen")
    public Object getDatabaseTableColumnList(@Param("tableName") String tableName, @Param("length") int length, @Param("start") int start, @Param("draw") int draw, @Param("::order") List<DataTableOrder> order, @Param("::columns") List<DataTableColumn> columns) {

        Cnd cnd = Cnd.NEW();
        List<Map> list = genTableColumnService.getDatabaseTableColumnList(tableName);
        Sql sql = genTableColumnService.getDatabaseTableColumnListForSql(tableName);
        List<Record> list2 = genTableColumnService.list(sql);

        NutMap map = new NutMap();

        map.put("recordsFiltered",1);
        map.put("data",list);
        map.put("draw",1);
        map.put("recordsTotal",list.size());

        return map;
        //return genTableColumnService.getDatabaseTableColumnList(tableName);
    }

    @At
    @Ok("json:full")
    @RequiresPermissions("sys.devtools.gen")
    public Object data1(@Param("length") int length, @Param("start") int start, @Param("draw") int draw, @Param("::order") List<DataTableOrder> order, @Param("::columns") List<DataTableColumn> columns) {
        Cnd cnd = Cnd.NEW();
        return genTableColumnService.data(length, start, draw, order, columns, cnd, null);
    }
}
