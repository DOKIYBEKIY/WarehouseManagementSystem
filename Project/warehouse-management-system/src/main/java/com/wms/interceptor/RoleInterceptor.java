package com.wms.interceptor;


import com.wms.entity.SysUser;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RoleInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler)
            throws Exception {


        SysUser user =
                (SysUser) request.getSession()
                .getAttribute("user");


        if(user == null){

            response.sendRedirect(
                    request.getContextPath()
                    +"/login.jsp"
            );

            return false;
        }


        String uri=request.getRequestURI();

        String context=request.getContextPath();

        uri=uri.substring(context.length());

        Integer roleId=user.getRoleId();

        System.out.println(
                "权限检查:"
                +uri
                +" roleId="
                +roleId
        );


        /*
         * 管理员（roleId=1）：全部放行
         */
        if(Integer.valueOf(1).equals(roleId)){
            return true;
        }


        /*
         * 仓库管理员（roleId=2）：
         *   只能访问 物资查询、仓库管理、出入库管理、库存查询/预警
         */
        if(Integer.valueOf(2).equals(roleId)){

            if(uri.startsWith("/warehouse")
                    || uri.startsWith("/stock")
                    || uri.startsWith("/goods")
                    || uri.startsWith("/query")){
                return true;
            }

            response.sendRedirect(
                    request.getContextPath()
                    +"/error"
            );

            return false;
        }


        /*
         * 统计员（roleId=3）：
         *   只能访问查询统计
         */
        if(Integer.valueOf(3).equals(roleId)){

            if(uri.startsWith("/query")){
                return true;
            }

            response.sendRedirect(
                    request.getContextPath()
                    +"/error"
            );

            return false;
        }


        return true;

    }

}
