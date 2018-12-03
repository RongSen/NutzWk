package cn.wizzer.app.gen.web;

import cn.wizzer.app.gen.service.GenTableColumnService;
import cn.wizzer.framework.page.datatable.DataTableColumn;
import cn.wizzer.framework.page.datatable.DataTableOrder;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import java.util.List;

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

    @At
    @Ok("json:full")
    @RequiresPermissions("sys.devtools.gen")
    public Object data(@Param("length") int length, @Param("start") int start, @Param("draw") int draw, @Param("::order") List<DataTableOrder> order, @Param("::columns") List<DataTableColumn> columns) {
        Cnd cnd = Cnd.NEW();
        return genTableColumnService.data(length, start, draw, order, columns, cnd, null);
    }
}
