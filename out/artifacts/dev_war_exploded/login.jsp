<%--<%@ page import="com.me.dao.userdao" %>--%>
<%@ page import="JavaDao.userdao" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: 15719
  Date: 2022/4/11
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--  -->
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登录与注册</title>
    <link rel="stylesheet" href="cssandjq/font-awesome.min.css">
    <link rel="stylesheet" href="cssandjq/dmaku.css">
</head>
<body>

<div class="materialContainer">
    <form method="post" action="userservlet?action=login">
    <div class="box">
        <div class="title">登录</div>
        <div class="input">
            <label for="name" style="line-height: 60px; font-size: 24px; font-weight: 300; top: 10px;">用户名</label>
            <input type="text" name="name" id="name">
<%--            name=name --%>
            <span class="spin" style="width: 0px;"></span>
        </div>
        <div class="input">
            <label for="pass" style="line-height: 60px; font-size: 24px; font-weight: 300; top: 10px;">密码</label>
            <input type="password" name="pass" id="pass">
<%--            name=pass--%>
            <span class="spin" style="width: 0px;"></span>
        </div>
        <div class="button login">
            <button>
                <span>登录</span>
                <i class="fa fa-check"></i>
            </button>
        </div>
        <a href="#" class="pass-forgot">忘记密码？</a>
    </div>
    </form>
    <form method="post" action="userservlet?action=register">
    <div class="overbox">
        <div class="material-button alt-2">
            <span class="shape"></span>
        </div>
        <div class="title">注册</div>
        <div class="input">
            <label for="regname">用户名</label>
            <input type="text" name="regname" id="regname">
            <span class="spin" style="width: 0px;"></span>
        </div>
        <div class="input">
            <label for="regpass">密码</label>
            <input type="password" name="regpass" id="regpass">
<%--            name=regpass--%>
            <span class="spin" style="width: 0px;"></span>
        </div>
        <div class="input">
            <label for="reregpass">确认密码</label>
            <input type="password" name="reregpass" id="reregpass">
            <span class="spin" style="width: 0px;"></span>
        </div>
        <div class="button">
            <button>
                <span>注册</span>
            </button>
        </div>
    </div>
    </form>
</div>

<script src="cssandjq/jquery.min.js.下载"></script>
<script src="cssandjq/dmaku.js.下载"></script>

</body>
</html>
