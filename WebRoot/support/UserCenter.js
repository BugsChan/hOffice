function openUserCenter() {
	var userMsg = getUserMsg();
	if(!userMsg) {
		$("login").onclick();
		return;
	}
	this.onclick = function() {
		location.assign("/index.html");
	}
	var html = '<div>用户中心</div>' +
		'<p>在这里,你可以修改你的个人信息</p>' +
		'<span style="margin-top:15px">用户账号</span>' +
		'<div><input type="text" readonly="readonly"/></div>' +
		'<span>用户名</span>' +
		'<div><input type="text"/></div>' +
		'<span>电子邮箱(可以不填)</span>' +
		'<div><input type="text"/></div>' +
		'<span>电话号码(可以不填)</span>' +
		'<div><input type="text"/></div>' +
		'<span>密码</span>' +
		'<div><input type="password"/></div>' +
		'<p>为了您的信息安全,请不要向我们提供过多的个人信息</p>' +
		'<button>确定更改</button>';
	var top = $("center").getElementsByClassName("top")[0];
	top.innerHTML = html;
	var inputs = top.getElementsByTagName("input");
	var id = inputs[0],
		username = inputs[1],
		email = inputs[2],
		phoneNum = inputs[3],
		_password = inputs[4],
		sure = top.getElementsByTagName("button")[0];
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
	};
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
	phoneNum.onblur = function() {
		if(/[^0-9]/.test(this.value)) {
			this.placeholder = "你输入的电话号码有误!";
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
			_phoneNum = phoneNum.value,
			_email = email.value;
		myPost(
			getURL("/support/UserSupport") + "?method=setting&userid=" + userid + "&username=" + _username +
			"&email=" + _email + "&password=" + user_password + "&newPassword=" + __password +
			"&phoneNumber=" + _phoneNum, null,
			function(res) {
				if(res.isOk) {
					alert("更改成功,确定后将自动返回主页!");
					setCookie("userMsg", "{\"userid\":\"" + userMsg.userid + "\",\"username\":\"" + _username.replace(/"/g, "\\\"") + "\",\"password\":\"" + __password.replace(/"/g, "\\\"") + "\",\"email\":\"" + _email + "\"}");
					var res_show = $("username") || $("login");
					res_show.innerText = _username;
					$("homePage").onclick();
				} else {
					alert(res.errorMsg);
				}
			}
		);
	};
}
$("homePage").onclick = openUserCenter;