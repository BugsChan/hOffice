function getURL(relativeURL) {
	var _location = location.pathname;
	_location = /^http/.test(location.toString()) ? _location.slice(0, _location.lastIndexOf("/")) : "http://www.hOffice.com.cn";
	return _location + relativeURL;
}
(function(doc, win) {
	var docEl = doc.documentElement,
		clientWidth = docEl.clientWidth || document.body.clientWidth;
	docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
})(document, window);

function $(id) {
	return document.getElementById(id);
}

function openPage(id) {
	var ul = $("docManager").getElementsByTagName("ul")[0];
	ul.innerHTML = "";
	var _node = $(id);
	var children = _node.parentNode.childNodes;
	for(var i = 0; i < children.length; i++) {
		if(!/foot|head/.test(children[i].id) && children[i] != _node && children[i].nodeName != "#text") {
			children[i].style.display = "none";
		}
	}
	_node.style.display = "block";
}

function getUserMsg() {
	var cookieStr = decodeURI(document.cookie);
	var cookies = cookieStr.split(";");
	for(var i = 0; i < cookies.length; i++) {
		if(/userMsg/.test(cookies[i])) {
			var value = cookies[i].slice(cookies[i].indexOf("=") + 1);
			setCookie("userMsg", value);
			return JSON.parse(value);
		}
	}
	return null;
}

function setCookie(_key, _value) {
	var _date = new Date();
	_date.setDate(_date.getDate() + 120);
	document.cookie = encodeURI(_key + "=" + _value) + ";expires=" + _date.toGMTString() + ";path=/";
}
/**
 * 该方法用于向浏览器发送post请求
 * @param {String} _url 发送目标url
 * @param {Object} content 发送的内容
 * @param {Function} callback 回调函数,参数为结果对象
 * @param {string} type 发送请求种类
 */
function myPost(_url,content,callback,type,noUseJSON) {
	if(!type)type="POST";
	var req = new XMLHttpRequest();
	req.open(type, _url /*URL*/ );
	req.send(content);
	req.onreadystatechange = function() {
		if(req.readyState != 4) return;
		if(!noUseJSON){
			callback(JSON.parse(req.responseText));
		}else{
			callback(req.responseText);
		}
	}
}
/**
 * 该方法用于获取cookie中的Jsessionid
 */
function getJsessionid(timeout, callback) {
	myPost(
		getURL("/support/getSession?sessionTime=" + timeout), null,
		function(res) {
			if(res.isOk) {
				document.cookie = "JSESSIONID=" + res.jsessionid + ";path=/";
				callback(res.jsessionid);
			} else {
				alert(res.errorMsg);
			}
		}
	);
}

function myGetJsessionid(callback) {
	getJsessionid(
		200,
		function(jsessionid) {
			callback(jsessionid);
		}
	);
}
/**
 * 该方法用于打开用户登录页面,且包含所有登录/注册方法
 */
function pageLogin() {
	openPage("login");
	var jsessionid;

	function gF(_node) {
		return _node.firstChild.nodeName != "#text" ? _node.firstChild : _node.firstChild.nextSibling;
	}
	var outer = $("login");
	var help_keyword = outer.getElementsByTagName("a")[0];
	var sure = outer.getElementsByClassName("sure")[0],
		_password = outer.getElementsByClassName("password")[0],
		userNumber = outer.getElementsByClassName("usernum")[0],
		img = outer.getElementsByTagName("img")[0];
	img.onclick = function() {
		myGetJsessionid(
			function(jsessionid) {
				img.src = "support/sureImgSupport?JSESSIONID=" + jsessionid + "&c=" + new Date().getMilliseconds();
			}
		);
	}
	img.onclick();
	//读取cookie,争取自动填充数据
	var userMsg = getUserMsg();
	if(userMsg != null) {
		userNumber.value = userMsg.userid;
		_password.value = userMsg.password;
	}
	help_keyword.onclick = function() {
		//发送给服务器,请求发送电子邮件
		var localSave = getUserMsg();
		var ___password = localSave.password;
		alert("请输入:" + ___password + " 试一试,如果密码仍然错误,请从主页进入'用户中心'查看或联系我们\n客服QQ群:555871481");
	}
	sure.onclick = function() {
		//登录
		var __password = _password.value,
			userid = /^[0-9]+$/.test(userNumber.value) ? userNumber.value : "",
			email = /^[0-9]+$/.test(userNumber.value) ? "" : userNumber.value,
			testId = outer.getElementsByClassName("enSure_id")[0].value;
		myPost(
			getURL("/support/UserSupport") + "?method=denlu&userid=" +
			userid + "&useremail=" + email + "&password=" + __password +
			"&testid=" + testId + "&JSESSIONID=" + jsessionid, null,
			function(res) {
				if(res.isOk) {
					var localSave = getUserMsg();
					setCookie("userMsg", "{\"userid\":\"" + res.userid + "\",\"username\":\"" + res.userName.replace(/"/g, "\\\"") + "\",\"password\":\"" + __password.replace(/"/g, "\\\"") + "\",\"email\":\"" + email + "\"}");
					alert("登录成功,欢迎光临!");
					openPage("homepage");
				} else {
					alert(res.errorMsg);
				}
			}
		);
	}
}

function pageZhuce() {
	openPage("zhuce");
	var outer = $("zhuce");

	function gF(_node) {
		return _node.firstChild.nodeName != "#text" ? _node.firstChild : _node.firstChild.nextSibling;
	}
	var v = outer.getElementsByTagName("input");
	var userName = v[0],
		userNumber = v[1],
		_password = v[2],
		pi2 = v[3],
		suredId = v[4],
		sure = v[5],
		img = outer.getElementsByTagName("img")[0];
	var jsessionid;
	img.onclick = function() {
		myGetJsessionid(
			function(id) {
				img.src = "support/sureImgSupport?JSESSIONID=" + id + "&c=" + new Date().getMilliseconds();
				jsessionid = id;
			}
		);
	}
	img.onclick();
	pi2.onblur = function() {
		if(pi2.value != _password.value) {
			pi2.placeholder = "两次输入密码不相符!";
			pi2.value = "";
		} else if(/;/.test(pi2.value)) {
			pi2.placeholder = "密码中不允许出现';'号!";
			pi2.value = "";
		} else if(pi2.value.length < 3) {
			pi2.placeholder = "密码不能小于三位!";
			pi2.value = "";
		}
	}
	userName.onblur = function() {
		if(/;/.test(this.value)) {
			this.placeholder = "用户名中不允许出现';'号";
			this.value = "";
		}
	}
	userNumber.onblur = function() {
		if(!/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(userNumber.value) && userNumber.value != "") {
			this.placeholder = "您输入的不是邮件地址!";
			this.value = "";
		}
	}
	sure.onclick = function() {
		//注册
		if(_password.value != pi2.value) return;
		var _userName = userName.value,
			email = userNumber.value,
			testId = suredId.value,
			__password = _password.value;
		myPost(
			//向页面发送请求
			getURL("/support/UserSupport") + "?method=zhuce&username=" +
			_userName + "&email=" + email + "&testid=" + testId +
			"&password=" + __password + "&JSESSIONID=" + jsessionid, null,
			function(res) {
				if(res.isOk) {
					setCookie("userMsg", "{\"userid\":\"" + res.userid + "\",\"username\":\"" + _userName.replace(/"/g, "\\\"") + "\",\"password\":\"" + __password.replace(/"/g, "\\\"") + "\",\"email\":\"" + email + "\"}");
					alert("注册成功,欢迎使用,你的账号为:" + res.userid);
				} else {
					alert(res.errorMsg);
				}
			}
		);
	}
}

function openUserCenter() {
	openPage('userCenter');
	var top = $("userCenter");
	var inputs = top.getElementsByTagName("input");
	var id = inputs[0],
		username = inputs[1],
		email = inputs[2],
		_password = inputs[3],
		sure = inputs[4];
	var userMsg = getUserMsg();
	id.value = userMsg.userid;
	username.value = userMsg.username;
	var user_password = userMsg.password;
	_password.value = user_password;
	email.value = userMsg.email;
	_password.onblur = function() {
		if(_password.value.length < 3) {
			_password.placeholder = "密码不能小于三位,建议不小于六位!";
			_password.value = "";
		} else if(_password.value != user_password) {
			var test_pass = prompt("请再次输入新密码");
			if(test_pass != _password.value) {
				_password.value = "";
				_password.placeholder = "你两次输入的密码不同,请检查后重新输入!";
			}
		}
	}
	username.onblur = function() {
		if(/;/.test(this.value)) {
			this.placeholder = "用户名中不允许出现';'号";
			this.value = "";
		}
	};
	email.onblur = function() {
		if(!/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(email.value) && email.value != "") {
			this.placeholder = "您输入的不是邮件地址!";
			this.value = "";
		}
	};
	var _link = document.createElement("link");
	_link.rel = "stylesheet";
	_link.type = "text/css";
	_link.href = "css/UserCenter.css";
	document.head.appendChild(_link);
	sure.onclick = function() {
		//确认更改
		var userid = id.value,
			_username = username.value,
			__password = _password.value,
			_email = email.value;
		myPost(
			getURL("/support/UserSupport") + "?method=setting&userid=" + userid + "&username=" + _username +
			"&email=" + _email + "&password=" + user_password + "&newPassword=" + __password +
			"&phoneNumber=", null,
			function(res) {
				if(res.isOk) {
					alert("更改成功,确定后将自动返回主页!");
					openPage("homepage");
				} else {
					alert(res.errorMsg);
				}
			}
		);
	}
}

function openLib() {
	openPage('docManager');
	var outer = $("docManager");
	var appending = outer.getElementsByTagName("ul")[0],
		searchInput = outer.getElementsByTagName("input")[0],
		searchSure = outer.getElementsByTagName("a")[0];
	var userMsg = getUserMsg();
	if(userMsg == null) {
		pageLogin();
	}
	myPost(
		getURL("/OnlineDoc") + "?method=lib&userid=" + userMsg.userid + "&password=" + userMsg.password, null,
		function(res) {
			if(res.isOk) {
				var docs = res.docs;
				var content = getURL("/OnlineDoc") + "?method=onlineDocument&uuid=";
				for(var i = 0; i < docs.length; i++) {
					var inner = docs[i].name + '<a href="' + content + docs[i].uuid + "\">打开</a><a class='deleteDoc'>删除</a>";
					var li = document.createElement("li");
					li.innerHTML = inner;
					appending.appendChild(li);
					if(!/doc\.html$|ppt\.html$|xls\.html$/.test(docs[i].name)){
						li.style.display="none";
					}
				}
			} else {
				alert(res.errorMsg);
			}
		}
		,"GET"
	);

	function fc(_node) {
		return _node.firstChild.nodeName != "#text" ? _node.firstChild : _node.firstChild.nextSibling;
	}

	function setDeletes() {
		function deleteDoc() {
			function del(callback,a){
				var uuid = fc(a.parentNode).href;
				uuid = uuid.slice(uuid.lastIndexOf("=") + 1);
				myPost(
					getURL("/OnlineDoc") + "?method=delete&userid=" + userMsg.userid + "&password=" + userMsg.password + "&uuid=" + uuid, null,
					function(res) {
						if(res.isOk) {
							var pp = a.parentNode;
							pp.parentNode.removeChild(pp);
							callback(res);
						} else {
							a.style.display="block";
							alert(res.errorMsg);
							throw new Exception();
						}
					}
					,"GET"
				);
			};
			function getName(obj,real){
				var pp=obj.parentNode
				,name=pp.innerText;
				if(real)return name.slice(0,-4);
				name=name.slice(0,name.lastIndexOf("."));
				name=name.slice(0,name.lastIndexOf("."));
				return name;
			};
			var Sname=getName(this);
			if(confirm("确认删除该文件?")){
				del(function(res){
					if(res.isOk){
						var deletes = outer.getElementsByClassName("deleteDoc");
						for(var i = 0; i < deletes.length; i++) {
							if(getName(deletes[i])==Sname
								&&deletes[i].parentNode.style.display=="none"){
								del(function(res){},deletes[i]);
							}
						}
					}else{
						res.target.style.display="block";
						alert(res.errorMsg);
					}
				},this);
			}
		};
		var deletes = outer.getElementsByClassName("deleteDoc");
		for(var i = 0; i < deletes.length; i++) {
			deletes[i].onclick = deleteDoc;
		}
	}
	setTimeout(setDeletes, 1000);
	searchSure.onclick = function(res) {
		var _in = res.___in___ || searchInput.value;
		var reg = new RegExp(_in);
		var lis = appending.getElementsByTagName("li");
		for(var i = 0, v = null; i < lis.length; i++) {
			//v >>>第一个匹配失败的li
			if(reg.test(lis[i].innerText) && v !== null) {
				//匹配成功
				lis[i].parentNode.insertBefore(lis[i], v);
			} else if(v === null) {
				//匹配失败
				v = lis[i];
			}
		}
		setDeletes();
	}
}

function sure_before_work(event) {
	if(!getUserMsg()) {
		alert("请登录或注册后再使用,否则无法保存");
		return false;
	}
}