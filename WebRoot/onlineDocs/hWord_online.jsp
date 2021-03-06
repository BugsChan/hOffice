<%@page import="java.io.FileInputStream,java.io.InputStreamReader,java.io.BufferedReader"%>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
<html id="version:2.3|hWord">
<!--
作者：陈子为	山东师范大学2016级 食工一班 学号:201613010147 QQ:3502318983 Email:3502318983@qq.com
时间：2017-8-25~2017-11-24
版本：2.0
美工：李萌
(c) www.hoffice.com.cn
(c) 陈子为
-->
	<head>
		<meta charset="UTF-8">
		<title><%=name %></title>
		<style id="printStylesheet" media="print">
			#head{
				display: none;
			}
			#lists{
				display: none;
			}
			#papers{
				margin: 0px auto 0px auto;
				width: 100%;
			}
			#note{
				display: none !important;
			}
			#adv{
				display: none;
			}
		</style>
		<style type="text/css">
			*{
				padding: 0px;
				margin: 0px;
				background-color: #ebe9e2;
				font-family:"Consolas","courier new","微软雅黑";
				font-size: 12px;
			}
			#items{/*head中的按钮栏89+36+27*/
				background-color: inherit;
				margin-left: 152px;
				margin-top: 6px;
			}
			#items button{
				width: 25px;
				height: 15px;
				line-height: 12px;
				font-size: 15px;
				background-color: #4d86a0;
				color: #FFF;
				border: none;
				cursor:pointer;
			}
			#items button:hover{
				font-size: 10px;
			}
			#head{
				width: 100%;
				height: 60px;
				background-color: #4d86a0;
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
				width:165px;
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
				width: 100%;
				top: 60px;
				opacity: 0.92;
			}
			#lists ul{
				float: left;
				width: 0em;
				display: none;
				list-style: none;
				background-color: #e1e1e1;
				position: fixed;
			}
			#lists li{
				width: 10em;
				cursor:pointer;
				background-color: inherit;
			}
			#lists li:hover{
				background-color: #b9c8ca;
			}
			#papers{
				margin: 70px auto 30px auto;
				width: 800px;
			}
			#papers>div{
				width: 760px;
				height: 870px;
				margin: 5px 0px 20px 0px;
				padding: 65px 20px 70px 20px;
				overflow: hidden;
			}
			#papers>div>div{
				padding: 0px 50px 0px 50px;
				text-align: left;
				font-size: 15px;
				font-family: "宋体";
			}
			#papers *{
				background-color: white;
				border: none;
				outline:none;
				font-family: inherit;
				font-size: inherit;
				text-align: inherit;
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
			input[type="button"]{
				border: solid 0.5px;
				width: 2.9em;
			}
			input[type="button"]:hover{
				background-color: inherit;
			}
			input[type="text"]{
				border: solid 0.5px;
			}
			textarea{
				border: solid deepskyblue 1px;
			}
			table{
				border-collapse: collapse;
			}
			#papers td{
				border: solid 1px;
			}
			ul label{
				display:inline-block;
				width:7em;
				background-color: #e1e1e1;
			}
			ul label:hover{
				background-color: #b9c8ca;
			}
		</style>
		<link class="mobile" rel="stylesheet" type="text/css" href="css/hWord_mobile.css" />
	</head>
	<body>
		<!--该div为标题栏,包括了关闭按钮,文件名和操作按钮-->
		<div id="head">
			<div id="flag">
				<img  src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFQAAAAVCAYAAADYb8kIAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA+dpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMTctMTEtMjNUMDM6MDk6NTgrMDg6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDE3LTExLTIzVDA0OjA2OjMwLTE2OjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDE3LTExLTIzVDA0OjA2OjMwLTE2OjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpBMTFBMkM2OUNGQzAxMUU3QTFFRkZDMjhFRTg1ODc1MyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpBMTFBMkM2QUNGQzAxMUU3QTFFRkZDMjhFRTg1ODc1MyI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkExMUEyQzY3Q0ZDMDExRTdBMUVGRkMyOEVFODU4NzUzIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkExMUEyQzY4Q0ZDMDExRTdBMUVGRkMyOEVFODU4NzUzIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+ymPwLAAAAkhJREFUeNrsWYFxwjAMdLgukI7gjuCOEEbICukIyQjpCDACjIBHwCPACDBC6twpd19VdgjhEqDoTiSxLMe835IMSdM0yovxWqu4LNlz4TWP9HdeK/XP5I2uqddsoO81Ps8mmrQV234sJnz5wWtDV0kKsjd0L0lnr+8E0HaH7kjV1IBaWNVUsJvAfScZCyd3KVMC6gYAZnoAty9Af4NgArHIXQBo2+f8AlSpIwBhAuxEsLJAn7tl51BAd0yLESyVGNqBLrEU466LZNwVJL+T102A7TzJdQnmAM+8oinBvg+WjG0d6jVrbi87Ghu1BHsK7Xtqa+dR0/0G7EXAD+d/isylEHwU2EvWH/ukMD8ue+6zmHhHOGELp8AiSyzlW15H4qcmJqZk//Ca0LV7Xw1jSFLSuN/CYaSG+VU09rvXtcj+iRnKWdE+56y/gT6aMbiOsP4ksDcF5q4ic2novUrwbyL+szNUiqOatTsheZlI/MzBn7P3DOPGTnXrwNgZ68NlOyYpJUyrGwGaQULioUGzL2V7yqlYmNE9FUgo0Q06TMzB0CPL3FI5hKx6iPpzTkAtO79LYDmhXNr2LFCoPDJDGCaEDHUBw2cF9AxfLlSsI6B9gGwhlmphy+YjDgRWiNUq1raYaWdY4YQ0FHRMFh2TNgBqV04pKImuCU8WyqcSSr2VtCvmAvQYYYKUBGzPWBVsb/yZ0BCYyxHx9wt8aziFFdIizc3QWLK5FNCOpZ+MrUdodyMXn49taZH+lFIJ/QXykgfO8k8tPwIMAIMK6cjibKkTAAAAAElFTkSuQmCC"/>
				<span id="title" title="点击修改文件名"><%=name %></span>
			</div>
			<div id="items">
				<button id="prev">↺</button><button id="next">↻</button><span id="document">文件</span><span id="start">样式</span><span id="insert">插入</span><span id="headTable">表格</span><span id="other">其他</span><span title="使用全屏,编辑更方便" id="requstFullScreen">全屏</span><span id="help">帮助</span><span id="login" style="float: right;margin-right: 50px;">登录</span>
			</div>
		</div>
		<!--这个div标签中装的是菜单-->
		<div id="lists">
			<!--这是文件的下拉菜单-->
			<ul id="document_list" style="margin-left: 222px;">
				<li id="lock" title="在输入框中不填入任何值则会取消加密">加密</li>
				<li id="save">保存(下载)</li>
				<li id="saveInBrowser" style="display: none;">存为浏览器文件</li>
				<li id="saveInServie" style="display: none;">存为云文件</li>
				<li id="myDoc" style="display: none;">我的文件</li>
			</ul>
			<!--这是"开始"按钮的下拉菜单-->
			<ul id="start_list" style="margin-left: 256px;">
				<li id="fontFamily">字体</li>
				<li id="fontSize">字号</li>
				<li id="color">颜色</li>
				<li id="textAlign">对齐方式</li>
				<li id="lineHeight">行间距</li>
				<li id="fontStyle">字体样式</li>
				<li id="sup">上标</li>
				<li id="sub">下标</li>
				<li id="search">查找替换</li>
			</ul>
			<!--这是"插入"按钮的下拉菜单-->
			<ul id="insert_list" style="margin-left: 310px;">
				<li id="fenShu" title='三击可去除分数'>分数</li>
				<li id="table">表格</li>
				<li id="img">
					<label for="file" title="三击可去除图片或视频">图片</label><input type="button" value="确定" />
					<input type="file" id="file" name="" style="display: none"/>
				</li>
				<li id="video">
					<input type="file" id="videoFile" style="display: none;" />
					<label for="videoFile" title="三击可去除图片或视频">视频</label><input id="video_sure" type="button" value="确定" />
				</li>
				<li id="link"  title="注意:兼容性不佳,仅火狐浏览器和Chrome浏览器(含其他火狐或Chrome内核浏览器)兼容">超链接</li>
				<li id="textArea">文本框</li>
			</ul>
			<ul id="headTable_list" style="margin-left: 368px;">
				<li id="collaspe_right">向右合并</li>
				<li id="collaspe_down">向下合并</li>
				<li id="cutLine">删除此行</li>
				<li id="addLine">增加一行</li>
				<li id="addRow">增加一列</li>
				<li id="cutRow">删除一列</li>
			</ul>
			<!--这是"其他"按钮的下拉菜单-->
			<ul id="other_list" style="margin-left: 420px;">
				<!--<li>纸张大小</li>-->
				<li id="print">打印</li>
				<li id="playNote">打开笔记本</li>
				<li title="点此引入插件">
					<input type="file" id="install" style="display: none;">
					<label for="install">引入插件</label><input type="button" value="确定" id="install_enter" />
				</li>
			</ul>
			<ul id="help_list" style="margin-left:525px;">
				<li id="unable_to_save">无法保存(下载)?</li>
			</ul>
			<ul id="fontFamily_list" style="margin-left: 376px;margin-top: 0.5em;">
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
			<ul id="color_list" style="margin-left: 376px;margin-top: 1.5em;">
				<li id="fontColor">字体颜色</li>
				<li id="bgColor">背景颜色</li>
			</ul>
			<ul id="fontSize_list" style="margin-left: 376px;margin-top: 1.5em;">
				<li>12</li><li>14</li><li>16</li><li>18</li><li>20</li><li>22</li><li>24</li><li>26</li><li>28</li>
				<li><input type="text" style="width: 7em;border: solid 0.5px;" placeholder="请输入其他字号" id="fontSize_input" /><input type="button" id="fontSize_enter" value="确定"/></li>
			</ul>
			<ul id="textAlign_list" style="margin-left: 376px;margin-top: 1.5em;">
				<li class="left">左对齐</li>
				<li class="right">右对齐</li>
				<li class="center">居中对齐</li>
				<li class="justify">两端对齐</li>
			</ul>
			<ul id="lineHeight_list" style="margin: 2.5em 0px 0px 376px;">
				<li>2</li>
				<li>3</li>
				<li>8</li>
				<li>10</li>
				<li>15</li>
				<li id="lineHeight_other">其他</li>
			</ul>
			<ul id="fontStyle_list" style="margin-left: 376px;margin-top: 5em;">
				<li id="bold" style="font-weight: bold;">加粗</li>
				<li id="null">正常</li>
				<li id='italic' style="font-style: italic;">斜体</li>
				<li id="underline" style="text-decoration: underline;">下划线</li>
				<li id="line-through" style="text-decoration: line-through;">删除线</li>
			</ul>
			<ul id="search_list" style="margin: 10em 0px 0px 376px;">
				<li><input id="searching" type="text" placeholder="查找内容"></li>
				<li><input id="replaceTo" type="text" placeholder="替换为"/></li>
				<li><input id="replace" type="button" style="width: 3em;" value="替换"><input id="searchNext" type="button" style="width: 7em;" value="查找下一处"></li>
			</ul>
			<ul id="fenShu_list" style="margin:0.5em 0px 0px 430px;">
				<li><input id="numerator" style="border:solid 0.5px;" type="text" placeholder="请输入分子" /></li>
				<li><input id="denominator" style="border:solid 0.5px;" type="text" placeholder="请输入分母" /></li>
				<li><input type="button" style="width: 10em;" value="确定"/></li>
			</ul>
			<ul id="table_list" style="margin:1.5em 0px 0px 430px;">
				<li><input id="rowCount" type="text" placeholder="行数"/></li>
				<li><input id="lineCount" type="text" placeholder="列数"/></li>
				<li><input id="table_enter" type="button" style="width: 10em;" value="确定"/></li>
			</ul>
			<ul id="colorList" style="margin-left: 476px;width: 150px;overflow: hidden;">
				<li><span style="background-color: #000000;"></span><span style="background-color: #993300;"></span><span style="background-color: #333300;"></span><span style="background-color: #000080;"></span><span style="background-color: #333399;"></span><span style="background-color: #333333;"></span></li><li><span style="background-color: #800000;"></span><span style="background-color: #FF6600;"></span><span style="background-color: #808000;"></span><span style="background-color: #008000;"></span><span style="background-color: #008080;"></span><span style="background-color: #0000FF;"></span></li><li><span style="background-color: #666699;"></span><span style="background-color: #808080;"></span><span style="background-color: #FF0000;"></span><span style="background-color: #FF9900;"></span><span style="background-color: #99CC00;"></span><span style="background-color: #339966;"></span></li><li><span style="background-color: #33CCCC;"></span><span style="background-color: #3366FF;"></span><span style="background-color: #800080;"></span><span style="background-color: #999999;"></span><span style="background-color: #FF00FF;"></span><span style="background-color: #FFCC00;"></span></li><li><span style="background-color: #FFFF00;"></span><span style="background-color: #00FF00;"></span><span style="background-color: #00FFFF;"></span><span style="background-color: #00CCFF;"></span><span style="background-color: #993366;"></span><span style="background-color: #C0C0C0;"></span></li><li><span style="background-color: #FF99CC;"></span><span style="background-color: #FFCC99;"></span><span style="background-color: #FFFF99;"></span><span style="background-color: #CCFFFF;"></span><span style="background-color: #99CCFF;"></span><span style="background-color: #FFFFFF;"></span></li>
				<li></li>
			</ul>
		</div>
		<%--papers.outerHTML --%>
		<%
String myOut=br.readLine();
while(myOut!=null&&!myOut.equals(str1)&&!myOut.equals(str2)){
out.print(myOut);
myOut=br.readLine();
}
%>
		<a id="adv" target="_blank" href="http://www.hOffice.com.cn">亲,你也可以使用hOffice哦</a>
		<textarea id="note" <%if(myOut!=null&&myOut.equals(str1)){
			out.print("class=\"");
			myOut=br.readLine();
			while(myOut!=null&&!myOut.equals(str2)){
				out.print(myOut+"\n");
				myOut=br.readLine();
			}
			out.print("\"");
		} %> placeholder="笔记本" style="position: fixed;display:none;height: 100px;width: 250px;right: 20px;top: 30px;"></textarea>
		<script id="beforeFuns" type="text/javascript">
			//设置before_save()方法,以免出错
			function before_save(){
				var note=$("note");
				note.className=note.value;
				var netJs=document.getElementsByClassName("fromNet");
				while(netJs.length>0){
					netJs[0].parentNode.removeChild(netJs[0]);
				}
				$("fromNet").removeAttribute("src");
				if($("title").innerText=="hWord"){
					$("head").onclick({target:{id:"title"}});
				}
			}
		</script>
		<!--[if lte IE 8]>
			<script type="text/javascript">
				alert("Sorry,本网站不支持IE8及几下版本浏览器,请更新你的浏览器,谢谢!");
			</script>
		<![endif]-->
		<script id="callbacksOfClick" type="text/javascript">
			(function(){
				if(window.jQuery){
					JQuery.noConflict();
				}
				//加密
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
				window.onclick=function(event){
					event=event||window.event;
					var target=event.target||event.srcElement;
					if(target.parentNode.id!="items"&&target.id!="fontColor"&&target.id!="bgColor"&&target.tagName!="INPUT"&&target.id!="input"){
						$("lists").style.display="none";
					}
				};
			})();
			function $(str){
				return document.getElementById(str);
			}
			
			//定义userRange,用于表述用户输入区域;
			var userRange;
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
			$("head").onmousedown=
			$("lists").onmousedown
			=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				var userRange=getUserRange();
				if(contains($("papers"),userRange.startContainer)){
					window.userRange=userRange;
				}
				if(!/text/i.test(target.type))return false;
			};
			$("lists").onkeydown=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				if(/input/i.test(target.tagName)){
					searchTimeCopy=0;
				}
			}
			var drag={
				paperMouseMove:function(event){
					event=event||window.event;
					var target=event.target||event.srcElement
					if(!/img|video/i.test(target.tagName))return;
					var x=drag.getInnerPosition(target,"x",event.clientX)
					,y=drag.getInnerPosition(target,"y",event.clientY);
					if(target.clientWidth-x<8){
						target.style.cursor="e-resize";
						target.onmousedown=drag.md_x;
					}else if(target.clientHeight-y<8){
						target.style.cursor="n-resize";
						target.onmousedown=drag.md_y;
					}else{
						target.style.cursor="default";
						target.onmousedown=null;
					}
				}
				,md_x:function(event){
					event=event||window.event;
					var target=event.target||event.srcElement;
					window.onmouseup=drag.win_mouseup;
					window.onmousemove=function(event){
						drag.mm_x(event,target);
					}
					return false;
				}
				,md_y:function(event){
					event=event||window.event;
					var target=event.target||event.srcElement;
					window.onmouseup=drag.win_mouseup;
					window.onmousemove=function(event){
						drag.mm_y(event,target);
					}
					return false;
				}
				,mm_x:function(event,target){
					var width=drag.getInnerPosition(target,"x",event.clientX);
					if(width>720||width<30)return;
					target.width=width;
				}
				,mm_y:function(event,target){
					var height=drag.getInnerPosition(target,"y",event.clientY);
					if(height<30)return;
					target.height=height;
				}
				,win_mouseup:function(event){
					window.onmousemove
					=window.onmousedown
					=window.onmouseup
					=null;
				}
				,getInnerPosition:function(obj,x_y_str,clientXY){
					if(x_y_str==="x"){
						return clientXY-obj.offsetLeft;
					}else{
						var y=document.body.scrollTop||document.documentElement.scrollTop;
						y+=clientXY-obj.offsetTop;
						return y;
					}
				}
			};
			$("papers").onmousemove=drag.paperMouseMove;
			$("papers").onclick=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				while(target!=this&&target.contentEditable!=true){
					if(/^[0-9]+$/.test(target.id)){
						getElement(target,"firstElementChild").focus();
						break;
					}else{
						target=target.parentNode;
					}
				}
			}
			//火狐浏览器三击删除视频或图片
			var mouseDownForFF={
				clear:false,
				clear2:false,
				onmousedown:function(event){
					event=event||window.event;
					var target=event.target||event.srcElement;
					if(/video|img/i.test(target.tagName)){
						if(!mouseDownForFF.clear){
							mouseDownForFF.clear=true;
							setTimeout(mouseDownForFF.backClear,500);
						}else if(!mouseDownForFF.clear2){
							mouseDownForFF.clear2=true;
							setTimeout(mouseDownForFF.backClear2,250);
						}else{
							if(!/sub/i.test(target.parentNode.tagName)){
								target.parentNode.removeChild(target);
							}else{
								var p=target.parentNode;
								var pp=p.parentNode;
								pp.removeChild(p);
							}
						}
						return false;
					}
				},
				backClear:function(){
					mouseDownForFF.clear=false;
				},
				backClear2:function(){
					mouseDownForFF.clear2=false;
				}
			}
			$("papers").addEventListener("click",mouseDownForFF.onmousedown,false);
			/**
			 * 该方法用于给title属性插入文件名
			 */
			$("title").changeName=function(innerText){
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
				$("lists").style.display="block";
				if(!obj.style.display||obj.style.display=="none"){
					obj.style.display="block";
				}else{
					obj.style.display="none";
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
						before_save();
						var blob = new Blob(['<!doctype html>'+document.documentElement.outerHTML], {type: "text/html;charset=utf-8"});
						saveAs(blob, $("title").innerText+".doc.html");
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
								var userRange=getUserRange();
								if(this.target.id=="fontColor"){
									setStyle("color",target.style.backgroundColor+"",userRange);
								}else if(this.target.id=="bgColor"){
									if(userRange!==false){
										setStyle("backgroundColor",target.style.backgroundColor+"",userRange);
									}else{
										alert("对不起,该选项仅在选中文字的情况下有效!");
									}
								}
								this.style.display="none";
								this.onclick=null;
								this.target=null;
							}
						}
						break;
					case "fontFamily_enter":
						setStyle("fontFamily",$("fontFamily_input").value,window.userRange);
						$("start_list").style.display="none";
						userRange=true;
						break;
					case "fontSize_enter":
						setStyle("fontSize",$("fontSize_input").value+"px",window.userRange);
						$("start_list").style.display="none";
						userRange=true;
						break;
					case "sup":
					case "sub":
						$("start_list").style.display="none";
						var innertext=prompt("请输入"+target.innerText+"内容:");
						var id=target.id;
						var userRange=getUserRange();
						insertHtmlAtCaret("<"+id+" style='font-size:"+(getFontSize(userRange.startContainer)/5*3)+"px;' contenteditable='false'>"+innertext+"</"+id+">");
						break;
					case "textArea":
						insertHtmlAtCaret("<table><tr><td>&nbsp;&nbsp;&nbsp;</td></tr></table>");
						break;
					case "table_enter":
						if(!isNaN(+$("rowCount").value)&&!isNaN(+$("lineCount").value)){
							var str="<table>";
							for(var i1=0;i1<+$("lineCount").value;i1++){
								str+="<tr>"
								for(var i2=0;i2<+$("rowCount").value;i2++){
									str+="<td>&nbsp;&nbsp;&nbsp;</td>";
								}
								str+="</tr>";
							}
							str+="</table>";
							if(window.getSelection){
								var userSelection=getSelection();
								userSelection.removeAllRanges();
								userSelection.addRange(window.userRange);
								insertHtmlAtCaret(str);
							}else{
								alert("对不起,你的浏览器无法胜任此项工作,建议升级或更换!");
							}
						}else{
							alert("对不起,您的输入有误,请重新输入");
						}
						break;
					case "link":
						var href=prompt("请输入网址(或'#'+页码):");
						var content=prompt("请输入超链接内容:");
						insertHtmlAtCaret("<a contenteditable='false' href='"+href+"' target='_black'>"+content+"</a>");
						break;
					case "collaspe_right":
						var userRange=getUserRange();
						var td=getTd(userRange);
						if(!td.colSpan||td.colSpan==0){
							td.colSpan=1;
						}else{
							td.colSpan++;	
						}
						td.parentNode.removeChild(getElement(td.parentNode,"lastElementChild"));
						break;
					case "collaspe_down":
						var userRange=getUserRange();
						var td=getTd(userRange);
						if(!td.rowSpan||td.rowSpan==0){
							td.rowSpan=1;
						}else{
							td.rowSpan++;
						}
						var removed=td.parentNode;
						for(var i=td.rowSpan;i>1;i--){
							removed=getElement(removed,"nextElementSibling");
						}
						removed.removeChild(getElement(removed,"lastElementChild"));
						break;
					case "cutLine":
						var userRange=getUserRange();
						var td=getTd(userRange);
						var table=td.parentNode.parentNode;
						table.removeChild(td.parentNode);
						if(!/tr/i.test(table.innerHTML)){
							table=table.parentNode;
							table.parentNode.removeChild(table);
						}
						break;
					case "addLine":
						var userRange=getUserRange();
						var td=getTd(userRange);
						var lineCount=+prompt("请输入列数:");
						if(!isNaN(lineCount)){
							var tr=document.createElement("tr");
							var str="";
							for(var i=0;i<lineCount;i++){
								str+="<td>&nbsp; &nbsp;</td>";
							}
							tr.innerHTML=str;
							td.parentNode.parentNode.appendChild(tr);
						}else{
							alert("输入错误,请重新输入!");
						}
						break;
					case "addRow":
						var userRange=getUserRange();
						var td=getTd(userRange);
						var tbody=td.parentNode.parentNode;
						var childNodes=tbody.childNodes;
						for(var i=0;i<childNodes.length;i++){
							if(childNodes[i].tagName){
								var td2=document.createElement("td");
								td2.innerHTML="&nbsp; &nbsp;"
								childNodes[i].appendChild(td2);
							}
						}
						break;
					case "cutRow":
						var userRange=getUserRange();
						var td=getTd(userRange);
						var tbody=td.parentNode.parentNode;
						var childNodes=tbody.childNodes;
						for(var i=0;i<childNodes.length;i++){
							if(childNodes[i].tagName){
								childNodes[i].removeChild(getElement(childNodes[i],"lastElementChild"));
							}
						}
						if(!/td/i.test(tbody.innerHTML)){
							tbody=tbody.parentNode;
							tbody.parentNode.removeChild(tbody);
						}
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
					case "video_sure":
						var sure=confirm("视频文件必须和本文件处在同一个文件夹下,因此请保存(导出)后再插入视屏,如您确定需插入的视频和本文件在同一个文件夹内,请按'确认'键,否则请按'取消'键.");
						var maxHeight=window.getComputedStyle(getElement($("papers"),"firstElementChild"),null).height;
						maxHeight=parseInt(maxHeight);
						if(getContenteditable(getUserRange().startContainer).offsetHeight+300>maxHeight-50){
							alert("对不起,您的高度已超限,无法加入图片");
							return;
						}
						if(sure){
							var src=$("videoFile").value;
							src=src.slice(src.lastIndexOf("\\")+1);
							var str='<video contenteditable="false" title="三击可去除视频,IE浏览器可右键播放." src="'+src+'" width="500" height="300" controls="controls">Sorry,您的浏览器不支持video视频直接播放</video>';
							try{
								alert("请勿使在视频文件前插入太多文字或换行,否则可能造成系统卡死.");
								insertHtmlAtCaret(str);
								var videos=document.getElementsByTagName("video");
								for(var i=0;i<videos.length;i++){
									videos[i].reload();
								}
							}catch(e){
								alert("对不起,您还未在纸上留下痕迹!");
							}
						}else{
							return;
						}
						break;
				}
				switch(target.parentNode.id){
					case "fontFamily_list":
						var userRange=getUserRange();
						$("fontFamily_input").value=target.style.fontFamily;
						setStyle("fontFamily",target.style.fontFamily,userRange);
						$("start_list").style.display="none";
						break;
					case "fontSize_list":
						var userRange=getUserRange();
						setStyle("fontSize",target.innerText+"px",userRange);
						$("start_list").style.display="none";
						break;
					case "textAlign_list":
						var userRange=getUserRange();
						setStyle("textAlign",target.className,userRange,"div");
						$("start_list").style.display="none";
						break;
					case "fontStyle_list":
						var userRange=getUserRange();
						if(target.id=="bold"){
							setStyle("fontWeight","bold",userRange);
							$("start_list").style.display="none";
						}else if(target.id=="null"){
							setStyle("fontWeight","normal",userRange);
							setStyle("fontStyle","normal",userRange);
							setStyle("textDecoration","none",userRange);
						}else if(target.id=="italic"){
							setStyle("fontStyle","italic",userRange);
						}else{
							setStyle("textDecoration",target.id,userRange);
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
							var width=300,height=200;
							var maxHeight=window.getComputedStyle(getElement($("papers"),"firstElementChild"),null).height;
							maxHeight=parseInt(maxHeight);
							if(getContenteditable(getUserRange().startContainer).offsetHeight+height>maxHeight-50){
								alert("对不起,您的高度已超限,无法加入图片");
								return;
							}
							if(/image\/\w+/.test(file.type)){
								try{
									var fr=new FileReader();
									fr.readAsDataURL(file);
									fr.onload=function(e){
										insertHtmlAtCaret("<img contenteditable='false' title='三击可去除图片,拖动可改变图片大小' width='"+width+"px' height='"+height+"' src='"+this.result+"'/>");
									}
								}catch(e){
									alert("抱歉,你的光标还未在纸上留下痕迹");
								}
							}else{
								alert("Sorry,你选择的文件不是图像文件,请重新选择");
							}
						}
						break;
					case "lineHeight_list":
						var userRange=getUserRange();
						if(target.id=="lineHeight_other"){
							var fontSize=getFontSize(userRange.startContainer);
							var add=prompt("请输入所需行间距:");
							if(!/[0-9]+/.test(add)){
								alert("您的输入错误,请重新输入!");
								return;
							}
							setStyle("lineHeight",fontSize+(+add)+"px",userRange);
						}else{
							var fontSize=getFontSize(userRange.startContainer);
							var userRange=getUserRange();
							setStyle("lineHeight",fontSize+(+target.innerText)+"px",userRange);
						}
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
						search.call(window,$("searching").value,$("papers"));
					}else if(target.id=="replace"){
						var userRange=getUserRange();
						if(userRange.startOffset==userRange.endOffset||!userRange){
							if(!searchTimeCopy||searchTimeCopy===0){
								searchTimeCopy=1;
							}else{
								searchTimeCopy++;
							}
							searchTime=searchTimeCopy;
							search.call(window,$("searching").value,$("papers"));
						}
						if(contains($("papers"),userRange.startContainer)){
							insertHtmlAtCaret($("replaceTo").value);
							searchTimeCopy--;
						}
					}
					userRange=true;
				}else if(target.parentNode.parentNode.id=="fenShu_list"&&target.type!="text"){
					var fontSize=getFontSize(window.userRange.startContainer)+2;
					var denominatorLength=$("denominator").value.length;//获取分母长度
					var numeratorLength=$("numerator").value.length;//获取分子长度
					var userSelection=getSelection();
					userSelection.removeAllRanges();
					userSelection.addRange(window.userRange);
					var width=17+Math.max(denominatorLength,numeratorLength)*fontSize/3;
					insertHtmlAtCaret("<sub contenteditable='false'><canvas id='c' width='"+width+"px' height='"+fontSize*1.5+"px'></canvas></sub>&nbsp;");
					var canvas=$("c");
					var sub=canvas.parentNode;
					var context=canvas.getContext("2d");
					context.font=fontSize*2/5+"pt 微软雅黑";
					context.fillText($("numerator").value,(parseInt(canvas.width)-numeratorLength*fontSize*0.5)/2,parseInt(canvas.height)*0.5);
					context.stroke();
					context.fillText($("denominator").value,(parseInt(canvas.width)-denominatorLength*fontSize*0.5)/2,parseInt(canvas.height));
					context.stroke();
					context.moveTo(0,(parseInt(canvas.height)+4)/2);
					context.lineTo(parseInt(canvas.width),(parseInt(canvas.height)+4)/2);
					context.stroke();
					var dataUrl=canvas.toDataURL("image/png");
					sub.innerHTML="<img title='三击可去除分数' src='"+dataUrl+"' />";
					$("insert_list").style.display="none";
				}
			}
			
			$("search_list").addEventListener("mouseover",function(){
				$("search_list").style.opacity="0.8";
				$("start_list").style.opacity="0";
			},false);
			$("search_list").addEventListener("mouseout",function(){
				$("search_list").style.opacity="0.92";
				$("start_list").style.opacity="0.92";
			},false);
			
			function getContenteditable(obj){
				try{
					if(/^[0-9]+$/.test(obj.id)){
						return getElement(obj,"lastElementChild");
					}else{
						obj=obj.parentNode;
						return getContenteditable(obj);
					}
				}catch(e){return false;}
			}
			
			function getTd(userRange){
				var td=userRange.startContainer;
				var count=0;
				while(!/td/i.test(td.tagName)){
					td=td.parentNode;
					count++;
					if(count>=5)return false;
				}
				return td;
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
			
			//此方法用于获取一个元素的字体大小
			function getFontSize(obj){
				var fontSize;
				try{
					fontSize=window.getComputedStyle(obj,null).fontSize;
					fontSize=parseInt(fontSize);
				}catch(e){
					try{
						fontSize=window.getComputedStyle(obj.parentNode,null).fontSize;
						fontSize=parseInt(fontSize);
					}catch(e1){
						fontSize=17;
					}
				}
				return fontSize;
			}
			
			//version control
			/**
			 * 该类负责版本控制
			 * 	-prev负责存储前15个版本
			 * 	-next负责存储后15个版本
			 * 	数组内为{_node://标签,type://种类,outer://message}
			 * 	-种类:
			 * 		1.#text
			 * 		2.#node
			 */
			var versionControl=new (function(){
				this._prev=[]
				,this._next=[]
				,this._prev._continue=false
				,this._prev.add=true
				,this.prev=function(event,arg0,arg1){
					arg0=arg0||"_prev"
					,arg1=arg1||"addNext";
					var rem=this[arg0].shift();
					if(!rem)return;
					switch(rem.type){
						case "#node":
							var _node=rem._node;
							if(rem.outer==""||rem.outer=="<br>"){
								rem.outer+=" ";
							}
							_node.innerHTML=rem.outer;
							break;
						case "#changeAttr":
							//需要 attrName,attrValue
							var nowAttr=rem._node[rem.attrName];
							if(!rem.attrValue){
								rem._node.removeAttribute(rem.attrName);
							}else{
								rem._node[rem.attrName]=rem.attrValue;
							}
							rem.attrValue=nowAttr;
							break;
					}
					this[arg1](rem);
				}
				,this.next=function(){
					versionControl.prev(null,"_next","addPrev");
				}
				,this.addPrev=function(rem,arg0,maxLen){
					arg0=arg0||"_prev"
					,maxLen=maxLen||15;
					if(this[arg0].length>maxLen){
						this[arg0].pop();
					}
					this[arg0].unshift(rem);
				}
				,this.changePrev=function(rem,no_turn,add){
					if(add&&this._prev.add){
						this.addPrev(rem);
						this._prev._continue=false;
						this._prev.add=false;
					}else if(!add){
						this._prev.add=true;
					}
					if(!no_turn){
						this._prev[0]=rem;
						this._prev._continue=false;
					}else{
						if(this._prev._continue){
							this._prev[0]=rem;
						}else{
							this.addPrev(rem);
							this._prev._continue=true;
						}
					}
				}
				,this.addNext=function(rem){
					this.addPrev(rem,"_next",16);
				}
				,this.typeAdd=function(keyCode){
					var p=getUserRange().startContainer
					,add_change="changePrev"
					,p1=p;
					if($("papers").getElementsByTagName("img").length==0){
						add_change="addPrev"
						,p=$("papers");
					}else if(p.nodeName=="#text"||p.tagName=='br'){
						p=p.parentNode;
					}
					if(add_change=="changePrev"||/[,。，]$|[^0-9]\.$/.test(p1.nodeValue||p1.innerText)||keyCode==13)
						this[add_change](
							{
								_node:p
								,type:"#node"
								,outer:p.innerHTML||""
							}
							,add_change=="addPrev"?null:!/[,。，?？！!]$|[^0-9]\.$/.test(p.innerText)&&keyCode!=13
							,add_change=="addPrev"?null:p.innerText==""||p.innerText=="\n"
						);
				}
				,this.styleChange=function(_node,rem_style){
					if(_node!=$("papers")&&$("papers").getElementsByTagName("img").length==0){
						this.addPrev(
							{
								_node:$("papers")
								,type:"#node"
								,outer:$("papers").innerHTML
							}
						);
						return;
					}
					if(rem_style){
						//记录style
						this.addPrev(
							{
								_node:_node
								,type:"#changeAttr"
								,attrName:"style"
								,attrValue:_node.style
							}
						);
					}else{
						//记录innerHTML
						this.addPrev(
							{
								_node:_node
								,type:"#node"
								,outer:_node.innerHTML
							}
						);
					}
				}
			})();
			$("next").onclick=versionControl.next;
			$("prev").onclick=function(){versionControl.prev()};
			
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
						var titleName=prompt("请输入文件名",$("title").innerText).replace(/\n/g,"");
						$("title").changeName(titleName);
						document.head.getElementsByTagName("title")[0].innerText=titleName;
						break;
					case "start":
						myChangeDisplay($("start_list"));
						break;
					case "insert":
						myChangeDisplay($("insert_list"));
						break;
					case "other":
						myChangeDisplay($("other_list"));
						break;
					case "headTable":
						myChangeDisplay($("headTable_list"));
						break;
					case "help":
						myChangeDisplay($("help_list"));
				}
			}
			var note=$("note");
			note.value=note.className;
			note=null;
			window.onbeforeunload=function(event){
				event=event||window.event;
				var msg="关闭或刷新可能会导致您的数据丢失,请确保您的文件已经保存(如果你已经保存请忽略这条提示).";
				return msg;
			};
		</script>
			
		<script id="callbacksOfKeydown" type="text/javascript">
			//定义平常的papers中的onkeydown方法
			$("papers").onkeyup=function(event){
				event=event||window.event;
				var target=event.target||event.srcElement;
				var eleHeight=target.offsetHeight;
				var eleParent=target.parentNode;
				var maxHeight=parseInt(eleParent.style.height)||870;
				maxHeight=parseInt(maxHeight);
				if(eleHeight>maxHeight){//内容高度超过了纸张最大高度
					eleParent.style.height=parseInt(eleHeight)+500+"px";
					target.focus();
				}else if(maxHeight-eleHeight>500){
					if(eleHeight+500>870){
						eleParent.style.height=parseInt(eleHeight)+500+"px";
					}else{
						eleParent.style.height="870px";
					}
					target.focus();
				}
				versionControl.typeAdd(event.keyCode);
			};
			
			$("papers").onkeydown=function(event){
				event=event||window.event;
				if(event.keyCode==9){
					insertHtmlAtCaret("　　");
					return false;
				}
			}
			
			/**
			 * 该方法用返回上一张纸的末尾的光标对象
			 * @param {Object} userSelection 现在的选择
			 * @param {Object} target 现在光标所在的contentable的div
			 */
			function backspaceCaret(lastPaper){
				var userRange=document.createRange();
				var lastWrittingPlace=getElement(lastPaper,"lastElementChild").lastChild;
				if(!lastWrittingPlace){
					lastWrittingPlace=getElement(lastPaper,"lastElementChild");
					userRange.selectNode(lastWrittingPlace.firstChild);
					return userRange;
				}
				if(lastWrittingPlace.nodeName=="#text"){
					userRange.setStart(lastWrittingPlace,lastWrittingPlace.nodeValue.length);
				}else{
					userRange.setStart(lastWrittingPlace,lastWrittingPlace.childNodes.length);
				}
				return userRange;
			}
			
			function contains(container,contained,onlyFirst){
				if(contained==container){
					return true;
				}else{
					try{
						if(onlyFirst){
							while(container){
								container=container.firstChild;
								if(contained==container)return true;
							}
						}else{
							while(contained){
								contained=contained.parentNode;
								if(container==contained)return true;
							}
						}
						return false;
					}catch(e){
						return false;
					}
				}
			}
			/**
			 * 
			 * @param {Object} newPaper the next paper 
			 * @param {Object} target contentable div
			 * @param {Object} maxHeight the max height of contentable div(target)
			 * @param boolean isStay if the caret will stay in oraginal place
			 */
			function insertCaret(newPaper,target,maxHeight,isStay){
				var userSelection=getSelection();
				if(isStay){
					var stayRange=userSelection.getRangeAt(0);
				}
				var div=document.createElement("div");
				var targetCopy=target;
				outer:while(targetCopy.offsetHeight>maxHeight){
					var lastRange=document.createRange();
					var lastElement=target.lastChild;//<div>乐寻技术</div>true <div>乐寻技术<br></div>false
					do{
						if(lastElement.innerHTML==""||/^\s*$/i.test(lastElement.innerText)||lastElement.nodeValue==""){
							target.removeChild(lastElement);
							lastElement=target.lastChild;
							if(targetCopy.offsetHeight<=maxHeight)break outer;
						}
						while(lastElement.nodeName!="#text"&&!/^\s*$/.test(lastElement.innerText)){
							target=lastElement;
							lastElement=lastElement.lastChild;
						}
					}while(lastElement.nodeValue==""||lastElement.nodeName!="#text");
					lastRange.setStart(lastElement,lastElement.length-1);
					lastRange.setEnd(lastElement,lastElement.length);
					var cutting=lastRange.extractContents();
					div.appendChild(cutting);
				}
				var frag = document.createDocumentFragment(), node, lastNode;
				while ( (node = div.lastChild) ) {
					lastNode = frag.appendChild(node);
				}
				var newWrittingPlace=getElement(newPaper,"firstElementChild");
				newWrittingPlace.focus();
				var userRange=userSelection.getRangeAt(0);
				userRange.insertNode(frag);
				try{
					if(lastNode){
						userRange.setStartAfter(lastNode);
					}else{
						userRange.setStartBefore(newWrittingPlace.firstChild);
					}
					userSelection.removeAllRanges();
					if(isStay){
						userRange=null;
						userSelection.addRange(stayRange);
					}else{
						userSelection.addRange(userRange);
					}
				}catch(e){}
			}
			
			/**
			 * 这是一个给光标处插入 html 的方法
			 * @param {Object} html
			 */
			function insertHtmlAtCaret(html){
				if(window.getSelection){
					var userSelection=getSelection();
					var userRange=userSelection.getRangeAt(0);
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
			/**
			 * 该方法用于给选中内容设置样式
			 * @param {Object} type_str 样式名称
			 * @param {Object} setting_str 设置的样式
			 */
			function setStyle(type_str,setting_str,userRange,nodeType){
				if(!nodeType){
					nodeType="span";
				}
				if(window.getSelection){
					if(!userRange){
						//如果用户没有选择,则进行全局设置
						if(!window.userRange){
							versionControl.styleChange($("papers"),true);
							$("papers").style[type_str]=setting_str;
							return;
						}else{
							userRange=window.userRange;
						}
					}
					if(userRange.startContainer==userRange.endContainer){
						if(userRange.startOffset==userRange.endOffset){
							if(userRange.startContainer.nodeName!="#text"){
								versionControl.styleChange(userRange.startContainer,true);
								userRange.startContainer.style[type_str]=setting_str;
							}else{
								alert("请选择后再进行设置,谢谢!");
							}
							return;
						}
						var myNode=document.createElement(nodeType);
						myNode.style[type_str]=setting_str;
						versionControl.styleChange(userRange.startContainer.parentNode,false);
						userRange.surroundContents(myNode);
					}else if(nodeType=="span"){
						var myNode=document.createElement(nodeType);
						myNode.style[type_str]=setting_str;
						var startContainer=userRange.startContainer
						,endContainer=userRange.endContainer
						,startOffset=userRange.startOffset
						,endOffset=userRange.endOffset
						,commonAncestorContainer=userRange.commonAncestorContainer;
						var _node=startContainer;
						while(_node.parentNode!=commonAncestorContainer){
							_node=_node.parentNode;
						}
						versionControl.styleChange(_node.parentNode,false);
						var list=[];
						_node=_node.nextSibling;
						while(!contains(_node,endContainer)){
							list.push(_node);
							_node=_node.nextSibling;
						}
						function surround(textNode,startOffset,endOffset){
							userRange.setStart(textNode,startOffset);
							userRange.setEnd(textNode,endOffset);
							userRange.surroundContents(myNode.cloneNode());
						}
						surround(startContainer,startOffset,startContainer.length);
						for(var i=0;i<list.length;i++){
							try{
								if(list[i].nodeName=="#text"&&list[i].length!=0){
									surround(list[i],0,list[i].length);
								}else{
									list[i].style[type_str]=setting_str;
								}
							}catch(e){}
						}
						surround(endContainer,0,endOffset);
					}else{
						var startContainer=userRange.startContainer
						,startOffset=userRange.startOffset
						,myNode=document.createElement(nodeType);
						versionControl.styleChange(startContainer.parentNode,false);
						var frag=userRange.extractContents();
						if(startOffset==0&&!startContainer.previousSibling){
							startContainer=startContainer.parentNode;
							startContainer.appendChild(myNode);
						}else if(startOffset!=0){
							userRange.setStart(startContainer,startOffset);
							userRange.setEnd(startContainer,startOffset);
							userRange.insertNode(myNode);
						}else{
							var pre=startContainer.previousSibling;
							if(pre.nodeName!="#text"){
								pre.insertAdjacentElement("afterEnd",myNode);
							}else{
								var parentNode=pre.parentNode;
								userRange.setStart(parentNode,parentNode.length);
								userRange.setEnd(parentNode,parentNode.length);
								userRange.insertNode(myNode);
							}
						}
						myNode.appendChild(frag);
						myNode.style[type_str]=setting_str;
					}
				}else{
					alert("Sorry,您的浏览器版本过低,请及时更新,谢谢!");
				}
			}
			function copyOnlyTxt(){
			    try {
			        document.execCommand("AutoUrlDetect", false, false);
			    }catch(e){}
				this.onpaste=function(e) {
					e=e||window.event;
					e.preventDefault();
			        var text = null;
					if(window.clipboardData&&clipboardData.setData) {
						text = window.clipboardData.getData('text');
			        }else{
			            text = (e.originalEvent || e).clipboardData.getData('text/plain') || prompt('在这里输入文本');
			        }
			        if (document.body.createTextRange) {    
			            if (document.selection) {
			                textRange = document.selection.createRange();
			            } else if (window.getSelection) {
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
			    this.onkeydown=function(e) {
			    	e=e||window.event;
			        // e.metaKey for mac
			        if (e.ctrlKey || e.metaKey) {
			            switch(e.keyCode){
			                case 66: //ctrl+B or ctrl+b
			                case 98: 
			                case 73: //ctrl+I or ctrl+i
			                case 105: 
			                case 85: //ctrl+U or ctrl+u
			                case 117: {
			                    e.preventDefault();    
			                    break;
			                }
			            }
			        }    
			    };
			}
			//循环为每一张纸绑定copyOnlyTxt方法
			for(var i=1;i<=+getElement($("papers"),"lastElementChild").id;i++){
				copyOnlyTxt.call(getElement($(i+""),"firstElementChild"));
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
				FS_proto.onwriteend =null;
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
			function getURL(relativeURL){
				var _location=location.pathname;
				_location=/^http/.test(location.toString())?_location.slice(0,_location.lastIndexOf("/")):"http://www.hOffice.com.cn";
				return _location+relativeURL;
			}
			(function(){
				var fromNet=$("fromNet");
				fromNet.src=getURL("/support/hWordSupport.js");
			})();
		</script>
	</body>
</html>