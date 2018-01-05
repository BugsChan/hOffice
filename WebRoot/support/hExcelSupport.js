function isMobile() {
	var mobiles = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
	var userAgent = navigator.userAgent;
	for(var i = 0; i < mobiles.length; i++) {
		if(userAgent.indexOf(mobiles[i]) >= 0) return true;
	}
	return false;
}
(function(doc, win) {
	if(isMobile()) {
		var docEl = doc.documentElement,
			clientWidth = docEl.clientWidth || document.body.clientWidth;
		docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
	}
})(document, window);

function support() {
	var before_save = window.before_save;
	$("saveInServie").style.display = "block";
	$("myDoc").style.display = "block";
	$("saveInServie").onclick = function() {
		//保存在web端
		window.before_save(true);
		//ajax code
		var title = $("title").innerText;
		var userMsg = getUserMsg();
		var userid = userMsg.userid;
		var _password = userMsg["password"];
		myPost(
			getURL("/support/saveSupport") + "?method=webnametest&userid=" + userid +
			"&password=" + _password + "&title=" + title + '.xls.html',
			null,
			function(res) {
				if(res.isOk) {
					webSave(userid, _password, title);
				} else if(res.sameName) {
					if(confirm("您要保存的文件与另一个文件名称相同,是否替换?")) {
						webSave(userid, _password, title);
					}
				} else {
					alert(res.errorMsg);
				}
			}
		);
	}

	function webSave(userid, _password, title) {
		myPost(
			getURL("/support/saveSupport") + "?method=webSave&userid=" + userid +
			"&password=" + _password + "&title=" + title + '.xls.html',
			'<!doctype html>' + document.documentElement.outerHTML,
			function(res2) {
				if(res2.isOk) {
					alert("文件保存成功!!");
				} else {
					alert(res2.errorMsg);
				}
			}
		);
	}
	$("unable_to_save").onclick = function() {
		//本地保存(回调方式)
		window.before_save(false);
		//ajax code
		getJsessionid(
			8,
			function(jsessionid) {
				myPost(
					getURL("/support/saveSupport") +
					"?method=localSaveUpload&JSESSIONID=" + jsessionid + "&title=" + $("title").innerText + ".doc.html", '<!doctype html>' + document.documentElement.outerHTML,
					function(res) {
						if(res.isOk) {
							window.open(getURL("/support/saveSupport") + "?method=localSaveDownload&JSESSIONID=" + jsessionid);
						} else {
							alert(res.errorMsg);
						}
					}
				);
			}
		);
	}
	var loginSupport = document.createElement("script");
	loginSupport.className = "fromNet";
	loginSupport.type = "text/javascript";
	loginSupport.src = getURL("/support/loginSupport.js");
	document.body.insertBefore(loginSupport, $("fromNet"));
	var lib = document.createElement("script");
	lib.type = "text/javascript";
	lib.className = "fromNet";
	lib.src = getURL("/support/lib.js");
	document.body.insertBefore(lib, loginSupport);
}
support();