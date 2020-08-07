package com.hh.util;

import com.hh.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * @description:
 * @author: 98316
 * @date: 2020-01-30 10:10
 */

public class LoginInterceptor implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //配置白名单
        Set<String> uris = new HashSet<>();
        uris.add("/index.jsp");
        uris.add("/login.jsp");
        uris.add("/register.jsp");
        uris.add("/answer_square.jsp");
        //管理员为完善所以先放开直接进去
        uris.add("/admin.jsp");
        uris.add("/survey.jsp");

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String servletPath = request.getServletPath();
        //System.out.println(servletPath);
        for (String uri : uris) {
            if (uri.contains(servletPath)) {
                filterChain.doFilter(request, response);
                return;
            }
        }

        //获取session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_session");
        //System.out.println(user);
        //判断session中是否有用户数据，如果有，则返回true，继续向下执行
        if (user != null) {
            filterChain.doFilter(request, response);
            return;
        }else{
            response.sendRedirect(request.getContextPath()+"login.jsp");
            return;
        }

    }

    @Override
    public void destroy() {

    }
}
