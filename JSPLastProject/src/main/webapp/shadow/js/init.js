function getPopUpFlag(win)
{
	try{ win.focus(); return win; }
	catch(e)
	{
		alert('\n팝업(PopUp)이 차단되어 있습니다.\n\n팝업차단을 풀어주셔야 요청하신 기능을 수행할 수 있습니다.               ');
	}
}
function ColorDlg(oColor,inner){ 
	inner.innerHTML = "<OBJECT id='dlgColor' CLASSID='clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b' width='0' height='0'></OBJECT>";
	if (oColor == null) 
	{
		var oTColor = document.getElementById('dlgColor').ChooseColorDlg(); 
	}
	else
	{
		var oTColor = document.getElementById('dlgColor').ChooseColorDlg(oColor); 
			 oTColor = oTColor.toString(16); 
	}
	if (oTColor.length < 6)
	{ 
		var sTempString = "000000".substring(0,6-oTColor.length); 
		oTColor = sTempString.concat(oTColor); 
	} 
	return oTColor;
} 
//파일확장자
function getFileExt(file)
{
	var arr = file.split('.');
	return arr[arr.length-1];
}
//쿠키
function getCookie( name ){
        var nameOfCookie = name + "=";
        var x = 0;
        while ( x <= document.cookie.length )
        {
                var y = (x+nameOfCookie.length);
                if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                        if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
                                endOfCookie = document.cookie.length;
                        return unescape( document.cookie.substring( y, endOfCookie ) );
                }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                        break;
        }
        return "";
}
function setCookie( name, value, expiredays ) 
{ 
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
}

//아이디(레이어), 폼 name, 이동 url, 전체 레이어 활성화 true
function view_cover(id, formid, nurl, divtype, cover)
{
	if(!id) id = "LayLoginForm";
	if(!divtype) divtype = true;
	if(!cover) cover = true;

	if(cover == true) {
		if(!top.document.getElementById('div_cover')){
			create_cover();
		}else{
			top.document.getElementById('div_cover').style.width = '100%';

			if(top.document.body.clientHeight > top.document.body.scrollHeight) top.document.getElementById('div_cover').style.height = '100%';
			else top.document.getElementById('div_cover').style.height = top.document.body.scrollHeight;
			top.document.getElementById('div_cover').style.display = 'block';
		}
	}

	var w = parseInt(top.document.getElementById(id).style.width);
	var h = parseInt(top.document.getElementById(id).style.height);
	var window_left = (top.document.body.clientWidth-w)/2;
	var window_top = (top.document.body.clientHeight-h)/2;
	this.Lw = h/2;

	if(id) {
		this.Lid = id;
		top.document.getElementById(id).style.display = '';
		top.document.getElementById(id).style.top = window_top;
		top.document.getElementById(id).style.left = window_left;
		if(divtype == true) CheckUIElements();
	}
	if(formid) top.document.getElementById('formid').value = formid;
	if(nurl) top.document.getElementById('nurl').value = nurl;

	//return true;
}

function CheckUIElements() 
{
    var yMenuFrom, yMenuTo, yButtonFrom, yButtonTo, yOffset, timeoutNextCheck;

    yMenuFrom   = parseInt (top.document.getElementById(this.Lid).style.top, 10);
    if ( window.document.layers ) 
        yMenuTo = top.pageYOffset + 0;
    else if ( window.document.getElementById ) 
        yMenuTo = top.document.body.scrollTop + parseInt('0');

    timeoutNextCheck = 500;

    if ( Math.abs (yButtonFrom - (yMenuTo + 152)) < 6 && yButtonTo < yButtonFrom )
     {
        setTimeout ("CheckUIElements()", timeoutNextCheck);
        return;
    }

    if ( yMenuFrom != yMenuTo )
    {
        yOffset = Math.ceil( Math.abs( yMenuTo - yMenuFrom ) / 10 );
        if ( yMenuTo < yMenuFrom )
            yOffset = -yOffset;

        top.document.getElementById(this.Lid).style.top = (parseInt(top.document.getElementById(this.Lid).style.top) + yOffset) + 20;

        timeoutNextCheck = 10;
    }

    setTimeout ("CheckUIElements()", timeoutNextCheck);
}

function cover_off(id){
	if(top.document.getElementById('div_cover')) top.document.getElementById('div_cover').style.display = 'none';
	if(id) top.document.getElementById(id).style.display = 'none';
}

function create_cover(){

	var color = '#FFFFFF';
	var opacity = '70';

	var cover_div = top.document.createElement('div');
	cover_div.style.position = 'absolute';
	cover_div.style.top = '0px';
	cover_div.style.left = '0px';
	cover_div.style.width = '100%';
	cover_div.style.zIndex = 1;
	if(top.document.body.offsetHeight > top.document.body.scrollHeight) cover_div.style.height = '100%';
	else cover_div.style.height = top.document.body.scrollHeight;
	cover_div.style.backgroundColor = color;
	cover_div.style.filter = 'alpha(opacity='+opacity+')';
	cover_div.id = 'div_cover';
	top.document.body.appendChild(cover_div);
}

function review_resize(product)
{
	OpenWindow('http://rs.cetizen.com/RealSize/Application/RSIViewer_cetizen.php?pcode=' + product,'',579,333,'no','no','no','','realsize');
}

function win_memo(url)
{
location.href = url;
}


function OpenWindow(url,target,width,height,scroll,toolbar,resiz,stat,name) 
{
	var window_left = (screen.width-width)/2;
	var window_top = (screen.height-height)/2;

	toolbar = toolbar?toolbar:"no";
	resiz = resiz?resiz:"no";
	stat = stat?stat:"no";
	scroll = scroll?scroll:"yes";
	name = name?name:"event";

	window.open(url, name, "width="+ width + ", height=" + height + ", toolbar=" + toolbar + ", resizable=" + resiz + ", scrollbars=" + scroll + ", status=" + stat + ", top=" + window_top + ", left=" + window_left);
}
function addComma (str)
{
 var input_str = str.toString();

 if (input_str == '') return false;
 input_str = parseInt(input_str.replace(/[^0-9]/g, '')).toString();
 if (isNaN(input_str)) { return false; }

 var sliceChar = ',';
 var step = 3;
 var step_increment = -1;
 var tmp  = '';
 var retval = '';
 var str_len = input_str.length;

 for (var i=str_len; i>=0; i--)
 {
  tmp = input_str.charAt(i);
  if (tmp == sliceChar) continue;
  if (step_increment%step == 0 && step_increment != 0) retval = tmp + sliceChar + retval;
  else retval = tmp + retval;
  step_increment++;
 }

 return retval;
}

function getMallPrice(id, pno)
{
	var path = "/home/mobizen/include/low_price.php?pno=" + pno;
	var url = "/_system/include/shopproxy.php";
	var pars = "yws_path=" + encodeURIComponent( path );

	var req = new Ajax.Request(
		url, 
		{
			method: 'GET', 
			parameters: pars, 
			asynchronous: true,
			onFailure: reportError,
			onComplete : function(transport) {
				data = req.transport.responseText;
				var v = data.split('|');
				if(v[2]>0){
					$(id).innerHTML = "<a href='http://mall.cetizen.com/home/mobizen/mall.php?cat=" + v[1] + "&q=view&uid=" + v[2] + "' target=_blank class='text01 clr03 b'>" + addComma(v[0]) + " 원</a>";
					$(id + "more").innerHTML = "<a href='http://mall.cetizen.com/home/mobizen/mall.php?cat=" + v[1] + "&q=view&uid=" + v[2] + "' target=_blank><img src=\"http://image3.cetizen.com/2007_cetizen/review/btn_more.gif\"></a>"
				} else $(id).innerHTML = "정보없음";
			}
		});
}
function getThumbImg(id, pno, imgurl, rpath, path, thumbpath, size)
{
	var path = "/imgthumb.php?pno=" + pno + "&imgurl=" + imgurl + "&rpath=" + rpath + "&path=" + path + "&thumbpath=" + thumbpath + "&size=" + size;
	var url = "/_system/include/proxy.php";
	var pars = "yws_path=" + encodeURIComponent( path );

	var ta_image = new Image();
	ta_image.src = imgurl + "/" + thumbpath + "/" + pno + ".comg";

	if(ta_image.width>0) $(id).src = imgurl + "/" + thumbpath + "/" + pno + ".jpg";
	else{
		var req = new Ajax.Request(
			url, 
			{
				method: 'GET', 
				parameters: pars, 
				asynchronous: true,
				onFailure: reportError,
				onComplete : function(transport) {
					data = req.transport.responseText;
					$(id).src = data;
				}
			});
	}
}
function getBbsThumbImg(id, imgurl, thumbpath, dirpath, iurl, w, h, type)
{
	var path = "/imgthumbView.php?imgurl=" + imgurl + "&thumbpath=" + thumbpath + "&dirpath=" + dirpath + "&iurl=" + iurl + "&w=" + w + '&h=' + h + '&type=' + type;
	var url = "/_system/include/bbsproxy.php";
	var pars = "yws_path=" + encodeURIComponent( path );

	var ta_image = new Image();
	ta_image.src = iurl + "/bbs/" + thumbpath;

	if(ta_image.width>0) $(id).innerHTML = "<img src="+iurl + "/bbs/" + thumbpath+"  vid=\"rainimg_resize\" onError=RainImgError(this) onclick=\"parent.RanimgView("+iurl + "/" + imgurl+")\" style='cursor:pointer'>";
	else{
		var BbsThumb = new Ajax.Updater(
			{success: id},
			url, 
			{
				method: 'GET', 
				parameters: pars,
				asynchronous: true,
				onFailure: reportError
			});
	}
}
var BIN = 1;
function getBbsThumbImgList(id, imgurl, thumbpath, dirpath, iurl, w, h, type)
{
	if(BIN>=10) BIN = 1;
	var path = "/imgthumbList" + BIN + ".php?imgurl=" + imgurl + "&thumbpath=" + thumbpath + "&dirpath=" + dirpath + "&iurl=" + iurl + "&w=" + w + '&h=' + h + '&type=' + type;
	var url = "/_system/include/bbsproxy.php";
	var pars = "yws_path=" + encodeURIComponent( path );

	var ta_image = new Image();
	ta_image.src = iurl + "/bbs/" + thumbpath;

	if(ta_image.width>0) $(id).innerHTML = "<img src="+iurl + "/bbs/" + thumbpath+" onError=RainImgError48(this,"+w+") onLoad=loadRainImgList(this) style='border:0px solid #E1E1E1;width:"+w+";height:"+h+"'>";
	else{
	BIN++;
		var BbsThumb = new Ajax.Updater(
			{success: id},
			url, 
			{
				method: 'GET', 
				parameters: pars,
				asynchronous: true,
				onFailure: reportError
			});
	}
}
function getReviewThumbImgList(id, imgurl, thumbpath, dirpath, iurl, w, h, type)
{
	if(BIN>=10) BIN = 1;
	var path = "/imgthumbList" + BIN + ".php?imgurl=" + imgurl + "&thumbpath=" + thumbpath + "&dirpath=" + dirpath + "&iurl=" + iurl + "&w=" + w + '&h=' + h + '&type=' + type;
	BIN++;
	var url = "/_system/include/proxy.php";
	var pars = "yws_path=" + encodeURIComponent( path );

	var ta_image = new Image();
	ta_image.src = iurl + "/review/" + thumbpath;

	if(ta_image.width>0) $(id).innerHTML = "<img src="+iurl + "/review/" + thumbpath+" onError=RainImgError(this) onLoad=loadRainImgList(this) style='border:1px solid #E1E1E1'>";
	else{
		var BbsThumb = new Ajax.Updater(
			{success: id},
			url, 
			{
				method: 'GET', 
				parameters: pars,
				asynchronous: true,
				onFailure: reportError
			});
	}
}
function reportError(request)
{
  //alert('Sorry. There was an error.');
}
function fsearchbox_submit() {
	var f  = document.fsearchbox;
    if (f.keyword.value	== '') {
        rainPopup.alert("검색어를 입력하세요.");
        f.keyword.select();
        f.keyword.focus();
        return;
    }

    // 검색에 많은 부하가 걸리는 경우 이 주석을	제거하세요.
    var	cnt	= 0;
    for	(var i=0; i<f.keyword.value.length;	i++) {
        if (f.keyword.value.charAt(i) == ' ')
            cnt++;
    }

    if (cnt	> 2) {
        rainPopup.alert("빠른	검색을 위하여 검색어에 공백은 두개만 입력할	수 있습니다.");
        f.keyword.select();
        f.keyword.focus();
        return;
    }

    f.action = "http://search.cetizen.com/search.php";
    f.submit();
}
function fbbssearchbox_submit(url) {
	var f  = document.fbbssearchbox;
    if (f.keyword.value	== '') {
        rainPopup.alert("검색어를 입력하세요.");
        f.keyword.select();
        f.keyword.focus();
        return;
    }

    // 검색에 많은 부하가 걸리는 경우 이 주석을	제거하세요.
    var	cnt	= 0;
    for	(var i=0; i<f.keyword.value.length;	i++) {
        if (f.keyword.value.charAt(i) == ' ')
            cnt++;
    }

    if (cnt	> 2) {
        rainPopup.alert("빠른	검색을 위하여 검색어에 공백은 두개만 입력할	수 있습니다.");
        f.keyword.select();
        f.keyword.focus();
        return;
    }

    f.action = url;
    f.submit();
}
function uccPlay(txtid, swfurl, w, h) {
	var q;
	q = "<embed quality=\"high\" menu=true salign=\"lt\" bgcolor=\"#ffffff\" width=\"" + w + "\" height=\"" + h + "\" name=\"uccplay\" align=\"middle\" allowScriptAccess=\"sameDomain\" allowFullScreen=\"true\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src='" + swfurl + "'>";
	q += "</embed>";

	document.getElementById(txtid).innerHTML = q;
}

function reviewPlay(txtid, swfurl, imgurl) {
	var q;
	q = "<EMBED src=http://review.cetizen.com/mediaplayer.swf width=550 height=450 type=application/x-shockwave-flash flashvars=\"height=450&width=550&file="+trim(swfurl)+"&image="+trim(imgurl)+"&logo=http://review.cetizen.com/logo.png&amp;link=http://www.cetizen.com&linktarget=_blank&showdigits=false&shuffle=false\" allowfullscreen=\"true\" allowscriptaccess=\"always\"></EMBED>";

//q = "<embed src=\"http://review.cetizen.com/mediaplayer.swf\" width=\"550\" height=\"450\" allowscriptaccess=\"always\" allowfullscreen=\"true\" flashvars=\"height=450&width=550&file="+trim(swfurl)+"&image="+trim(imgurl)+"&logo=http://review.cetizen.com/logo.png&link=http://www.cetizen.com&linktarget=_blank&showdigits=false&shuffle=false\"/>";
//q += "</embed>";
//alert(q);
	document.getElementById(txtid).innerHTML = q;
}

function getreview_play(fileID, ovodurl, id)
{
	

	if(fileID>0) {

		var url = '/_system/include/ezucc_proxy.php';
		var pars = 'action=getThumbnailList&id=' + fileID;
		var str = "";
		var highlightValSmall = "";
		var id=!id?"uccp":id;

		var req = new Ajax.Request(
			url, 
			{
				method: 'GET', 
				parameters: pars,
				asynchronous: true,
				onComplete : function(transport) {
					resDataXml = req.transport.responseXML;
					var THUMBNAIL = resDataXml.getElementsByTagName("RESULT/THUMBNAIL");					
					var totalthumbCount = THUMBNAIL.length;

						highlightVal = resDataXml.getElementsByTagName("THUMBNAIL")[0].childNodes[0].nodeValue;
						
						str += highlightVal;
						//alert(str);
					getreviewUrl(fileID, str, id);
				}
			});

	}else midplay(id, ovodurl, 550, 450 , 1);
}

function getreviewUrl(fileID, str, id)
{
	var path = '/fms/pos_query2.php?service_id=6000&protocol=http&web_auth=y&out_type=uri&&s_idx=' + fileID;
	var url = '/_system/module/vodcdn.php';
	var pars = 'yws_path=' + encodeURIComponent( path );

	var req = new Ajax.Request(
		url, 
		{
			method: 'GET', 
			parameters: pars,
			asynchronous: true,
			onComplete : function(transport) {
				data = req.transport.responseText;
				//alert(data);
				reviewPlay(id, data, str);
			}
		});
}



function midplay(txtid, review_vod, w, h, type) {
	var q;

	if(type==1) {
	q = "<embed name=mediaplayer1 name=mediaplayer1 type='application/x-mplayer2' pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/' width='" + w + "' height='" + h + "' filename='" + review_vod + "' autostart='1' autosize='1' autoresize='1' animationatstart='0' transparentatstart='1' autorewind='1' showdisplay='0' clicktoplay='0' enablecontextmenu='0' showpositioncontrols='0' showstatusbar='1'>";
	q += "</embed>";
	}else{
	q = "<embed name=mediaplayer1 name=mediaplayer1 pluginspage=\"http://www.macromedia.com/jp/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash\" type=\"application/x-shockwave-flash\" quality=high width='" + w + "' height='" + h + "' src='" + review_vod + "'>";
	q += "</embed>";
	}

	document.getElementById(txtid).innerHTML = q;
}

function trim(str){
	str = str.replace(/^\s*/,'').replace(/\s*$/,'');
	return str;
}

function getUccPlay(fileID, ovodurl, id)
{
	if(fileID>0) {

		var url = '/_system/include/ezucc_proxy.php';
		var pars = 'action=getThumbnailList&id=' + fileID;
		var str = "&thum_num=6";
		var highlightValSmall = "";
		var id=!id?"uccp":id;

		var req = new Ajax.Request(
			url, 
			{
				method: 'GET', 
				parameters: pars,
				asynchronous: true,
				onComplete : function(transport) {
					resDataXml = req.transport.responseXML;
					var THUMBNAIL = resDataXml.getElementsByTagName("RESULT/THUMBNAIL");
					var totalthumbCount = THUMBNAIL.length;

					for(i=0;i<6;i++){
						highlightVal = resDataXml.getElementsByTagName("THUMBNAIL")[i].childNodes[0].nodeValue;
						highlightValSmall = resDataXml.getElementsByTagName("THUMBNAIL_SMALL")[i].childNodes[0].nodeValue;
						highlightValNum = resDataXml.getElementsByTagName("THUMBNAIL_SMALL")[i].getAttribute("time");

						str += "&thumimg"+ parseInt(i+1) +"=" + encodeURIComponent(highlightValSmall);
						str += "&thum"+ parseInt(i+1) +"=" + highlightValNum;
						if(i==0) str += "&thumbig"+ parseInt(i+1) +"=" + highlightVal;
					}	
					//alert(str);
					getUccUrl(fileID, str, id);
				}
			});

	}else midplay(id, ovodurl, 550, 450 , 1);
}
function getUccUrl(fileID, str, id)
{
	var path = '/fms/pos_query2.php?service_id=6000&protocol=http&web_auth=y&out_type=uri&&s_idx=' + fileID;
	var url = '/_system/module/vodcdn.php';
	var pars = 'yws_path=' + encodeURIComponent( path );

	var req = new Ajax.Request(
		url, 
		{
			method: 'GET', 
			parameters: pars,
			asynchronous: true,
			onComplete : function(transport) {
				data = req.transport.responseText;

				uccPlay(id, 'http://image3.cetizen.com/2007_cetizen/cetizenucc2.swf?curl=' + trim(data) + '' + trim(str), '578', '475');
			}
		});
}

function getUccUrlSmall(fileID, id, imgurl, w)
{
	var path = '/fms/pos_query2.php?service_id=6000&protocol=http&web_auth=y&out_type=uri&&s_idx=' + fileID;
	var url = '/_system/module/vodcdn.php';
	var pars = 'yws_path=' + encodeURIComponent( path );
	if(!w) w = 125;

	var req = new Ajax.Request(
		url, 
		{
			method: 'GET', 
			parameters: pars,
			asynchronous: true,
			onComplete : function(transport) {
				data = req.transport.responseText;
				uccPlay(id, 'http://image3.cetizen.com/2007_cetizen/125x93n.swf?curl=' + trim(data) + '&thumbig1=' + trim(imgurl), w, '93');
			//alert('http://image3.cetizen.com/2007_cetizen/125x93.swf?curl=' + trim(data) + '&thumbig1=' + trim(imgurl));
			}
		});
}

function getUccThumb(id, fileID, num, w, h)
{
	if(fileID>0) {

		var url = '/_system/include/ezucc_proxy.php';
		var pars = 'action=getThumbnailList&id=' + fileID;
		var str = "";
		var highlightValSmall = "";

		var req = new Ajax.Request(
			url, 
			{
				method: 'GET', 
				parameters: pars,
				asynchronous: true,
				onComplete : function(transport) {
					resDataXml = req.transport.responseXML;
					var THUMBNAIL = resDataXml.getElementsByTagName("RESULT/THUMBNAIL");
					var totalthumbCount = THUMBNAIL.length;

					for(i=0;i<num;i++){
						highlightValSmall = resDataXml.getElementsByTagName("THUMBNAIL")[i].childNodes[0].nodeValue;

						str += "<img src='" + highlightValSmall + "' width=" + w + " height=" + h + " onError=\"RainImgError2(this, "+w+")\">";
					}		
					document.getElementById(id).innerHTML = str;
				}
			});

	}else document.getElementById(id).innerHTML = "<img src=\"<?=$img[$global[thisname]]?>/img_movie.gif\" width=\"190\" height=\"150\" onError=\"RainImgError2(this, 190)\">";
}

function roundTable(objID) {
   var obj = document.getElementById(objID);
   var Parent, objTmp, Table, TBody, TR, TD;
   var bdcolor, bgcolor, Space;
   var trIDX, tdIDX, MAX;
   var styleWidth, styleHeight;

   Parent = obj.parentNode;
   objTmp = document.createElement('SPAN');
   Parent.insertBefore(objTmp, obj);
   Parent.removeChild(obj);

   bdcolor = obj.getAttribute('rborder');
   bgcolor = obj.getAttribute('rbgcolor');
   radius = parseInt(obj.getAttribute('radius'));
   if (radius == null || radius < 1) radius = 1;
   else if (radius > 6) radius = 6;

   MAX = radius * 2 + 1;

   Table = document.createElement('TABLE');
   TBody = document.createElement('TBODY');

   Table.cellSpacing = 0;
   Table.cellPadding = 0;

   for (trIDX=0; trIDX < MAX; trIDX++) {
		  TR = document.createElement('TR');
		  Space = Math.abs(trIDX - parseInt(radius));
		  for (tdIDX=0; tdIDX < MAX; tdIDX++) {
				 TD = document.createElement('TD');
				 
				 styleWidth = '1px'; styleHeight = '1px';
				 if (tdIDX == 0 || tdIDX == MAX - 1) styleHeight = null;
				 else if (trIDX == 0 || trIDX == MAX - 1) styleWidth = null;
				 else if (radius > 2) {
						if (Math.abs(tdIDX - radius) == 1) styleWidth = '2px';
						if (Math.abs(trIDX - radius) == 1) styleHeight = '2px';
				 }

				 if (styleWidth != null) TD.style.width = styleWidth;
				 if (styleHeight != null) TD.style.height = styleHeight;

				 if (Space == tdIDX || Space == MAX - tdIDX - 1) TD.style.backgroundColor = bdcolor;
				 else if (tdIDX > Space && Space < MAX - tdIDX - 1)  TD.style.backgroundColor = bgcolor;
				 
				 if (Space == 0 && tdIDX == radius) TD.appendChild(obj);
				 TR.appendChild(TD);
		  }
		  TBody.appendChild(TR);
   }
   Table.appendChild(TBody);
   Parent.insertBefore(Table, objTmp);
}

function ShowImageReview(pno, ptitle, pm)
{
	RanFramesView("/review.php?q=openimage&pno="+pno+"&win=1&pid="+ptitle+"&pm="+pm,615,670,'no')
}

function ShowPriceView(pno, ptitle)
{
	RanFramesView("http://review.cetizen.com/review.php?q=price&pno="+pno+"&pid="+ptitle+"&win=1",445,480,'no')
		
}

function ShowEscrowView(pno, ptitle)
{
	RanFramesView("http://review.cetizen.com/review.php?q=escrow&pno="+pno+"&pid="+ptitle+"&win=1",445,480,'no')
		
}

function ShowSpacError(pno, ptitle)
{
	RanFramesView("/review.php?q=spacError&pno="+pno+"&pid="+ptitle+"&win=1",465,480,'no')
}

function flashWrite(url,w,h,id,bg,vars,win){

	// 플래시 코드 정의
	var flashStr=
	"<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0' width='"+w+"' height='"+h+"' id='"+id+"' align='middle'>"+
	"<param name='allowScriptAccess' value='always' />"+
	"<param name='movie' value='"+url+"' />"+
	"<param name='FlashVars' value='"+vars+"' />"+
	"<param name='wmode' value='"+win+"' />"+
	"<param name='menu' value='false' />"+
	"<param name='quality' value='high' />"+
	"<param name='bgcolor' value='"+bg+"' />"+
	"<embed src='"+url+"' FlashVars='"+vars+"' wmode='"+win+"' menu='false' quality='high' bgcolor='"+bg+"' width='"+w+"' height='"+h+"' name='"+id+"' align='middle' allowScriptAccess='always' type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/go/getflashplayer' />"+
	"</object>";

	// 플래시 코드 출력
	document.write(flashStr);

}
function getBestSide(id, iurl, imgurl)
{
	var url = '/_create/side/'+iurl;
	var pars = 'imgurl='+imgurl;

	var req = new Ajax.Updater(
		{success: id},
		url,
		{
			method: 'GET',
			asynchronous: true,
			parameters: pars
		});
}
