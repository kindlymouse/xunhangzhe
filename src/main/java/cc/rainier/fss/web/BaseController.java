package cc.rainier.fss.web;

import cc.rainier.fss.service.account.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;

/**
 * Created with IntelliJ IDEA.
 * User: Alex Zhang
 * Date: 13-8-8
 * Time: 下午4:14
 */
public abstract class BaseController {
    protected static final String PAGE_SIZE = "5";
    /**
     * 取出Shiro中的当前用户Id.
     */
    protected Long getCurrentUserId() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user.id;
    }
}
