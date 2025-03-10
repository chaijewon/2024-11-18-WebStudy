var httpRequest=null;
function getHttpRequest() {  //��Ŵ��
	if (window.ActiveXObject) {
		try {
			
			return new ActiveXObject("Msxml2.XMLHTTPREQUEST");		
			
			
		} catch(e) {			
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e1) {
				return null;						
			}		
		}
	}
	else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}		
	else {
		return null;
	}
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
}
function sendRequest(param, callback) {
	httpRequest = getHttpRequest(); 	
	httpRequest.open("POST","suggest.daum",true);	
	httpRequest.onreadystatechange=callback;
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	httpRequest.send(param);
}

