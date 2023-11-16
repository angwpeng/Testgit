package org.lanqiao.filter;

import javax.servlet.*;
import java.io.IOException;

public class EncodingFilter implements Filter {

    private  String encoding;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        //获取web.xml配置的编码格式
       encoding= filterConfig.getInitParameter("encoding");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        req.setCharacterEncoding(encoding);
        res.setCharacterEncoding(encoding);
        res.setContentType("text/html; charset="+encoding);
        //向下执行
        chain.doFilter(req,res);
    }


}
