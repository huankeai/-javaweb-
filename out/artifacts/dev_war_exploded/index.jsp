<%@ page import="JavaDao.JavaDaoLogo" %>
<%@ page import="bean.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Random" %>
<%@ page import="bean.user" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2022/4/10erweishu@localhost
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<link rel="stylesheet" href="css/locss.css">
<style>
    .div_moweihuang{
        width: 100%;
        height: 100px;
        background-image: url(img/mg.png);
        background-color: #ffebdb;
        padding: 0px 10px;
        width: 100%;
        height: 300px;
        border: #e62129 1px solid;
    }
</style>
<body>
<!-- 顶端 -->
<div>
    <div class="div_dingye">
        <span id="sp_hui">本网站以供方便大学生在校购买商品，可买任何类型的商品服务</span>
        <span id="sp_hui2">联系电话 1737****994</span>
        <span id="sp_hui3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 更多功能还在开发中</span>

    </div>

    <div class="div_ssuo"> <!-- 设置横线颜色 -->
            <table class="table_ssuo" >
            <tr>
                <form action="">
                    <!-- <td id="sp_logo">逸选购</td> -->
                    <td colspan="2"><div class="img_logo"><img src="img/logo.png" alt="" ></div></td>
                    &nbsp;         <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td colspan="3" id="inp_ssuo">

                        <!-- <input type="text" class="ssuo_li" placeholder="您需要什么?"><input type="submit" value="" class="anxiu"> -->
                        <div class="main">
                            <div class="pannel-div search">
                                &nbsp; <input type="text" class="in" id="in" placeholder="请输入查询内容" /><input type="submit" class="btn_search" value="搜索">
                            </div>
                        </div>

                    </td>
                    <td colspan="3">
                        <%
                            user user =(user) session.getAttribute("user");
                            if (user!=null){
                        %>
                        <form action="indexx.jsp">
<%--                            购物车--%>
                            <a href="gowucheMi.jsp"><input type="button" value="我的购物车" id="gowuche"></a>
                            <%if (user.getUtypeid()==2){%>
                            <a href="indexx.jsp"><input type="button" value="我的店铺" id="gowuche"></a>
                            <%}else {%>
                            <a href="#"><input type="button" value="我的店铺" id="gowuche" onclick="window.alert('您还不是商家请向管理员申请')"></a>
                            <%}%>
                        </form>
                        <%}else {%>
                        <form action="#">
                            <a href="#"> <input type="button" value="我的购物车" id="gowuche"  onclick="window.alert('请登录')"></a>
                            <a href="#"><input type="button" value="我的店铺" id="gowuche"  onclick="window.alert('请登录')"></a>
                        </form>
                       <%}%>
                    </td>
                    <td><div class="div_dengli">
                        <!-- 登录 -->
                        <%
                            user l=new user();
                            l = (user) session.getAttribute("user");
                            session.setAttribute("l",l);
                            if (l==null){
                        %>
                        <a href="login.jsp" class="aaa">
                            <dl><img src="img/user.png" alt="" class="img_user"><br><span class="denglu">未登录</span></dl>
                        </a>
                        <%}else{%>
                        <a href="login.jsp" class="aaa">
                            <dl><img src="img/wanjia.jpg" alt="" class="img_user"><br><span class="denglu">用户id:<%=l.getUname()%></span></dl>
                        </a>
                        <a href="RequestDispatcher?action=tuichu">退出登录</a>
                        <%}%>
                    </div></td>
                </form>
        </table>
    </div>
</div>

<!-- 商品分类 -->
<div class="fenlei_fen1">
    <div class="fenlei_li">
        <table class="table_fenlei">
            <tr>
                <td class="table_fenlei_td_to">商品分类:</td>
                <td>成人用品</td>
                <td>非成人用品</td>
            </tr>
            <tr>
                <td class="table_fenlei_td_to">店铺分类:</td>
                <td>得物</td>
                <td>非得物</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="table_fenlei_td_to">价格分类:</td>
                <td>100以下</td>
                <td>100以上</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="table_fenlei_td_to_boder" colspan="15">
                    <span class="sp_goneng">功能:</span>
                    <a href="http://www.4399.com/">游戏:4399</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="http://www.4399.com/">游戏2:万熊的救赎</a>

                </td>
            <td> <a href="wuziqi.jsp">五子棋</a></td>


            </tr>

        </table>

    </div>
</div>

<!-- 商品 -->
<h1 id="h1_remai">逸选购热卖</h1>
<div class="fenlei_fen123" >
    <div class="fenlei_li123">
        <div class="grid">

            <a href="">
                <div id="div_shangp">

                    <form action="">
                        <dl>
                            <dt class="tp"><img src="img/3.jpeg" alt=""></dt>
                            <dd class="sp">淘宝卖家来说,商品的描述其实也是非常重要的,如果能够写好商品的描述,那自然对卖家来说也是非常不错的,同时在写商品描述的时候,也需要好好去了解一下这个包括了哪些内容
                            </dd>
                            <dd class="ab"><span class="jg">&yen;99</span> <span class="jg1">&yen;122</span> <span class="gwc"></span> <br> <img src="img/店铺.png" alt="" width="10px"> <span class="span_dai">DFAY</span></dd>
                        </dl>

                    </form>

                </div>

            </a>
<%--            循环商品--%>

            <c:forEach items="${list}" var="c" >
            <a href="RequestDispatcher?action=shopId&id=${c.gid}">
                <div id="div_shangp">
                    <form action="RequestDispatcher?action=shopId&id=${c.gid}">
                        <dl>
                            <dt class="tp"><img src="${c.paddr}" alt="" width="100px"></dt>
                            <dd class="sp">${c.gname}:${c.describe} ID${c.gid}
                            </dd>
                            <dd class="ab"><span class="jg">&yen;${c.price}</span> <span class="jg1">&yen;${c.price+23}</span> <span class="gwc"></span> <br> <img src="img/店铺.png" alt="" width="10px"> <span class="span_dai">DFAY</span></dd>
                        </dl>

                    </form>
                </div>
            </a>
            </c:forEach>

<%--         结束--%>
        </div>


    </div>

</div>
<!-- 末尾 -->
<div class="div_moweihuang" >
    <div class="div_moweihuang_da">
        <div class="div_moweihuang_div">
            <h1>没有找到心仪的技师?</h1>
            <h5>还有海量技师等你选快去联系客服吧</h5>
            <div>

                <form action="Exceltion.jsp" method="post">
                <input type="submit" value="联系客服" id="mi_button2" class="login-button">
                <input type="submit" value="反馈提交" id="mi_button2" class="login-button">
                </form>

            </div>
        </div>
    </div>
</div>

<div class="div_mowei">
    <div class="mowei_shang">
        <div class="mowei_t">
            <h1 class="h1_bangzu" >网站帮助</h1>
        </div>
    </div>

    <!-- 注释 -->
    <div class="text_bai">
        <table class="table_dingbu">
            <tr>
                <td><span>帮助中心</span></td>
                <td><span>充值提现</span></td>
                <td><span>安全保障</span></td>
                <td><span>客服中心</span></td>
                <td rowspan="5" style="width: 150px;"><h2 class="h2_wei">技术支持:</h2></td>
                <td rowspan="5"><img src="img/123.png" alt="" width="150px" class="file_le"></td>

            </tr>
            <tr>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">网店出售流程</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">充值方式</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">安全流程</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">帮助中心</a></span></td>
            </tr>
            <tr>

                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">网店购买流程</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">提现方式</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">安全交易</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">客服中心</a></span></td>

            </tr>
            <tr>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">网店转让地图</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">服务费说明</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">合同法律效率</a></span></td>
                <td class="tdoc_ojbk"><span><a href="Exceltion.jsp"  class="a_asd">在线回答</a></span></td>

            </tr>
        </table>
        <table class="tbale_2">
            <tr>

                <td><h2>开发人员:</h2></td>
                <td class="tenx_x"><span id="text_powe">刘意</span></td>
                <td id="text_powe">雷启霖</td>
                <td id="text_powe">戴义青</td>
                <td id="text_powe">宋岗</td>
            </tr>
            <tr>
                <td><h2>技术支持:</h2></td>
                <td><span id="text_powe">百度</span></td>
                <td id="text_powe">GitHub</td>
                <td id="text_powe">CSDN</td>
                <td id="text_powe">佟都</td>
            </tr>
        </table>
        <table class="tbale_3">
            <tr>
                <td>位置:湖南省长沙市长沙南方职业技术学院209，5号床铺 #3182287125</td>
                <td>位置:湖南省长沙市长沙南方职业技术学院209，1号床铺 </td>
                <td>位置:湖南省长沙市长沙南方职业技术学院210，5号床铺 </td>
                <td>位置:湖南省长沙市长沙南方职业技术学院211，3号床铺 </td>
            </tr>
        </table>
    </div>
    <!-- 注释 -->
</div>

</body>
</html>