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


        // 去掉项目名
        String context=request.getContextPath();

        uri=uri.substring(context.length());



        Integer roleId=user.getRoleId();



        System.out.println(
                "权限检查:"
                +uri
                +" roleId="
                +roleId
        );



        //管理员
        if(uri.startsWith("/admin")){


            if(!Integer.valueOf(1).equals(roleId)){

                response.sendRedirect(
                        request.getContextPath()
                        +"/error"
                );

                return false;
            }
        }



        //仓库管理员
        else if(uri.startsWith("/warehouse")){


            if(!Integer.valueOf(2).equals(roleId)){

                response.sendRedirect(
                        request.getContextPath()
                        +"/error"
                );

                return false;
            }
        }



        //统计员
        else if(uri.startsWith("/query")){


            if(!Integer.valueOf(3).equals(roleId)){


                response.sendRedirect(
                        request.getContextPath()
                        +"/error"
                );

                return false;

            }
        }



        return true;

    }

}