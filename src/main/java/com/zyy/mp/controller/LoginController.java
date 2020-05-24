package com.zyy.mp.controller;

import com.zyy.mp.entity.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.*;

/**
 * @author: Zyy
 * @date: 2020-05-22 16:38
 * @description:
 * @version:
 */
@RestController
public class LoginController {

    @RequestMapping(value = "/login")
    public Result login(@RequestParam("username") String username, @RequestParam("password") String password) {
        Result result = new Result(false);
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 执行认证登陆
        try {
            subject.login(token);
        } catch (UnknownAccountException uae) {
            result.setMessage("未知账户");
            return result;
        } catch (IncorrectCredentialsException ice) {
            result.setMessage("密码不正确");
            return result;
        } catch (LockedAccountException lae) {
            result.setMessage("账户已锁定");
            return result;
        } catch (ExcessiveAttemptsException eae) {
            result.setMessage("用户名或密码错误次数过多");
            return result;
        } catch (AuthenticationException ae) {
            result.setMessage("用户名或密码不正确！");
            return result;
        }
        if (subject.isAuthenticated()) {
            result.setFlag(true);
            result.setMessage("登录成功");
            return result;
        } else {
            token.clear();
            result.setMessage("登录失败");
            return result;
        }
    }
}
