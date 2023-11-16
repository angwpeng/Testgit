<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <!--引用js文件-->
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<form action="test?action=login" method="post">
       账号：<input id="username" name="username">
        <a id="tishi"></a>
        <input type="submit" value="登录_get" id="login_get1">
        <input type="submit" value="登录_post" id="login_post1">
         <input type="submit" value="登录_load" id="login_load1">
    <script>
        $(function (){
            //按钮绑定单击事件
            $("#login_get").on("click",function (){
                //获取账号框的值
                var username = $("#username").val();
                $.get("test?action=login",{"username":username},function (data){
                   if(data=="true"){
                       $("#tishi").html("账号存在");
                   }else{
                       $("#tishi").html("账号不存在");
                   }
                    //防止表单重复提交
                    return false;
                })
            })

            //按钮绑定单击事件
            $("#login_post").on("click",function (){
                //获取账号框的值
                var username = $("#username").val();
                $.post("test?action=login",{"username":username},function (data){
                    if(data=="true"){
                        $("#tishi").html("账号存在");
                    }else{
                        $("#tishi").html("账号不存在");
                    }
                    //防止表单重复提交
                    return false;
                })
            })

            //load
            $("#login_load").on("click",function (){
                //获取文本框的值
                var username = $("#username").val();
                $("#tishi").load("test?action=login",{"username":username},function (data) {
                    if(data=="true"){
                        $(this).html("账号存在");
                    }else{
                        $(this).html("账号不存在");
                    }
                    //防止表单重复提交
                    return false;
                })
            })

        })

    </script>
</form>
</body>
</html>