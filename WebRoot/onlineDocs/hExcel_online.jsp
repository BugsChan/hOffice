<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileInputStream,java.io.InputStreamReader,java.io.BufferedReader"%>
<%
String path=(String)request.getAttribute("path");
if(path==null){
	response.sendError(404);
}
String name=path.substring(path.indexOf("_")+1);
FileInputStream input=null;
InputStreamReader reader=null;
BufferedReader br=null;
try{
input=new FileInputStream(application.getRealPath(path));
reader=new InputStreamReader(input,"utf-8");
br=new BufferedReader(reader);
%>
<!DOCTYPE html>
<html id="version:2.0|hExcel">
<!--
作者：陈子为	山东师范大学2016级 食工一班 学号:201613010147 QQ:3502318983 Email:3502318983@qq.com
时间：2017-8-25~2017-11-06
版本：2.0
页面设计: 李萌
(c) www.hoffice.com.cn
(c) 陈子为
-->
	<head>
		<meta charset="UTF-8">
		<title><%=name %></title>
		<style id="peintStyle" media="print">
			#head{
				display: none;
			}
			#lists{
				display: none;
			}
			textarea{
				display: none;
			}
			#table{
				position: static !important;
				margin: 10px auto 0px auto !important;
			}
			body{
				width: 100% !important;
			}
			#adv{
				display: none;
			}
		</style>
		<style id="originalStyle" type="text/css">
			*{
				font-size: 17px;
				font-family: "Consolas","courier new","微软雅黑","宋体";
				padding: 0px;
				border: 0px;
				margin: 0px;
				font-size: 12px;
			}
			body{
				background-color: white;
				width: 35000px;
			}
			#items{/*head中的按钮栏89+36+27*/
				background-color: inherit;
				margin-left: 152px;
				margin-top: 6px;
			}
			#head{
				width: 100%;
				height: 60px;
				background-color: #4a9463;
				color: white;
				position: fixed;
				top: 0px;
				overflow: hidden;
			}
			#head img{
				background-color: inherit;
				margin-left: 27px;
				margin-top: 12px;
				width: 83px;
			}
			#head span{
				background-color: inherit;
				display: inline-block;
				text-align: center;
				padding-left: 1px;
				width: 52px;
				border-left: solid white 1px;
				height: 11px;
				line-height: 12px;
				cursor: pointer;
			}
			#head #title{
				display: inline-block;
				width:145px;
				height: 20px;
				color: black;
				overflow: hidden;
				background-color: white;
				margin-left: 36px;
				line-height: 20px;
				text-align: left;
			}
			#head span:hover{
				font-size: 12.5px;
			}
			#head #title:hover{
				font-size:12px;
			}
			#head a{
				font-size: inherit;
				background-color: inherit;
				color: white;
				text-decoration: none;
			}
			#flag{
				background-color: inherit;
			}
			#lists{
				position: fixed;
				top: 60px;
				width: 100%;
				opacity: 0.92;
			}
			#lists ul{
				list-style: none;
				float: left;
				width: 0em;
				display: none;
				background-color: #DCE2DE;
				position: fixed;
			}
			#lists li{
				width: 10em;
				cursor:pointer;
				background-color: inherit;
			}
			#lists li:hover{
				background-color: #BCCDC5;
			}
			input[type="button"]{
				border: solid 0.5px;
				width: 2.9em;
			}
			input[type="button"]:hover{
				background-color: inherit;
			}
			ul label{
				display:inline-block;
				width:7em;
				background-color: #DCE2DE;
			}
			ul label:hover{
				background-color: #BCCDC5;
			}
			input[type="text"]{
				border: solid 0.5px;
			}
			textarea{
				border: solid deepskyblue 1px;
			}
			#colorList span{
				display: block;
				border: solid 0.5px;
				width: 18px;
				height: 18px;
				float: left;
				margin: 0px 3px 0px 3px;
			}
			#colorList li{
				margin-top: 3px;
				height: 18px;
				width: 100%;
			}
			#colorList li:hover{
				background-color: inherit;
			}
			#colorList{
				border: solid 0.5px;
			}
			#table{
				margin: 60px 20px 40px 20px;
				border-collapse: collapse;
			}
			#table tr{
				font-size: 15px;
				text-align: center;
				overflow: hidden;
			}
			thead td{
				width: 50px;
				background-color: gainsboro !important;
				color: black !important;
				font-size: 15px !important;
				line-height: 15px !important;
			}
			thead td:first-child{
				width: 30px;
			}
			table td{
				font-size: 15px;
				border: dotted 1px;
				cursor: cell;
				overflow: hidden;
				line-height: 15px;
			}
			#table .rowCount{
				background-color: gainsboro;
				color: black;
				line-height: 15px;
				font-size: 15px !important;
			}
		</style>
		<link class="mobile" rel="stylesheet" type="text/css" href="css/hExcel_mobile.css" />
	</head>
	<body>
		<!--该div为标题栏,包括了关闭按钮,文件名和操作按钮-->
		<div id="head">
			<div id="flag">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAAAXCAYAAACRUrg+AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTEtMjRUMDk6NDM6MjIrMDg6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTExLTI0VDA5OjQzOjM4KzA4OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTExLTI0VDA5OjQzOjM4KzA4OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpFNDgwRkYzQUQwQjgxMUU3QjQ0NTg0QTFBODBCQkE3MCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpFNDgwRkYzQkQwQjgxMUU3QjQ0NTg0QTFBODBCQkE3MCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkU0ODBGRjM4RDBCODExRTdCNDQ1ODRBMUE4MEJCQTcwIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkU0ODBGRjM5RDBCODExRTdCNDQ1ODRBMUE4MEJCQTcwIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+TUATwQAAAg9JREFUeNrsWYuNgzAMTatbgBVyI3AjsEJWoCPQEegIZYR2BBjhOgIdoYzABcmRXi0HgtqKo40lqyJxPjzs+Dnd9H2vojxfvug3tVpO2J6tVqytnhhzsbr/ZGATq9mEbSO0ZdE3VU74DXJwjdsFNjJ4eT+hxYqANRTtdxG/jQ732qNgKdm8K7DRYyOw7wusJhaAukTC0wIzcX1Hz/iM+tw8rdUT0UwuCSVPZ3sjWzNrx0OBYDXrXyM1zY9aQ78K1HRkTjffzWrC+obn48j+tLDODeYb5m7Bvgx9n7UAq+ilnGTUZqDNCGNO0H8i4BQBmgsfwYH4yz5SIaz9r4H1iQQsf3EFz9I6GQN16sPlI56vaM2eImAS2DUlrw7K45TOQE3tO09F5CSkrDZQuneekj642pzDY6+kzyxp5/LYM5XWmDwPwr5wbxdPP5cUxtWe5K2E5PkwsBXWwi73LeC5FfugZ49dAp4eIgkApx/d5Bp5LL9HKAMBC5U9RdKYvh2wBYVsB9FjPEdSAyEeAm7DztqP8VgN3nogdWF+nLjmLGcAmz6j+FkTsCV5XkfnLLIELRwRFSStnFVamrEGbl9DdGAyDL/OnMFjC4HbvYrHci5rRvbRAv+UKql2ZI10pPIKHbNaHptAKF8FZrIT7BRQrR/y7AaOjga8ntt/g/0V1m2oPYS6qU38MzFeG65K/gQYAIkWIBiH2BUZAAAAAElFTkSuQmCC" />
				<span id="title" title="点击修改文件名"><%=name %></span>
			</div>
			<div id="items">
				<span id="document">文件</span><span id="start">样式</span><span id="insert">插入</span><span id="tableButton">表格</span><span id="funs">函数</span><span id="other">其他</span><span title="使用全屏,编辑更方便" id="requstFullScreen">全屏</span><span id="help">帮助</span><span id="login" style="float: right;margin-right: 50px;">登录</span>
			</div>
		</div>
		
		<div id="lists" style="z-index: 1000;">
			<!--document_list is a list for document-->
			<ul id="document_list" style="margin-left: 162px;">
				<li id="lock" title="在输入框中不填入任何值则会取消加密">加密</li>
				<li id="save">保存(下载)</li>
				<li id="saveInBrowser" style="display: none;">存为浏览器文件</li>
				<li id="saveInServie" style="display: none;">存为云文件</li>
				<li id="myDoc" style="display: none;">我的文件</li>
			</ul>
			<!--这是"文字"按钮的下拉菜单-->
			<ul id="start_list" style="margin-left: 216px;">
				<li id="fontFamily">字体</li>
				<li id="fontSize">字号</li>
				<li id="color">颜色</li>
				<li id="textAlign">对齐方式</li>
				<li id="fontStyle">字体样式</li>
				<li id="search">查找替换</li>
			</ul>
			<!--这是"插入"按钮的下拉菜单-->
			<ul id="insert_list" style="margin-left: 270px;">
				<li id="img">
					<label title="图片尽量不要太大(整个表格的总大小不能超过400M,否则可能无法储存.)" for="file">图片</label><input type="button" value="确定" />
					<input type="file" id="file" name="" style="display: none"/>
				</li>
				<li id="link">超链接</li>
				<li id="addRow">增加一行</li>
				<li id="addLine">增加一列</li>
			</ul>
			<ul id="tableButton_list" style="margin-left: 328px;">
				<li id="collaspe_right" title="同时按住Ctrl和方向右键可向右合并单元格">向右合并(Ctrl+ →)</li>
				<li id="collaspe_down" title="同时按住Ctrl和方向下键可向下合并单元格">向下合并(Ctrl+ ↓)</li>
				<li id="splite">分割</li>
				<li id="cutRow">删除此行</li>
				<li id="cutLine">删除此列</li>
				<li id="bigToSmall">从大到小排序</li>
				<li id="smallToBig">从小到大排序</li>
			</ul>
			<ul id="funs_list" style="margin-left: 380px;">
				<li id="sum">求和</li>
				<li id="count">计数</li>
				<li id="logic">逻辑</li>
				<li id="statistics">统计</li>
				<li id="math">数学</li>
				<li id="funs_other">其他</li>
			</ul>
			<ul id="other_list" style="margin-left: 438px;">
				<li id="print">打印</li>
				<li id="playNote">打开笔记本</li>
				<li id="jumpTo" title="跳转后输入任意字符可以使视野移到跳转目标">跳转到特定单元格</li>
				<li title="Excel可将文件存为txt">
					<input type="file" id="installTxt" style="display: none;">
					<label for="installTxt" title="Excel可将文件转化为txt">引入txt文件</label><input type="button" value="确定" id="installTxt_enter" />
				</li>
				<li title="点此引入插件">
					<input type="file" id="install" style="display: none;">
					<label for="install">引入插件</label><input type="button" value="确定" id="install_enter" />
				</li>
			</ul>
			<ul id="help_list" style="margin-left:540px;">
				<li id="unable_to_save">无法保存(下载)?</li>
			</ul>
			<ul id="fontFamily_list" style="margin-left: 336px;margin-top: 0.5em;">
				<li style="font-family: 'Consolas';">Consolas</li>
				<li style="font-family: 'courier new';">courier new</li>
				<li style="font-family: '微软雅黑';">微软雅黑</li>
				<li style="font-family: '宋体';">宋体</li>
				<li style="font-family: '隶书';">隶书</li>
				<li style="font-family: '等线';">等线</li>
				<li style="font-family: '等线 light';">等线 light</li>
				<li style="font-family: '方正兰亭超细黑简体';">方正兰亭超细黑简体</li>
				<li style="font-family: '方正舒体';">方正舒体</li>
				<li style="font-family: '方正姚体';">方正姚体</li>
				<li style="font-family: '仿宋';">仿宋</li>
				<li style="font-family: '华文彩云';">华文彩云</li>
				<li style="font-family: '华文行楷';">华文行楷</li>
				<li style="font-family: '华文仿宋';">华文仿宋</li>
				<li style="font-family: '华文琥珀';">华文琥珀</li>
				<li style="font-family: '楷体';">楷体</li>
				<li><input id="fontFamily_input" type="text" style="width: 7em;border: solid 0.5px;" placeholder="请输入其他字体" /><input type="button" id="fontFamily_enter" value="确定"/></li>
			</ul>
			<ul id="color_list" style="margin-left: 336px;margin-top: 1.5em;">
				<li id="fontColor">字体颜色</li>
				<li id="bgColor">背景颜色</li>
			</ul>
			<ul id="fontSize_list" style="margin-left: 336px;margin-top: 1.5em;">
				<li>12</li>
				<li>15</li>
				<li>18</li>
				<li>28</li>
				<li><input type="text" style="width: 7em;border: solid 0.5px;" placeholder="请输入其他字号" id="fontSize_input" /><input type="button" id="fontSize_enter" value="确定"/></li>
			</ul>
			<ul id="textAlign_list" style="margin-left: 336px;margin-top: 1.5em;">
				<li class="left">左对齐</li>
				<li class="right">右对齐</li>
				<li class="center">居中对齐</li>
				<li class="justify">两端对齐</li>
			</ul>
			<ul id="fontStyle_list" style="margin-left: 336px;margin-top: 5em;">
				<li id="bold" style="font-weight: bold;">加粗</li>
				<li id="null">正常</li>
				<li id='italic' style="font-style: italic;">斜体</li>
				<li id="underline" style="text-decoration: underline;">下划线</li>
				<li id="line-through" style="text-decoration: line-through;">删除线</li>
			</ul>
			<ul id="search_list" style="margin: 6em 0px 0px 336px;">
				<li><input id="searching" type="text" placeholder="查找内容"></li>
				<li><input id="replaceTo" type="text" placeholder="替换为"/></li>
				<li><input id="replace" type="button" style="width: 3em;" value="替换"><input id="searchNext" type="button" style="width: 7em;" value="查找下一处"></li>
			</ul>
			<ul id="sum_list" style="margin: 0.5em 0px 0px 498px;">
				<li title="sum(始:末[,扩展区域])">sum 求和函数</li>
				<li title="sumif(始:末,条件[,扩展区域])">sumif 条件求和</li>
				<li title="sumifs(始:末,[条件1始:条件1末,条件1,[条件2始:条件2末,条件2[...]]])">sumifs 多条件求和</li>
			</ul><ul id="count_list" style="margin: 1.5em 0px 0px 498px;">
				<li title="count(始:末[,扩展区域])">count 计数函数</li>
				<li title="countif(始:末,条件[,扩展区域])">countif 条件计数</li>
				<li title="countifs(始:末,[条件1始:条件1末,条件1,[条件2始:条件2末,条件2[...]]])">countifs 多条件计数</li>
			</ul><ul id="logic_list" style="margin: 2.5em 0px 0px 498px;">
				<li title="if(条件,符合条件的返回值,不符合的返回值[,扩展区域])">if 条件判断</li>
				<li title="max(始:末[,扩展区域[,分割区域]])">max 求最大值</li>
				<li title="min(始:末[,扩展区域[,分割区域]])">min 求最小值</li>
				<li title="slice(被分割的句子,始位置[,末位置//负数始末位置表示从后开始数][,扩展区域])">slice 分割句子</li>
			</ul><ul id="statistics_list" style="margin: 3.5em 0px 0px 498px;">
				<li title="average(始:末[,扩展区域])">average 求平均数</li>
				<li title="mode(始:末[,扩展区域])">mode 求众数</li>
				<li title="median(始:末[,扩展区域])">media 求中位数</li>
				<li title="rank(列号或行号或区域[,降序或升序])">rank 求名次(序号)</li>
			</ul><ul id="math_list" style="margin: 5.5em 0px 0px 498px;">
				<li title="abs(判断位置,扩展区域)">abs 求绝对值</li>
				<li title="pow(底数,指数)">pow 幂函数</li>
			</ul><ul id="funs_other_list" style="margin: 6.5em 0px 0px 498px;">
				<li id="typeCode" title="用户可以使用JavaScript语言自己编写函数,该函数的return值将会返回到编辑的表格中">编程</li>
			</ul>
			<ul id="colorList" style="margin-left: 436px;width: 150px;overflow: hidden;">
				<li><span style="background-color: #000000;"></span><span style="background-color: #993300;"></span><span style="background-color: #333300;"></span><span style="background-color: #000080;"></span><span style="background-color: #333399;"></span><span style="background-color: #333333;"></span></li><li><span style="background-color: #800000;"></span><span style="background-color: #FF6600;"></span><span style="background-color: #808000;"></span><span style="background-color: #008000;"></span><span style="background-color: #008080;"></span><span style="background-color: #0000FF;"></span></li><li><span style="background-color: #666699;"></span><span style="background-color: #808080;"></span><span style="background-color: #FF0000;"></span><span style="background-color: #FF9900;"></span><span style="background-color: #99CC00;"></span><span style="background-color: #339966;"></span></li><li><span style="background-color: #33CCCC;"></span><span style="background-color: #3366FF;"></span><span style="background-color: #800080;"></span><span style="background-color: #999999;"></span><span style="background-color: #FF00FF;"></span><span style="background-color: #FFCC00;"></span></li><li><span style="background-color: #FFFF00;"></span><span style="background-color: #00FF00;"></span><span style="background-color: #00FFFF;"></span><span style="background-color: #00CCFF;"></span><span style="background-color: #993366;"></span><span style="background-color: #C0C0C0;"></span></li><li><span style="background-color: #FF99CC;"></span><span style="background-color: #FFCC99;"></span><span style="background-color: #FFFF99;"></span><span style="background-color: #CCFFFF;"></span><span style="background-color: #99CCFF;"></span><span style="background-color: #FFFFFF;"></span></li>
				<li></li>
			</ul>
		</div>
		<%--table.outerHTML --%>
		<%
		String myOut=br.readLine();
		while(myOut!=null&&!myOut.equals("~~~~~~~~~~~~~~~~~~~~~~~~~~~")){
			out.print(myOut);
			myOut=br.readLine();
		}
		 %>
		<a id="adv" target="_blank" href="http://www.hOffice.com.cn">亲,你也可以使用hOffice哦</a>
		<textarea id="table_input" style="position: absolute;display: none;border: deepskyblue 1px;"></textarea>
		<textarea id="note" placeholder="笔记本" style="position: fixed;display:none;height: 100px;width: 250px;right: 20px;top: 30px;"></textarea>
		<script id="beforeFuns" type="text/javascript">
			//设置before_save()方法,以免出错
			function before_save(){
				var netJs=document.getElementsByClassName("fromNet");
				while(netJs.length>0){
					netJs[0].parentNode.removeChild(netJs[0]);
				}
				var fromNet=$("fromNet");
				var script=document.createElement("script");
				document.body.insertBefore(script,fromNet);
				document.body.removeChild(fromNet);
				script.type="text/javascript";
				script.id="fromNet";
				$("document_list").style.display="none";
			}
		</script>
		<!--[if gt IE8]>
			<script type="text/javascript">
				Element.prototype.addEventListener=function(arg0,arg1){
					this.attachEvent("on"+arg0,arg1);
				}
			</script>
		<![endif]-->
		<script id="callbacksOfClick" type="text/javascript" language="JavaScript">
			//该方法用于增加列数,如addLine("A")="B";
			function addLineCount(str,isCut){
				str=str+"";
				if(!isCut){
					if(str===""){return "A"};
					var lastCode=str.charCodeAt(str.length-1);
					str=str.slice(0,str.length-1);
					if(lastCode<90){
						str+=String.fromCharCode(lastCode+1);
					}else{
						str=addLineCount(str)+"A";
					}
				}else{
					if(str==="A")return "";
					var lastCode=str.charCodeAt(str.length-1);
					str=str.slice(0,str.length-1);
					if(lastCode>65){
						str+=String.fromCharCode(lastCode-1);
					}else{
						str=addLineCount(str,true)+"Z";
					}
				}
				return str;
			}
			if(window.jQuery){
				JQuery.noConflict();
			}
			//定义自己的$方法
			function $(div_str,p2,p3,p4,p5,p6,p7){
				if(window.JQuery){
					if(/^[A-z0-9]/.test(div_str)){
						div_str="#"+div_str;
					}
					return JQuery(div_str,p2,p3,p4,p5,p6,p7);
				}
				if(/^#/.test(div_str)){
					div_str=div_str.slice(1);
				}
				return document.getElementById(div_str);
			}
			
			/*
			 * String类型的公有方法,用于更正标点符号
			 */
			String.prototype.EUpper=function(notToUpper){
				var str=this.toString();
				str=str.replace(/：/g,":");
				str=str.replace(/，/g,",");
				str=str.replace(/；/g,";");
				str=str.replace(/（/g,"(");
				str=str.replace(/）/g,")");
				if(notToUpper){
					return str;
				}else{
					return str.toUpperCase();
				}
			}
			
			HTMLCollection.prototype.getElementByInnerText=function(innerText){
				for(var i=0;i<this.length;i++){
					if(this[i].innerText==innerText)return this[i];
				}
			}
			
			/**
			 * 加密
			 */
			if(document.body.id&&document.body.id!="keyword:"){
				var body=document.body;
				body.style.display="none";
				setTimeout(function(){
					var keyword=prompt("该文件已加密,请输入密码:");
					if(("keyword:"+keyword)==document.body.id){
						body.style.display="block";
					}
				},500);
			}
			$("lists").onkeydown=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				if(/input/i.test(target.tagName)){
					searchTimeCopy=0;
				}
			}
			var title=$("title");
			title.changeName=function(innerText){
				this.innerText=innerText;
			}
			function myRequestFullScreen(isNotExit){
				if(isNotExit){
					//进入全屏
					var docElm = document.documentElement;
					if (docElm.requestFullscreen) {  
					    docElm.requestFullscreen();  
					}else if (docElm.mozRequestFullScreen) {  
					    docElm.mozRequestFullScreen();  
					}else if (docElm.webkitRequestFullScreen) {  
					    docElm.webkitRequestFullScreen();  
					}else if (docElm.msRequestFullscreen) {
					  	document.body.msRequestFullscreen();
					  	alert("我们已为您跳转到了全屏模式,但您的浏览器对我们设置的全屏不完全兼容,如由异常,请退出全屏再按f11手动进入全屏.")
					}else{
						alert("对不起,因为浏览器版本原因,我们无法为你设置全屏,请按f11进入全屏");
					}
				}else{
					//退出全屏
					var de = document;
				    if (de.exitFullscreen) {
				        de.exitFullscreen();
				    } else if (de.mozCancelFullScreen) {
				        de.mozCancelFullScreen();
				    } else if (de.webkitCancelFullScreen) {
				        de.webkitCancelFullScreen();
				    }else if(de.msExitFullscreen){
				    	de.msExitFullscreen();
				    }else{
				    	alert("对不起,因为浏览器版本原因,我们无法为你设置全屏,请按f11退出全屏");
				    }
				}
			}
			/**
			 * 该方法用于更改元素的display属性,如果display为none,则改为block,反之亦然
			 * 但当setNone==true时,obj的display属性将被改为none
			 */
			function myChangeDisplay(obj){
				changeDisplay(obj);
				var id=obj.id;
				var objs=obj.parentNode.getElementsByTagName("ul");
				for(var i=0;i<objs.length;i++){
					if(objs[i].id!=id){
						objs[i].style.display="none";
					}
				}
			}
			function changeDisplay(obj){
				if(!obj.style.display||obj.style.display=="none"){
					obj.style.display="block";
				}else{
					obj.style.display="none";
				}
			}
			
			function contains(container,contained){
				if(contained==container){
					return true;
				}else{
					try{
						while(contained){
							contained=contained.parentNode;
							if(container==contained)return true;
						}
						return false;
					}catch(e){
						return false;
					}
				}
			}
			function getUserRange(returnSelection){
				var userRange;
				if(window.getSelection){
					try{
						if(returnSelection)return getSelection();
						userRange=getSelection().getRangeAt(0);
					}catch(e){
						userRange=false;
					}
					return userRange;
				}else{
					alert("Sorry,您的浏览器版本过低,暂不支持该功能,请升级您的浏览器,谢谢!");
				}
			}
			document.body.onmousedown=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				if(!/textArea/i.test(target.tagName)&&!/input/i.test(target.tagName)){
					return false;
				}
			};
			window.onclick=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				if(target.id!="table_input"&&!/td/i.test(target.tagName)&&!contains($("head"),target)&&!contains($("lists"),target)){
					var input=$("table_input");
					if(dragCell.inputTarget!==null){
						//如果以前的选中单元格存在并不是图片或视频或函数,则将其内容改为输入框中的内容
						if(dragCell.inputTarget!==null&&!hasClassOf(dragCell.inputTarget,"free")){
							//如果之前选中单元格的输入内容为函数,则执行函数
							if(dragCell.inputTarget.name&&dragCell.inputTarget.name!="null"){
								dragCell.inputTarget.name=input.value.slice(1);
								startFun(dragCell.inputTarget.name);
							}else
							//如果之前选中的单元格中的内容是超链接,则将input.value作为innerHTML插入
							if(hasClassOf(dragCell.inputTarget,"insertHTML")){
								dragCell.inputTarget.innerHTML=input.value;
							}else{
								dragCell.inputTarget.innerText=input.value;
							}
						}
					}
					input.style.display="none";
					dragCell.inputTarget=null;
				}
			}
			//lists菜单栏中所有的按钮统一绑定事件
			$("lists").onmouseover=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				var id=target.id;
				if(id){
					id+="_list";
					var obj_list;
					if(obj_list=$(id)){
						obj_list.style.display="block";
						obj_list.onmouseout=function(){
							this.style.display="none";
						}
					}
				}
				target.parentNode.style.display="block";
				if(target.parentNode.parentNode){
					target.parentNode.parentNode.style.display="block";
				}
			}
			$("lists").onmouseout=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				var id=target.id;
				if(id){
					id+="_list";
					try{
						document.getElementById(id).style.display="none";
					}catch(e){}
				}
			}
			var searchTime,searchTimeCopy;
			function search(searching_str,parentNode){
				//遍历parentNode
				if(parentNode.childNodes.length>=1){
					var childNodes=parentNode.childNodes;
					for(var i=0;i<childNodes.length;i++){
						var returning=search.call(this,searching_str,childNodes[i]);
						if(returning===true){
							continue;
						}else{
							return false;
						}
					}
					return true;
				}else if(parentNode.nodeName=="#text"){
					var reg=new RegExp(searching_str);
					var index,totleIndex=0,str=parentNode.nodeValue;
					for(var i=this.searchTime;i>0;i--){
						index=str.search(reg);
						if(index<0){
							break;
						}else{
							totleIndex+=index+searching_str.length;
							str=str.slice(index+searching_str.length);
						}
					}
					this.searchTime=i;
					if(index<0||this.searchTime>0){
						return true;//return true 表示继续进行
					}else{
						var userSelection;
						try{
							userSelection=getSelection();
						}catch(e){
							alert("Sorry,你的浏览器版本太低不支持此功能,请升级或更新浏览器,谢谢!");
							return false;//return false表示此方法到此为止
						}
						var userRange=document.createRange();
						userRange.setStart(parentNode,totleIndex-searching_str.length);
						userRange.setEnd(parentNode,totleIndex);
						userSelection.removeAllRanges();
						userSelection.addRange(userRange);
						return false;//return false表示此方法到此为止
					}
				}else{
					return true;
				}
			}
			$("table").onmousemove=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				if(/thead/i.test(target.parentNode.parentNode.tagName)){
					var x=getRelativePosition(target,event,"x");
					var width=getStyle(target,"width");
					if(x>width-4){
						target.style.cursor="col-resize";
						target.onmousedown=dragCell.dragCellW;
					}else if(x<4){
						target.style.cursor="col-resize";
						target.onmousedown=null;
					}else{
						target.style.cursor="cell";
						target.onmousedown=dragCell.normalMousedown;
					}
				}else if(/\browCount\b/.test(target.className)){
					var y=getRelativePosition(target,event,"y");
					var height=getStyle(target,"height");
					if(y>height-4){
						target.style.cursor="row-resize";
						target.onmousedown=dragCell.dragCellH;
					}else if(y<4){
						target.style.cursor="row-resize";
						target.onmousedown=null;
					}else{
						target.style.cursor="cell";
						target.onmousedown=dragCell.normalMousedown;
					}
				}
			}
			
			var dragCell={
				target:null,
				inputTarget:null,
				minHeight:15,
				lineCount:"B",//列数
				rowCount:2,//行数
				chosedClassName:null,//被选中的className
				imgW:200,
				imgH:120,
				dragCellW:function(event){
					event=event||window.event;
					window.onmousemove=dragCell.windowOnmousemoveW;
					window.onmouseup=dragCell.windowOnmouseup;
					dragCell.target=this;
				},
				dragCellH:function(event){
					event=event||window.event;
					dragCell.target=this;
					window.onmousemove=dragCell.windowOnmousemoveH;
					window.onmouseup=dragCell.windowOnmouseup;
				},
				windowOnmouseup:function(){
					window.onmousemove=null;
					window.onmouseup=null;
					dragCell.target=null;
				},
				windowOnmousemoveW:function(event){
					event=event||window.event;
					var x=getRelativePosition(dragCell.target,event,"x");
					dragCell.target.style.width=x+"px";
					if(dragCell.inputTarget&&dragCell.inputTarget.className.match(/[A-Z]+/)==dragCell.target.innerText){
						$("table_input").style.width=x+"px";
					}
					try{
						$("table_input").style.left=dragCell.inputTarget.offsetLeft+21+"px";
					}catch(e){}
					return false;
				},
				windowOnmousemoveH:function(event){
					event=event||window.event;
					var y=getRelativePosition(dragCell.target,event,"y");
					if(y>dragCell.minHeight){
						dragCell.target.style.height=y+"px";
						dragCell.target.style.lineHeight=y+"px";
						if(dragCell.inputTarget&&dragCell.inputTarget.parentNode==dragCell.target.parentNode){
							$("table_input").style.height=y+"px";
						}
					}else{
						dragCell.target.style.height=dragCell.minHeight+"px";
						dragCell.target.style.lineHeight=dragCell.minHeight+"px";
						if(dragCell.inputTarget&&dragCell.inputTarget.parentNode==dragCell.target.parentNode){
							$("table_input").style.height=dragCell.minHeight+"px";
						}
					}
					try{
						$("table_input").style.top=dragCell.inputTarget.offsetTop+61+"px";
					}catch(e){}
					return false;
				},
				normalMousedown:function(event,des_str){
					var className,
					myStyle=$("chooserStyle"),
					str=null;
					if(/rowCount/i.test(this.className)){
						className="r"+this.innerText;
					}else{
						className=this.innerText;
					}
					if(myStyle){
						document.head.removeChild(myStyle);
					}
					myStyle=document.createElement("style");
					myStyle.id="chooserStyle";
					myStyle.type="text/css";
					myStyle.innerText="."+className+"{background-color:#D9EFE7;}";
					document.head.appendChild(myStyle);
					dragCell.chosedClassName=className;
					this.onclick=null;
				}
			};
			
			/**
			 * 输入一个数组,返回一个数组,该数组为原数组的排序 
			 * 如arr=[4,6,1] return [2,1,3]		(isdown=true)
			 * isdown 是否为降序
			 */
			function rankArr(arr,isdown,getArrangedArr){
				var marr=[];
				for(var i=0;i<arr.length;i=marr.push(i+1)){}
				for(var i=0,v;i<arr.length;i++){
					for(var i1=0;i1<arr.length-i-1;i1++){
						if((arr[i1]>arr[i1+1])!=isdown){
							v=arr[i1+1];
							arr[i1+1]=arr[i1];
							arr[i1]=v;
							v=marr[i1+1];
							marr[i1+1]=marr[i1];
							marr[i1]=v;
						}
					}
				}
				if(getArrangedArr)return arr;
				arr=[];
				for(var i=0;i<marr.length;i=arr.push(i+1)){}
				for(var i=0,v;i<marr.length;i++){
					for(var i1=0;i1<marr.length-i-1;i1++){
						if(marr[i1]>marr[i1+1]){
							v=arr[i1+1];
							arr[i1+1]=arr[i1];
							arr[i1]=v;
							v=marr[i1+1];
							marr[i1+1]=marr[i1];
							marr[i1]=v;
						}
					}
				}
				return arr;
			}
			
			/**!注意,此对象中的方法极其复杂,且较为可靠,请尽量调用,少做更改
			 * 其中所有字母均大写的方法为用户可以调用的方法
			 */
			var userFuns={
				attention:"Sorry ,您的函数好像有点儿问题!",
				start:null,
				end:null,
				arg1:null,
				arg2:null,
				putIn:function(ans,notAlert,target){
					if(notAlert===null)return null;
					target=target||dragCell.inputTarget;
					if(target.innerText!=""&&!notAlert){
						if(confirm("继续执行函数会损坏原有数据,是否继续执行?")){
							target.innerText=ans;
							return true;
						}else{
							return null;
						}
					}else{
						target.innerText=ans;
						return notAlert;
					}
				},
				checkLineCounts:function(smaller,bigger){
					var jd=false;
					for(var i=smaller;i!=addLineCount(dragCell.lineCount);i=addLineCount(i)){
						if(i==bigger){jd=true;break;}
					}
					return jd;
				},
				/**userFuns.computeSupport
				 * 该函数用于支持函数的跨域运算,即对一行或一列中的一部分单元格中的内容进行运算
				 * @param {Array} arr 
				 * 		-此数组的长度必须为单数(否则将会报错),且第一项为计算区域,如"a1:b1"或"a1:a3",不区分大小写;
				 * 		-第一项以后为 判断区域(类似于第一项) 和 判断条件 交替出现
				 * @param {Function} callBack 回调函数;
				 * 	-原函数在运行过程中会遍历计算区域中所有单元格,每循环到一个单元格,就会调用该回调函数;
				 * 	-回调函数参数为:
				 * 		ans:上一次处理得到的答案
				 * 		inner: 此次获取的单元格中的内容,不会自动转化为number类型
				 * 		j (logicalTestResult): 条件判断的结果 (如所有条件判断结果为true,则j为true,如果有一个以上条件判断结果为false,则j为false)
				 * 	-返回值将作为ans继续参与循环,循环结束后(没有报错)原函数返回ans
				 */
				computeSupport:function(arr,callBack){
					try{
						var se=arr.shift().split(":");
						var lineAdd=se[0].match(/[A-Z]+/).toString()==se[1].match(/[A-Z]+/).toString(),
						rowAdd=+se[0].match(/[0-9]+/)==+se[1].match(/[0-9]+/);
						if((lineAdd&&rowAdd)||!(lineAdd||rowAdd)){
							throw Error;
						}else{
							var ans=0;
							if(arr.length%2!=0)throw Error;
							if(lineAdd){//纵向相加
								var start=+se[0].match(/[0-9]+/),end=+se[1].match(/[0-9]+/),lineCount=se[0].match(/[A-Z]+/);
								if(start>end||end>dragCell.rowCount)throw Error;
								for(var i=0,v,j=true;i<end;i++,j=true){
									v=getElementByClassNames(lineCount,"r"+(i+1)).innerText;
									for(var i2=0,v2;i2<arr.length;i2+=2){
										v2= +getElementByClassNames(arr[i2].match(/[A-Z]+/),"r"+(i+1)).innerText;
										if(!eval(v2+arr[i2+1])){
											j=false;break;
										}
									}
									ans=callBack(ans,v,j);
								}
							}else{//横向相加
								var start=se[0].match(/[A-Z]+/),end=se[1].match(/[A-Z]+/),rowCount="r"+se[0].match(/[0-9]+/);
								if(!userFuns.checkLineCounts(start,end))throw Error;
								for(var i=start,v,j=true;i!=addLineCount(end);i=addLineCount(i),j=true){
									v=getElementByClassNames(i,rowCount).innerText;
									for(var i2=0,v2;i2<arr.length;i2+=2){
										v2= +getElementByClassNames(i,arr[i2].match(/[0-9]+/)).innerText;
										if(!eval(v2+arr[i2+1])){
											j=false;break;
										}
									}
									ans=callBack(ans,v,j);
								}
							}
							return ans;
						}
					}catch(e){
						alert(userFuns.attention);
						return "";
					}
				},
				/**userFuns.c_deal
				 * 此方法用于进一步支持函数的跨域运算(参见userFuns.computedSupport)
				 * ,并解决了computedSupport方法无法在回调函数中使用原函数内部数据的问题
				 * @param {Array} arr	-参见computedSupport方法中的arr参数
				 * @param {Object} arg1	-可在回调函数中使用的参数,在回调函数中以userF.arg1调用
				 * @param {Object} arg2	-与arg1同
				 * @param {Function} callBack	-参见computedSupport方法中的callBack参数
				 */
				c_deal:function(arr,arg1,arg2,callBack){
					try{
						userFuns.arg1=arg1;
						userFuns.arg2=arg2;
						return userFuns.computeSupport(arr,function(ans,inner,j){
							return callBack(ans,inner,j);
						});
					}catch(e){}finally{
						userFuns.arg1=userFuns.arg2=null;
					}
				},
				_ifs:function(arr,isAdd){
					return userFuns.c_deal(arr,arr,isAdd,function(ans,v,j){
						if(userFuns.arg2){
							v=+v;
							v=(isNaN(v)||!j)?0:v;
						}else{
							v=(isNaN(+v)||v==""||!j)?0:1;
						}
						return ans+v;
					});
				},
				sumifs:function(arr){
					return userFuns._ifs(arr,true);
				},
				SUMIFS:function(arr){
					userFuns.putIn(userFuns.sumifs(arr));
				},
				countifs:function(arr){
					return userFuns._ifs(arr,false);
				},
				COUNTIFS:function(arr){
					userFuns.putIn(userFuns.countifs(arr));
				},
				_max:function(arr,arrNormal,ismin){
					if(!ismin)ismin=false;
					try{
						var se=arr.shift().split(":");
						var lineCompare=se[0].match(/[A-Z]+/).toString()==se[1].match(/[A-Z]+/).toString(),
						rowCompare=+se[0].match(/[0-9]+/)==+se[1].match(/[0-9]+/);
						if((lineCompare&&rowCompare)||!(lineCompare||rowCompare)){
							throw Error;
						}else{
							var sliceSE,max=NaN;
							try{
								sliceSE=arr.shift().match(/[0-9]+[^0-9][0-9]+/).toString();
								sliceSE=sliceSE.split(/[^0-9]+/);
							}catch(e){
								sliceSE=null;
							}
							if(lineCompare){
								var start=+se[0].match(/[0-9]+/),end=+se[1].match(/[0-9]+/),lineCount=se[0].match(/[A-Z]+/);
								if(start>end||end>dragCell.rowCount)throw Error;
								var v;
								while(start!=(end+1)&&isNaN(max)){
									max=getElementByClassNames(lineCount,"r"+start).innerText;
									max = max==""?NaN:sliceSE?+max.slice(+sliceSE[0],+sliceSE[1]):+max;
									start++;
								}
								while(start!=(end+1)){
									v=getElementByClassNames(lineCount,"r"+start).innerText;
									v = v==""?NaN:sliceSE?+v.slice(+sliceSE[0],+sliceSE[1]):+v;
									if(!isNaN(v)&&((v<max)==ismin))max=v;
									start++;
								}
							}else{
								var start=se[0].match(/[A-Z]+/).toString(),end=se[1].match(/[A-Z]+/),rowCount=+se[0].match(/[0-9]+/);
								if(!userFuns.checkLineCounts(start,end))throw Error;
								end=addLineCount(end);
								while(start!=end&&isNaN(max)){
									max=getElementByClassNames(start,"r"+rowCount).innerText;
									max = max==""?NaN:sliceSE?+max.slice(+sliceSE[0],+sliceSE[1]):+max;
									start=addLineCount(start);
								}
								var v;
								while(start!=end){
									v=getElementByClassNames(start,"r"+rowCount).innerText;
									v = v==""?NaN:sliceSE?+v.slice(+sliceSE[0],+sliceSE[1]):+v;
									if(!isNaN(v)&&((v<max)==ismin))max=v;
									start=addLineCount(start);
								}
							}
							return max;
						}
					}catch(e){alert(userFuns.attention);return "";}
				},
				//logicalTest字符串的预处理
				logical_pretreatment:function(logical_str,lineTo,rowTo,notToRes){
					if(/[A-z]+[0-9]+/.test(logical_str)){
						var v1=logical_str.split(/[A-z]+[0-9]+/g),
						v2=logical_str.match(/[A-z]+[0-9]+/g);
						logical_str=v1[0];
						for(var i=0,v3;i<v2.length;i++){
							if(lineTo)v2[i]=v2[i].replace(/[A-z]+/,lineTo);
							if(rowTo)v2[i]=v2[i].replace(/[0-9]+/,rowTo);
							if(!notToRes){
								v3=g(v2[i].EUpper()).innerText;
								v3=isNaN(+v3)?"'"+v3+"'":+v3;
							}else{v3=v2[i].EUpper();}
							logical_str+=v3+v1[i+1];
						}
					}
					return logical_str;
				},
				/**@param {Function} userFuns.ifs
				 * -该方法用于为函数提供横向和纵向扩展服务,类似于Excel中的下拉效果
				 * @param {string} userTargetRange 
				 * 		-用户选择的扩展区域,可纵可横.写出首尾并用冒号分开,
				 * 		不区分大小写格式如"a:z"或"A:Z"或"1:3"或"a1:a3"或"a1:c1"
				 * @param {boolean} rowArrange_on_only
				 * 		-大多数情况下意义不大,如该值为true,表示默认横向扩展
				 * @param {String} pretreated_str
				 * 		-被预处理的字符串,被处理后的字符串将会作为参数传给getInner函数
				 * 		-处理方法: 
				 * 			如果字符串中符合以下正则/^["'].*["']$/,则会被剥去一头一尾 slice(1,-1),
				 * 			如果字符串中不符合上诉正则,且
				 * 				notToRes为false,则其中的表格号(/[A-Z]+[0-9]+/)中的列号或行号(和扩展方向一致)将会被换为当前行号或列号
				 * 				notToRes为true,则其中表格号将在notToRes为false的操作(更换行号或列号)的基础上被更换为表格中的内容
				 * @param {Function} getInner
				 * 		-回调函数,其参数为被处理后的pretreated_str,返回值将被填充到该行(或列)与选中单元格对齐的单元格内
				 * @param {boolean} notToRes	(not to result)
				 * 		-详见pretreated_str参数说明
				 */
				ifs:function(userTargetRange,rowArrange_on_only,pretreated_str,getInner,notToRes){
					try{
						var targetRange=userTargetRange.split(":"),
						targetStart=targetRange[0].match(/[A-Z]+/),
						targetEnd=targetRange[1].match(/[A-Z]+/),
						lineArrange;
						if(targetStart==null||targetEnd==null){
							targetStart=targetRange[0].match(/[0-9]+/);
							targetEnd=targetRange[1].match(/[0-9]+/);
							if(targetStart==null||targetEnd==null||(+targetStart> +targetEnd)||(+targetEnd>dragCell.rowCount))throw Error;
							targetStart=+targetStart;
							targetEnd=+targetEnd;
							lineArrange=true;//纵向扩展
						}else{
							if(!userFuns.checkLineCounts(targetStart,targetEnd))throw Error;
							lineArrange=false;
						}
					}catch(e2){
						targetStart=
						targetEnd=
						null;
						if(userTargetRange&&(userTargetRange=="ALL"||userTargetRange=="TRUE")){
							targetStart=0;
							targetEnd=dragCell.rowCount;
							lineArrange=true;
						}else if(rowArrange_on_only){
							lineArrange=false;
						}else{
							lineArrange=true;
						}
					}
					var myPretreated_str;
					if(lineArrange){//纵向扩展
						var lineCount=dragCell.inputTarget.className.match(/[A-Z]+/),notAlert=false;
						targetEnd++;
						while(targetStart<targetEnd){
							//pretreated_str字符串的预处理
							myPretreated_str=/^["'].*["']$/.test(pretreated_str)?pretreated_str.slice(1,-1):userFuns.logical_pretreatment(pretreated_str,null,targetStart,notToRes);
							notAlert=userFuns.putIn(getInner(myPretreated_str)
							,notAlert
							,getElementByClassNames(lineCount,"r"+targetStart));
							targetStart++;
						}
					}else{//横向扩展
						var rowCount=dragCell.inputTarget.className.match(/[0-9]+/),notAlert=false;
						targetEnd=addLineCount(targetEnd);
						while(targetStart!=targetEnd){
							//pretreated_str字符串的预处理
							myPretreated_str=/^["'].*["']$/.test(pretreated_str)?pretreated_str.slice(1,-1):userFuns.logical_pretreatment(pretreated_str,targetStart,null,notToRes);
							notAlert=userFuns.putIn(getInner(myPretreated_str)
							,notAlert
							,getElementByClassNames(targetStart,"r"+rowCount));
							targetStart=addLineCount(targetStart);
						}
					}
				},
				/**@param {Function} userFuns.deal
				 * 该方法用于为标准的IF类型函数提供纵向延伸的服务,
				 * 主要为解决userFuns.ifs方法中回调函数无法调取函数中数据的问题
				 * @param {Array} arr
				 * 		0:pretreated_str
				 * 			-被预处理的字符串,处理后会被作为参数传给回调函数dealCallBack,处理方法和userFuns.ifs中的pretreated_str相同
				 * 		1:value_if_true(start)	将被写为userFuns.start供给dealCallBack调用
				 * 		2:value_if_false(end)	将被写为userFuns.end供给dealCallBack调用
				 * 		3:userTargetRange	
				 * 			-用户选择的扩展区域,详见于userFuns.ifs方法中的userTargetRange参数
				 * @param {Array} arrNormal	
				 * 		-与arr类似,但区分大小写(arr需要全部转化为大写)
				 * @param {Function} dealCallBack -详见userFuns.ifs中的getInner参数;
				 * 		-回调函数,参数为被处理后的pretreated_str,返回值将会被写入该行(或列)与选中单元格对齐的单元格内
				 * @param {Boolean} notPretreatment 
				 * 		-决定了dealCallBack中出入参数是pretreated_str (arr[0]) 的何种处理方式
				 * 		-详见userFuns.ifs中的参数notToRes;
				 */
				deal:function(arr,arrNormal,dealCallBack,notPretreatment){
					try{
						var str=arrNormal[0];
						userFuns.start=isNaN(+arrNormal[1])?arrNormal[1]:+arrNormal[1];
						userFuns.end=isNaN(+arrNormal[2])?arrNormal[2]:+arrNormal[2];
						var rowArrange_on_only;
						try{
							rowArrange_on_only= str.match(/[A-z]+/).toString().toUpperCase()==dragCell.inputTarget.className.match(/[A-z]+/).toString();
						}catch(e2){
							rowArrange_on_only=true;
						}
						userFuns.ifs(
							arr[3]
							,rowArrange_on_only
							,str
							,function(argument){
								if(/^["'].*["']$/.test(argument))argument=argument.slice(1,-1);
								return dealCallBack(argument);
							},
							notPretreatment
						);
					}catch(e){alert(userFuns.attention);}finally{
						userFuns.start=userFuns.end=null;
					}
				},
				MAX:function(arr,arrNormal,ismin){
					arr=[arr[0],arr[2],null,arr[1]];
					userFuns.deal(arr,arr,function(arg){
						return userFuns._max([arg,userFuns.start],null,ismin);
					},true);
				},
				MIN:function(arr,arrNormal){
					userFuns.MAX(arr,arrNormal,true);
				},
				IF:function(arr,arrNormal){
					userFuns.deal(arr,arrNormal,function(myLogicalTest){
						return eval(myLogicalTest)?userFuns.start:userFuns.end;
					});
				},
				SUMIF:function(arr,arrNormal){
					arr=[arr[0],arr[1],null,arr[2]];
					userFuns.deal(arr,arr,function(arg){
						return userFuns.sumifs([arg,arg,userFuns.start]);
					},true);
				},
				SUM:function(arr){
					userFuns.SUMIF([arr[0],"||true",arr[1]]);
				},
				COUNTIF:function(arr,arrNormal){
					arr=[arr[0],arr[1],null,arr[2]];
					userFuns.deal(arr,arr,function(arg){
						return userFuns.countifs([arg,arg,userFuns.start]);
					},true);
				},
				COUNT:function(arr){
					userFuns.COUNTIF([arr[0],"||true",arr[1]]);
				},
				SLICE:function(arr,arrNormal){
					userFuns.deal(arr,arrNormal,function(arg){
						return arg.slice(userFuns.start,userFuns.end);
					});
				},
				REPLACE:function(arr,arrNormal){
					userFuns.deal(arr,arrNormal,function(arg){
						return arg.replace(new RegExp(userFuns.start,"g"),userFuns.end);
					});
				},
				AVERAGEIFS:function(arr){
					var arrCopy=arr.slice(0);
					var ans=+userFuns._ifs(arr,true)/ +userFuns._ifs(arrCopy,false);
					userFuns.putIn(ans);
				},
				/**
				 * 该方法用于返回一个横向或纵向区域内的平均数
				 * @param {Array} arr
				 * 		0:computeRange 计算区域
				 * 		1:logicalTest 判断条件
				 */
				averageif:function(arr){
					arr=arr.slice(0,2);
					arr=[arr[0],arr[0],arr[1]];
					var arrCopy=arr.slice(0);
					return +userFuns._ifs(arr,true)/ +userFuns._ifs(arrCopy,false);
				},
				AVERAGEIF:function(arr){
					arr=[arr[0],arr[1],null,arr[2]];
					userFuns.deal(arr,arr,function(arg){
						return userFuns.averageif([arg,userFuns.start]);
					},true);
				},
				AVERAGE:function(arr){
					userFuns.AVERAGEIF([arr[0],"||true",arr[1]]);
				},
				AVG:function(arr){
					userFuns.AVERAGE(arr);
				},
				modeifs:function(arr){//众数,如所有的数都仅出现了一次,则返回NaN,否则返回最小的众数
					var arr_in=userFuns.computeSupport(arr,function(ans,inner,j){
						if(!j||isNaN(+inner)||inner==""){
							return ans;
						}else if(typeof ans=="number"){
							return [+inner];
						}else{
							ans.push( +inner);
							return ans;
						}
					});
					var obj={},max_count=1,mode=NaN;
					for(var i=0;i<arr_in.length;i++){
						if(obj[arr_in[i]]){
							obj[arr_in[i]]++;
						}else{
							obj[arr_in[i]]=1;
						}
					}
					for(var v in obj){
						if(obj[v]>max_count){
							mode=+v;
							max_count=obj[v];
						}
					}
					return mode;
				},
				MODEIFS:function(arr){
					userFuns.putIn(userFuns.modeifs(arr));
				},
				MODEIF:function(arr){
					arr=[arr[0],arr[1],null,arr[2]];
					userFuns.deal(arr,arr,function(innerText){
						return userFuns.modeifs([innerText,innerText,userFuns.start]);
					},true);
				},
				MODE:function(arr){
					arr=[arr[0],"||true",arr[1]];
					userFuns.MODEIF(arr);
				},
				//返回中位数
				mediaifs:function(arr){
					var arr_in=userFuns.computeSupport(arr,function(ans,inner,j){
						if(!j||isNaN(+inner)||inner==""){
							return ans;
						}else if(typeof ans=="number"){
							return [+inner];
						}else{
							ans.push( +inner);
							return ans;
						}
					});
					arr_in=rankArr(arr_in,false,true);
					if(arr_in.length%2==0){
						var v=arr_in.length/2;
						return (arr_in[v]+arr_in[v-1])/2;
					}else{
						return arr_in[(arr_in.length-1)/2];
					}
				},
				MEDIAIFS:function(arr){
					userFuns.putIn(userFuns.mediaifs(arr));
				},
				MEDIAIF:function(arr){
					arr=[arr[0],arr[1],null,arr[2]];
					userFuns.deal(arr,arr,function(innerText){
						return userFuns.mediaifs([innerText,innerText,userFuns.start]);
					},true);
				},
				MEDIA:function(arr){
					userFuns.MEDIAIF([arr[0],"||true",arr[1]]);
				},
				_ABS:function(arr){
					return Math.abs(+userFuns.logical_pretreatment(arr[0]));
				},
				ABS:function(arr){
					var arrC=[arr[0]+":"+arr[0],null,null,arr[1]];
					userFuns.deal(arr,arr,function(arg){
						var i=arg.match(/[A-Z]+[0-9]+/);
						userFuns._ABS(i?i:arg);
					},true);
				},
				_POW:function(arr){
					return Math.pow(userFuns.logical_pretreatment(arr[0]),userFuns.logical_pretreatment(arr[1]));
				},
				POW:function(arr){
					userFuns.putIn(userFuns._POW(arr));
				},
				RANK:function(arr){
					if(/^[A-Z]+$/.test(arr[0])){
						arr[0]=arr[0]+1+":"+arr[0]+dragCell.rowCount;
					}else if(/^[0-9]+$/.test(arr[0])){
						arr[0]="A"+arr[0]+":"+dragCell.lineCount+arr[0];
					}
					if(!arr[1]){
						arr[1]=true;
					}else{
						arr[1]=/down/i.test(arr[1])?true:false;
					}
					var arr_res=userFuns.computeSupport([arr[0]],function(ans,inner,j){
						if(typeof ans=="number"){
							ans={arr_num:ans,arr_trueText:[]};
						}
						if(isNaN(+inner)||inner==""){
							ans.arr_trueText.push(false);
							return ans;
						}else{
							ans.arr_trueText.push(true);
						}
						if(typeof ans.arr_num=="number"){
							ans.arr_num=[+inner];
							return ans;
						}else{
							ans.arr_num.push( +inner);
							return ans;
						}
					});
					if(!arr_res)return;
					var arr_arrange=rankArr(arr_res.arr_num,arr[1]);
					var se=arr[0].split(":"),arg2;
					if(se[0].match(/[A-Z]+/).toString()==se[1].match(/[A-Z]+/).toString()){
						arg2=[-1,false,+se[0].match(/[0-9]+/),true,dragCell.inputTarget.className.match(/[A-Z]+/).toString()];
					}else{
						arg2=[-1,false,se[0].match(/[A-Z]+/),false,+dragCell.inputTarget.className.match(/[0-9]+/).toString()];
					}
					arg2.push(arr_res.arr_trueText);
					arg2.push(-1);
					userFuns.c_deal(
						[arr[0]]
						,arr_arrange
						,arg2
						,function(ans,inner,j){
							j=userFuns.arg2[3];
							userFuns.arg2[6]++;
							if(userFuns.arg2[5][userFuns.arg2[6]]){
								userFuns.arg2[0]++;
								userFuns.arg2[1]=userFuns.putIn(
									userFuns.arg1[userFuns.arg2[0]]
									,userFuns.arg2[1]
									,j?getElementByClassNames(userFuns.arg2[4],"r"+userFuns.arg2[2]):getElementByClassNames(userFuns.arg2[2],"r"+userFuns.arg2[4])
								);
							}
							j?userFuns.arg2[2]++:userFuns.arg2[2]=addLineCount(userFuns.arg2[2]);
						}
					);
				}
			};
			
			var userLeaderAtt={
				//扩展
				kuozhan:"如您希望函数被纵向(或横向)应用,请输入拓展区域,如不需要请直接按确认键;"
				+"输入 all 代表纵向扩展到整列\n横向扩展例如: a:c,纵向扩展例如: 1:3,不区分大小写和中英文标点."
				//始:末
				,se:"请输入始末单元格的位置,中间用冒号隔开,如: a1:c1 或 a1:a3;\n不区分大小写和中英文标点符号!"
				,logicalTest:"请输入判断条件,系统会自动将每个需要计算的单元格中的\n内容放在判断条件的左边进行判断,如不符合条件,则该单元格的内容不会被计算;"
				+"\n例如: >3 !注意:判断条件中的'='写为'==',写单个等号无效!"
			};
			
			var userLeader={
				sum:[
					userLeaderAtt.se,
					userLeaderAtt.kuozhan
				]
				,sumif:[
					userLeaderAtt.se,
					userLeaderAtt.logicalTest,
					userLeaderAtt.kuozhan
				]
				,sumifs:null
				,count:[
					userLeaderAtt.se,
					userLeaderAtt.kuozhan
				]
				,countif:[
					userLeaderAtt.se,
					userLeaderAtt.logicalTest,
					userLeaderAtt.kuozhan
				]
				,countifs:null
				,IF:[
					"请输入判断条件,条件中可以包含一个单元格位置,(例如: a1>3 ):"
					,"请输入符合判断条件时的返回值(value_if_true),该返回值将会写入被选中的单元格中."
					,"请输入不符合判断条件时的返回值(value_if_false),该返回值将会写入被选中的单元格中."
					,userLeaderAtt.kuozhan
				]
				,max:[
					userLeaderAtt.se,
					userLeaderAtt.kuozhan,
					"请输入分割区域,首位用'~'隔开,如: 1~3,系统会将每个需要计算的单元格中的内容进行分割后再进行计算\n"
					+"如原单元格中内容为: a32,则输入 1~3则系统将会按照 32 来进行比较"
				]
				,min:[
					userLeaderAtt.se,
					userLeaderAtt.kuozhan,
					"请输入分割区域,首位用'~'隔开,如: 1~3,系统会将每个需要计算的单元格中的内容进行分割后再进行计算\n"
					+"如原单元格中内容为: 123,则输入 1~3则系统将会按照 23 来进行比较\n"
					+"!注意: 从0开始数,如 123 中1为第0位,2为第1位,且末位 (上述例子中1~3的第3位不会包含在分割后的结果内)"
				]
				,slice:[
					"请输入需要被分割的句子(如: 你好)或单元格位置(如: a1,不区分大小写):"
					,"请输入开始分割的位置 (如: 0 ),如不输入则默认为0\n"
					+"!注意: 从0开始数,如 123 中1为第0位,2为第1位"
					,"请输入分割结束的位置 (如: 3),仍如上一个参数一样从0开始数\n"
					+",但最后一位不会被包含在结果中"
					,userLeaderAtt.kuozhan
				]
				,average:[
					userLeaderAtt.se
					,userLeaderAtt.kuozhan
				]
				,mode:[
					userLeaderAtt.se
					,userLeaderAtt.kuozhan
				]
				,MEDIA:[
					userLeaderAtt.se
					,userLeaderAtt.kuozhan
				]
				,abs:[
					"请输入数据 (如: -12) 或单元格位置 (如: a1):"
					,userLeaderAtt.kuozhan
				]
				,pow:[
					"请输入底数(可以为单元格位置,如: a1,不区分大小写):"
					,'请输入指数(可以为单元格位置,如: a1,不区分大小写):'
				]
				,lead:function(fun_name,title){
					if(!dragCell.inputTarget){
						alert("Sorry,您还没有选中单元格!");
						return;
					}else if(userLeader[fun_name]==null&&userLeader[fun_name.toUpperCase()]==null){
						alert("该函数不提供自动化支持,使用方法为:\n"+title);
					}else{
						if(userLeader[fun_name]==null)fun_name=fun_name.toUpperCase();
						var input=$("table_input");
						input.value="="+fun_name+"(";
						for(var i=0;i<userLeader[fun_name].length;i++){
							input.value+=prompt(userLeader[fun_name][i])+",";
						}
						input.value=input.value.slice(0,-1);
						input.value+=")";
						dragCell.inputTarget.name="start";
						window.onclick({target:document.body});
					}
				}
				,rank:[
					"请输入排名区域 (如: a1:a3 或 a1:c1),若整行(整列)都需要排序则只需输入行号或列号 (如 a 或 3)"
					,"请输入排名方式,排序方式有down (降序) 或  up (升序) 两种,若不输入则按照降序处理"
				]
			}
			
			/**
			 * 该方法用于执行字符串类型的方法(类似于evel,但默认执行userFuns中的方法)
			 * @param {String} fun_str	方法字符串
			 * @param {Boolean} funsInWindow	慎用!如为true,则会直接调用eval方法
			 */
			function startFun(fun_str,funsInWindow){
				try{
					fun_str=fun_str.EUpper(true);
					var fun_name=fun_str.match(/^[^\(]+/).toString().replace(/\s/g,"");
					var args=fun_str.replace(fun_name,"");
					fun_name=fun_name.EUpper();
					args=args.replace(/\(|\)/g,"");
					args=args.split(/,/g);
					var argsCopy=args.slice(0);
					for(var i=0;i<args.length;i++){
						args[i]=args[i].replace(/[\s]/g,"").toUpperCase();
					}
					userFuns[fun_name](args,argsCopy);
				}catch(e){
					fun_str=userFuns.logical_pretreatment(fun_str);
					try{
						userFuns.putIn(eval(fun_str));
					}catch(e2){alert(userFuns.attention);}
				}
			}
			
			
			$("table").onclick=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				//如果点击的是td且该td不再thead中且不为最左边的一列,则出现输入框,
				if(/td/i.test(target.tagName)&&!/thead/i.test(target.parentNode.parentNode.tagName)
					&&!/\browCount\b/.test(target.className)){
					//如果被选中的td不在被选中的列或行当中,则取消该列(或行)的被选中
					if($("chooserStyle")&&!new RegExp("\\b"+dragCell.chosedClassName+"\\b").test(target.className)){
						document.head.removeChild($("chooserStyle"));
						dragCell.chosedClassName=null;
					}
					var x=target.offsetLeft+21;
					var y=target.parentNode.offsetTop+61;
					var input=$("table_input");//获取输入框和其位置
					//如果以前的选中单元格存在并不是图片或视频或函数,则将其内容改为输入框中的内容
					if(dragCell.inputTarget!==null&&!hasClassOf(dragCell.inputTarget,"free")){
						//如果之前选中单元格的输入内容为函数,则执行函数
						if(dragCell.inputTarget.name&&dragCell.inputTarget.name!="null"){
							dragCell.inputTarget.name=input.value.slice(1);
							startFun(dragCell.inputTarget.name);
						}else
						//如果之前选中的单元格中的内容是超链接,则将input.value作为innerHTML插入
						if(hasClassOf(dragCell.inputTarget,"insertHTML")){
							dragCell.inputTarget.innerHTML=input.value;
						}else{
							dragCell.inputTarget.innerText=input.value;
						}
					}
					//如果选中的单元格没有free标记(即不是视频或图片),则将输入框内容改为单元格内容
					if(!hasClassOf(target,"free")){
						if(target.name&&target.name!="null"){
							//如果选中单元格内容为函数(有name且name不为NULL),则显示函数
							input.value="="+target.name;
						}else
						//如果选中的单元格有insertHTML标记(是超链接),则将单元格中的html插入输入框
						if(hasClassOf(target,"insertHTML")){
							input.value=target.innerHTML;
						}else{
							input.value=target.innerText;
						}
					}
					input.style.display="block";//设置输入框样式
					input.style.top=y+"px";
					input.style.left=x+"px";
					input.style.fontSize=dragCell.minHeight+"px";
					input.style.lineHeight=dragCell.minHeight+"px";
					input.style.width=getStyle(target,"width")+"px";
					input.placeholder=target.className;
					var height;
					height=getStyle(target,"height");
					if(!height||height==0){
						height=getStyle(target.parentNode.firstChild,"height");
					}
					//储存被选中的单元格
					dragCell.inputTarget=target;
					input.style.height=height+"px";
					input.focus();
				}
			}
			
			$("table").insertTxtToCells=function(res,it){
				res=res.replace(/\r/g,"");
				res=res.split(/\n/g);
				for(var i=0;i<res.length;i++){
					res[i]=res[i].split(/\t/g);
				}
				
				var tds=this.getElementsByClassName("rowCount");
				it=it||dragCell.inputTarget;
				if(it){
					splite(it);
				}
				for(var i1=0,i1_=it?it.className.match(/[A-Z]+/):"A",app=it?+it.className.match(/[0-9]+/)-1:0,isAddLine=true;i1<res.length;i1++){
					for(var i2=0,i2_=i1_,tr,td;i2<res[i1].length;i2++,i2_=addLineCount(i2_)){
						tr=tds[i1+app].parentNode;
						if(isAddLine)addLine(true);
						td=tr.getElementsByClassName(i2_)[0];
						if(td.rowSpan>1||td.colSpan>1){
							splite(td);
							td=tr.getElementsByClassName(i2_)[0];
						}
						td.innerText=res[i1][i2];
					}
					addRow(true);
					isAddLine=false;
				}
			}
			
			$("table").installTxt=function(){
				var file=$("installTxt").files[0];
				if(!file){alert("Sorry,您还没有选择txt文件!");return;};
				if(/text\/plain/i.test(file.type)){
					var fr=new FileReader();
					var codingRight,res;
					fr.readAsText(file,"GBK");
					fr.onload=function(){
						res=this.result+"";
						if(confirm("确认下文有无中文(方框不算)乱码,有乱码请按'确定'键,无请按'取消'键:\n\t"+res.slice(0,100))){
							fr.readAsText(file,"UTF-8");
							fr.onload=function(){
								res=this.result+"";
								$("table").insertTxtToCells(res);
								return ;
							}
						}
						$("table").insertTxtToCells(res);
						return ;
					}
				}else{
					alert("Sorry,您选择的文件不是txt文件!");
				}
			};
			
			HTMLElement.prototype.getEle=function(description_str){
				return getElement(this,description_str);
			}
			
			function getElement(obj,description_str){
				try{
					if(description_str=="lastElementChild"){
						return obj.lastChild.nodeName=="#text"?obj.lastChild.previousSibling:obj.lastChild;
					}else if(description_str=="firstElementChild"){
						return obj.firstChild.nodeName=="#text"?obj.firstChild.nextSibling:obj.firstChild;
					}else if(description_str=="nextElementSibling"){
						return obj.nextSibling.nodeName=="#text"?obj.nextSibling.nextSibling:obj.nextSibling;
					}else if(description_str=="previousElementSibling"){
						return obj.previousSibling.nodeName=="#text"?obj.previousSibling.previousSibling:obj.previousSibling;
					}
				}catch(e){return false;}
			}
			
			dragCell.lineCount=getElement(getElement($("table"),'firstElementChild'),"firstElementChild").lastChild.innerText;
			dragCell.rowCount=+getElement(getElement($("table"),"lastElementChild"),'lastElementChild').firstChild.innerText;
			
			$("table_input").onkeydown=function(event){
				event=event||window.event;
				var keyCode=event.keyCode;
				//keyCode enter:13 tab:9 down:40 up:38 right:39 left:37
				if(!dragCell.inputTarget.name&&dragCell.inputTarget.name!="null"){
					switch(keyCode){
						case 40:
						case 13:
							if(event.ctrlKey){
								$("lists").onclick({target:{id:"collaspe_down",parentNode:true}});
								return false;
							}
							if(!event.shiftKey||keyCode==40){
								if(hasClassOf(dragCell.inputTarget,dragCell.rowCount+"")){
									addRow(true);
									$("table").onclick({target:getElement(getElement($("table"),"lastElementChild"),"lastElementChild").getElementsByClassName(getClassName(dragCell.inputTarget,"[A-Z]+"))[0]});
								}else{
									var lineCount=getClassName(dragCell.inputTarget,"[A-Z]+");
									var rowCount=+getClassName(dragCell.inputTarget,"[0-9]+",true)+1;
									var td=getElementByClassNames(lineCount,rowCount);
									$("table").onclick({target:td});
								}
								return false;
							}
							break;
						case 9:
						case 39:
							if(event.ctrlKey){
								$("lists").onclick({target:{id:"collaspe_right",parentNode:true}});
								return false;
							}
							var lineCount=getClassName(dragCell.inputTarget,"[A-Z]+",true);
							var rowCount=getClassName(dragCell.inputTarget,"[0-9]+");
							if(hasClassOf(dragCell.inputTarget,dragCell.lineCount)){
								addLine(true);
								dragCell.inputTarget=getElementByClassNames(lineCount,rowCount);
							}
							lineCount=addLineCount(lineCount);
							$("table").onclick({target:getElementByClassNames(lineCount,rowCount)});
							return false;
							break;
						case 37:
							if(getClassName(dragCell.inputTarget,"[A-Z]+",true)=="A"){
								break;
							}else if(hasClassOf(dragCell.inputTarget,dragCell.lineCount)&&!event.ctrlKey){
								var tbody=getElement($("table"),"lastElementChild");
								var trs=tbody.getElementsByTagName("tr");
								for(var i=0,isNull=true;i<trs.length;i++){
									if(trs[i].lastChild.innerHTML!=""){
										isNull=false;
										break;
									}
								}
								if(isNull&&$("table_input").value==""){
									addLine(false);
								}
							}
							var lineCount=addLineCount(getClassName(dragCell.inputTarget,"[A-Z]+",true),true);
							var rowCount=getClassName(dragCell.inputTarget,"[0-9]+");
							$("table").onclick({target:getElementByClassNames(lineCount,rowCount)});
							return false;
							break;
						case 38:
							var rowCount=getClassName(dragCell.inputTarget,"[0-9]+");
							if(+getClassName(dragCell.inputTarget,"[0-9]+")==1){
								break;
							}else if(hasClassOf(dragCell.inputTarget,dragCell.rowCount+"")&&!event.ctrlKey){
								var tbody=getElement($("table"),"lastElementChild");
								var lastTr_in_tbody=getElement(tbody,"lastElementChild");
								var reg=new RegExp("^"+rowCount+"\\s*$");
								if(reg.test(lastTr_in_tbody.innerText)&&$("table_input").value==""&&lastTr_in_tbody.getElementsByTagName("video").length==0&&lastTr_in_tbody.getElementsByTagName("img").length==0){
									addRow(false);
								}
							}
							rowCount=+rowCount-1+"";
							var lineCount=getClassName(dragCell.inputTarget,"[A-Z]+");
							
							$("table").onclick({target:getElementByClassNames(lineCount,rowCount)});
							return false;
							break;
						case 8:
						case 46:
							if(hasClassOf(dragCell.inputTarget,'insertHTML')||event.ctrlKey){
								$("table_input").value="";
								if(hasClassOf(dragCell.inputTarget,'free')){
									dragCell.inputTarget.innerHTML="";
									toggleClassName(dragCell.inputTarget,"free");
								}
							}
							break;
						default:
							if(hasClassOf(dragCell.inputTarget,"insertHTML")){
								toggleClassName(dragCell.inputTarget,"insertHTML");
							}
							break;
					}
				}
					
				if(/^=/.test(this.value)){
					dragCell.inputTarget.name=this.value.slice(1);
					this.style.color="red";
				}else{
					dragCell.inputTarget.name=null;
					this.style.color="black";
				}
			}
			function setStyle(type_str,type_str_css,setting_str){
				if(dragCell.inputTarget){
					dragCell.inputTarget.style[type_str]=setting_str;
				}else if(dragCell.chosedClassName){
					var mySettingStyle=$("settingStyle"+dragCell.chosedClassName);
					var str="";
					if(mySettingStyle){
						str=mySettingStyle.innerHTML;
						document.head.removeChild(mySettingStyle);
					}
					mysettingStyle=document.createElement("style");
					mysettingStyle.type="text/css";
					mysettingStyle.id="settingStyle"+dragCell.chosedClassName;
					var myStr="."+dragCell.chosedClassName+"{"+type_str_css+":"+setting_str+";}";
					if(new RegExp("\\b"+myStr+"\\b").test(str)){
						mysettingStyle.innerHTML=str;
					}else if(new RegExp(str.match(/\.[^:]+:/)).test(myStr)){
						mysettingStyle.innerHTML=myStr;
					}else if(new RegExp("\\b\\."+dragCell.chosedClassName+"{"+type_str_css+":").test(str)){
						str=str.replace(new RegExp("\\b\\."+dragCell.chosedClassName+"{"+type_str_css+":"+".+}"),myStr);
						mySettingStyle.innerHTML=str;
					}else{
						mysettingStyle.innerHTML=str+" "+myStr;
					}
					document.head.appendChild(mysettingStyle);
				}else{
					var tableStyle=$("tableStyle")
					,str="";
					if(tableStyle){
						str=tableStyle.innerHTML;
						document.head.removeChild(tableStyle);
					}
					tableStyle=document.createElement("style");
					tableStyle.type="text/css";
					tableStyle.id="tableStyle";
					var myStr="table td{ "+type_str_css+":"+setting_str+";}";
					if(new RegExp("\\b"+myStr+"\\b").test(str)){
						tableStyle.innerHTML=str;
					}else if(new RegExp(" "+type_str_css).test(str)){
						str=str.replace(new RegExp(" "+type_str_css+":[^;]+;","g")," "+type_str_css+":"+setting_str+";");
						tableStyle.innerHTML=str;
					}else{
						tableStyle.innerHTML=str+" "+myStr;
					}
					document.head.appendChild(tableStyle);
				}
			}
			/**
			 * 这是一个给光标处插入 html 的方法
			 * @param {Object} html
			 */
			function insertHtmlAtCaret(html){
				if(window.getSelection){
					var userSelection=getSelection()
					,userRange=userSelection.getRangeAt(0);
					userRange.deleteContents();
					var el=document.createElement("div");
					el.innerHTML=html;
					var frag = document.createDocumentFragment(), node, lastNode;
					while((node = el.firstChild)){
						lastNode = frag.appendChild(node);
		            }
		            userRange.insertNode(frag);
		            if(lastNode){
		            	userRange.setStartAfter(lastNode);
		            	userSelection.removeAllRanges();
		            	userSelection.addRange(userRange);
		            }
				}else if(document.selection && document.selection.type != "Control"){
					document.selection.createRange().pasteHTML(html);
				}else{
					alert("对不起,您的浏览器版本太低,请及时更新!");
				}
			}
			
			function getElementByClassName(obj,className){
				return obj.getElementsByClassName(className)[0];
			}
			
			/**
			 * 此方法用于将被合并的单元格重新分割
			 * @param {Object} obj 被合并的单元格
			 */
			function splite(obj){
				if(obj.rowSpan==1&&obj.colSpan==1)return;
				var lineCounts=obj.className.match(/[A-Z]+/g)
				,rowCounts=obj.className.match(/[0-9]+/g)
				,finalRowCount=+rowCounts[0]-1
				,finalLineCount=addLineCount(lineCounts[0],true)
				,maxRowCount=rowCounts[rowCounts.length-1]
				,maxLineCount=lineCounts[lineCounts.length-1]
				,table=$("table")
				,str=obj.innerText;
				obj.parentNode.removeChild(obj);
				for(var i1=maxLineCount;i1!=finalLineCount;i1=addLineCount(i1,true)){
					for(var i2=+maxRowCount,td,tdAfter;i2!=finalRowCount;i2--){
						td=document.createElement("td");
						td.className=i1+" r"+i2;
						tdAfter=getElementByClassNames(addLineCount(i1),"r"+i2);
						try{
							tdAfter.parentNode.insertBefore(td,tdAfter);
						}catch(e){
							var tds=table.getElementsByClassName("rowCount");
							for(var i3=0;i3<tds.length;i3++){
								if(+tds[i3].innerText==i2){
									tds[i3].parentNode.appendChild(td);
									break;
								}
							}
						}
					}
				}
				td.innerText=str;
			}
			function getTargetByStr(str){
				var rowCount=str.match(/[0-9]+/);
				var lineCount=str.match(/[A-Z]+/)
				lineCount=new String(lineCount).toUpperCase();
				return getElementByClassNames(lineCount,"r"+rowCount);
			}
			var g=getTargetByStr;
			
			function myParseFloat(str,NaNAsMax){
				var returning=parseFloat(str);
				if(!isNaN(+returning))return returning;
				if(str!="")return Number.MAX_VALUE;
				return Number.MIN_VALUE;
			}
			
			$("lists").onclick=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				switch(target.id){
					case "lock":
						var keyword=prompt('请输入密码(空格无效,不输入任何值表示没有密码):').replace(/\s/g,"");
						var keywordSure=prompt("请再次确认密码:").replace(/\s/g,"");
						if(keyword==keywordSure){
							document.body.id="keyword:"+keyword;
						}else{
							alert("Sorry,您前后两次输入的密码不同,请确认后重新加密!");
						}
						break;
					case "save":
						target.parentNode.style.display="none";
						var note=$("note");
						note.className=note.value;
						before_save();
						var blob = new Blob(['<!doctype html>'+document.documentElement.outerHTML], {type: "text/plain;charset=utf-8"});
						saveAs(blob, $("title").innerText+".xls.html");
						alert("文件即将写入,请您在确保下载完成后关闭浏览器.");
						break;
					case "fontColor":
					case "bgColor":
						var colorList=$("colorList");
						colorList.target=target;
						changeDisplay(colorList);
						colorList.onclick=function(event){
							event=event||window.event;
							var target=event.target||event.srcElement;
							if(target.parentNode.parentNode==this){
								if(this.target.id=="fontColor"){
									setStyle("color","color",target.style.backgroundColor+"");
								}else if(this.target.id=="bgColor"){
									setStyle("backgroundColor","background-color",target.style.backgroundColor+"");
								}
								this.style.display="none";
								this.onclick=null;
								this.target=null;
							}
						}
						break;
					case "fontFamily_enter":
						setStyle("fontFamily","font-family",$("fontFamily_input").value);
						$("start_list").style.display="none";
						break;
					case "fontSize_enter":
						var input=$("fontSize_input").value;
						if(isNaN(+input)){
							alert("您的输入有误,请检查后重新输入!");
							return;
						}else{
							setStyle("fontSize","font-size",$("fontSize_input").value+"px");
							setStyle("lineHeight","line-height",$("fontSize_input").value+"px");
							if(+input>dragCell.minHeight)setStyle("lineHeight","line-height",$("fontSize_input").value+"px");
						}
						$("start_list").style.display="none";
						break;
					case "link":
						if(dragCell.inputTarget){
							var href=prompt("请输入网址(或'#'+页码):");
							var content=prompt("请输入超链接内容:");
							if(!content)break;
							var str="<a href='"+href+"' target='_black'>"+content+"</a>";
							$("table_input").value=str;
							toggleClassName(dragCell.inputTarget,"insertHTML");
						}else{
							alert("您还没有选择单元格!");
						}
						$("insert_list").style.display="none";
						break;
					case "collaspe_right":
						if(getClassName(dragCell.inputTarget,"[A-Z]+",true)==dragCell.lineCount){
							$("tableButton_list").style.display="none";
							break;
						}
						var td=dragCell.inputTarget;
						var className=getClassName(td,"[A-Z]+",true);
						var rowCounts=td.className.match(/[0-9]+/g);
						for(var i=0,removedTd;i<rowCounts.length;i++){
							removedTd=getElementByClassNames(addLineCount(className),rowCounts[i]);
							splite(removedTd);
						}
						for(var i=0,removedTd;i<rowCounts.length;i++){
							removedTd=getElementByClassNames(addLineCount(className),rowCounts[i]);
							$("table_input").value+=removedTd.innerText;
							removedTd.parentNode.removeChild(removedTd);
						}
						td.className=td.className.replace(className,className+" "+addLineCount(className));
						td.colSpan++;
						$("table").onclick({target:td});
						$("tableButton_list").style.display="none";
						break;
					case "collaspe_down":
						var td=dragCell.inputTarget;
						var rowCount=+getClassName(td,"r[0-9]+",true).slice(1);
						if(rowCount==dragCell.rowCount){
							$("tableButton_list").style.display="none";
							break;
						}
						td.rowSpan++;
						var lineCounts=td.className.match(/[A-Z]+/g);
						for(var i=0,removedTd;i<lineCounts.length;i++){
							removedTd=getElementByClassNames(lineCounts[i],"r"+(rowCount+1));
							splite(removedTd);
						}
						for(var i=0;i<lineCounts.length;i++){
							var removedTd=getElementByClassNames(lineCounts[i],"r"+(rowCount+1));
							$("table_input").value+=removedTd.innerText;
							removedTd.parentNode.removeChild(removedTd);
						}
						td.className+=" r"+(rowCount+1);
						$("tableButton_list").style.display="none";
						$("table").onclick({target:td});
						break;
					case "cutLine":
						//获取选取的列数lineCount和最后一列的列数lastLineCount
						var lineCount=dragCell.chosedClassName;
						var lastLineCount=dragCell.lineCount;
						if(confirm("确定要删除此列?")){
							if(lineCount==null||!/[A-Z]+/.test(lineCount)){
								try{
									lineCount=getClassName(dragCell.inputTarget,"[A-Z]+",true);
								}catch(e){
									addLine(false);
									$("tableButton_list").style.display="none";
									break;
								}
							}
							if(lineCount==lastLineCount){
								addLine(false);
								$("table_input").style.display="none";
								$("tableButton_list").style.display="none";
								break;
							}
							
							//删除选中的列
							var trs=getElement($("table"),"lastElementChild").getElementsByTagName("tr");
							for(var i=0,judge,td;i<trs.length;i+=judge?getElementByClassName(trs[i],lineCount).rowSpan:trs[i].removeChild(getElementByClassName(trs[i],lineCount)).rowSpan){
								td=getElementByClassName(trs[i],lineCount);
								if(td.colSpan>1){
									td.colSpan--;
									var cLineCount=getClassName(td,"[A-Z]+",true);
									td.className=td.className.replace(cLineCount+" ","");
									judge=true;
									continue;
								}else{
									judge=false;
								}
							}
							var lastTd_in_thead=getElement(getElement($("table"),'firstElementChild'),"firstElementChild").lastChild;
							lastTd_in_thead.parentNode.removeChild(lastTd_in_thead);
							
							/*改变选中的一列后面的className,
							并改变了lineCount使其与lastlineCount相等*/
							lineCount=addLineCount(lineCount);
							var tds=$("table").getElementsByClassName(lineCount);
							lastLineCount=addLineCount(lastLineCount);
							while(lineCount!=lastLineCount){
								var i=0;
								while(tds.length>i){
									if(tds[i].colSpan>1){
										i++;
										continue;
									}
									tds[i].className=tds[i].className.replace(lineCount,addLineCount(lineCount,true));
								}
								lineCount=addLineCount(lineCount);
								tds=$("table").getElementsByClassName(lineCount);
							}
							dragCell.lineCount=addLineCount(dragCell.lineCount,true);
						}
						$("tableButton_list").style.display="none";
						break;
					case "addLine":
						//获取选取的列数lineCount和最后一列的列数lastLineCount
						var lineCount=dragCell.chosedClassName;
						var lastLineCount=dragCell.lineCount;
						if(lineCount==null||!/[A-Z]+/.test(lineCount)){
							try{
								lineCount=getClassName(dragCell.inputTarget,"[A-Z]+",true);
							}catch(e){
								addLine(true);
								$("insert_list").style.display="none";
								break;
							}
						}
						lineCount=addLineCount(lineCount,true);
						/*改变选中的一列后面的className,
						并改变了lastLineCount使其与lineCount相等*/
						var table=$("table");
						var tds=table.getElementsByClassName(lastLineCount);
						while(lineCount!=lastLineCount){
							while(tds.length!=0){
								tds[0].className=tds[0].className.replace(lastLineCount,addLineCount(lastLineCount));
							}
							lastLineCount=addLineCount(lastLineCount,true);
							tds=table.getElementsByClassName(lastLineCount);
						}
						
						//改变表头中的字母
						lastLineCount=dragCell.lineCount;
						var tr_in_thead=getElement(getElement($("table"),"firstElementChild"),"firstElementChild");
						tr_in_thead.innerHTML+="<td>"+addLineCount(lastLineCount)+"</td>";
						
						//插入新的一列
						lineCount=addLineCount(lineCount);
						lastLineCount=addLineCount(lineCount);
						tds=table.getElementsByClassName(lastLineCount);
						var td;
						for(var i=0;i<tds.length;i++){
							if(tds[i].colSpan>1){
								tds[i].colSpan++;
								var firstClassName=tds[i].className.match(/[A-Z]+/);
								if(firstClassName==addLineCount(lineCount)){
									tds[i].className=lineCount+" "+tds[i].className;
								}else{
									tds[i].className=tds[i].className.replace(addLineCount(lineCount,true),addLineCount(lineCount,true)+" "+lineCount);
								}
								continue;
							}
							td=document.createElement("td");
							td.className=tds[i].className.replace(lastLineCount,lineCount);
							tds[i].parentNode.insertBefore(td,tds[i]);
						}
						
						//增加列数
						dragCell.lineCount=addLineCount(dragCell.lineCount);
						$("insert_list").style.display="none";
						break;
					case "addRow":
						//获取选取的行数和最后一行的行数
						var rowCount=dragCell.chosedClassName;
						if(rowCount==null||!/r[0-9]+/.test(rowCount)){
							try{
								rowCount=getClassName(dragCell.inputTarget,"r[0-9]+",true);
							}catch(e){
								addRow(true);
								$("insert_list").style.display="none";
								break;
							}
						}
						rowCount=+rowCount.slice(1)-1;
						var lastRowCount=dragCell.rowCount;
						
						/*改变选中的一行后面行的className
						并改变了lastRowCount使其与rowCount相等*/
						var table=$("table");
						var tds=table.getElementsByClassName("r"+lastRowCount);
						while(lastRowCount!=rowCount){
							while(tds.length!=0){
								tds[0].className=tds[0].className.replace("r"+lastRowCount,"r"+(lastRowCount+1));
							}
							lastRowCount--;
							tds=table.getElementsByClassName("r"+lastRowCount);
						}
						tds=table.getElementsByClassName("rowCount");
						var tr_to_insert;
						for(var i=0;i<tds.length;i++){
							if(+tds[i].innerText>rowCount){tds[i].innerText=+tds[i].innerText+1};
							if(+tds[i].innerText==rowCount+2)tr_to_insert=tds[i].parentNode;
						}
						
						/*插入一行*/
						tds=table.getElementsByClassName("r"+rowCount);
						rowCount++;
						var tr=document.createElement("tr");
						var str="<td class='rowCount'>"+rowCount+"</td>";
						var lastLineCount=addLineCount(dragCell.lineCount);
						for(var i="A",i2=0;i!=lastLineCount;i=addLineCount(i),i2++){
							if(tds[i2].rowSpan>1){
								tds[i2].rowSpan++;
								if(hasClassOf(tds[i2],"r"+(rowCount-1))){
									tds[i2].className=tds[i2].className.replace("r"+(rowCount-1),"r"+(rowCount-1)+" r"+rowCount);
								}else{
									tds[i2].className="r"+rowCount+" "+tds[i2].className;
								}
								for(var i3=0;i3<tds[i2].colSpan-1;i3++){
									i=addLineCount(i);
								}
								continue;
							}
							str+="<td class='"+i+" r"+rowCount+"' ></td>";
						}
						tr.innerHTML=str;
						tr_to_insert.parentNode.insertBefore(tr,tr_to_insert);
						
						//增加储存的行数
						dragCell.rowCount++;
						$("insert_list").style.display="none";
						break;
					case "cutRow":
						var rowCount=dragCell.chosedClassName;
						if(confirm("确认删除此行?")){
							if(rowCount==null||!/r[0-9]+/.test(rowCount)){
								try{
									rowCount=getClassName(dragCell.inputTarget,"r[0-9]+",true);
								}catch(e){
									addRow(false);
									$("insert_list").style.display="none";
									break;
								}
							}
							rowCount=+rowCount.slice(1);
							if(rowCount==dragCell.rowCount){
								addRow(false);
								$("insert_list").style.display="none";
								break;
							}
							
							var td_rowCounts=document.getElementsByClassName("rowCount");
							var tr;
							for(var i=0;i<td_rowCounts.length;i++){
								if(+td_rowCounts[i].innerText==rowCount){
									tr=td_rowCounts[i].parentNode;
								}else if(+td_rowCounts[i].innerText>rowCount){
									td_rowCounts[i].innerText=td_rowCounts[i].innerText-1;
								}
							}
							td_rowCounts=null;
							var children=tr.childNodes;
							for(var i=0;i<children.length;i++){
								if(children[i].nodeName!="#text"&&children[i].rowSpan>1){
									splite(children[i]);
								}
							}
							tr.parentNode.removeChild(tr);
							var tds=$("table").getElementsByClassName("r"+rowCount);
							for(var i=0;i<tds.length;i++){
								if(tds[i].rowSpan>1){
									var eRowCount=getClassName(tds[i],"r[0-9]+",true);
									tds[i].className=tds[i].className.replace(eRowCount,"");
									tds[i].rowSpan--;
									continue;
								}
								tds[i].className=tds[i].className.replace(" r"+rowCount,"");
							}
							var lastRowCount=dragCell.rowCount;
							rowCount++;
							tds=$("table").getElementsByClassName("r"+rowCount);
							while(rowCount<=lastRowCount){
								var i=0;
								while(tds.length>i){
									if(tds[i].rowSpan>1){
										i++;
										continue;
									}
									tds[i].className=tds[i].className.replace("r"+rowCount,"r"+(rowCount-1));
								}
								rowCount++;
								tds=$("table").getElementsByClassName("r"+rowCount);
							}
							dragCell.rowCount--;
						}
						$("tableButton_list").style.display="none";
						break;
					case "splite":
						splite(dragCell.inputTarget);
						dragCell.inputTarget=null;
						$("table_input").style.display="none";
						$("tableButton_list").style.display="none"
						break;
					case "jumpTo":
						var placeTo=prompt("请输入跳转位置,如'a1'.");
						if(/[A-z]+[0-9]+/.test(placeTo)){
							placeTo=g(placeTo);
							$("table").onclick({target:placeTo});
						}
						$("other_list").style.display="none";
						break;
					case "installTxt_enter":
						$("table").installTxt();
						break;
					case "bigToSmall":
						window.onclick({target:document.body});
						var className=dragCell.chosedClassName;
						if(/[0-9]+/.test(className)){//横向排序
							sortLine(className,true)
						}else if(/[A-Z]+/.test(className)){
							sortRow(className,true);
						}else{
							alert("对不起,你还未选择行或列!");
						}
						$("tableButton_list").style.display="none";
						break;
					case "smallToBig":
						window.onclick({target:document.body});
						var className=dragCell.chosedClassName;
						if(/[0-9]+/.test(className)){//横向排序
							sortLine(className,false)
						}else if(/[A-Z]+/.test(className)){
							sortRow(className,false);
						}else{
							alert("对不起,你还未选择行或列!");
						}
						$("tableButton_list").style.display="none";
						break;
					case "print":
						$("other_list").style.display="none";
						window.print();
						break;
					case "playNote":
						if(target.innerText=="打开笔记本"){
							$("note").style.display="block";
							target.innerText="关闭笔记本";
						}else{
							$("note").style.display="none";
							target.innerText="打开笔记本";
						}
						$("other_list").style.display="none";
						break;
					case "install_enter":
						var file=$("install").files[0];
						if(!file){
							alert("Sorry,您还没有选择插件,请点击左端'引入插件'字样选择插件后再点'确定'");
							return;
						}
						if(/.js$/.test($("install").value)){
							script=document.createElement("script");
							script.language="JavaScript";
							script.type="text/javascript";
							script.className="userAppending";
							var fr=new FileReader();
							fr.readAsText(file);
							fr.onload=function(){
								script.innerHTML=this.result;
								document.body.insertBefore(script,$("fromNet"));
							}
						}else{
							alert("Sorry,您选择的并非插件,请重新选择");
							return;
						}
						$("other_list").style.display="none";
						break;
					case "typeCode":
						alert("在单元格中输入等号后可在等号后输入JavaScript代码,"
						+"\n你可以创建一个方法,运行该方法后其返回值将出现在该单元格中."
						+"\n你还可以运行任何菜单中的方法和averageif,averageifs,modeif,modeifs,mediaif,mediaifs等方法,其使用方法与sumif,sumifs类似");
						break;
				}
				switch(target.parentNode.id){
					case "fontFamily_list":
						$("fontFamily_input").value=target.style.fontFamily;
						setStyle("fontFamily","font-family",target.style.fontFamily);
						$("start_list").style.display="none";
						break;
					case "fontSize_list":
						setStyle("fontSize","font-size",target.innerText+"px");
						setStyle("lineHeight","line-height",target.innerText+"px");
						$("start_list").style.display="none";
						break;
					case "textAlign_list":
						setStyle("textAlign","text-align",target.className);
						$("start_list").style.display="none";
						break;
					case "fontStyle_list":
						if(target.id=="bold"){
							setStyle("fontWeight","font-weight","bold");
							$("start_list").style.display="none";
						}else if(target.id=="null"){
							setStyle("fontWeight","font-weight","normal");
							setStyle("fontStyle","font-style","normal");
							setStyle("textDecoration","text-decoration","none");
						}else if(target.id=="italic"){
							setStyle("fontStyle","font-style","italic");
						}else{
							setStyle("textDecoration","text-decoration",target.id);
						}
						$("start_list").style.display="none";
						break;
					case "img":
						if(target.type=="button"){
							var file=$("file").files[0];
							if(!file){
								alert("Sorry,您还没有选择本地照片,请点击左端'照片'字样选择后再点'确定'");
								return;
							}
							var wh_str=prompt('请输入长,宽(参考:一个单元格的默认宽度为50,高为15,如不输入,则图片长,宽默认为200,120):');
							var width,height;
							if(!/^[0-9]+[^0-9A-z]+[0-9]+$/.test(wh_str)){
								width=dragCell.imgW,height=dragCell.imgH;
							}else{
								dragCell.imgW=width=+wh_str.split(/[^0-9A-z]+/)[0];
								dragCell.imgH=height=+wh_str.split(/[^0-9A-z]+/)[1];
							}
							if(/image\/\w+/.test(file.type)){
								try{
									var fr=new FileReader();
									fr.readAsDataURL(file);
									fr.onload=function(e){
										dragCell.inputTarget.innerHTML="<img title='ctrl+删除键可去除图片' width='"+width+"px' height='"+height+"' src='"+this.result+"'/>";
										toggleClassName(dragCell.inputTarget,"free");
									}
								}catch(e){}
							}else{
								alert("Sorry,你选择的文件不是图像文件,请重新选择");
							}
						}
						break;
					case "sum_list":
					case "count_list":
					case "logic_list":
					case "statistics_list":
					case "math_list":
						var fun_name=target.innerText.match(/[a-z]+/).toString();
						userLeader.lead(fun_name,target.title);
						$("funs_list").style.display="none";
						break;
				}
				if(target.type!="text"&&target.parentNode.parentNode&&target.parentNode.parentNode.id=="search_list"){
					if(target.id=="searchNext"){
						if(!searchTimeCopy||searchTimeCopy===0){
							searchTimeCopy=1;
						}else{
							searchTimeCopy++;
						}
						searchTime=searchTimeCopy;
						search.call(window,$("searching").value,$("table"));
					}else if(target.id=="replace"){
						var userRange=getUserRange();
						if(userRange.startOffset==userRange.endOffset||!userRange){
							if(!searchTimeCopy||searchTimeCopy===0){
								searchTimeCopy=1;
							}else{
								searchTimeCopy++;
							}
							searchTime=searchTimeCopy;
							search.call(window,$("searching").value,$("table"));
						}
						if(contains($("table"),userRange.startContainer)){
							insertHtmlAtCaret($("replaceTo").value);
							searchTimeCopy--;
						}
					}
				}
			}
			/**
			 * 此方法用于纵向对所有行进行排序
			 * @param {Object} className	字符串,该方法将会按照该列的大小进行排序,如"A";
			 * @param {Object} isdown	是否按照从大到小的顺序进行排列
			 */
			function sortRow(className,isdown){
				var limite=prompt("请输入行数范围,(冒号隔开的首行和末行,如'2:3'),如不输入默认从头排序:");
				if(!limite||limite=="")limite="r1:r"+dragCell.rowCount;
				var jd=limite.match(/[A-Z]+/g);
				try{
					if(jd){
						for(var i=0;i<jd.length;i++){
							if(jd[i]!=className){
								throw Error;
							}
						}
					}
					if(/([A-Z]*[0-9]+:[A-Z]*[0-9]+)?/.test(limite)){
						jd=limite.match(/[0-9]+/g);
						var start=g("r"+jd[0]+className);
						var end=g("r"+jd[1]+className);
						if(!(start&&end)||(+jd[0]>+jd[1])){
							throw Error;
						}
						start=+jd[0];
						end=+jd[1];
						if(confirm("注意:排序将可能会使一些单元格合并,任然确定排序?")){
							//对所有列从start到end的单元格进行分割
							var tbody=$("table").getEle("lastElementChild");
							for(var i=start-1,tds;i!=end;i++){
								tds=tbody.getElementsByClassName("r"+i);
								for(var i2=0;i2<tds.length;i2++){
									splite(tds[i2]);
								}
							}
							//将从start到end的数据注入数组
							var arr=[];
							start=+jd[0];
							end=+jd[1];
							while(start!=(end+1)){
								arr.push(myParseFloat(g("r"+start+className).innerText));
								start++;
							}
							//获取排列顺序数组
							arr=rankArr(arr,isdown);
							start=+jd[0];
							var afterOrder=[]/*表示排好后的行*/,afterClasses=[];
							var tds=tbody.getElementsByClassName("rowCount");
							for(var i=0,i2;i<arr.length;i++){
								i2=arr[i];//排序号码
								afterOrder[i2-1]=tds.getElementByInnerText(start).parentNode;
								afterClasses[i]=start;
								start++;
							}
							//根据afterOrder对列进行排序
							start=jd[0];
							tds=null;
							for(var i=0,v=afterOrder.pop();i<afterOrder.length;i++){
								v.parentNode.insertBefore(afterOrder[i],v);
							}
							afterOrder.push(v);
							for(var i=0;i<afterClasses.length;i++){
								tds=afterOrder[i].childNodes;
								tds[0].innerHTML=afterClasses[i];
								for(var i2=1;i2<tds.length;i2++){
									tds[i2].className=tds[i2].className.replace(/[0-9]+/,afterClasses[i]);
								}
							}
							afterOrder=null;
						}
					}else{
						throw Error;
					}
				}catch(e){
					alert("Sorry ,您的输入有误,请检查后重新排序!");
					return ;
				}
			}
			
			/**
			 * 此方法用于对所有列进行排序
			 * @param {String} className	字符串,该方法将会按照该行数据的大小进行排序,如"1";
			 * @param {Boolean} isdown	是否按照从大到小的顺序进行排列
			 */
			function sortLine(className,isdown){
				var limite=prompt("请输入列数范围,(冒号隔开的首列和末列,如'A:C'),不区分大小写(如不输入则默认从头排序):")
				limite=limite.EUpper();
				if(!limite||limite=="")limite="A:"+dragCell.lineCount;
				var jd=limite.match(/[0-9]+/g);
				try{
					if(jd){
						for(var i=0;i<jd.length;i++){
							if("r"+jd[i]!=className){
								throw Error;
							}
						}
					}
					if(/([A-Z]+[0-9]*:[A-Z]+[0-9]*)?/.test(limite)){
						jd=limite.match(/[A-Z]+/g);
						var start=g(jd[0]+className);
						var end=g(jd[1]+className);
						if(!(start&&end)){
							throw Error;
						}
						while(start!=end){
							start=start.nextSibling;
							if(!start)throw Error;
						}
						start=jd[0];
						end=jd[1];
						if(confirm("注意:排序将可能会使一些单元格合并,任然确定排序?")){
							//对所有列从start到end的单元格进行分割
							var tbody=$("table").getEle("lastElementChild");
							end=addLineCount(end);
							for(var i=start,tds;i!=end;i=addLineCount(i)){
								tds=tbody.getElementsByClassName(i);
								for(var i2=0;i2<tds.length;i2++){
									splite(tds[i2]);
								}
							}
							//将从start到end的数据注入数组
							var arr=[];
							start=g(jd[0]+className);
							end=g(jd[1]+className);
							while(start!=end){
								arr.push(myParseFloat(start.innerText));
								start=start.nextSibling;
							}
							arr.push(myParseFloat(end.innerText));
							//获取排列顺序数组
							arr=rankArr(arr,isdown);
							start=jd[0];
							var afterOrder=[]/*表示拍好后的列*/,afterClasses=[];
							for(var i=0,i2;i<arr.length;i++){
								i2=arr[i];//排序号码
								afterOrder[i2-1]=tbody.getElementsByClassName(start);
								afterClasses[i]=start;
								start=addLineCount(start);
							}
							//根据afterOrder对列进行排序
							start=jd[0];
							for(var i=0,v=afterOrder.pop();i<afterOrder.length;i++){
								for(var i2=0;i2<afterOrder[i].length;i2++){
									v[i2].parentNode.insertBefore(afterOrder[i][i2],v[i2]);
								}
							}
							afterOrder.push(v);
							for(var i=0;i<afterOrder.length;i++){
								afterOrder[i]=Array.prototype.slice.call(afterOrder[i],0);
							}
							for(var i=0;i<afterClasses.length;i++){
								for(var i2=0,v2;i2<afterOrder[i].length;i2++){
									v2=afterOrder[i][i2];
									v2.className=v2.className.replace(/[A-Z]+/,afterClasses[i]);
								}
							}
							afterOrder=null;
						}
					}else{
						throw Error;
					}
				}catch(e){
					alert("Sorry ,您的输入有误,请检查后重新排序!");
					return ;
				}
			}
			
			$("search_list").addEventListener("mouseover",function(){
				$("search_list").style.opacity="0.4";
				$("start_list").style.opacity="0";
			},false);
			$("search_list").addEventListener("mouseout",function(){
				$("search_list").style.opacity="0.92";
				$("start_list").style.opacity="0.92";
			},false);
			//head标题栏中的所有按钮统一用此方法绑定事件
			$("head").onclick=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				switch(target.id){
					case "document":
						var doc_list=document.getElementById("document_list");
						myChangeDisplay(doc_list);
						break;
					case "requstFullScreen":
						myRequestFullScreen(true);
						target.id="requstExitFullScreen";
						target.innerText="退出全屏";
						break;
					case "requstExitFullScreen":
						myRequestFullScreen(false);
					    target.id="requstFullScreen";
						target.innerText="全屏";
						break;
					case "title":
						var titleName=prompt("请输入文件名").replace(/\n/g,"");
						title.changeName(titleName);
						document.head.getElementsByTagName("title")[0].innerText=titleName;
						break;
					case "start":
						myChangeDisplay($("start_list"));
						break;
					case "insert":
						myChangeDisplay($("insert_list"));
						break;
					case "funs":
						myChangeDisplay($("funs_list"));
						break;
					case "tableButton":
						myChangeDisplay($("tableButton_list"));
						break;
					case "other":
						myChangeDisplay($("other_list"));
						break;
					case "help":
						myChangeDisplay($("help_list"));
						break;
				}
			}
			var note=$("note");
			note.value=note.className;
			note=null;
			window.onbeforeunload=function(event){
				event=event||window.event;
				var msg="关闭或刷新可能会导致您的数据丢失,请确保您的文件已经保存(如果你已经保存请忽略这条提示).";
				event.returnValue=msg;
				return msg;
			};
			function getClassName(obj,type_str,getLast){
				if(!getLast){
					var reg=new RegExp(type_str);
					return obj.className.match(reg);
				}else{
					var reg=new RegExp(type_str,"g");
					var returning=obj.className.match(reg);
					return returning[returning.length-1];
				}
			}
			
			function getElementByClassNames(className_1,className_2){
				var reg=/^[0-9]+$/i;
				className_1=reg.test(className_1)?"r"+className_1:className_1;
				className_2=reg.test(className_2)?"r"+className_2:className_2;
				reg=new RegExp("\\b"+className_1+"\\b");
				var objs=document.getElementsByClassName(className_2);
				for(var i=0;i<objs.length;i++){
					if(reg.test(objs[i].className))return objs[i];
				}
			}
			/*
			 * 该方法用于增加一列或减少一列,如果isAdd==false则减少
			 */
			function addLine(isAdd){
				var tbody=getElement($("table"),"lastElementChild");
				var tr_in_head=getElement(getElement($("table"),"firstElementChild"),"firstElementChild");
				var lastTdInHead=getElement(tr_in_head,"lastElementChild");
				var lineCount=lastTdInHead.innerText;
				var trs=tbody.getElementsByTagName("tr");
				if(isAdd){
					lineCount=addLineCount(lineCount);
					var newTdInHead=document.createElement("td");
					newTdInHead.innerText=lineCount;
					tr_in_head.appendChild(newTdInHead);
					for(var i=0;i<trs.length;i++){
						trs[i].innerHTML+="<td class='"+lineCount+" r"+(i+1)+"'></td>";
					}
					dragCell.lineCount=lineCount;
				}else if(lineCount!=="A"){
					tr_in_head.removeChild(lastTdInHead);
					for(var i=0,judge;i<trs.length;i+=judge?trs[i].lastChild.rowSpan:trs[i].removeChild(trs[i].lastChild).rowSpan){
						if(trs[i].lastChild.colSpan>1){
							trs[i].lastChild.colSpan--;
							judge=true;
							continue;
						}else{
							judge=false;
						}
					}
					dragCell.lineCount=tr_in_head.lastChild.innerText;
					var tds=tbody.getElementsByClassName(dragCell.lineCount);
					for(var i=0,lastClassName=null;i<tds.length;i++){
						lastClassName=getClassName(tds[i],"[A-Z]+",true);
						if(lastClassName!=dragCell.lineCount)tds[i].className=tds[i].className.replace(" "+lastClassName,"");
					}
				}else{
					alert("您的列数只有一列,无法再减少!");	
				}
			}
			function addRow(isAdd){
				var tbody=getElement($("table"),"lastElementChild");
				if(isAdd){
					dragCell.rowCount++;
					var lastLineCount=addLineCount(dragCell.lineCount);
					var str="<td class='rowCount'>"+dragCell.rowCount+"</td>";
					for(var i="A";i!=lastLineCount;i=addLineCount(i)){
						str+="<td class='"+i+" r"+dragCell.rowCount+"'></td>";
					}
					var tr=document.createElement("tr");
					tr.innerHTML=str;
					tbody.appendChild(tr);
				}else{
					tbody.removeChild(getElement(tbody,"lastElementChild"));
					var tds=tbody.getElementsByClassName("r"+dragCell.rowCount);
					while(tds.length>0){
						tds[0].rowSpan--;
						tds[0].className=tds[0].className.replace(" r"+dragCell.rowCount,"");
					}
					dragCell.rowCount--;
				}
					
			}
			function toggleClassName(obj,className,appendBefore){
				var reg=new RegExp(className);
				if(reg.test(obj.className)){
					obj.className=obj.className.replace(className,"");
					obj.className=obj.className.replace(/\s\s/g," ");
					obj.className=obj.className.replace(/\s$/,"");
				}else{
					if(appendBefore){
						obj.className=className+" "+obj.className;
						obj.className=obj.className.replace(/\s\s/g," ");
					}else{
						obj.className+=" "+className;
					}
				}
			}
			//此方法用于获取一个元素的字体大小
			function getStyle(obj,style_str){
				return parseInt(window.getComputedStyle(obj,null)[style_str]);
			}
			function getRelativePosition(obj,event,xy_str){
				if(xy_str==="x"){
					var x=document.body.scrollLeft
						||document.documentElement.scrollLeft;
					x+=event.clientX-obj.offsetLeft-20;
					return x;
				}else if(xy_str==="y"){
					var y=document.body.scrollTop||document.documentElement.scrollTop;
					y+=event.clientY-obj.parentNode.offsetTop-60;
					return y;
				}
			}
			function hasClassOf(obj,className_str){
				if(/^[0-9]+$/.test(className_str))className_str="r"+className_str;
				var reg=new RegExp("\\b"+className_str+"\\b");
				if(reg.test(obj.className))return true;
				return false;
			}
			var saveAs=saveAs||(function(view){
				"use strict";
				if (typeof view === "undefined" || typeof navigator !== "undefined" && /MSIE [1-9]\./.test(navigator.userAgent)) {
					return;
				}
				var
					  doc = view.document
					, get_URL = function() {
						return view.URL || view.webkitURL || view;
					}
					, save_link = doc.createElementNS("http://www.w3.org/1999/xhtml", "a")
					, can_use_save_link = "download" in save_link
					, click = function(node) {
						var event = new MouseEvent("click");
						node.dispatchEvent(event);
					}
					, is_safari = /constructor/i.test(view.HTMLElement) || view.safari
					, is_chrome_ios =/CriOS\/[\d]+/.test(navigator.userAgent)
					, throw_outside = function(ex) {
						(view.setImmediate || view.setTimeout)(function() {
							throw ex;
						}, 0);
					}
					, force_saveable_type = "application/octet-stream"
					, arbitrary_revoke_timeout = 1000 * 40 // in ms
					, revoke = function(file) {
						var revoker = function() {
							if (typeof file === "string") { // file is an object URL
								get_URL().revokeObjectURL(file);
							} else { // file is a File
								file.remove();
							}
						};
						setTimeout(revoker, arbitrary_revoke_timeout);
					}
					, dispatch = function(filesaver, event_types, event) {
						event_types = [].concat(event_types);
						var i = event_types.length;
						while (i--) {
							var listener = filesaver["on" + event_types[i]];
							if (typeof listener === "function") {
								try {
									listener.call(filesaver, event || filesaver);
								} catch (ex) {
									throw_outside(ex);
								}
							}
						}
					}
					, auto_bom = function(blob) {
						if (/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(blob.type)) {
							return new Blob([String.fromCharCode(0xFEFF), blob], {type: blob.type});
						}
						return blob;
					}
					, FileSaver = function(blob, name, no_auto_bom) {
						if (!no_auto_bom) {
							blob = auto_bom(blob);
						}
						var
							  filesaver = this
							, type = blob.type
							, force = type === force_saveable_type
							, object_url
							, dispatch_all = function() {
								dispatch(filesaver, "writestart progress write writeend".split(" "));
							}
							, fs_error = function() {
								if ((is_chrome_ios || (force && is_safari)) && view.FileReader) {
									// Safari doesn't allow downloading of blob urls
									var reader = new FileReader();
									reader.onloadend = function() {
										var url = is_chrome_ios ? reader.result : reader.result.replace(/^data:[^;]*;/, 'data:attachment/file;');
										var popup = view.open(url, '_blank');
										if(!popup) view.location.href = url;
										url=undefined; // release reference before dispatching
										filesaver.readyState = filesaver.DONE;
										dispatch_all();
									};
									reader.readAsDataURL(blob);
									filesaver.readyState = filesaver.INIT;
									return;
								}
								if (!object_url) {
									object_url = get_URL().createObjectURL(blob);
								}
								if (force) {
									view.location.href = object_url;
								} else {
									var opened = view.open(object_url, "_blank");
									if (!opened) {
										view.location.href = object_url;
									}
								}
								filesaver.readyState = filesaver.DONE;
								dispatch_all();
								revoke(object_url);
							}
						;
						filesaver.readyState = filesaver.INIT;
			
						if (can_use_save_link) {
							object_url = get_URL().createObjectURL(blob);
							setTimeout(function() {
								save_link.href = object_url;
								save_link.download = name;
								click(save_link);
								dispatch_all();
								revoke(object_url);
								filesaver.readyState = filesaver.DONE;
							});
							return;
						}
			
						fs_error();
					}
					, FS_proto = FileSaver.prototype
					, saveAs = function(blob, name, no_auto_bom) {
						return new FileSaver(blob, name || blob.name || "download", no_auto_bom);
					}
				;
				if (typeof navigator !== "undefined" && navigator.msSaveOrOpenBlob) {
					return function(blob, name, no_auto_bom) {
						name = name || blob.name || "download";
			
						if (!no_auto_bom) {
							blob = auto_bom(blob);
						}
						return navigator.msSaveOrOpenBlob(blob, name);
					};
				}
			
				FS_proto.abort = function(){};
				FS_proto.readyState = FS_proto.INIT = 0;
				FS_proto.WRITING = 1;
				FS_proto.DONE = 2;
			
				FS_proto.error =
				FS_proto.onwritestart =
				FS_proto.onprogress =
				FS_proto.onwrite =
				FS_proto.onabort =
				FS_proto.onerror =
				FS_proto.onwriteend =
					null;
			
				return saveAs;
			}(
				   typeof self !== "undefined" && self
				|| typeof window !== "undefined" && window
				|| this.content
			));
			if (typeof module !== "undefined" && module.exports) {
			  module.exports.saveAs = saveAs;
			} else if ((typeof define !== "undefined" && define !== null) && (define.amd !== null)) {
			  define("FileSaver.js", function() {
			    return saveAs;
			  });
			}
		</script>
		<%--userAppending代码 --%>
		<%myOut=br.readLine();
			while(myOut!=null){
				out.print(myOut);
				myOut=br.readLine();
			}
		}catch(Exception e){}finally{
			if(br!=null)br.close();
			if(reader!=null)reader.close();
			if(input!=null)input.close();
		}
		 %>
		<script id="fromNet" type="text/javascript"></script>
		<script type="text/javascript" id="LocalSupport">
			function getURL(relativeURL){
				var _location=location.pathname;
				_location=/^http/.test(location.toString())?_location.slice(0,_location.lastIndexOf("/")):"http://www.hOffice.com.cn";
				return _location+relativeURL;
			}
			function localSupport(){
				var fromNet=$("fromNet");
				fromNet.src=getURL("/support/hExcelSupport.js");
			}
			localSupport();
		</script>
	</body>
</html>