package cn.wizzer.app.gen.web;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.entity.Gen_table_column;
import cn.wizzer.app.gen.service.GenTableService;
import cn.wizzer.framework.base.Result;
import cn.wizzer.framework.page.datatable.DataTableColumn;
import cn.wizzer.framework.page.datatable.DataTableOrder;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.json.JSONArray;
import org.json.JSONObject;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.adaptor.JsonAdaptor;
import org.nutz.mvc.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.List;

@IocBean
@At("/gen/table")
public class GenTableController {

    private static final Log log = Logs.get();

    @Inject
    private GenTableService genTableService;

    @At({"","/index"})
    @Ok("beetl:/modules/gen/table/index.html")
    @RequiresPermissions("sys.devtools.gen")
    public void index(HttpServletRequest req){
        //req.setAttribute("list", cmsChannelService.query(Cnd.where("parentId", "=", "").or("parentId", "is", null).asc("location").asc("path")));
        req.setAttribute("list", genTableService.getGenTableList());
    }

    @At("/add")
    @Ok("beetl:/modules/gen/table/add.html")
    @RequiresPermissions("sys.devtools.gen")
    public void add(HttpServletRequest req){
        req.setAttribute("tableList", genTableService.getDatabaseTableList());
    }

    @At("/addDo")
    @Ok("json")
    @AdaptBy(type = JsonAdaptor.class)
    @RequiresPermissions("sys.devtools.gen")
    public Object addDo(@Param("..")JSONObject obj, HttpServletRequest req){
        //genTableService.newGenTable(genTable);
        System.out.println(obj);
        try {
            return Result.success("ok");
        } catch (Exception e) {
            return Result.error("error");
        }
    }

    @At("/delete")
    @Ok("json:full")
    @RequiresPermissions("sys.devtools.gen")
    public Object delete(String id){
        try {
            return Result.success("system.success");
        } catch (Exception e) {
            return Result.error("system.error");
        }
    }

    @At
    @Ok("json:full")
    @RequiresPermissions("sys.devtools.gen")
    public Object data(@Param("length") int length, @Param("start") int start, @Param("draw") int draw, @Param("::order") List<DataTableOrder> order, @Param("::columns") List<DataTableColumn> columns) {
        Cnd cnd = Cnd.NEW();
        return genTableService.data(length, start, draw, order, columns, cnd, null);
    }
}
