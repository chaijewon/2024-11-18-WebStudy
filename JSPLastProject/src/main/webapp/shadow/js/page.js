//페이징처리
function getPageLink(lnum,p,tpage,imgpath)
{
	var g_p1 = "<img src='"+imgpath+"/prev1.gif' border='0' align=absmiddle> <font color=gray>이전</font></a> ";
	var g_p2 = "<img src='"+imgpath+"/prev2.gif' border='0' align=absmiddle> <font color=gray>이전</font></a> ";
	var g_n1 = " <font color=gray>다음</font></a> <img src='"+imgpath+"/next1.gif' border='0' align=absmiddle>";
	var g_n2 = " <font color=gray>다음</font></a> <img src='"+imgpath+"/next2.gif' border='0' align=absmiddle>";
	var g_cn = "&nbsp;&nbsp;<img src='"+imgpath+"/cutln.gif' border='0' align=absmiddle>&nbsp;&nbsp;";
	var g_q  = "<a href='javascript:getPageGo(1);'><img src='"+imgpath+"/btn_firstp.gif' border='0' align=absmiddle> <font color=gray>맨앞</font></a> ";

	if(p < lnum+1) { g_q += g_p1; }
	else{ var pp = parseInt((p-1)/lnum)*lnum; g_q += "<a href='javascript:getPageGo("+pp+");'>"+g_p2+"</A>";} g_q += g_cn;

	var st1 = parseInt((p-1)/lnum)*lnum + 1;
	var st2 = st1 + lnum;

	for(var jn = st1; jn < st2; jn++)
	if ( jn <= tpage)
	(jn == p)? g_q += "<font color=red><b>"+jn+"</b></font>"+g_cn : g_q += "<a href='javascript:getPageGo("+jn+");'>"+jn+"</a>"+g_cn;

	if(tpage < lnum || tpage < jn) { g_q += g_n1; }
	else{var np = jn; g_q += "<a href='javascript:getPageGo("+np+");'>"+g_n2+"</a>"; }
	g_q  += " <a href='javascript:getPageGo("+tpage+");'><font color=gray>맨끝</font> <img src='"+imgpath+"/btn_lastp.gif' border='0' align=absmiddle></a>";
	document.write(g_q);
}
function getPageLink2(lnum,p,tpage,imgpath)
{
	var g_p1 = "<img src='"+imgpath+"/prev1.gif' border='0' align=absmiddle>";
	var g_p2 = "<img src='"+imgpath+"/prev1.gif' border='0' align=absmiddle>";
	var g_n1 = "<img src='"+imgpath+"/next1.gif' border='0' align=absmiddle>";
	var g_n2 = "<img src='"+imgpath+"/next1.gif' border='0' align=absmiddle>";
	var g_cn = "&nbsp;&nbsp;<img src='"+imgpath+"/cutln.gif' border='0' align=absmiddle>&nbsp;&nbsp;";
	var g_q  = "<a href='javascript:getPageGo(1);'><img src='"+imgpath+"/btn_firstp.gif' border='0' align=absmiddle></a> ";

	if(p < lnum+1) { g_q += g_p1; }
	else{ var pp = parseInt((p-1)/lnum)*lnum; g_q += "<a href='javascript:getPageGo("+pp+");' class='page_num'>"+g_p2+"</A>";} g_q += g_cn;

	var st1 = parseInt((p-1)/lnum)*lnum + 1;
	var st2 = st1 + lnum;

	for(var jn = st1; jn < st2; jn++)
	if ( jn <= tpage)
	(jn == p)? g_q += "<font color=red><b>"+jn+"</b></font>"+g_cn : g_q += "<a href='javascript:getPageGo("+jn+");' class='page_num'>"+jn+"</a>"+g_cn;

	if(tpage < lnum || tpage < jn) { g_q += g_n1; }
	else{var np = jn; g_q += "<a href='javascript:getPageGo("+np+");' class='page_num'>"+g_n2+"</a>"; }
	g_q  += " <img src='"+imgpath+"/btn_lastp.gif' border='0' align=absmiddle></a>";
	document.write(g_q);
}
//페이지클릭
function getPageGo(n)
{ 
	var p   = getUriString('p');
	var que = location.href.replace('&p='+p,'');
		 que = que.indexOf('?') != -1 ? que : que + '?';
		 que = que.replace('&q=view&uid=' + getUriString('uid') , '');
	var xurl = que.split('#');
	location.href= xurl[0] + '&p=' + n; 
}

//파라미터값
function getUriString(param)
{
	var QuerySplit = location.href.split('?');
	var ResultQuer = QuerySplit[1] ? QuerySplit[1].split('&') : '';

	for (var i = 0; i < ResultQuer.length; i++)
	{
		var keyval = ResultQuer[i].split('=');
		if (param == keyval[0]) return keyval[1];
	}
	return "";
}