<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="java.io.FileInputStream,java.io.InputStreamReader,java.io.BufferedReader"%>
<%
String path=(String)request.getAttribute("path");
if(path==null){
response.sendError(404);
}
String name=path.substring(path.indexOf("_")+1);
name=name.substring(0, name.lastIndexOf("."));
name=name.substring(0,name.lastIndexOf("."));
FileInputStream input=null;
InputStreamReader reader=null;
BufferedReader br=null;
try{
input=new FileInputStream(application.getRealPath(path));
reader=new InputStreamReader(input,"utf-8");
br=new BufferedReader(reader);
String str1="~~~~~~~~~node~1~~~~~~~"
,str2="~userApp~2~▂▃▅▆█๑۩ﺴﺴ۩๑๑۩۞۩~";
%>
<!DOCTYPE html>
<html id="version:2.0|hPPT">
<!--
作者：陈子为	山东师范大学2016级 食工一班 学号:201613010147 QQ:3502318983 Email:3502318983@qq.com
时间：2017-8-25~2017-11-06
版本：2.0
页面设计: 李萌
(c) www.hoffice.com.cn
(c) 陈子为
-->

	<head>
		<title>
			<%=name %>
		</title>
		<meta charset="UTF-8">
		<style type="text/css" id="printStylesheet" media="print">
			#head {
				display: none;
			}
			
			#lists {
				display: none;
			}
			
			#sideBar {
				display: none;
			}
			
			#ppt {
				width: 740px !important;
				height: auto;
				float: none !important;
				overflow: visible !important;
				position: static !important;
			}
			
			#ppts {
				overflow: visible !important;
				position: static !important;
				margin: 0px auto 0px auto !important;
			}
			
			#ppt>div {
				background-color: rgba(0, 0, 0, 0);
				break-inside: avoid;
			}
			
			#adv {
				display: none;
			}
		</style>
		<style id="positionStyle" type="text/css">
			* {
				padding: 0px;
				margin: 0px;
				background-color: #ebe9e2;
				font-family: "Consolas", "courier new", "微软雅黑";
				font-size: 12px;
			}
			
			h1 {
				font-size: 25px;
				text-align: center;
			}
			
			#items {
				/*head中的按钮栏89+36+27*/
				background-color: inherit;
				margin-left: 152px;
				margin-top: 6px;
			}
			
			#head {
				width: 100%;
				height: 60px;
				background-color: #e06b2f;
				color: white;
				position: fixed;
				top: 0px;
				overflow: hidden;
			}
			
			#head img {
				background-color: inherit;
				margin-left: 43px;
				margin-top: 12px;
			}
			
			#head span {
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
			
			#head #title {
				display: inline-block;
				width: 145px;
				height: 20px;
				color: black;
				overflow: hidden;
				background-color: white;
				margin-left: 36px;
				line-height: 20px;
				text-align: left;
			}
			
			#head span:hover {
				font-size: 12.5px;
			}
			
			#head #title:hover {
				font-size: 12px;
			}
			
			#head a {
				font-size: inherit;
				background-color: inherit;
				color: white;
				text-decoration: none;
			}
			
			#flag {
				background-color: inherit;
			}
			
			#lists {
				position: fixed;
				width: 100%;
				top: 60px;
				opacity: 0.92;
				z-index: 1000;
			}
			
			#lists ul {
				float: left;
				width: 0em;
				display: none;
				list-style: none;
				background-color: #e1e1e1;
				position: fixed;
			}
			
			#lists li {
				width: 10em;
				cursor: pointer;
				background-color: inherit;
			}
			
			#lists li:hover {
				background-color: #E3C9BA;
			}
			
			#colorList span {
				display: block;
				border: solid 0.5px;
				width: 18px;
				height: 18px;
				float: left;
				margin: 0px 3px 0px 3px;
			}
			
			#colorList li {
				margin-top: 3px;
				height: 18px;
				width: 100%;
			}
			
			#colorList li:hover {
				background-color: inherit;
			}
			
			#colorList {
				border: solid 0.5px;
			}
			
			input[type="button"] {
				border: solid 0.5px;
				width: 2.9em;
			}
			
			input[type="button"]:hover {
				background-color: inherit;
			}
			
			input[type="text"] {
				border: solid 0.5px;
			}
			
			#fenYe span {
				display: inline-block;
				padding: 0px 5px;
				text-align: center;
				border-left: solid black 1px;
				line-height: 11px;
				cursor: pointer;
			}
			
			ul label {
				display: inline-block;
				width: 7em;
				background-color: #e1e1e1;
			}
			
			ul label:hover {
				background-color: #E3C9BA;
			}
			
			#main_content {
				width: 100%;
				height: 500px;
				margin-top: 60px;
			}
			
			#sideBar {
				float: left;
				width: 18%;
				height: 100%;
				margin-top: 20px;
				padding: 20px;
				list-style: none;
				border-right: solid 1px darkgray;
			}
			
			#ppts {
				width: 740px;
				left: 30%;
				top: 60px;
				height: 500px;
				overflow: hidden;
				background-color: white;
				margin: 20px auto 0px auto;
			}
			
			#main_content li {
				text-align: left;
			}
			
			a {
				margin: 15px 5% 20px 5%;
			}
			
			#main_content a:hover {
				outline: solid;
			}
			
			#pagination {
				border-top: solid 1px darkgray;
			}
			
			#ppt {
				width: 740px;
				height: 500px;
				margin: auto;
				background-color: rgba(0, 0, 0, 0);
				position: relative;
			}
			
			#ppt>div {
				width: 740px;
				height: 500px;
				background-color: inherit;
				float: left;
			}
			
			#ppt>div>div {
				background-color: rgba(198, 198, 198, 0.5);
				padding: 10px;
				text-align: inherit;
				font-size: 16px;
			}
			
			#ppt>div>div * {
				background-color: rgba(0, 0, 0, 0);
				font-size: inherit;
				color: inherit;
				text-align: inherit;
				font-family: inherit;
			}
			
			#fenYe ul {
				width: 100%;
				height: 140px;
				overflow: auto;
				cursor: pointer;
				text-align: center;
				margin: 0px auto 0px auto;
			}
			
			#fenYe li {
				background-color: #e1e1e1;
			}
			
			table {
				border-collapse: collapse;
				background-color: inherit;
			}
			
			#ppts td {
				border: solid 1px;
				background-color: inherit;
			}
			
			#ctrl li {
				float: left;
				border-right: solid 1px white;
				padding: 5px 10px 5px 10px;
				background-color: darkgrey;
				color: white;
				cursor: pointer;
			}
			
			#ctrl li:hover {
				background-color: #E3C9BA;
			}
		</style>
		<link class="mobile" rel="stylesheet" type="text/css" href="css/hPPT_mobile.css" />
	</head>

	<body>
		<div id="head">
			<div id="flag">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEEAAAAVCAYAAAAZ6IOkAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTEtMjZUMTE6MTY6MjgrMDg6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTExLTI2VDExOjE2OjM0KzA4OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTExLTI2VDExOjE2OjM0KzA4OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozNTAwN0VEN0QyNTgxMUU3OTgxRTg0QkU3NkQ4OUU4RiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozNTAwN0VEOEQyNTgxMUU3OTgxRTg0QkU3NkQ4OUU4RiI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjM1MDA3RUQ1RDI1ODExRTc5ODFFODRCRTc2RDg5RThGIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjM1MDA3RUQ2RDI1ODExRTc5ODFFODRCRTc2RDg5RThGIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+IZ7hawAAAVNJREFUeNrsWIENgyAQVNMF7AiuYEfQEVzBjqAj6Ah1BB2hjlBHqCs4AoXkST5EwKpFSfnk0mAfhfP//tEnhHj/bhf4rShihV9JMaBxTpEp/DuKxjYSGAGJwi+cGav8e5siITD4rCfFm4IgsHGrIDSHeUQAu1bMvBxvxleFwjQJbKORcC2CtGKbekgiMJHcqwISY5siAeuLD7ghrckBMuNzrnAPTlIr+KUCGsV/HdaEo2yAxbxQVOgEdaKokaBHEBm9RI9inVYFJ9Clib8RjdiK1kg2uro66KyCxeJc3psIE3M2kRD/OBo4qeOKOZsJOUM6hKjx+qa/yPbqS44mgZdHXu/rhRFQQIpybRhNpMOeVqEN4HAuNZshks60NNUnpKhO+3s8GJXIGvqFpWcNXk3usK7NAnlEJJQLw36uWbL+7OAOUI4ER4IjwQrz3TdGz/sIMAAkX1KOd/P4zAAAAABJRU5ErkJggg==" />
				<span id="title" title="点击修改文件名"><%=name %></span>
			</div>
			<div id="items">
				<span id="document">文件</span><span id="start">样式</span><span id="insert">插入</span><span id="headTable">表格</span><span id="other">其他</span><span title="使用全屏,编辑更方便" id="requstFullScreen">全屏</span><span id="help">帮助</span><span id="login" style="float: right;margin-right: 50px;">登录</span>
			</div>
		</div>
		<!--这个div标签中装的是菜单-->
		<div id="lists">
			<!--这是文件的下拉菜单-->
			<ul id="document_list" style="margin-left:162px;">
				<li id="lock" title="在输入框中不填入任何值则会取消加密">加密</li>
				<li id="save">保存(下载)</li>
				<li id="saveInBrowser" style="display: none;">存为浏览器文件</li>
				<li id="saveInServie" style="display: none;">存为云文件</li>
				<li id="myDoc" style="display: none;">我的文件</li>
			</ul>
			<!--这是"开始"按钮的下拉菜单-->
			<ul id="start_list" style="margin-left:216px;">
				<li id="fontFamily">字体</li>
				<li id="fontSize">字号</li>
				<li id="color">颜色</li>
				<li id="textAlign">对齐方式</li>
				<li id="lineHeight">行间距</li>
				<li id="fontStyle">字体样式</li>
				<li id="sup">上标</li>
				<li id="sub">下标</li>
			</ul>
			<!--这是"插入"按钮的下拉菜单-->
			<ul id="insert_list" style="margin-left: 270px;">
				<li id="fenShu">分数</li>
				<li id="table">表格</li>
				<li id="img">
					<label for="file">图片</label><input type="button" value="确定" />
					<input type="file" id="file" name="" style="display: none" />
				</li>
				<li id="bgImg">
					<label for="gbImgFile">背景图片</label><input type="button" value="确定" />
					<input type="file" id="gbImgFile" name="" style="display: none" />
				</li>
				<li id="link" title="注意:超链接仅在压缩后能使用!">超链接</li>
				<li id="textArea">文本框</li>
			</ul>
			<ul id="headTable_list" style="margin-left: 328px;">
				<li id="collaspe_right">向右合并</li>
				<li id="collaspe_down">向下合并</li>
				<li id="cutLine">删除此行</li>
				<li id="addLine">增加一行</li>
				<li id="addRow">增加一列</li>
				<li id="cutRow">删除一列</li>
			</ul>
			<!--这是"其他"按钮的下拉菜单-->
			<ul id="other_list" style="margin-left: 380px;">
				<li id="print">打印</li>
				<li id="play">从头播放</li>
				<li id="playOn">从现在开始播放</li>
				<li id="playNote">打开笔记本</li>
				<li id="deleteBgImg">删除背景图片</li>
				<li title="点此引入插件">
					<input type="file" id="install" style="display: none;">
					<label for="install">引入插件</label><input type="button" value="确定" id="install_enter" />
				</li>
			</ul>
			<ul id="help_list" style="margin-left:485px;">
				<li id="unable_to_save">无法保存(下载)?</li>
			</ul>
			<ul id="fontFamily_list" style="margin-left:336px;margin-top: 0.5em;">
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
				<li><input id="fontFamily_input" type="text" style="width: 7em;border: solid 0.5px;" placeholder="请输入其他字体" /><input type="button" id="fontFamily_enter" value="确定" /></li>
			</ul>
			<ul id="color_list" style="margin-left: 336px;margin-top: 1.5em;">
				<li id="fontColor">字体颜色</li>
				<li id="bgColor">背景颜色</li>
				<li id="pageColor">页面颜色</li>
			</ul>
			<ul id="fontSize_list" style="margin-left: 336px;margin-top: 1.5em;">
				<li>12</li>
				<li>14</li>
				<li>16</li>
				<li>18</li>
				<li>20</li>
				<li>22</li>
				<li>24</li>
				<li>26</li>
				<li>28</li>
				<li><input type="text" style="width: 7em;border: solid 0.5px;" placeholder="请输入其他字号" id="fontSize_input" /><input type="button" id="fontSize_enter" value="确定" /></li>
			</ul>
			<ul id="textAlign_list" style="margin-left: 336px;margin-top: 1.5em;">
				<li class="left">左对齐</li>
				<li class="right">右对齐</li>
				<li class="center">居中对齐</li>
				<li class="justify">两端对齐</li>
			</ul>
			<ul id="lineHeight_list" style="margin: 2.5em 0px 0px 336px;">
				<li>2</li>
				<li>3</li>
				<li>8</li>
				<li>10</li>
				<li>15</li>
				<li id="lineHeight_other">其他</li>
			</ul>
			<ul id="fontStyle_list" style="margin-left: 336px;margin-top: 5em;">
				<li id="bold" style="font-weight: bold;">加粗</li>
				<li id="null">正常</li>
				<li id='italic' style="font-style: italic;">斜体</li>
				<li id="underline" style="text-decoration: underline;">下划线</li>
				<li id="line-through" style="text-decoration: line-through;">删除线</li>
			</ul>
			<ul id="fenShu_list" style="margin:0.5em 0px 0px 390px;">
				<li><input id="numerator" style="border:solid 0.5px;" type="text" placeholder="请输入分子" /></li>
				<li><input id="denominator" style="border:solid 0.5px;" type="text" placeholder="请输入分母" /></li>
				<li><input type="button" style="width: 10em;" value="确定" /></li>
			</ul>
			<ul id="table_list" style="margin:1.5em 0px 0px 390px;">
				<li><input id="rowCount" type="text" placeholder="行数" /></li>
				<li><input id="lineCount" type="text" placeholder="列数" /></li>
				<li><input id="table_enter" type="button" style="width: 10em;" value="确定" /></li>
			</ul>
			<ul id="colorList" style="margin-left: 436px;width: 150px;overflow: hidden;">
				<li><span style="background-color: #000000;"></span><span style="background-color: #993300;"></span><span style="background-color: #333300;"></span><span style="background-color: #000080;"></span><span style="background-color: #333399;"></span><span style="background-color: #333333;"></span></li>
				<li><span style="background-color: #800000;"></span><span style="background-color: #FF6600;"></span><span style="background-color: #808000;"></span><span style="background-color: #008000;"></span><span style="background-color: #008080;"></span><span style="background-color: #0000FF;"></span></li>
				<li><span style="background-color: #666699;"></span><span style="background-color: #808080;"></span><span style="background-color: #FF0000;"></span><span style="background-color: #FF9900;"></span><span style="background-color: #99CC00;"></span><span style="background-color: #339966;"></span></li>
				<li><span style="background-color: #33CCCC;"></span><span style="background-color: #3366FF;"></span><span style="background-color: #800080;"></span><span style="background-color: #999999;"></span><span style="background-color: #FF00FF;"></span><span style="background-color: #FFCC00;"></span></li>
				<li><span style="background-color: #FFFF00;"></span><span style="background-color: #00FF00;"></span><span style="background-color: #00FFFF;"></span><span style="background-color: #00CCFF;"></span><span style="background-color: #993366;"></span><span style="background-color: #C0C0C0;"></span></li>
				<li><span style="background-color: #FF99CC;"></span><span style="background-color: #FFCC99;"></span><span style="background-color: #FFFF99;"></span><span style="background-color: #CCFFFF;"></span><span style="background-color: #99CCFF;"></span><span style="background-color: #FFFFFF;"></span></li>
				<li><button style="background-color: null;display:block;margin: 0px auto 0px auto;width:4em;height:1.2em;line-height:1.2em;font-size: 15px;border: solid 0.5px;">透明</button></li>
			</ul>
		</div>

		<div id="main_content">
			<ul id="sideBar">
				<li>页面布局</li>
				<li>
					<hr>
				</li>
				<li>
					<a id="layout1" href="javascript:;"><img src="data:image/png;base64,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" /></a>
					<a id="layout2" href="javascript:;"><img src="data:image/png;base64,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" /></a>
				</li>
				<li>
					<a id="layout3" href="javascript:;"><img src="data:image/png;base64,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" /></a>
					<a id="layout4" href="javascript:;"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKTWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVN3WJP3Fj7f92UPVkLY8LGXbIEAIiOsCMgQWaIQkgBhhBASQMWFiApWFBURnEhVxILVCkidiOKgKLhnQYqIWotVXDjuH9yntX167+3t+9f7vOec5/zOec8PgBESJpHmomoAOVKFPDrYH49PSMTJvYACFUjgBCAQ5svCZwXFAADwA3l4fnSwP/wBr28AAgBw1S4kEsfh/4O6UCZXACCRAOAiEucLAZBSAMguVMgUAMgYALBTs2QKAJQAAGx5fEIiAKoNAOz0ST4FANipk9wXANiiHKkIAI0BAJkoRyQCQLsAYFWBUiwCwMIAoKxAIi4EwK4BgFm2MkcCgL0FAHaOWJAPQGAAgJlCLMwAIDgCAEMeE80DIEwDoDDSv+CpX3CFuEgBAMDLlc2XS9IzFLiV0Bp38vDg4iHiwmyxQmEXKRBmCeQinJebIxNI5wNMzgwAABr50cH+OD+Q5+bk4eZm52zv9MWi/mvwbyI+IfHf/ryMAgQAEE7P79pf5eXWA3DHAbB1v2upWwDaVgBo3/ldM9sJoFoK0Hr5i3k4/EAenqFQyDwdHAoLC+0lYqG9MOOLPv8z4W/gi372/EAe/tt68ABxmkCZrcCjg/1xYW52rlKO58sEQjFu9+cj/seFf/2OKdHiNLFcLBWK8ViJuFAiTcd5uVKRRCHJleIS6X8y8R+W/QmTdw0ArIZPwE62B7XLbMB+7gECiw5Y0nYAQH7zLYwaC5EAEGc0Mnn3AACTv/mPQCsBAM2XpOMAALzoGFyolBdMxggAAESggSqwQQcMwRSswA6cwR28wBcCYQZEQAwkwDwQQgbkgBwKoRiWQRlUwDrYBLWwAxqgEZrhELTBMTgN5+ASXIHrcBcGYBiewhi8hgkEQcgIE2EhOogRYo7YIs4IF5mOBCJhSDSSgKQg6YgUUSLFyHKkAqlCapFdSCPyLXIUOY1cQPqQ28ggMor8irxHMZSBslED1AJ1QLmoHxqKxqBz0XQ0D12AlqJr0Rq0Hj2AtqKn0UvodXQAfYqOY4DRMQ5mjNlhXIyHRWCJWBomxxZj5Vg1Vo81Yx1YN3YVG8CeYe8IJAKLgBPsCF6EEMJsgpCQR1hMWEOoJewjtBK6CFcJg4Qxwicik6hPtCV6EvnEeGI6sZBYRqwm7iEeIZ4lXicOE1+TSCQOyZLkTgohJZAySQtJa0jbSC2kU6Q+0hBpnEwm65Btyd7kCLKArCCXkbeQD5BPkvvJw+S3FDrFiOJMCaIkUqSUEko1ZT/lBKWfMkKZoKpRzame1AiqiDqfWkltoHZQL1OHqRM0dZolzZsWQ8ukLaPV0JppZ2n3aC/pdLoJ3YMeRZfQl9Jr6Afp5+mD9HcMDYYNg8dIYigZaxl7GacYtxkvmUymBdOXmchUMNcyG5lnmA+Yb1VYKvYqfBWRyhKVOpVWlX6V56pUVXNVP9V5qgtUq1UPq15WfaZGVbNQ46kJ1Bar1akdVbupNq7OUndSj1DPUV+jvl/9gvpjDbKGhUaghkijVGO3xhmNIRbGMmXxWELWclYD6yxrmE1iW7L57Ex2Bfsbdi97TFNDc6pmrGaRZp3mcc0BDsax4PA52ZxKziHODc57LQMtPy2x1mqtZq1+rTfaetq+2mLtcu0W7eva73VwnUCdLJ31Om0693UJuja6UbqFutt1z+o+02PreekJ9cr1Dund0Uf1bfSj9Rfq79bv0R83MDQINpAZbDE4Y/DMkGPoa5hpuNHwhOGoEctoupHEaKPRSaMnuCbuh2fjNXgXPmasbxxirDTeZdxrPGFiaTLbpMSkxeS+Kc2Ua5pmutG003TMzMgs3KzYrMnsjjnVnGueYb7ZvNv8jYWlRZzFSos2i8eW2pZ8ywWWTZb3rJhWPlZ5VvVW16xJ1lzrLOtt1ldsUBtXmwybOpvLtqitm63Edptt3xTiFI8p0in1U27aMez87ArsmuwG7Tn2YfYl9m32zx3MHBId1jt0O3xydHXMdmxwvOuk4TTDqcSpw+lXZxtnoXOd8zUXpkuQyxKXdpcXU22niqdun3rLleUa7rrStdP1o5u7m9yt2W3U3cw9xX2r+00umxvJXcM970H08PdY4nHM452nm6fC85DnL152Xlle+70eT7OcJp7WMG3I28Rb4L3Le2A6Pj1l+s7pAz7GPgKfep+Hvqa+It89viN+1n6Zfgf8nvs7+sv9j/i/4XnyFvFOBWABwQHlAb2BGoGzA2sDHwSZBKUHNQWNBbsGLww+FUIMCQ1ZH3KTb8AX8hv5YzPcZyya0RXKCJ0VWhv6MMwmTB7WEY6GzwjfEH5vpvlM6cy2CIjgR2yIuB9pGZkX+X0UKSoyqi7qUbRTdHF09yzWrORZ+2e9jvGPqYy5O9tqtnJ2Z6xqbFJsY+ybuIC4qriBeIf4RfGXEnQTJAntieTE2MQ9ieNzAudsmjOc5JpUlnRjruXcorkX5unOy553PFk1WZB8OIWYEpeyP+WDIEJQLxhP5aduTR0T8oSbhU9FvqKNolGxt7hKPJLmnVaV9jjdO31D+miGT0Z1xjMJT1IreZEZkrkj801WRNberM/ZcdktOZSclJyjUg1plrQr1zC3KLdPZisrkw3keeZtyhuTh8r35CP5c/PbFWyFTNGjtFKuUA4WTC+oK3hbGFt4uEi9SFrUM99m/ur5IwuCFny9kLBQuLCz2Lh4WfHgIr9FuxYji1MXdy4xXVK6ZHhp8NJ9y2jLspb9UOJYUlXyannc8o5Sg9KlpUMrglc0lamUycturvRauWMVYZVkVe9ql9VbVn8qF5VfrHCsqK74sEa45uJXTl/VfPV5bdra3kq3yu3rSOuk626s91m/r0q9akHV0IbwDa0b8Y3lG19tSt50oXpq9Y7NtM3KzQM1YTXtW8y2rNvyoTaj9nqdf13LVv2tq7e+2Sba1r/dd3vzDoMdFTve75TsvLUreFdrvUV99W7S7oLdjxpiG7q/5n7duEd3T8Wej3ulewf2Re/ranRvbNyvv7+yCW1SNo0eSDpw5ZuAb9qb7Zp3tXBaKg7CQeXBJ9+mfHvjUOihzsPcw83fmX+39QjrSHkr0jq/dawto22gPaG97+iMo50dXh1Hvrf/fu8x42N1xzWPV56gnSg98fnkgpPjp2Snnp1OPz3Umdx590z8mWtdUV29Z0PPnj8XdO5Mt1/3yfPe549d8Lxw9CL3Ytslt0utPa49R35w/eFIr1tv62X3y+1XPK509E3rO9Hv03/6asDVc9f41y5dn3m978bsG7duJt0cuCW69fh29u0XdwruTNxdeo94r/y+2v3qB/oP6n+0/rFlwG3g+GDAYM/DWQ/vDgmHnv6U/9OH4dJHzEfVI0YjjY+dHx8bDRq98mTOk+GnsqcTz8p+Vv9563Or59/94vtLz1j82PAL+YvPv655qfNy76uprzrHI8cfvM55PfGm/K3O233vuO+638e9H5ko/ED+UPPR+mPHp9BP9z7nfP78L/eE8/sl0p8zAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAASFSURBVHja7JpvaFZlGMZ/r9NpW20znYZpuoTNpiGBBdKHaKuB0peCIMil2MYISXObqJiTlqK15f6YH143MFDBT9WHMIhE/FgEBW3SBpubllnbmI7Nf2Xry/XCw2Hv+fPssE6v5/lyznt2cd/nPs917uc617PE5OQkD9KYxQM24oLjguOC44L/V2N2uj/U1NR8A6wGcoE/gRFgAbAI+BvoAxLAk4oTBUwWsBDoSyaT5YEKBl4GfgLOAs8Br+n6R8B1oEW/zwPngOcjghkCygLPsMYzOnYDN4G1wCCwWdePAnU6fzsCmB3AaeB3m3d4BKjSEysFnlbwVuAzoE03sAyYjAimXZOUbVPwPaBD78QTwFXRZoee9nvAcuCK8FHAFAFfAfdtCl4E3FGjuAp8oqCtxtMeEHZFRDD9wDw1tcAFZwGvAJcVtFa02ang5tMejAhmGKieDqV/VMAo09jELAE6tVwF7tJDwNdakqJMYxPzF3DKVmnNV7ENBm16gBtAgah1VNQ6EBFME7AJuGVTcA7wBfAhsE7BHwI2aA08psSngMaIYOqBXreCvYTHi1r3zHFOs58aGyOGKQLm2BT8rAJlA3eBcQXK099vaL3L0/WoYObZzvAP8edhJn8eqkPnSG1lqRMCjKn9PwzM1fmYTwyiYpfOnwIeU54gcdww94DRdAx1K/g7BTIbwKijQWB8l/rFdANrdP4lUGwZJx0mtUwlglJ6WLIS4FMF2Kjft9XUEuqSfjE3NQMY6umwRRw3zAVbSufoS6kZ2AXkS3ndBkqkfBqASsm9Wg/MVt3Qx0aOO1pPXw0Qxw2zX7Gshcd+FbtcSuaarqdk3gfAFt2AF+akvsDyjBw9UkefB4jjhmkEzhj9InCXXgIclF7NB35Rwm91TEnQIz4wTaKvSenFQGHAOG6YUWBCjXDKkUi3tyQTr1TdbyrTrF+qZ6WLsebE/ApcBLYpTYcaWJaHQec316zpmHgVM7AsVsfC4z8UHudFoWHgnxB8435p3S5jZo8DLwBLQ/Sox4FL6RjqVnAZcAJ4Xc0iLN/YbCibZfQ3A7+F4FEfAh4F3rGh9HXdzHx9fL+k4yoJiBXAHnVGfGKGgD+MHNnAXi19QeKkw7yvpcqK0o8Abzo8Yae/1Cp/yQ+mWq+GKTzGRMkqdeywck3YzHCuXPywDLfOKYRHr6jaEaK59730tFWXrtTHQxiGWxGwz8ClxkLZM2GYe7WyfAqns9VyLSTfuF8ixiy4WM1ne0gedYvXVstsH1st6ahVJ2oN+MQMSmWtN3LkaXbwoLHfXJHbajmrY2oMAG9k6lYLurExR8FvafYybqulHShXZ8aYrXGDRRm11fKuZgBHwQ1i0YxstbgVXAA87kItpxjwwngJj9qQcm2KhUcsPGLhEQuPWHhksvDYLtpsMTrkz7JREsbT9sI0SXj0GTlK1KmDxHHDFHoJD7eCs+X7toXkG9cbrwqOmbf1up2Y3ZokbHxp08S7H9B/tjXxbLxuJ2YC6E4mkxWBCs7UEf+DeFxwXHBccFxwlMe/AwCG+IzZ8tUfzAAAAABJRU5ErkJggg=="></a>
				</li>
				<li id="fenYe">
					<span style="margin-top: 30px;">分页</span>
					<hr>
					<ul></ul>
					<span id="addNew">新增</span><span id="upwoard">向上移动</span><span id="downwoard">向下移动</span><span id="delete">删除</span>
				</li>
			</ul>
			<%--ppts.outerHTML --%>
			<%
			String myOut=br.readLine();
			while(myOut!=null&&!myOut.equals(str1)&&!myOut.equals(str2)){
				out.print(myOut);
				myOut=br.readLine();
			}
			%>
		</div>
		<textarea id="note" <%if(myOut!=null&&myOut.equals(str1)){
			out.print("class=\"");
			myOut=br.readLine();
			while(myOut!=null&&!myOut.equals(str2)){
				out.print(myOut+"\n");
				myOut=br.readLine();
			}
			out.print("\"");
		} %> placeholder="笔记本" style="position: fixed;display:none;height: 70px;width: 250px;right: 20px;top: 30px;z-index: 10000;"></textarea>
		<!--该ul用于展示PPT-->
		<ul id="ctrl" style="display:none;list-style:none;position:fixed;bottom:20px;right:20px;">
			<li id="cPREV">PREV</li>
			<li id="cNEXT">NEXT</li>
			<li id="cEXIT">EXIT</li>
		</ul>
		<a id="adv" target="_blank" href="http://www.hOffice.com.cn">亲,你也可以使用hOffice哦</a>
		<script id="beforeFuns" type="text/javascript">
			//设置before_save()方法,以免出错
			function before_save() {
				var note=$("note");
				note.className=note.value;
				var netJs = document.getElementsByClassName("fromNet");
				while(netJs.length > 0) {
					netJs[0].parentNode.removeChild(netJs[0]);
				}
				$("fromNet").removeAttribute("src");
			}
		</script>
		<!--[if gt IE8]>
<script type="text/javascript">
Element.prototype.addEventListener=function(arg0,arg1){
this.attachEvent("on"+arg0,arg1);
}
</script>
<![endif]-->
		<script id="callBacksOfClick" type="text/javascript">
			if(window.jQuery) {
				JQuery.noConflict();
			}
			//定义自己的$方法
			function $(div_str, p2, p3, p4, p5, p6, p7) {
				if(window.JQuery) {
					if(/^[A-z0-9]/.test(div_str)) {
						div_str = "#" + div_str;
					}
					return JQuery(div_str, p2, p3, p4, p5, p6, p7);
				}
				if(/^#/.test(div_str)) {
					div_str = div_str.slice(1);
				}
				return document.getElementById(div_str);
			}
			//定义userRange,用于表述用户输入区域;
			var userRange;

			function getUserRange(returnSelection) {
				var userSelection;
				if(window.getSelection) {
					userSelection = getSelection();
					if(returnSelection) return userSelection;
					try {
						return userSelection.getRangeAt(0);
					} catch(e) {
						return false;
					}
				} else {
					alert("Sorry,您的浏览器不支持此功能,请升级或更换浏览器!");
					return false;
				}
			}

			if(document.body.id && document.body.id != "keyword:") {
				var body = document.body;
				body.style.display = "none";
				setTimeout(function() {
					var keyword = prompt("该文件已加密,请输入密码:");
					if(("keyword:" + keyword) == document.body.id) {
						body.style.display = "block";
					}
				}, 500);
			}
			$("head").onmousedown = $("lists").onmousedown = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				var userRange = getUserRange();
				if(contains($("ppts"), userRange.startContainer)) {
					window.userRange = userRange;
				}
				if(!/text/i.test(target.type)) return false;
			};
			$("fenYe").onmousedown = function() {
				return false;
			};
			$("ppts").onmousedown = function(event) {
				event = event || window.event;
				if(event.ctrlKey) {
					return false;
				}
			};
			setMainHeight();
			var title = $("title");
			title.changeName = function(innerText) {
				this.innerText = innerText;
			}

			function getElement(obj, des_str) {
				try {
					switch(des_str) {
						case "firstElementChild":
							return obj.firstChild.nodeName == "#text" ? obj.firstChild.nextSibling : obj.firstChild;
							break;
						case "lastElementChild":
							return obj.lastChild.nodeName == "#text" ? obj.lastChild.previousSibling : obj.lastChild;
							break;
						case "nextElementSibling":
							return obj.nextSibling.nodeName == "#text" ? obj.nextSibling.nextSibling : obj.nextSibling;
							break;
						case "previousElementSibling":
							return obj.previousSibling.nodeName == "#text" ? obj.previousSibling.previousSibling : obj.previousSibling;
							break;
					}
				} catch(e) {
					return false;
				}
			}
			//该方法用来设置#content的高度 setContentHeight
			function setMainHeight() {
				var content = $("main_content");
				var height = window.screen.availHeight - 60;
				content.style.height = height + "px";
			}
			//head标题栏中的所有按钮统一用此方法绑定事件
			$("head").onclick = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				switch(target.id) {
					case "document":
						myChangeDisplay($("document_list"));
						break;
					case "requstFullScreen":
						myRequestFullScreen(true);
						target.id = "requstExitFullScreen";
						target.innerText = "退出全屏";
						setMainHeight();
						break;
					case "requstExitFullScreen":
						myRequestFullScreen(false);
						target.id = "requstFullScreen";
						target.innerText = "全屏";
						setMainHeight();
						break;
					case "title":
						var titleName = prompt("请输入文件名").replace(/\n/g, "");
						title.changeName(titleName);
						document.head.getElementsByTagName("title")[0].innerText = titleName;
						break;
					case "start":
						myChangeDisplay($("start_list"));
						break;
					case "insert":
						myChangeDisplay($("insert_list"));
						break;
					case "layout":
						myChangeDisplay($("layout_list"));
						break;
					case "other":
						myChangeDisplay($("other_list"));
						break;
					case "headTable":
						myChangeDisplay($("headTable_list"));
						break;
					case "help":
						myChangeDisplay($("help_list"));
						break;
				}
			}
			var note = $("note");
			note.value = note.className;
			note = null;
			window.onbeforeunload = function(event) {
				event = event || window.event;
				var msg = "关闭或刷新可能会导致您的数据丢失,请确保您的文件已经保存(如果你已经保存请忽略这条提示).";
				event.returnValue = msg;
				return msg;
			};

			function myRequestFullScreen(isNotExit, noAlert) {
				if(isNotExit) {
					//进入全屏
					var docElm = document.documentElement;
					if(docElm.requestFullscreen) {
						docElm.requestFullscreen();
					} else if(docElm.mozRequestFullScreen) {
						docElm.mozRequestFullScreen();
					} else if(docElm.webkitRequestFullScreen) {
						docElm.webkitRequestFullScreen();
					} else if(docElm.msRequestFullscreen) {
						document.body.msRequestFullscreen();
						if(!noAlert) {
							alert("我们已为您跳转到了全屏模式,但您的浏览器对我们设置的全屏不完全兼容,如由异常,请退出全屏再按f11手动进入全屏.");
						}
					} else {
						if(!noAlert) {
							alert("对不起,因为浏览器版本原因,我们无法为你设置全屏,请按f11进入全屏");
						}
					}
				} else {
					//退出全屏
					var de = document;
					if(de.exitFullscreen) {
						de.exitFullscreen();
					} else if(de.mozCancelFullScreen) {
						de.mozCancelFullScreen();
					} else if(de.webkitCancelFullScreen) {
						de.webkitCancelFullScreen();
					} else if(de.msExitFullscreen) {
						de.msExitFullscreen();
					} else {
						if(!noAlert) {
							alert("对不起,因为浏览器版本原因,我们无法为你设置全屏,请按f11退出全屏");
						}
					}
				}
			}
			var time = 0;
			$("sideBar").onclick = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				switch(target.id) {
					case "addNew":
						var ppt = $("ppt");
						ppt.style.width = parseInt(ppt.style.width) + 740 + "px";
						ppt.style.right = (740 * time) + "px";
						time++;
						var div = document.createElement("div");
						div.style.position = "relative";
						div.className = time + "";
						var lastDiv = ppt.getElementsByClassName(time + "")[0];
						if(!lastDiv) {
							lastDiv = false;
						}
						if(lastDiv !== false) {
							ppt.insertBefore(div, lastDiv);
							var children = ppt.childNodes;
							for(var i = 0, rem = 0; i < children.length; i++) {
								try {
									if(rem == +children[i].className) {
										children[i].className = rem + 1
									}
									rem = +children[i].className;
								} catch(e) {}
							}
						} else {
							ppt.appendChild(div);
						}
						var str = "<div class='title' contenteditable='true' style='width:640px;height:60px;text-align: center;position:absolute;left:50px;top:20px;font-size: 28px;'>单击此处添加标题</div>" +
							"<div class='content' contenteditable='true' style='width:640px;height:350px;position:absolute;top:115px;left:50px;'></div>";
						div.innerHTML = str;
						var ul = $("fenYe").getElementsByTagName("ul")[0];
						var lastLi = ul.getElementsByClassName(time + "")[0];
						if(!lastLi) {
							lastLi = false;
						}
						var li = document.createElement("li");
						li.className = time + "";
						if(lastLi !== false) {
							ul.insertBefore(li, lastLi);
							var children = ul.childNodes;
							for(var i = 0, rem = 0; i < children.length; i++) {
								try {
									if(rem == children[i].className) {
										children[i].className = rem + 1;
									}
									rem = +children[i].className;
								} catch(e) {}
							}
						} else {
							ul.appendChild(li);
						}
						myChangeColor(li);
						break;
					case "delete":
						var ppt = $("ppt");
						ppt.removeChild(ppt.getElementsByClassName(time + "")[0]);
						ppt.style.width = parseInt(ppt.style.width) - 740 + "px";
						var children = ppt.childNodes;
						for(var i = 0, rem = 1; i < children.length; i++) {
							try {
								if(rem != children[i].className) {
									children[i].className = rem;
								}
								rem++;
							} catch(e) {}
						}
						var ul = $("fenYe").getElementsByTagName("ul")[0];
						ul.removeChild(ul.getElementsByClassName(time + "")[0]);
						var children = ul.childNodes;
						for(var i = 0, rem = 1; i < children.length; i++) {
							try {
								if(rem != children[i].className) {
									children[i].className = rem;
								}
								rem++;
							} catch(e) {}
						}
						time--;
						myChangeColor(ul.getElementsByClassName(time + ""));
						break;
					case "downwoard":
						var ppt = $("ppt");
						var div = ppt.getElementsByClassName(+time + 1 + "")[0];
						ppt.removeChild(div);
						ppt.insertBefore(div, ppt.getElementsByClassName(time + "")[0]);
						ppt.getElementsByClassName(time + "")[0].className = +time + 1 + "";
						div.className = time + "";
						var ul = $("fenYe").getElementsByTagName("ul")[0];
						myChangeColor(ul.getElementsByClassName(+div.className + 1 + "")[0]);
						$("ppt").style.right = (+div.className) * 740 + "px";
						ul.getElementsByClassName(div.className + "")[0].innerText = div.getElementsByClassName("title")[0].innerText;
						ul.getElementsByClassName(+div.className + 1 + "")[0].innerText = ppt.getElementsByClassName(+div.className + 1 + "")[0].getElementsByClassName("title")[0].innerText;
						break;
					case "upwoard":
						var ppt = $("ppt");
						var div = ppt.getElementsByClassName(time + "")[0];
						ppt.removeChild(div);
						ppt.insertBefore(div, ppt.getElementsByClassName(+time - 1 + "")[0]);
						ppt.getElementsByClassName(+time - 1 + "")[0].className = +time + "";
						div.className = +time - 1 + "";
						var ul = $("fenYe").getElementsByTagName("ul")[0];
						myChangeColor(ul.getElementsByClassName(div.className + "")[0]);
						ul.getElementsByClassName(div.className + "")[0].innerText = div.getElementsByClassName("title")[0].innerText;
						ul.getElementsByClassName(+div.className + 1 + "")[0].innerText = ppt.getElementsByClassName(+div.className + 1 + "")[0].getElementsByClassName("title")[0].innerText;
						$("ppt").style.right = (+div.className - 1) * 740 + "px";
						break;
				}
				switch(target.parentNode.id) {
					case "layout1":
						var ppt = $("ppt");
						var myPPT = ppt.getElementsByClassName(time)[0];
						var str = "<div class='title' contenteditable='true' style='text-align: center; width: 640px;height:60px;position: absolute;left: 50px;top:20px;font-size: 28px;'>单击此处添加标题</div>" +
							"<div class='content' contenteditable='true' style='float:left;width:300px;height:350px;position:absolute;left:50px;top:115px;'></div><div class='content' contenteditable='true' style='float:left; width:300px;height:350px;position:absolute;left:390px;top:115px;'></div>";
						myPPT.innerHTML = str;
						break;
					case "layout2":
						var ppt = $("ppt");
						var myPPT = ppt.getElementsByClassName(time)[0];
						var str = "<div class='title' contenteditable='true' style='width:640px;height:60px;text-align: center;position:absolute;left:50px;top:20px;font-size: 28px;'>单击此处添加标题</div>" +
							"<div class='content' contenteditable='true' style='width:640px;height:350px;position:absolute;top:115px;left:50px;'></div>";
						myPPT.innerHTML = str;
						break;
					case "layout3":
						var ppt = $("ppt");
						var myPPT = ppt.getElementsByClassName(time)[0];
						var str = "<div class='title' contenteditable='true' style='text-align: center; width: 640px;height:60px;position:absolute;left:50px;top:70px;font-size: 28px;'>单击此处添加标题</div>";
						myPPT.innerHTML = str;
						break;
					case "layout4":
						var ppt = $("ppt");
						var myPPT = ppt.getElementsByClassName(time)[0];
						var str = "<div class='title' contenteditable='true' style='text-align: center; width: 650px;height:60px;position:absolute;left:50px;top:20px;font-size: 28px;'>单击此处添加标题</div>" +
							"<div class='content' contenteditable='true' style='float:left;width:300px;height:130px;position:absolute;left:50px;top:115px;'></div><div class='content' contenteditable='true' style='float:left; width:300px;height:130px;position:absolute;left:390px;top:115px;'></div>" +
							"<div class='content' contenteditable='true' style='float:left;width:300px;height:180px;position:absolute;left:50px;top:275px;'></div><div class='content' contenteditable='true' style='float:left; width:300px;height:180px;position:absolute;left:390px;top:275px;'></div>";
						myPPT.innerHTML = str;
						break;
				}
			}

			function myChangeColor(obj) {
				changeColor(obj);
				var objs = obj.parentNode.getElementsByTagName("li");
				for(var i = 0; i < objs.length; i++) {
					if(objs[i] !== obj) {
						objs[i].style.backgroundColor = "inherit";
					}
				}
			}

			function changeColor(obj) {
				if(!obj.style.backgroundColor || obj.style.backgroundColor == "inherit") {
					obj.style.backgroundColor = "#E3C9BA";
				} else {
					obj.style.backgroundColor = "inherit";
				}
			}
			$("ppt").onclick = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				if(/\btitle\b/.test(target.parentNode.className)) {
					target = target.parentNode;
				} else if(target.className == "content") {
					target = target.parentNode.getElementsByClassName("title")[0];
				} else if(target.parentNode.className == "content") {
					target = target.parentNode.parentNode.getElementsByClassName("title")[0];
				}
				if(/\btitle\b/.test(target.className)) {
					var parent = target.parentNode;
					var classNameOfParent = parent.className;
					var img = target.getElementsByTagName("img")[0];
					var video = target.getElementsByClassName("video")[0];
					if(img || video) {
						if(img) {
							$("fenYe").getElementsByClassName(classNameOfParent)[0].innerText = "图片";
						} else {
							$("fenYe").getElementsByClassName(classNameOfParent)[0].innerText = "视频";
						}
					} else {
						$("fenYe").getElementsByClassName(classNameOfParent)[0].innerText = target.innerText.replace(/\s/g, "").slice(0, 10);
					}
				}
			}

			function getRelativePosition(clientXY, obj, xy_str) {
				if(xy_str == "x") {
					return clientXY - drag.offsetLeft - obj.offsetLeft;
				} else {
					var y = document.body.scrollTop || document.documentElement.scrollTop;
					y += clientXY - drag.offsetTop - obj.offsetTop;
					return y;
				}
			}

			$("ppt").onmousemove = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				if(target.className == "content" || /\btitle\b/.test(target.className)) {
					var x = getRelativePosition(event.clientX, target, "x"),
						y = getRelativePosition(event.clientY, target, "y");
					if(x < 5 || target.clientWidth - x < 5) {
						target.contentEditable = 'false';
						target.style.cursor = "e-resize";
						target.onmousedown = drag.onmouseDown_w;
					} else if(y < 5 || target.clientHeight - y < 5) {
						target.contentEditable = 'false';
						target.style.cursor = "n-resize";
						target.onmousedown = drag.onmouseDown_h;
					} else {
						target.contentEditable = 'true';
						target.style.cursor = "text";
						target.onmousedown = null;
					}
				}
			};

			var drag = {
				offsetLeft: $("ppts").offsetLeft,
				offsetTop: $("ppts").offsetTop,
				onWindowMouseup: function() {
					window.onmousemove = null;
					window.onmouseup = null;
				},
				onmouseDown_w: function(event) {
					event = event || window.event;
					var target = event.target || event.srcElement,
						x = getRelativePosition(event.clientX, target, "x");
					if(+x < 5) {
						window.onmousemove = function(event) {
							drag.win_mm_x_left(event, target);
						};
						window.onmouseup = drag.onWindowMouseup;
					} else {
						window.onmousemove = function(event) {
							drag.win_mm_x_right(event, target);
						}
						window.onmouseup = drag.onWindowMouseup;
					}
					return false;
				},
				win_mm_x_left: function(event, target) {
					event = event || window.event;
					var x = getRelativePosition(event.clientX, target, "x"),
						width = parseFloat(target.style.width),
						left = parseFloat(target.style.left);
					if(left + x > 0) {
						target.style.width = width - x + "px";
						target.style.left = left + x + "px";
						var img = target.getElementsByTagName("img")[0];
						img ? img.width = width - x : 0;
						var video = target.getElementsByTagName("video")[0];
						video ? video.width = width - x : 0;
					}
				},
				win_mm_x_right: function(event, target) {
					event = event || window.event;
					var x = getRelativePosition(event.clientX, target, "x"),
						left = parseInt(target.style.left);
					if(x + left < 740) {
						target.style.width = x - 20 + "px";
						var img = target.getElementsByTagName("img")[0];
						img ? img.width = x - 20 : 0;
						var video = target.getElementsByTagName("video")[0];
						video ? video.width = x - 20 : 0;
					}
				},
				onmouseDown_h: function(event) {
					event = event || window.event;
					var target = event.target || event.srcElement,
						y = getRelativePosition(event.clientY, target, "y");
					if(y < 5) {
						window.onmousemove = function(event) {
							drag.win_mm_y_t(event, target);
						}
						window.onmouseup = drag.onWindowMouseup;
					} else {
						window.onmousemove = function(event) {
							drag.win_mm_y_b(event, target);
						}
						window.onmouseup = drag.onWindowMouseup;
					}
					return false;
				},
				win_mm_y_t: function(event, target) {
					var y = getRelativePosition(event.clientY, target, "y"),
						height = parseFloat(target.style.height),
						top = parseFloat(target.style.top);
					if(y + top > 0) {
						target.style.height = height - y + "px";
						target.style.top = top + y + "px";
						img = target.getElementsByTagName("img")[0];
						img ? img.height = height - y : 0;
						video = target.getElementsByTagName("video")[0];
						video ? video.height = height - y : 0;
					}
				},
				win_mm_y_b: function(event, target) {
					var y = getRelativePosition(event.clientY, target, "y"),
						top = parseInt(target.style.top);
					if(y + top < 495) {
						target.style.height = y - 20 + "px";
						img = target.getElementsByTagName("img")[0];
						img ? img.height = y - 20 : 0;
						video = target.getElementsByTagName("video")[0];
						video ? video.height = y - 20 : 0;
					}
				}
			};

			$("fenYe").getElementsByTagName("ul")[0].onmousedown = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				var className = target.className;
				if(/li/i.test(target.tagName)) {
					$("ppt").style.right = (+className - 1) * 740 + "px";
					time = className;
					myChangeColor(target);
				} else {
					return false;
				}
			}
			/**
			 * 该方法用于更改元素的display属性,如果display为none,则改为block,反之亦然
			 * 但当setNone==true时,obj的display属性将被改为none
			 */
			function myChangeDisplay(obj) {
				changeDisplay(obj);
				var id = obj.id;
				var objs = obj.parentNode.getElementsByTagName("ul");
				for(var i = 0; i < objs.length; i++) {
					if(objs[i].id != id) {
						objs[i].style.display = "none";
					}
				}
			}

			function changeDisplay(obj) {
				if(!obj.style.display || obj.style.display == "none") {
					obj.style.display = "block";
				} else {
					obj.style.display = "none";
				}
			}
			//lists菜单栏中所有的按钮统一绑定事件
			$("lists").onmouseover = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				var id = target.id;
				if(id) {
					id += "_list";
					var obj_list;
					if(obj_list = $(id)) {
						obj_list.style.display = "block";
						obj_list.onmouseout = function() {
							this.style.display = "none";
						}
					}
				}
				target.parentNode.style.display = "block";
				if(target.parentNode.parentNode) {
					target.parentNode.parentNode.style.display = "block";
				}
			}
			$("lists").onmouseout = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				var id = target.id;
				if(id) {
					id += "_list";
					try {
						document.getElementById(id).style.display = "none";
					} catch(e) {}
				}
			}

			function contains(container, contained) {
				if(contained == container) {
					return true;
				} else {
					try {
						while(contained) {
							contained = contained.parentNode;
							if(container == contained) return true;
						}
						return false;
					} catch(e) {
						return false;
					}
				}
			}

			$("lists").onclick = function(event) {
				event = event || window.event;
				var target = event.target || event.srcElement;
				switch(target.id) {
					case "lock":
						var keyword = prompt('请输入密码(空格无效,不输入任何值表示没有密码):').replace(/\s/g, "");
						var keywordSure = prompt("请再次确认密码:").replace(/\s/g, "");
						if(keyword == keywordSure) {
							document.body.id = "keyword:" + keyword;
						}
						break;
					case "save":
						target.parentNode.style.display = "none";
						before_save();
						var blob = new Blob(['<!doctype html>' + document.documentElement.outerHTML], {
							type: "text/plain;charset=utf-8"
						});
						saveAs(blob, $("title").innerText + ".ppt.html");
						alert("文件即将写入,请您在确保下载完成后关闭浏览器.");
						break;
					case "bgColor":
					case "pageColor":
					case "fontColor":
						var colorList = $("colorList");
						colorList.target = target;
						changeDisplay(colorList);
						colorList.onclick = function(event) {
							event = event || window.event;
							var target = event.target || event.srcElement;
							if(target.parentNode.parentNode == this) {
								var userRange = getUserRange();
								if(this.target.id == "fontColor") {
									setStyle("color", target.style.backgroundColor + "", userRange);
								} else if(this.target.id == "bgColor") {
									var div = getDiv(userRange.startContainer);
									div.style.backgroundColor = target.style.backgroundColor + "";
								} else if(this.target.id == "pageColor") {
									$("ppt").style.backgroundColor = target.style.backgroundColor + "";
								}
								this.style.display = "none";
								this.onclick = null;
								this.target = null;
							}
						}
						break;
					case "fontFamily_enter":
						setStyle("fontFamily", $("fontFamily_input").value, window.userRange);
						$("start_list").style.display = "none";
						userRange = true;
						break;
					case "fontSize_enter":
						setStyle("fontSize", $("fontSize_input").value + "px", window.userRange);
						$("start_list").style.display = "none";
						userRange = true;
						break;
					case "sup":
					case "sub":
						$("start_list").style.display = "none";
						var innertext = prompt("请输入" + target.innerText + "内容:");
						var id = target.id;
						var userRange = getUserRange();
						insertHtmlAtCaret("<" + id + " style='font-size:" + (getFontSize(userRange.startContainer) / 5 * 3) + "px;' contenteditable='false'>" + innertext + "</" + id + ">");
						break;
					case "textArea":
						insertHtmlAtCaret("<table><tr><td>&nbsp;&nbsp;&nbsp;</td></tr></table>");
						break;
					case "table_enter":
						if(!isNaN(+$("rowCount").value) && !isNaN(+$("lineCount").value)) {
							var str = "<table>";
							for(var i1 = 0; i1 < +$("lineCount").value; i1++) {
								str += "<tr>"
								for(var i2 = 0; i2 < +$("rowCount").value; i2++) {
									str += "<td>&nbsp;&nbsp;&nbsp;</td>";
								}
								str += "</tr>";
							}
							str += "</table>";
							if(window.getSelection) {
								var userSelection = getSelection();
								userSelection.removeAllRanges();
								userSelection.addRange(window.userRange);
								insertHtmlAtCaret(str);
							} else {
								alert("对不起,你的浏览器无法胜任此项工作,建议升级或更换!");
							}
						} else {
							alert("对不起,您的输入有误,请重新输入");
						}
						break;
					case "link":
						var href = prompt("请输入网址(或'.'+页码):");
						var content = prompt("请输入超链接内容:");
						insertHtmlAtCaret("<a ontenteditable='false' href='" + href + "' target='_black'>" + content + "</a>");
						break;
					case "collaspe_right":
						var userRange = getUserRange();
						var td = getTd(userRange);
						if(!td.colSpan || td.colSpan == 0) {
							td.colSpan = 1;
						} else {
							td.colSpan++;
						}
						td.parentNode.removeChild(getElement(td.parentNode, "lastElementChild"));
						break;
					case "collaspe_down":
						var userRange = getUserRange();
						var td = getTd(userRange);
						if(!td.rowSpan || td.rowSpan == 0) {
							td.rowSpan = 1;
						} else {
							td.rowSpan++;
						}
						var removed = td.parentNode;
						for(var i = td.rowSpan; i > 1; i--) {
							removed = getElement(removed, "nextElementSibling");
						}
						removed.removeChild(getElement(removed, "lastElementChild"));
						break;
					case "cutLine":
						var userRange = getUserRange();
						var td = getTd(userRange);
						var table = td.parentNode.parentNode;
						table.removeChild(td.parentNode);
						if(!/tr/i.test(table.innerHTML)) {
							table = table.parentNode;
							table.parentNode.removeChild(table);
						}
						break;
					case "addLine":
						var userRange = getUserRange();
						var td = getTd(userRange);
						var lineCount = +prompt("请输入列数:");
						if(!isNaN(lineCount)) {
							var tr = document.createElement("tr");
							var str = "";
							for(var i = 0; i < lineCount; i++) {
								str += "<td>&nbsp; &nbsp;</td>";
							}
							tr.innerHTML = str;
							td.parentNode.parentNode.appendChild(tr);
						} else {
							alert("输入错误,请重新输入!");
						}
						break;
					case "addRow":
						var userRange = getUserRange();
						var td = getTd(userRange);
						var tbody = td.parentNode.parentNode;
						var childNodes = tbody.childNodes;
						for(var i = 0; i < childNodes.length; i++) {
							if(childNodes[i].tagName) {
								var td2 = document.createElement("td");
								td2.innerHTML = "&nbsp; &nbsp;"
								childNodes[i].appendChild(td2);
							}
						}
						break;
					case "cutRow":
						var userRange = getUserRange();
						var td = getTd(userRange);
						var tbody = td.parentNode.parentNode;
						var childNodes = tbody.childNodes;
						for(var i = 0; i < childNodes.length; i++) {
							if(childNodes[i].tagName) {
								childNodes[i].removeChild(getElement(childNodes[i], "lastElementChild"));
							}
						}
						if(!/td/i.test(tbody.innerHTML)) {
							tbody = tbody.parentNode;
							tbody.parentNode.removeChild(tbody);
						}
						break;
					case "print":
						$("other_list").style.display = "none";
						window.print();
						break;
					case "play":
						$("ppt").style.right = "0px";
					case "playOn":
						if(/msie/i.test(navigator.userAgent) && !/msie 9\.0|msie 10\.0|msie 11\.0/i.test(navigator.userAgent)) {
							$("head").style.display = "none";
							$("lists").style.display = "none";
							$("sideBar").style.display = "none";
							$("ppts").style.margin = "0px auto 0px auto";
							$("ppts").style.position = 'static';
							$("note").style.display = "none";
						} else {
							var style = document.createElement("style");
							style.id = "playStyle";
							style.type = "text/css";
							style.innerHTML = "#head{display: none;}#lists{display: none;}#sideBar{display: none;}#ppts{margin: 0px auto 0px auto !important;position:static !important;}#ppt>div>div{background-color:rgba(0,0,0,0);}#note{display:none !important;}";
							document.head.appendChild(style);
							myRequestFullScreen(true, true);
							window.onmousedown = function() {
								return false;
							};
						}
						window.onclick = function() {
							window.onclick = function(event) {
								event = event || window.event;
								var target = event.target || event.srcElement;
								if(target.parentNode.id !== "ctrl") {
									$("cNEXT").onclick();
								}
							}
						}
						window.onkeydown = function(event) {
							event = event || window.event;
							switch(event.keyCode) {
								case 9:
								case 39:
								case 40:
								case 13:
									$("cNEXT").onclick();
									return false;
									break;
								case 37:
								case 38:
								case 8:
									$("cPREV").onclick();
									return false;
									break;
							}
						}
						$("other_list").style.display = "none";
						$("ctrl").style.display = "block";
						var divs = document.getElementsByClassName("title");
						for(var i = 0; i < divs.length; i++) {
							divs[i].blur();
						}
						divs = document.getElementsByClassName("content");
						for(var i = 0; i < divs.length; i++) {
							divs[i].blur();
						}
						break;
					case "playNote":
						if(target.innerText == "打开笔记本") {
							$("note").style.display = "block";
							target.innerText = "关闭笔记本";
						} else {
							$("note").style.display = "none";
							target.innerText = "打开笔记本";
						}
						$("other_list").style.display = "none";
						break;
					case "deleteBgImg":
						var ppts = $("ppts");
						ppts.style.backgroundImage = null;
						$("other_list").style.display = "none";
						break;
					case "install_enter":
						var file = $("install").files[0];
						if(!file) {
							alert("Sorry,您还没有选择插件,请点击左端'引入插件'字样选择插件后再点'确定'");
							return;
						}
						if(/.js$/.test($("install").value)) {
							var script = document.createElement("script");
							script.language = "JavaScript";
							script.type = "text/javascript";
							script.className = "userAppending";
							var fr = new FileReader();
							fr.readAsText(file);
							fr.onload = function() {
								script.innerHTML = this.result;
								document.body.insertBefore(script, $("fromNet"));
							}
						} else {
							alert("Sorry,您选择的并非插件,请重新选择");
							return;
						}
						$("other_list").style.display = "none";
						break;
				}

				switch(target.parentNode.id) {
					case "fontFamily_list":
						var userRange = getUserRange();
						$("fontFamily_input").value = target.style.fontFamily;
						setStyle("fontFamily", target.style.fontFamily, userRange);
						$("start_list").style.display = "none";
						break;
					case "fontSize_list":
						var userRange = getUserRange();
						setStyle("fontSize", target.innerText + "px", userRange);
						$("start_list").style.display = "none";
						break;
					case "textAlign_list":
						var userRange = getUserRange();
						setStyle("textAlign", target.className, userRange, "div");
						$("start_list").style.display = "none";
						break;
					case "fontStyle_list":
						var userRange = getUserRange();
						if(target.id == "bold") {
							setStyle("fontWeight", "bold", userRange);
							$("start_list").style.display = "none";
						} else if(target.id == "null") {
							setStyle("fontWeight", "normal", userRange);
							setStyle("fontStyle", "normal", userRange);
							setStyle("textDecoration", "none", userRange);
						} else if(target.id == "italic") {
							setStyle("fontStyle", "italic", userRange);
						} else {
							setStyle("textDecoration", target.id, userRange);
						}
						$("start_list").style.display = "none";
						break;
					case "lineHeight_list":
						if(target.id == "lineHeight_other") {
							var userRange = getUserRange();
							var fontSize = getFontSize(userRange.startContainer);
							var add = prompt("请输入所需行间距:");
							if(!/[0-9]+/.test(add)) {
								alert("您的输入错误,请重新输入!");
								return;
							}
							setStyle("lineHeight", fontSize + (+add) + "px", userRange);
						} else {
							var fontSize = getFontSize();
							var userRange = getUserRange();
							setStyle("lineHeight", fontSize + (+target.innerText) + "px", userRange);
						}
						break;
				}
				if(target.parentNode.parentNode.id == "fenShu_list" && target.type != "text") {
					//插入分数
					//获取字体大小
					var fontSize = getFontSize() + 2;
					var denominatorLength = $("denominator").value.length; //获取分母长度
					var numeratorLength = $("numerator").value.length; //获取分子长度
					var userSelection = getSelection();
					userSelection.removeAllRanges();
					userSelection.addRange(window.userRange);
					var width = 17 + Math.max(denominatorLength, numeratorLength) * fontSize / 3;
					insertHtmlAtCaret("<sub contenteditable='false'><canvas id='c' width='" + width + "px' height='" + fontSize * 1.5 + "px'></canvas></sub>&nbsp;");
					var canvas = $("c");
					var sub = canvas.parentNode;
					var context = canvas.getContext("2d");
					context.font = [fontSize * 3 / 2];
					context.fillText($("numerator").value, (parseInt(canvas.width) - numeratorLength * fontSize * 0.5) / 2, parseInt(canvas.height) * 0.5);
					context.stroke();
					context.fillText($("denominator").value, (parseInt(canvas.width) - denominatorLength * fontSize * 0.5) / 2, parseInt(canvas.height));
					context.stroke();
					context.moveTo(0, (parseInt(canvas.height) + 4) / 2);
					context.lineTo(parseInt(canvas.width), (parseInt(canvas.height) + 4) / 2);
					context.stroke();
					var dataUrl = canvas.toDataURL("image/png");
					sub.innerHTML = "<img src='" + dataUrl + "' />";
					$("insert_list").style.display = "none";
				} else if(target.parentNode.id == "img" && target.type == "button") {
					var file = $("file").files[0];
					if(!file) {
						alert("Sorry,您还买有导入本地照片,请点击左端'照片'字样导入后再点'确定'");
						return;
					}
					var userRange = getUserRange();
					var div = getDiv(userRange.startContainer);
					if(div === false) {
						alert("Sorry,你还没有选择哦!");
						return;
					}
					if(/image\/\w+/.test(file.type)) {
						try {
							var fr = new FileReader();
							fr.readAsDataURL(file);
							fr.onload = function(e) {
								if(parseInt(div.style.width) > parseInt(div.style.height) + 100) {
									div.innerHTML = "<span contenteditable='false'><img height='" + div.style.height + "' src='" + this.result + "'/></span>";
								} else {
									div.innerHTML = "<span contenteditable='false'><img width='" + div.style.width + "' src='" + this.result + "'/></span>"
								}
								insertHtmlAtCaret("");
							}
						} catch(e) {
							alert("抱歉,你的光标还未在纸上留下痕迹");
						}
					} else {
						alert("Sorry,你选择的文件不是图像文件,请重新选择");
					}
				} else if(target.parentNode.id == "bgImg" && target.type == "button") {
					var file = $("gbImgFile").files[0];
					if(!file) {
						alert("Sorry,您还买有导入本地照片,请点击左端'照片'字样导入后再点'确定'");
						return;
					}
					if(/image\/\w+/.test(file.type)) {
						try {
							var fr = new FileReader();
							fr.readAsDataURL(file);
							fr.onload = function(e) {
								var ppts = $("ppts");
								ppts.style.backgroundImage = "url(" + this.result + ")";
								ppts.style.backgroundSize = "740px 500px";
							}
						} catch(e) {
							alert("抱歉,你的光标还未在纸上留下痕迹");
						}
					} else {
						alert("Sorry,你选择的文件不是图像文件,请重新选择");
					}
				}
			}
			$("cNEXT").onclick = function() {
				myRequestFullScreen(true, true);
				var ppt = $("ppt");
				var right = parseInt(ppt.style.right);
				if((parseInt(ppt.style.width) - 740) >= right) {
					changeRight(ppt, right, right + 740);
				} else {
					alert("Sorry,您的幻灯片已经播放完成!");
				}
			}
			$("cPREV").onclick = function() {
				myRequestFullScreen(true, true);
				var ppt = $("ppt");
				var right = parseInt(ppt.style.right);
				if(right >= 740) {
					changeRight(ppt, right, right - 740);
				} else {
					alert("Sorry,您的幻灯片已是第一张,无法向前!");
				}
			}
			$("cEXIT").onclick = function() {
				myRequestFullScreen(false);
				var playStyle = $("playStyle");
				playStyle.parentNode.removeChild(playStyle);
				$("ctrl").style.display = "none";
				window.onclick = null;
				window.onmousedown = null;
				window.onkeydown = null;
			}

			function changeRight(obj, nowRight, aimRight) {
				if(aimRight % 740 != 0) {
					aimRight += 740 - (aimRight % 740);
				}
				var timer = setInterval(function() {
					if(aimRight > nowRight) {
						nowRight += 20;
						if(nowRight <= aimRight) {
							obj.style.right = nowRight + "px";
						} else {
							obj.style.right = aimRight + "px";
							clearInterval(timer);
						}
					} else {
						nowRight -= 20;
						if(nowRight >= aimRight) {
							obj.style.right = nowRight + "px";
						} else {
							obj.style.right = aimRight + "px";
							clearInterval(timer);
						}
					}
				}, 10);
			}

			function getDiv(target) {
				try {
					while(true) {
						if(/\btitle\b/.test(target.className) || target.className == "content") return target;
						target = target.parentNode;
					}
				} catch(e) {
					return false;
				}
			}

			function getTd(userRange) {
				var td = userRange.startContainer;
				var count = 0;
				while(!/td/i.test(td.tagName)) {
					td = td.parentNode;
					count++;
					if(count >= 5) return false;
				}
				return td;
			}

			//此方法用于获取一个元素的字体大小
			function getFontSize(obj) {
				var fontSize;
				try {
					fontSize = obj.style.fontSize;
				} catch(e) {
					fontSize = 17;
				}
				if(!fontSize) {
					fontSize = 17;
				} else {
					fontSize = parseInt(fontSize);
				}
				return fontSize;
			}
		</script>
		<script id="callbacksOfKeydown" type="text/javascript">
			$("ppt").onkeydown = function(event) {
				event = event || window.event;
				if(event.keyCode == 9) {
					insertHtmlAtCaret("　　");
					return false;
				}
			}

			/**
			 * 这是一个给光标处插入 html 的方法
			 * @param {Object} html
			 */
			function insertHtmlAtCaret(html) {
				if(window.getSelection) {
					var userSelection = getSelection();
					var userRange = userSelection.getRangeAt(0);
					userRange.deleteContents();
					var el = document.createElement("div");
					el.innerHTML = html;
					var frag = document.createDocumentFragment(),
						node, lastNode;
					while((node = el.firstChild)) {
						lastNode = frag.appendChild(node);
					}
					userRange.insertNode(frag);
					if(lastNode) {
						userRange.setStartAfter(lastNode);
					}
				} else if(document.selection && document.selection.type != "Control") {
					document.selection.createRange().pasteHTML(html);
				} else {
					alert("对不起,您的浏览器版本太低,请及时更新!");
				}
			}

			/**
			 * 该方法用于给选中内容设置样式
			 * @param {Object} type_str 样式名称
			 * @param {Object} setting_str 设置的样式
			 */
			function setStyle(type_str, setting_str, userRange, nodeType) {
				if(!nodeType) {
					nodeType = "span";
				}
				if(window.getSelection) {
					if(!userRange) {
						//如果用户没有选择,则进行全局设置
						if(!window.userRange) {
							$("papers").style[type_str] = setting_str;
							return;
						} else {
							userRange = window.userRange;
						}
					}
					if(userRange.startContainer == userRange.endContainer) {
						if(userRange.startOffset == userRange.endOffset) {
							if(userRange.startContainer.nodeName != "#text") {
								userRange.startContainer.style[type_str] = setting_str;
							} else {
								alert("请选择后再进行设置,谢谢!");
							}
							return;
						}
						//如果开始的标签==结束的标签
						if(userRange.startOffset == 0 && userRange.endOffset == userRange.startContainer.length && nodeType != "div") {
							var parent = userRange.startContainer.parentNode;
							parent.style[type_str] = setting_str;
						} else {
							var myNode = document.createElement(nodeType);
							myNode.style[type_str] = setting_str;
							userRange.surroundContents(myNode);
						}
					} else if(nodeType == "span") {
						var myNode = document.createElement(nodeType);
						myNode.style[type_str] = setting_str;
						var startContainer = userRange.startContainer,
							endContainer = userRange.endContainer,
							startOffset = userRange.startOffset,
							endOffset = userRange.endOffset,
							commonAncestorContainer = userRange.commonAncestorContainer;
						var _node = startContainer;
						while(_node.parentNode != commonAncestorContainer) {
							_node = _node.parentNode;
						}
						var list = [];
						_node = _node.nextSibling;
						while(!contains(_node, endContainer)) {
							list.push(_node);
							_node = _node.nextSibling;
						}

						function surround(textNode, startOffset, endOffset) {
							userRange.setStart(textNode, startOffset);
							userRange.setEnd(textNode, endOffset);
							userRange.surroundContents(myNode.cloneNode());
						}
						surround(startContainer, startOffset, startContainer.length);
						for(var i = 0; i < list.length; i++) {
							try {
								if(list[i].nodeName == "#text" && list[i].length != 0) {
									surround(list[i], 0, list[i].length);
								} else {
									list[i].style[type_str] = setting_str;
								}
							} catch(e) {}
						}
						surround(endContainer, 0, endOffset);
					} else {
						var startContainer = userRange.startContainer,
							startOffset = userRange.startOffset,
							myNode = document.createElement(nodeType),
							frag = userRange.extractContents();
						if(startOffset == 0 && !startContainer.previousSibling) {
							startContainer = startContainer.parentNode;
							startContainer.appendChild(myNode);
						} else if(startOffset != 0) {
							userRange.setStart(startContainer, startOffset);
							userRange.setEnd(startContainer, startOffset);
							userRange.insertNode(myNode);
						} else {
							var pre = startContainer.previousSibling;
							if(pre.nodeName != "#text") {
								pre.insertAdjacentElement("afterEnd", myNode);
							} else {
								var parentNode = pre.parentNode;
								userRange.setStart(parentNode, parentNode.length);
								userRange.setEnd(parentNode, parentNode.length);
								userRange.insertNode(myNode);
							}
						}
						myNode.appendChild(frag);
						myNode.style[type_str] = setting_str;
					}
				} else {
					alert("Sorry,您的浏览器版本过低,请及时更新,谢谢!");
				}
			}
		</script>

		<script id="copyOnlyTxt" type="text/javascript" language="JavaScript">
			function copyOnlyTxt() {
				try {
					document.execCommand("AutoUrlDetect", false, false);
				} catch(e) {}
				this.onpaste = function(e) {
					e = e || window.event;
					e.preventDefault();
					var text = null;
					if(window.clipboardData && clipboardData.setData) {
						text = window.clipboardData.getData('text');
					} else {
						text = (e.originalEvent || e).clipboardData.getData('text/plain') || prompt('在这里输入文本');
					}
					if(document.body.createTextRange) {
						if(document.selection) {
							textRange = document.selection.createRange();
						} else if(window.getSelection) {
							sel = window.getSelection();
							var range = sel.getRangeAt(0);
							var tempEl = document.createElement("span");
							tempEl.innerHTML = "&#FEFF;";
							range.deleteContents();
							range.insertNode(tempEl);
							textRange = document.body.createTextRange();
							textRange.moveToElementText(tempEl);
							tempEl.parentNode.removeChild(tempEl);
						}
						textRange.text = text;
						textRange.collapse(false);
						textRange.select();
					} else {
						document.execCommand("insertText", false, text);
					}
				};
				this.onkeydown = function(e) {
					e = e || window.event;
					// e.metaKey for mac
					if(e.ctrlKey || e.metaKey) {
						switch(e.keyCode) {
							case 66: //ctrl+B or ctrl+b
							case 98:
							case 73: //ctrl+I or ctrl+i
							case 105:
							case 85: //ctrl+U or ctrl+u
							case 117:
								{
									e.preventDefault();
									break;
								}
						}
					}
				};
			}
			copyOnlyTxt.call($("ppts"));
		</script>
		<script id="save" type="text/javascript">
			var saveAs = saveAs || (function(view) {
				"use strict";
				if(typeof view === "undefined" || typeof navigator !== "undefined" && /MSIE [1-9]\./.test(navigator.userAgent)) {
					return;
				}
				var
					doc = view.document,
					get_URL = function() {
						return view.URL || view.webkitURL || view;
					},
					save_link = doc.createElementNS("http://www.w3.org/1999/xhtml", "a"),
					can_use_save_link = "download" in save_link,
					click = function(node) {
						var event = new MouseEvent("click");
						node.dispatchEvent(event);
					},
					is_safari = /constructor/i.test(view.HTMLElement) || view.safari,
					is_chrome_ios = /CriOS\/[\d]+/.test(navigator.userAgent),
					throw_outside = function(ex) {
						(view.setImmediate || view.setTimeout)(function() {
							throw ex;
						}, 0);
					},
					force_saveable_type = "application/octet-stream",
					arbitrary_revoke_timeout = 1000 * 40 // in ms
					,
					revoke = function(file) {
						var revoker = function() {
							if(typeof file === "string") { // file is an object URL
								get_URL().revokeObjectURL(file);
							} else { // file is a File
								file.remove();
							}
						};
						setTimeout(revoker, arbitrary_revoke_timeout);
					},
					dispatch = function(filesaver, event_types, event) {
						event_types = [].concat(event_types);
						var i = event_types.length;
						while(i--) {
							var listener = filesaver["on" + event_types[i]];
							if(typeof listener === "function") {
								try {
									listener.call(filesaver, event || filesaver);
								} catch(ex) {
									throw_outside(ex);
								}
							}
						}
					},
					auto_bom = function(blob) {
						if(/^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(blob.type)) {
							return new Blob([String.fromCharCode(0xFEFF), blob], {
								type: blob.type
							});
						}
						return blob;
					},
					FileSaver = function(blob, name, no_auto_bom) {
						if(!no_auto_bom) {
							blob = auto_bom(blob);
						}
						var
							filesaver = this,
							type = blob.type,
							force = type === force_saveable_type,
							object_url, dispatch_all = function() {
								dispatch(filesaver, "writestart progress write writeend".split(" "));
							},
							fs_error = function() {
								if((is_chrome_ios || (force && is_safari)) && view.FileReader) {
									// Safari doesn't allow downloading of blob urls
									var reader = new FileReader();
									reader.onloadend = function() {
										var url = is_chrome_ios ? reader.result : reader.result.replace(/^data:[^;]*;/, 'data:attachment/file;');
										var popup = view.open(url, '_blank');
										if(!popup) view.location.href = url;
										url = undefined; // release reference before dispatching
										filesaver.readyState = filesaver.DONE;
										dispatch_all();
									};
									reader.readAsDataURL(blob);
									filesaver.readyState = filesaver.INIT;
									return;
								}
								if(!object_url) {
									object_url = get_URL().createObjectURL(blob);
								}
								if(force) {
									view.location.href = object_url;
								} else {
									var opened = view.open(object_url, "_blank");
									if(!opened) {
										view.location.href = object_url;
									}
								}
								filesaver.readyState = filesaver.DONE;
								dispatch_all();
								revoke(object_url);
							};
						filesaver.readyState = filesaver.INIT;

						if(can_use_save_link) {
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
					},
					FS_proto = FileSaver.prototype,
					saveAs = function(blob, name, no_auto_bom) {
						return new FileSaver(blob, name || blob.name || "download", no_auto_bom);
					};
				if(typeof navigator !== "undefined" && navigator.msSaveOrOpenBlob) {
					return function(blob, name, no_auto_bom) {
						name = name || blob.name || "download";

						if(!no_auto_bom) {
							blob = auto_bom(blob);
						}
						return navigator.msSaveOrOpenBlob(blob, name);
					};
				}

				FS_proto.abort = function() {};
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
				typeof self !== "undefined" && self ||
				typeof window !== "undefined" && window ||
				this.content
			));
			if(typeof module !== "undefined" && module.exports) {
				module.exports.saveAs = saveAs;
			} else if((typeof define !== "undefined" && define !== null) && (define.amd !== null)) {
				define("FileSaver.js", function() {
					return saveAs;
				});
			}
		</script>
		<%--userAppending代码 --%>
		<%myOut=br.readLine();
while(myOut!=null){
out.print(myOut+'\n');
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
			function getURL(relativeURL) {
				var _location = location.pathname;
				_location = /^http/.test(location.toString()) ? _location.slice(0, _location.lastIndexOf("/")) : "http://www.hOffice.com.cn";
				return _location + relativeURL;
			}

			function localSupport() {
				var fromNet = $("fromNet");
				fromNet.src = getURL("/support/hPPTSupport.js");
			}
			localSupport();
		</script>
	</body>

</html>