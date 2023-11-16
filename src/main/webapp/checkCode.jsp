
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
 <!--验证码图片-->
<img src="<%=request.getContextPath()%>/test?action=codeImgProduct" id="codeImg" alt="验证码加载中...">
<a>看不清?点击图片刷新</a>

<script>
    $(function (){
        $("#codeImg").on("click",function (){
            //将点击时候的当前时间拼接到请求 确保请求不重复
            //获取当前时间
            let time = new Date().getTime();
            $(this).attr("src","<%=request.getContextPath()%>/test?action=codeImgProduct&d="+time);
        })
    })
</script>
</body>
</html>
