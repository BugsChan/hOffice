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
		var inn=$("table").outerHTML;
		inn+=!$("note").className?"":"\n~~~~~~~~~node~1~~~~~~~\n"+$("note").className;
		var userAppendings=document.getElementsByClassName("userAppending");
		if(userAppendings.length!=0){
			inn+="\n~userApp~2~▂▃▅▆█๑۩ﺴﺴ۩๑๑۩۞۩~\n";
			for(var i=0;i<userAppendings.length;i++){
				inn+=userAppendings[i].outerHTML;
			}
		}
		myPost(
			getURL("/support/saveSupport") + "?method=webSave&userid=" + userid +
			"&password=" + _password + "&title=" + title + '.xls.html',
			inn,
			function(res2) {
				if(res2.isOk) {
					alert("文件保存成功!!");
					location.assign(getURL("/OnlineDoc?method=onlineDocument&uuid=")+res2.uuid);
				} else {
					alert(res2.errorMsg);
				}
			}
		);
	};
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

$("chart").onclick=function(){
	var start=prompt("请输入起始行号或列号:","");
	var end=prompt("请输入结束行号或列号:","");
	start=start.toUpperCase();
	end=end.toUpperCase();
	try{
		var data=[];
		if(/^[A-Z]+$/.test(start)){
			if(!/^[A-Z]+$/.test(end)){
				throw new Error("input error");
			}else{
				//go
				for(var i=getLineCount(start);i<=getLineCount(end);i++){
					var nodes=document.getElementsByClassName(getLineCount(i));
					var arr=[];
					for(var i2=0;i2<nodes.length;i2++){
						if(/^\s*$/.test(nodes[i2].innerText))break;
						arr.push(nodes[i2].innerText);
					}
					data.push(arr);
				}
			}
		}else if(/^[0-9]+$/.test(start)){
			if(!/^[0-9]+$/.test(end)){
				throw new Error("input error");
			}else{
				for(var i=+start;i<=+end;i++){
					var nodes=document.getElementsByClassName("r"+i);
					var arr=[];
					for(var i2=0;i2<nodes.length;i2++){
						if(/^\s*$/.test(nodes[i2].innerText))break;
						arr.push(nodes[i2].innerText);
					}
					data.push(arr);
				}
			}
		}else{
			throw new Error("input error");
		}
		window.impress={};
		window.impress.data=data;
		console.log(data);
		var hps=window.open("hPs.html");
//		hps.onunload=function(){
//			var src=window.impress.photo;
//			
//		};
	}catch(e){
		alert("Sorry ,你的输入好像有问题?");
	}
};