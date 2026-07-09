package com.wms.interceptor;


import com.wms.entity.SysUser;
import org.springframework.web.servlet.HandlerInterceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler)
            throws Exception {


        SysUser user =
                (SysUser)
                request.getSession()
                .getAttribute("user");


        /*
         * 未登录
         */
        if(user == null){


            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );


            return false;
        }


        return true;

    }


}