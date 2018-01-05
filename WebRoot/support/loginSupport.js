/**
 * 该方法用于以JavaScript Object形式获取保存在cookie中的用户信息
 */
function getUserMsg(){
	var cookieStr=decodeURI(document.cookie);
	var cookies=cookieStr.split(";");
	for(var i=0;i<cookies.length;i++){
		if(/userMsg/.test(cookies[i])){
			var value = cookies[i].slice(cookies[i].indexOf("=")+1);
			setCookie("userMsg",value);
			return JSON.parse(value);
		}
	}
	return null;
}

function auto_login(){
	try{
		var userMsg=getUserMsg();
		var res_show=$("username")||$("login");
		res_show.innerText=userMsg.username;
	}catch(e){}
}
auto_login();

function setCookie(_key,_value){
	var _date=new Date();
	_date.setDate(_date.getDate()+120);
	document.cookie=encodeURI(_key+"="+_value)+";expires="+_date.toGMTString()+";path=/";
}
/**
 * 该方法用于向浏览器发送post请求
 * @param {String} _url 发送目标url
 * @param {Object} content 发送的内容
 * @param {Function} callback 回调函数,参数为结果对象
 */
function myPost(_url,content,callback){
	var req=new XMLHttpRequest();
	req.open("POST",_url/*URL*/);
	req.send(content);
	req.onreadystatechange=function(){
		if(req.readyState!=4)return;		
		callback(JSON.parse(req.responseText));
	}
}

/**
 * 该方法用于获取cookie中的Jsessionid
 */
function getJsessionid(timeout,callback){
	myPost(
		getURL("/support/getSession?sessionTime="+timeout)
		,null
		,function(res){
			if(res.isOk){
				document.cookie="JSESSIONID="+res.jsessionid+";path=/";
				callback(res.jsessionid);
			}else{
				alert(res.errorMsg);
			}
		}
	);
}

/**
 * 该方法用于打开用户登录页面,且包含所有登录/注册方法
 */
function importLoaginNode(){
	var innerHtml='<div title="如未注册请点击右下角\'注册\'字样注册">'
		+'<div style="width:27px;float:left;border-bottom:solid 1px #8e8e8e;">登录'
		+'</div>'
		+'<div style="float: right;">'
			+'<a href="javascript:;">'
				+'<img style="width: 12px;height: 12px;" src="img/icons.png" />'
			+'</a>'
		+'</div>'
		+'<br><br>'
		+'<span class="user_num_att">电子邮箱/账号*</span>'
		+'<input class="user_num" type="text">'
		+'<br><br>'
		+'<span>密码*</span><a target="_blank" href="javascript:;">忘记密码?</a>'
		+'<input maxLength="20" class="password" type="password">'
		+'<br><br>'
		+'<div>'
			+'<div style="float: left;"><img class="sureImg" style="width:80px;height:40px;"></div>'
			+'<div style="float: right;"><span>验证码*</span><br><input maxLength="4" class="enSure_id" type="text"></div>'
		+'</div><br><input class="sure" type="button" value="确定">'
		+'<a href="JavaScript:;">注册?</a>'
	+'</div>';
	
	var outer=document.createElement("div");
	outer.style.height=screen.width+"px";
	outer.className="LC";
	var _link=document.createElement("link");
	_link.rel="stylesheet";
	_link.type="text/css";
	_link.href=getURL("/css/LoginControl.css");
	_link.className="LC";
	if(/hWord|hExcel|hPPT/.test(document.documentElement.id)){
		document.body.insertBefore(outer,$("fromNet"));
	}else{
		document.body.appendChild(outer);
	}
	document.head.appendChild(_link);
	
	outer.innerHTML=innerHtml;
	var jsessionid;
	function myGetJsessionid(callback){
		getJsessionid(
			200
			,function(jsessionid){
				callback(jsessionid);
			}
		);
	}
	function gF(_node){
		return _node.firstChild.nodeName!="#text"?_node.firstChild:_node.firstChild.nextSibling;
	}
	var v=outer.getElementsByTagName("a");
	var unload=v[0]
	,zhuce=v[2]
	,help_keyword=v[1]
	,sure=outer.getElementsByClassName("sure")[0]
	,_password=outer.getElementsByClassName("password")[0]
	,userNumber=outer.getElementsByClassName("user_num")[0];
	unload.onclick=function(){
		document.body.removeChild(outer);
		document.head.removeChild(document.head.getElementsByClassName("LC")[0]);
	}
	,img=outer.getElementsByTagName("img")[1];
	img.src="support/sureImgSupport?JSESSIONID="+jsessionid+"&c="+new Date().getMilliseconds();
	img.onclick=function(){
		myGetJsessionid(
			function(jsessionid){
				img.src="support/sureImgSupport?JSESSIONID="+jsessionid+"&c="+new Date().getMilliseconds();
			}
		);
	}
	img.onclick();
	zhuce.onclick=zhuce_click;
	
	//读取cookie,争取自动填充数据
	var userMsg=getUserMsg();
	if(userMsg!=null){
		userNumber.value=userMsg.userid;
		_password.value=userMsg.password;
	}
	
	function zhuce_click(){
		gF(outer).className="zhuce";
		gF(gF(outer)).innerText="注册";
		help_keyword.style.display="none";
		var before=img.parentNode.parentNode;
		var pi2=document.createElement("input");
		pi2.type="password";
		var att=document.createElement("span");
		att.innerText="请再次输入密码*";
		before.parentNode.insertBefore(pi2,before);
		pi2.parentNode.insertBefore(att,pi2);
		zhuce.innerText="登录?";
		var userName=document.createElement("input");
		userName.type='text';
		userName.maxLength=10;
		before=outer.getElementsByClassName("user_num_att")[0];
		before.parentNode.insertBefore(userName,before);
		var att2=document.createElement("span");
		att2.innerText="请填写用户名*";
		userName.parentNode.insertBefore(att2,userName);
		var _br=document.createElement("br")
		,__br=document.createElement("br");
		att2.parentNode.insertBefore(_br,before);
		att2.parentNode.insertBefore(__br,before);
		
		before.innerText="电子邮箱(选填)";
		zhuce.onclick=function(){
			//还原为登录
			before.innerText="电子邮箱/账号*";
			gF(outer).className="denlu";
			gF(gF(outer)).innerText="登录";
			pi2.parentNode.removeChild(pi2);
			att.parentNode.removeChild(att);
			_br.parentNode.removeChild(_br);
			__br.parentNode.removeChild(__br);
			help_keyword.style.display="inline";
			userName.parentNode.removeChild(userName);
			att2.parentNode.removeChild(att2);
			zhuce.onclick=zhuce_click;
			zhuce.innerText="注册?";
			userNumber.onblur=null;
			sure.onclick=loagin;
		}
		pi2.onblur=function(){
			if(pi2.value!=_password.value){
				pi2.placeholder="两次输入密码不相符!";
				pi2.value="";
			}else if(/;/.test(pi2.value)){
				pi2.placeholder="密码中不允许出现';'号!";
				pi2.value="";
			}else if(pi2.value.length<3){
				pi2.placeholder="密码不能小于三位!";
				pi2.value="";
			}
		}
		userName.onblur=function(){
			if(/;/.test(this.value)){
				this.placeholder="用户名中不允许出现';'号";
				this.value="";
			}
		}
		userNumber.onblur=function(){
			if(!/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(userNumber.value)&&userNumber.value!=""){
				this.placeholder="您输入的不是邮件地址!";
				this.value="";
			}
		}
		sure.onclick=function(){
			//注册
			if(_password.value!=pi2.value)return;
			var _userName=userName.value
			,email=userNumber.value
			,testId=outer.getElementsByClassName("enSure_id")[0].value
			,__password=_password.value;
			myPost(
				//向页面发送请求
				getURL("/support/UserSupport")+"?method=zhuce&username="
				+_userName+"&email="+email+"&testid="+testId
				+"&password="+__password+"&JSESSIONID="+jsessionid
				,null
				,function(res){
					if(res.isOk){
						unload.onclick();
						setCookie("userMsg","{\"userid\":\""+res.userid+"\",\"username\":\""+_userName.replace(/"/g,"\\\"")+"\",\"password\":\""+__password.replace(/"/g,"\\\"")+"\",\"email\":\""+email+"\"}");
						alert("注册成功,欢迎使用,你的账号为:"+res.userid);
						var res_show=$("username")||$("login");
						res_show.innerText=_userName;
					}else{
						alert(res.errorMsg);
					}
				}
			);
		}
	};
	help_keyword.onclick=function(){
		//发送给服务器,请求发送电子邮件
		var localSave=getUserMsg();
		var ___password=localSave.password;
		alert("请输入:"+___password+" 试一试,如果密码仍然错误,请从主页进入'用户中心'查看或联系我们\n客服QQ群:555871481");
	}
	function loagin(){
		//登录
		var __password=_password.value
		,userid=/^[0-9]+$/.test(userNumber.value)?userNumber.value:""
		,email=/^[0-9]+$/.test(userNumber.value)?"":userNumber.value
		,testId=outer.getElementsByClassName("enSure_id")[0].value;
		myPost(
			getURL("/support/UserSupport")+"?method=denlu&userid="
			+userid+"&useremail="+email+"&password="+__password
			+"&testid="+testId+"&JSESSIONID="+jsessionid
			,null
			,function(res){
				if(res.isOk){
					unload.onclick();
					setCookie("userMsg","{\"userid\":\""+res.userid+"\",\"username\":\""+res.userName.replace(/"/g,"\\\"")+"\",\"password\":\""+__password.replace(/"/g,"\\\"")+"\",\"email\":\""+email+"\"}");
					var res_show=$("username")||$("login");
					res_show.innerText=res.userName;
					alert("登录成功,欢迎光临!");
				}else{
					alert(res.errorMsg);
				}
			}
		);
	}
	sure.onclick=loagin;
}
$("login").onclick=importLoaginNode;