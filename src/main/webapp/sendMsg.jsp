<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2023/11/16
  Time: 0:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <input type="text" id="phone">
    <input type="button" id="btn" value="发送短信">
    <script>

        $(function (){
            $("#btn").click(function (){

                $.post("test?action=sendMsg",{"phone":$("#phone").val()},function (data){
                    return false;
                })
            })
        })
    </script>
</body>
</html>
