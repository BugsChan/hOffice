function openLib() {
	var userMsg = getUserMsg();
	if(!userMsg) {
		alert("您尚未登录,请先登录或注册!");
		return;
	}
	var innerHtml = '<div>' +
		'<input type="text"/><a style="float:none;margin-left: 10px;" href="javascript:;">搜索</a><img src="' + getURL('/img/icons.png') + '" />' +
		'<br><br><span class="showWord">hWord文件</span><span class="showExcel">hExcel文件</span><span style="border-right:none;" class="showPPT">hPPT文件</span>' +
		'<br><br>' +
		'<ul></ul>' +
		'</div>';
	var outer = document.createElement("div");
	outer.className = "DM";
	outer.innerHTML = innerHtml;
	var _link = document.createElement("link");
	_link.rel = "stylesheet";
	_link.type = "text/css";
	_link.href = getURL("/css/lib.css");
	_link.className = "DM";
	if(/hWord|hExcel|hPPT/.test(document.documentElement.id)) {
		document.body.insertBefore(outer, $("fromNet"));
	} else {
		document.body.appendChild(outer);
	}
	document.head.appendChild(_link);
	var appending = outer.getElementsByTagName("ul")[0],
		hw = outer.getElementsByClassName("showWord")[0],
		he = outer.getElementsByClassName("showExcel")[0],
		hp = outer.getElementsByClassName("showPPT")[0],
		searchInput = outer.getElementsByTagName("input")[0],
		searchSure = outer.getElementsByTagName("a")[0],
		unload = outer.getElementsByTagName("img")[0];
	myPost(
		getURL("/OnlineDoc") + "?method=lib&userid=" + userMsg.userid + "&password=" + userMsg.password, null,
		function(res) {
			if(res.isOk) {
				var docs = res.docs;
				var content = getURL("/OnlineDoc") + "?method=onlineDocument&uuid=";
				for(var i = 0; i < docs.length; i++) {
					var inner = docs[i].name + '<span><a target="_blank" href="' + content + docs[i].uuid + "\">打开</a><a href='javascript:;' class='deleteDoc'>删除</a>";
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

	function deleteDoc() {
		function del(callback,a){
			var uuid = fc(a.parentNode).href;
			uuid = uuid.slice(uuid.lastIndexOf("=") + 1);
			myPost(
				getURL("/OnlineDoc") + "?method=delete&userid=" + userMsg.userid + "&password=" + userMsg.password + "&uuid=" + uuid, null,
				function(res) {
					if(res.isOk) {
						var pp = a.parentNode.parentNode;
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
			var pp=obj.parentNode.parentNode
			,name=pp.innerText;
			if(real)return name.slice(0,-4);
			name=name.slice(0,name.lastIndexOf("."));
			name=name.slice(0,name.lastIndexOf("."));
			return name;
		}
		var Sname=getName(this);
		if(confirm("确认删除该文件?")) {
			del(function(res){
				if(res.isOk){
					var deletes = outer.getElementsByClassName("deleteDoc");
					for(var i = 0; i < deletes.length; i++) {
						if(getName(deletes[i])==Sname
							&&deletes[i].parentNode.parentNode.style.display=="none"){
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

	function setDeletes() {
		var deletes = outer.getElementsByClassName("deleteDoc");
		for(var i = 0; i < deletes.length; i++) {
			deletes[i].onclick = deleteDoc;
		}
	}
	setTimeout(setDeletes, 1000);
	unload.onclick = function() {
		document.body.removeChild(outer);
		document.head.removeChild(document.head.getElementsByClassName("DM")[0]);
	}
	searchSure.onclick = function(res) {
		var _in = res.___in___ || searchInput.value;
		var reg = new RegExp(_in);
		var lis = appending.getElementsByTagName("li");
		for(var i = 0, v = null; i < lis.length; i++) {
			//v>>>第一个匹配失败的li
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
	hw.onclick = function() {
		searchSure.onclick({
			___in___: "doc"
		})
	};
	hp.onclick = function() {
		searchSure.onclick({
			___in___: "ppt"
		})
	};
	he.onclick = function() {
		searchSure.onclick({
			___in___: "xls"
		})
	};
}
$("myDoc").onclick = openLib;