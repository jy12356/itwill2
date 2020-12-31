var host = location.host;
var httpUrl = 'https://'+host;
//var httpsUrl = 'http://'+host;
var httpsUrl = 'https://'+host;
if (host == "dev.bookcube.com"){
	var toon_viewer_url = 'https://devtoon.bookcube.com';
}else{
	var toon_viewer_url = 'https://toon.bookcube.com';
}

var BOOK_IMG_200 = 'https://bookimg.bookcube.com/200/';
var BOOK_IMG_150 = 'https://bookimg.bookcube.com/150/';
var BOOK_IMG_120 = 'https://bookimg.bookcube.com/120/';
var BOOK_IMG_94 = 'https://bookimg.bookcube.com/94/';
var BOOK_IMG_70 = 'https://bookimg.bookcube.com/70/';
var SERIAL_IMG_200 = 'https://serialimg.bookcube.com/200/';
var SERIAL_IMG_150 = 'https://serialimg.bookcube.com/150/';
var SERIAL_IMG_120 = 'https://serialimg.bookcube.com/120/';
var SERIAL_IMG_94 = 'https://serialimg.bookcube.com/94/';

function commify(n) {
	var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	n += '';                          // 숫자를 문자열로 변환

	while (reg.test(n))
	n = n.replace(reg, '$1' + ',' + '$2');

	return n;
}

//숫자 체크
function numChk(thisObj){
	if(isNaN(thisObj.value) == true){
		alert("숫자로 입력해주세요");
		thisObj.value = "";
	}
}

//길이 체크
function checkLength(thisObj){
	if (thisObj.value.length == thisObj.maxLength){
		nextFocus(thisObj);
	}
}

//input 이동
function nextFocus(element){
	var form = element.form;
	
	for (var i=0; i<form.length ;i++ ){

		if (form.elements[i] == element)	{
			i++;
			var next = form.elements[i];
			next.focus();
			break;	
		}			
	}	
}
function getLoginURL(){
	var openURL = window.document.URL;
//	var openPath = window.location.pathname;
//	var openParam = window.location.search;
//	if(openURL.indexOf("https") == -1){
//		return_url = openPath + "" + openParam;
//	}else {
		return_url = openURL;
//	}

	return return_url;
}

function goLogin(return_url, msg){
	if(return_url){
		url = httpsUrl + '/login.asp?return_url=' + escape(return_url);
	}else{
		url = httpsUrl + '/login.asp?return_url='+escape(getLoginURL());
	}

	if(msg){
		if(confirm(msg)){
			location.href=url;
		}else{
			return false;
		}
	}else{
		location.href=url;
	}
}

function goUrl(url){
	location.href = url ;
}

function parent_replace(url){
	parent.location.href = url;
}

//0원 도서 및 바로 보기
function instant_view(series_num, buyType, book_num){

	var url = '/data/_instant_view.asp';
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : {
			book_num : book_num,
			series_num : series_num,
			buyType : buyType
		},
		headers : {'cache-control' : "no-cache"},
		cache : false,
		success : function(data){
			if(data.success){
				book_down(series_num, book_num, data.split_num, data.file_type);
			}else{
				alert(data.message);
			}
		},
		error: function(){}
	});

}


function makeShortUrl(longUrl){
	/*
	var apiUrl = 'https://api-ssl.bitly.com/v3/shorten?domain=bit.ly&format=json&access_token=5942ac80ce8ffbfdcbecd1f007803eb023adda03&longUrl='+encodeURIComponent(longUrl);
	var apiData = {};

	$.getJSON(apiUrl, function(data){
		console.log(data);
	});
	*/
	var apiData = {};

	$.ajax({
		url : '/data/_make_short_url.asp',
		data : {longUrl : longUrl},
		dataType : 'json',
		type : 'post',
		async : false,
		headers : {'cache-control' : "no-cache"},
		cache : false,
		success : function(data){
			apiData = data
		},
		error : function(){alert('error');}
	});

	return apiData;
}