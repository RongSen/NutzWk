package cn.wizzer.app.gen.web;

import cn.wizzer.app.gen.entity.Gen_table;
import cn.wizzer.app.gen.service.GenTableService;
import cn.wizzer.framework.base.Result;
import cn.wizzer.framework.page.datatable.DataTableColumn;
import cn.wizzer.framework.page.datatable.DataTableOrder;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Fail;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@IocBean
@At("/gen/table")
public class GenTableController {

    private static final Log log = Logs.get();

    @Inject
    private GenTableService genTableService;

    @At("")
    @Ok("beetl:/modules/gen/table/index.html")
    @RequiresPermissions("sys.devtools.gen")
    public void index(HttpServletRequest req){
        //req.setAttribute("list", cmsChannelService.query(Cnd.where("parentId", "=", "").or("parentId", "is", null).asc("location").asc("path")));
        req.setAttribute("list", genTableService.getGenTableList());
    }

    @At
    @Ok("beetl:/modules/gen/table/add.html")
    @RequiresPermissions("sys.devtools.gen")
    public  Object add(@Param("..") Gen_table table){
        try {
            return Result.success("system.success");
        } catch (Exception e) {
            return Result.error("system.error");
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
