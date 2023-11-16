package org.lanqiao.empweb;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.alibaba.fastjson.JSONArray;

import org.lanqiao.entity.User;
import org.lanqiao.util.SendSMSUtil;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.json.JsonArray;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/test")
public class HelloServlet extends HttpServlet {


    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取action的值
        String action = req.getParameter("action");
        //反射
        try {
            Method method = this.getClass().getDeclaredMethod(action
                    ,HttpServletRequest.class
                    ,HttpServletResponse.class);
            method.invoke(this,req,resp);
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);

    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //获取账号框的值
        String username = req.getParameter("username");
        System.out.println("页面账号框输入的值"+username);
        //代表账号不存在
        boolean boo = false;
        if(username.equals("admin")){
            //代表账号存在
            boo =true;
        }

        PrintWriter out = resp.getWriter();
        out.write(String.valueOf(boo));
        //刷新
        out.flush();
        //关闭
        out.close();

    }

    private void jsonServlet(HttpServletRequest req,HttpServletResponse res)throws  Exception{
        User u1= new User(101,"张三","123456");
        User u2= new User(102,"张四","123456");
        User u3= new User(103,"张五","123456");
        List<User> list = new ArrayList<User>();
        list.add(u1);
        list.add(u2);
        list.add(u3);

        //调用alibaba的Json类
        JSONArray json = new JSONArray(list);
        //将json转为字符串
        String res_json = json.toJSONString();
        //获取页面输出对象
        PrintWriter out = res.getWriter();
        //输出的时候需要string类型
        out.write(res_json);
        out.flush();
        out.close();
    }
    private void codeImgProduct(HttpServletRequest req,HttpServletResponse res)throws Exception{
        //实例化Hutool生成线型验证码的工具类  图片宽 高  验证码字符个数 线段的个数
        LineCaptcha lineCaptcha = new LineCaptcha(100,20,4,25);
        //调用生成验证码的方法
        lineCaptcha.createCode();
        //获取生成验证码的值
        String code = lineCaptcha.getCode();
        //存到session,方便取出进行验证
        req.getSession().setAttribute("code",code);
        //输出的格式
        res.setContentType("images/jpeg");
        //将浏览器设置为不缓存
        res.setHeader("Pragma","No-cache");
        //输出到页面
        lineCaptcha.write(res.getOutputStream());
        //关闭
        res.getOutputStream().close();


    }

    private void sendMsg(HttpServletRequest req,HttpServletResponse res) throws Exception{
       //获取页面传过来的手机号
        String phoneNumber = req.getParameter("phone");
        //调用发送短信的工具类
        // 实例化
        SendSMSUtil util = new SendSMSUtil();
        //调用发送短信的方法
        String result = util.senSMSUtil(phoneNumber);
        System.out.println(result);
    }
}