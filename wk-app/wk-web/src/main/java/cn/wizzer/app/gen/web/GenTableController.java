package cn.wizzer.app.gen.web;

import cn.wizzer.app.gen.service.GenTableService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
@At("/gen/table")
public class GenTableController {

    private static final Log log = Logs.get();

    @Inject
    private GenTableService genTableService;

    @At
    @Ok("beetl:/modules/gen/table/index.html")
    @RequiresPermissions("sys.devtools.gen")
    public Object index(){
        return genTableService.getGenTableList();
    }
}
