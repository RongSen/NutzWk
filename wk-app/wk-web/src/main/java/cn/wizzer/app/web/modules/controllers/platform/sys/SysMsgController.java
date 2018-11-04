package cn.wizzer.app.web.modules.controllers.platform.sys;

import cn.wizzer.app.sys.modules.services.SysMsgService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

@IocBean
@At("/platform/sys/msg")
public class SysMsgController {
    private final static Log log = Logs.get();

    @Inject
    private SysMsgService sysMsgService;

    @At("")
    @Ok("beetl:/platform/sys/msg/index.html")
    @RequiresPermissions("sys.manager.msg")
    public Object index(){
        return sysMsgService.getSysMsgList();
    }

    @At("/add")
    @Ok("beetl:/platform/sys/msg/add.html")
    @RequiresPermissions("sys.manager.msg")
    public Object add(){
        return null;
    }

}
