<%@ page session="false" language="java" import="java.util.*,Service.HomepageService" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HomepageService ser=new HomepageService(getServletContext());
%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8"/>
		<title><%=ser.getPageTitle() %></title>
		<meta name="keywords" content="<%=ser.getKeywords()%>"/>
		<meta name="description" content="<%=ser.getPageDes()%>"/>
		<link rel="stylesheet" type="text/css" href="css/mobile_homepage.css" />
	</head>
	<body>
		<div id="head"></div>
		<div id="homepage" style="display: block;">
			<div id="imgs">
				<div>
					<%
					List<String> urls=ser.getImgURLs();
					for(String url:urls){
					 %>
						<div style="background-image: url(<%=url%>);"></div>
					<%} %>
				</div>
			</div>
			<div id="bottom">
				<p>产品中心</p>
				<div>
					<a ontouchstart="sure_before_work();" href="hWord.html" id="hWord"><div></div><span>新建hWord网络文件</span></a><div><hr></div>
					<a ontouchstart="sure_before_work();" href="hPPT.html" id="hPPT"><div></div><span>新建hPPT网络文件</span></a><div><hr></div>
					<a ontouchstart="sure_before_work();" href="hExcel.html" id="hExcel"><div></div><span>新建hExcel网络文件</span></a><div><hr></div>
					<a ontouchstart="sure_before_work();" href="http://www.hoffice.com.cn/OnlineDoc?method=onlineDocument&uuid=dc3424ce6b40495ebaca23e968a62014" id="search"><div></div><span>创建调查表</span></a><div><hr></div>
				</div>
			</div>
		</div>
		<div id="login" class="login" style="display: none;">
			<div class="content">
				<input class="usernum" type="text" placeholder="请输入账号"/>
				<input class="password" style="margin-bottom: 0px;" type="password" placeholder="请输入密码"/>
				<input class="enSure_id" style="width: 3.2rem;margin-top: 0px;" type="text" placeholder="请输入验证码"/><img />
			</div><a href="javascript:;">忘记密码?</a>
			<input class="sure" type="button" value="登 录"/>
			<input onclick="pageZhuce();" style="background-color: white;color: black;" type="button" value="注 册" />
		</div>
		<div class="login" id="zhuce" style="display: none;">
			<div class="content">
				<input type="text" placeholder="请输入用户名" />
				<input type="text" placeholder="请输入电子邮箱(非必须)" />
				<input type="password" placeholder="请输入密码" />
				<input style="margin-bottom: 0px;" type="password" placeholder="请再次确认密码" />
				<input maxlength="4" style="width: 3.2rem;margin-top: 0px;" type="text" placeholder="请输入验证码" /><img />
			</div>
			<input type="button" value="注 册"/>
			<input onclick="pageLogin();" style="background-color: white;color: black;" type="button" value="登 录" />
		</div>
		<div class="login" id="userCenter" style="display: none;">
			<div class="content">
				我的账号:<input type="text" /><br>
				我的昵称:<input type="text" placeholder="请输入用户名" /><br>
				电子邮箱:<input type="text" placeholder="请输入电子邮箱(非必须)" /><br>
				我的密码:<input type="password" placeholder="请输入密码" />
			</div>
			<input type="button" value="更 改"/>
		</div>
		<div id="docManager" style="display: none;">
			<input type="text" /><a href="javascript:;">搜索</a>
			<ul></ul>
		</div>
		<div id="placeHolder"></div>
		<div id="foot">
			<div><a href="javascript:openPage('homepage');">首页</a></div><div><a href="javascript:pageLogin();">登录</a></div><div><a href="javascript:openUserCenter();">用户中心</a></div><div><a href="javascript:openLib();">文件管理</a></div>
		</div>
		<script type="text/javascript" src="support/mobileSupport.js"></script>
		<script type="text/javascript" src="support/adv_homepage_mobile.js"></script>
	</body>
</html>