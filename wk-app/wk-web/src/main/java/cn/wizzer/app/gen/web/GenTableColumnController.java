package cn.wizzer.app.gen.web;

import cn.wizzer.app.gen.service.GenTableColumnService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
@At("/gen/tableColumn")
public class GenTableColumnController {

    private static final Log log = Logs.get();

    @Inject
    private GenTableColumnService genTableColumnService;

    @At
    @Ok("beetl:/modules/gen/tableColumn/index.html")
    @RequiresPermissions("")
    public Object index(){
        return genTableColumnService.getGenTableColumList();
    }
}
