<%--
  Created by IntelliJ IDEA.
  User: 17274
  Date: 2021/6/15
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>学生管理系统</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>

    <style>
        #search{
            width: 309px;
            margin-top: 40px;
            margin-bottom: 40px;
            margin-right: auto;
            margin-left: auto;

        }

        #div2{
            width: 1300px;
            margin: 0px auto;

        }

        #table{
            align-content: center;

        }

        #table tr:first-child{
            text-align: center;
            font-size: 20px;
            color: gray;
        }

        #table tr td{
            text-align: center;
            line-height: 30px;
        }



    </style>

</head>
<body>

<h1 style="text-align: center">学生管理系统</h1>

<div id="search">
    <!-- 搜索框 -->
    <form class="form-inline" action="/findOneByName">
        <div class="form-group">
            <label for="exampleInputName2">姓名</label>
            <input type="text" class="form-control" name="name" id="exampleInputName2" placeholder="Jane Doe">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
    </form>
</div>

<!-- 信息列表 -->
<div id="div2">

    <table id="table" class="table table-hover">
        <tr>
            <td>序号</td>
            <td>姓名</td>
            <td>学号</td>
            <td>性别</td>
            <td>电话</td>
            <td>操作</td>
        </tr>

        <c:forEach items="${studentList}" var="studnet" >
            <tr>
                <td>${studnet.id}</td>
                <td>${studnet.name}</td>
                <td>${studnet.number}</td>
                <td>${studnet.gender}</td>
                <td>${studnet.phone}</td>
                <td>
                    <button id="button3" onclick="updateUserStudent(${studnet.id})" type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
                        修改
                    </button>
                    <button id="button2" onclick="deletStudent(${studnet.id})" type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false" autocomplete="off">
                        删除
                    </button>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>


<!-- 添加 -->
<div style="width: 86px;margin: 0 auto">
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        添加
    </button>

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">学生信息</h4>
                </div>
                <div class="modal-body">


                    <!-- 表单
                        添加一个点击事件，点击发送表单
                     -->
                    <form id="formInsert" class="form-horizontal" action="/formInsert"  >
                        <!-- 姓名 -->
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputEmail3" required name="name" placeholder="yourName">
                            </div>
                        </div>
                        <!-- 学号 -->
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">学号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword3" name="number" required placeholder="YourNumber">
                            </div>
                        </div>

                        <!-- 性别 -->
                        <div class="form-group">
                            <label for="inputPassword4" class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword4" name="gender" required placeholder="YourGender">
                            </div>
                        </div>

                        <!-- 电话 -->
                        <div class="form-group">
                            <label for="inputPassword5" class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputPassword5" name="phone" required placeholder="YourPhoneNumber">
                            </div>
                        </div>

                    </form>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

                    <!-- 给这个按钮添加一个点击事件，点击后，发送表单 -->
                    <button id="button1" type="button" class="btn btn-primary">保存</button>


                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>



<script>

    //添加点击事件
    document.getElementById("button1").onclick = function () {
        //点击后，点击发送表单
        document.getElementById("formInsert").submit();
    }

    function deletStudent(id) {
        if(confirm("你确定要进行删除吗？")){
            location.href="${pageContext.request.contextPath}/deleteStudent?id="+id;
        }
    }

    function updateUserStudent(id) {
        location.href="${pageContext.request.contextPath}/updateUserStudent?id="+id;
    }
</script>