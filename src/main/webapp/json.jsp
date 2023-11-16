
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
<button id="btn">获取</button>
<table border="1">
    <tr id="table_tr">
        <td>id</td>
        <td>userName</td>
        <td>password</td>
    </tr>
</table>
    <script>
        $(function(){
          //按钮绑定单击事件
            $("#btn").on("click",function (){
                //ajax请求
                $.get("test?action=jsonServlet",function (data){
                    //将返回的数据转为json数据
                   let json_data = $.parseJSON(data);
                   /*遍历json数组
                   json_data是要遍历的对象
                   k指的是json数组k值*/
                   $.each(json_data,function (k,v){
                       $("#table_tr").after("<tr>" +
                           "<td>" +json_data[k].id+"</td>"+
                           "<td>" +json_data[k].userName+"</td>"+
                           "<td>" +json_data[k].password+"</td>"+
                           "</tr>")

                   })

                })
            })

        })
    </script>
</body>
</html>
