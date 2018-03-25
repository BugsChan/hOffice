function $(id_str){
	return document.getElementById(id_str);
}
function isMobile() {
	var mobiles = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
	var userAgent = navigator.userAgent;
	for(var i = 0; i < mobiles.length; i++) {
		if(userAgent.indexOf(mobiles[i]) >= 0) return true;
	}
	return false;
}

//init
(function(doc){
	var height=document.documentElement.clientHeight
	,width=screen.width;
	function rm(id_str){
		$(id_str).parentNode.removeChild($(id_str));
	};
	if(isMobile()){
		$("outer").style.width="100%";
		var docEl=doc.documentElement,
		clientWidth=docEl.clientWidth||document.body.clientWidth;
		docEl.style.fontSize=100*(clientWidth/640)+'px';
		rm("cssPc");
	}else{
		$("outer").style.width=height*8/13+'px';
		rm("cssMobile");
	}
})(document);

/**
 * 此方法用于获取用户的uid
 */
function getUid(){
	function readCookie(){
		var value=null;
		if(window.localStorage){
			value=localStorage.getItem("uid");
		}
		if(!value){
			var cookieStr = decodeURI(document.cookie);
			var cookies = cookieStr.split(";");
			for(var i=0;i<cookies.length;i++){
				if(/uid/.test(cookies[i])) {
					var value = cookies[i].slice(cookies[i].indexOf("=") + 1);
					return value;
				}
			}
			return null;
		}else{
			return value;
		}
	};
	
	var uid=readCookie();
	if(uid!==null){
		return uid;
	}
		
	function setCookie(_key,_value){
		if(window.localStorage){
			localStorage.setItem(_key,_value);
		}
		var _date = new Date();
		_date.setDate(_date.getDate() + 120);
		document.cookie = encodeURI(_key + "=" + _value) + ";expires=" + _date.toGMTString();
	};
	function getGuid(){
		function s4() {
			return(((1+Math.random())*0x10000)|0).toString(16).substring(1);
		}
		return s4()+s4()+s4()+s4()+s4()+s4()+s4()+s4();
	}
	uid=getGuid();
	setCookie("uid",uid);
	return uid;
}
function sub(){
	var inners=$("container").childNodes;
	var inner="\n"+getUid()+"\t";
	for(var i=0,v;i<inners.length;i++){
		v=inners[i].childNodes;
		for(var i2=0;i2<v.length;i2++){
			if(/input/i.test(v[i2].tagName)){
				if(v[i2].type=="checkbox"){
					inner+=(v[i2].checked?"是":"否")+"\t";
				}else{
					inner+=v[i2].value.replace(/\t|\n/g,"")+"\t";
				}
			}
		}
	}
	inner=inner.slice(0,-1);
	var uuid=document.documentElement.id;
	uuid=uuid.slice(uuid.indexOf(":")+1);
	myPost(
		"/support/saveSupport?method=append&uuid="+uuid
		,inner
		,function(res){
			if(res.isOk){
				$("outer").innerHTML="<h1>提交成功,将在3秒后跳转到hOffice主页</h1>";
				setTimeout(
					function(){
						location.assign("http://www.hoffice.com.cn");
					}
					,3000
				);
			}else{
				alert(res.errorMsg);
			}
		}
	);
}
function myPost(_url,content,callback,type) {
	if(!type)type="POST";
	var req = new XMLHttpRequest();
	req.open(type, _url /*URL*/ );
	req.send(content);
	var ret;
	req.onreadystatechange = function() {
		if(req.readyState != 4) return;
		callback(JSON.parse(req.responseText));
	}
}
$("sub").onclick=sub;