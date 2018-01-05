<%@page session="false" import="Service.HomepageService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
HomepageService ser=new HomepageService(getServletContext());
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title><%=ser.getPageTitle() %></title>
		<meta name="keywords" content="<%=ser.getKeywords()%>"/>
		<meta name="description" content="<%=ser.getPageDes() %>" />
		<link rel="stylesheet" type="text/css" href="css/pc_homePage.css"/>
	</head>
	<body>
		<div id="head" >
			<div class="top"><span style="color: gray;margin-left: 700px;"><span id="username" style="display: inline-block;width:100px;text-align: center;">未登录</span>|</span><a id="login" href="javascript:;" style="font-weight: bold;">登录</a>OR<a href="javascript:$('username').innerText='未登录';alert('你已经退出,请关闭浏览器.');" style="font-weight: bold;">退出</a></div>
			<div class="center">
				<p class="logo">hOffice</p>
				<p class="homePage">用户中心</p>
				<p class="products"><a href="#products">产品中心</a></p>				
				<p class="reviews"><a href="<%=ser.getLink()%>">用户反馈</a></p>
				<p class="plue_ins"><a href="<%=ser.getLink()%>">插件下载</a></p>
				<p id="myDoc" class="documents">文件管理</p>
			</div>
			<div class="footer"></div>
		</div>
		<div id="center">
			<div class="top">
				<div class="content">
					<p class="title"><%=ser.getTitle() %></p>
					<hr style="width:2em;float: left;">
					<p class="inner_content">
						<%=ser.getDescription() %>
					</p>
				</div><div class="imgs" id="imgs">
					<div>
					<%
					List<String> urls=ser.getImgURLs();
					for(String url:urls){
					 %>
						<div style="background-image: url(<%=url%>);"></div>
					<%} %>
					</div>
				</div>
			</div>
			<div class="footer">
				<div id="products">产品中心</div>
				<div class="contents">
					<div>
						<div class="logo_into">
							<div id="hWord_logo">
								<div class="logo">
									<div class="img"></div>
									<span>使用hWord</span>
								</div>
								
								<hr>
								<a href="/downLoads/hWord.html">点击下载hWord<br>源文件</a>
							</div>
						</div>
						<div id="hWord_b_logo"><div></div></div>
					</div>
					
					<div>
						<div class="logo_into">
							<div id="hPPT_logo">
								<div class="logo">
									<div class="img"></div>
									<span>使用hPPT</span>
								</div>
								<hr>
								<a href="/downLoads/hPPT.html">点击下载hPPT<br>源文件</a>
							</div>
						</div>
						<div id="hExcel_b_logo"><div></div></div>
					</div>
					
					<div>
						<div class="logo_into">
							<div id="hExcel_logo">
								<div class="logo">
									<div class="img"></div>
									<span>使用hExcel</span>
								</div>
								<hr>
								<a href="/downLoads/hExcel.html">点击下载hExcel<br>源文件</a>
							</div>
						</div>
						<div id="hPPT_b_logo"><div></div></div>
					</div>
					
					<div>
						<div class="logo_into">
							<div id="help_logo">
								<div class="logo">
									<div class="img"></div>
									<span>查看帮助文档</span>
								</div>
								<hr>
								<a href="/downLoads/install.exe">安装包下载<br>仅支持windows</a>
							</div>
						</div>
						<div id="help_b_logo"><div></div></div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<div class="leftSide">
				<p>Site is powerd by Bugs ltd.</p>
				<p>本网站由小虫技术有限责任公司提供</p>
				<p><a href=""> 主页 </a>|<a href="#products"> 产品 </a>|<a target="_blank" href="/msg/aboutUs.doc.html"> 关于我们 </a>|<a target="_blank" href="/msg/aboutProgramers.doc.html"> 开发者需知 </a>|
<a href="/msg/PolicyMsg.doc.html"> 法律声明 </a>|<a href="/reviews.html"> 用户反馈 </a>
				</p>
			</div>
			<div class="rightSide">
				<p>CopyRight&copy;2018.小虫技术有限责任公司 保留所有解释权</p>
			</div>
		</div>
		<!--[if lte IE 8]>
			<script type="text/javascript">
				alert("Sorry,本网站不支持IE8及几下版本浏览器,请更新你的浏览器,谢谢!");
			</script>
		<![endif]-->
		<script src="support/pc_homePage.js" type="text/javascript"></script>
		<script src="support/loginSupport.js" type="text/javascript"></script>
		<script src="support/lib.js" type="text/javascript"></script>
		<script src="support/UserCenter.js" type="text/javascript"></script>
	</body>
</html>