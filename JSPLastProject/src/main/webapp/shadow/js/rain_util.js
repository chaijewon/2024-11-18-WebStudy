
if (rain == undefined)
	var rain = Class.create();

rain.extend = function(destination, source) {
	return Object.extend(Object.extend({}, destination), source);
}

/*
* rain.Popup
* 레인 팝업 통제기
*/

rain.Popup = Class.create();
rain.Popup.prototype = {
	initialize : function(obj_class, options, parentNode) {
		this.parentNode = parentNode;
		this.childNodes = [];
		if (this.parentNode == null) {
			var doc_area = document.getElementsByTagName("body")[0]
			this.obj_area = doc_area.insertBefore(rain.nodeUtil.getDiv({},{left:'0px',top:'0px',position:'absolute',zIndex : 1000}), doc_area.firstChild);
			this.style_class = (obj_class != null)?obj_class:new rain.Popup.style();
//			Position.absolutize(this.obj_area);
		} else {
			this.obj = $(obj_class.obj);
			this.style_class = this.parentNode.style_class;
			obj_class.popup_class = this;
			this.is_closed = false;
			this.options = Object.extend({
				is_transparent : false,
				toolbar : true,
				shadow : true,
				ismoveable : true,
				sticker : {obj : null, pos : 'TL', margin : [0,0]}
			}, options);	
			var doc_area = this.parentNode.obj_area;
			var tmp_obj = rain.nodeUtil.getDiv({},{zIndex : 10, position : 'relative'});
			this.frame_obj = doc_area.insertBefore(tmp_obj, doc_area.lastChild);
			if (this.options.shadow) {
				this.shadow_obj = this.frame_obj.appendChild(rain.nodeUtil.getDiv({},this.style_class.getStyle('shadow')));
				Position.absolutize(this.shadow_obj);
			} else 
				this.shadow_obj = null;
				
			if (!this.options.is_transparent)
				this.outbox_obj = this.frame_obj.appendChild(rain.nodeUtil.getDiv({},this.style_class.getStyle('outbox')));
			else 
				this.outbox_obj = this.frame_obj.appendChild(rain.nodeUtil.getDiv({},{}));


			this.drawFrame();
			this.reSize();
		}
	},
	drawFrame : function() {
		if (this.options.toolbar ) {
			this.top_area = this.outbox_obj.appendChild(rain.nodeUtil.getDiv({},{width:'auto', height:'14px',margin:'2px 0px 2px 0px'}));
			this.handler = this.top_area.appendChild(rain.nodeUtil.getDiv({},this.style_class.getStyle('handler')));
			//this.btn_toggle = this.top_area.appendChild(rain.nodeUtil.getButton({title:'최소화',onclick:this.toggle.bind(this)},this.style_class.getStyle('smallbtn')));
			this.btn_close = this.top_area.appendChild(rain.nodeUtil.getButton({title:'창닫기',onclick:this.close.bind(this)},this.style_class.getStyle('smallbtn')));
			this.obj_area = this.outbox_obj.appendChild(rain.nodeUtil.getDiv({},{width:'auto', height:'auto',margin:'0px',padding:'2px'}));
			this.frame_margin = {w:8,h:18,l:0,t:0};
		} else if (this.options.is_transparent) {
			this.obj_area = this.outbox_obj.appendChild(rain.nodeUtil.getDiv({},{width:'auto', height:'auto',margin:'0px'}));
			this.frame_margin = {w:0,h:0,l:0,t:0};
		} else {
			this.obj_area = this.outbox_obj.appendChild(rain.nodeUtil.getDiv({},{width:'auto', height:'auto',margin:'0px',padding:'2px'}));
			this.frame_margin = {w:4,h:4,l:0,t:0};
		}
		this.obj_area.appendChild(this.obj);
		Position.absolutize(this.frame_obj);
		if (this.options.toolbar && this.options.ismoveable)
			new rain.Popup.Drag(this.frame_obj, {handler : [this.handler]});
	},
	add : function(obj_class,options) {
		if (this.childNodes.length > 0) 
			this.childNodes[0].close();
		var obj = new rain.Popup(obj_class,options,this);
		this.appendChild(obj);
		return obj;
	},
	appendChild : function(obj) {
		this.childNodes.push(obj);
	},
	removeChild : function(obj) {
		this.childNodes = this.childNodes.findAll(function(value) {return (value != obj);});
		if (obj.frame_obj.parentNode != null) obj.frame_obj.parentNode.removeChild(obj.frame_obj);
	},
	changeSize : function(frm_height, frm_width) {
		var style_info;
		if (frm_width != null) {
			style_info = {height:frm_height + 'px',width : frm_width + 'px'};
		} else {
			style_info = {height:frm_height + 'px'};
		}
		Element.setStyle(this.frame_obj,style_info);
		Element.setStyle(this.outbox_obj,style_info);
		if (this.shadow_obj != null)
			Position.clone(this.outbox_obj,this.shadow_obj);
		
	},
	toggle : function() {
		this.is_closed = !this.is_closed;
		if (this.is_closed) {
			Element.hide(this.obj_area);
			Element.setStyle(this.btn_toggle, this.style_class.getStyle('smallopenbtn'));
			this.changeSize(20);
		} else {
			Element.show(this.obj_area);
			Element.setStyle(this.btn_toggle, this.style_class.getStyle('smallbtn'));
			this.changeSize(this.obj_size.h+20);
		}
	},
	reSize : function() {
		this.obj_size  = {w:this.obj.offsetWidth, h:this.obj.offsetHeight};
		Element.setStyle(this.obj_area, {width:(this.obj_size.w)+'px',height:(this.obj_size.h)+'px'});
		this.changeSize(this.obj_size.h+this.frame_margin.h,this.obj_size.w+this.frame_margin.w);
		if (!this.is_resized) {
			if (this.handler != null) 
				Element.setStyle(this.handler, {width:(this.obj_size.w -30)+'px'});
			if (this.options.sticker.obj != null) {
				var pos = Position.positionedOffset(this.options.sticker.obj);
				var wh = {w:this.options.sticker.obj.offsetWidth, h:this.options.sticker.obj.offsetHeight};
				switch(this.options.sticker.pos) {
					case 'TR' :
						pos[0] += wh.w; break;
					case 'BL' :
						pos[1] += wh.h; break;
					case 'BR' :
						pos[0] += wh.w; pos[1] += wh.h; break;
				}
				if (this.options.sticker.margin != null) {
					pos[0] +=  this.options.sticker.margin[0];
					pos[1] +=  this.options.sticker.margin[1];
				}
				Element.setStyle(this.frame_obj, {left:(pos[0] + this.frame_margin.l)+'px',top:(pos[1] + this.frame_margin.t)+'px'});
			} else if (this.parentNode == null || this.parentNode.parentNode == null)
				rain.nodeUtil.move2Center(this.frame_obj);
			else 
				rain.nodeUtil.move2Center(this.frame_obj, this.parentNode.obj_area);
			this.is_resized = true;
		}
	},
	close : function() {
		if (this.parentNode != null) 
			this.parentNode.removeChild(this);
	},
	closeChild : function() {
		for(var i =0; i < this.childNodes.length; i++) 
			this.childNodes[i].close();
	}
}

/*
* rain.Popup.style
* 레인 팝업 스타일 통제기
*/
rain.Popup.style = Class.create();
rain.Popup.style.prototype = {
	initialize : function(options) {
		this.options = Object.extend({
			line : '#757373',
			bg : '#FFFFFF',
			font : '#aaaaaa',
			handler : '#e1e1e1',
			btn : '#444444',
			tabon : '#363636',
			taboff : '#363636',
			box_bg : '#FFFFFF',
			box_font : '#aaaaaa',
			shadow : '#eeeeee',
			shadow_margin : '3px 0px 0px 3px',
			url_image : 'http://file.cafen.net/editor/images/',
			url_uploads : 'http://file.cafen.net/editor/uploads/'
		}, options);
	},
	imgURL : function() {
		return this.options.url_image;
	},
	uploadURL : function() {
		return this.options.url_uploads;
	},
	getStyle : function(area_name) {
		switch(area_name) {
			case 'toptaboff' :
				return {
					borderTop : '1px solid '+this.options.line,
					borderLeft : '1px solid '+this.options.line,
					borderRight : '1px solid '+this.options.line,
					borderBottom : '1px solid '+this.options.line,
					backgroundColor : this.options.taboff,
					color : this.options.box_font,
					padding : '3px',
					fontSize : '9pt',
					textAlign : 'center',
					cursor:'pointer'
				}
				break;
			case 'toptabon' :
				return {
					borderTop : '1px solid '+this.options.line,
					borderLeft : '1px solid '+this.options.line,
					borderRight : '1px solid '+this.options.line,
					borderBottom : '1px solid '+this.options.tabon,
					backgroundColor : this.options.tabon,
					color : this.options.box_font,
					padding : '3px',
					fontSize : '9pt',
					textAlign : 'center',
					cursor:'pointer'
				}
				break;
			case 'toptabgab' :
				return {
					borderTop : '0px',
					borderLeft : '0px',
					borderRight : '0px',
					borderBottom : '1px solid '+this.options.line,
					padding : '1px',
					width : '3px',
					fontSize : '3px'
				}
				break;
			case 'toptabline' :
				return {
					backgroundColor : this.options.tabon,
					height : '3px',
					fontSize : '3px'
				}
				break;
			case 'smallbox' :
				return {
					border : '1px solid ' +this.options.line,
					backgroundColor : this.options.box_bg,
					color : this.options.box_font,
					fontSize : '12px',
					cursor:'pointer'
				}
				break;
			case 'outbox' :
				return {
					backgroundColor : this.options.bg,
					border : '1px solid '+this.options.line,
					width : 'auto',height : 'auto',
					margin :'0px',
					textAlign : 'center'
				}
				break;
			case 'shadow' :
				return {
					backgroundColor : this.options.shadow,
					width : 'auto',height : 'auto',
					margin : this.options.shadow_margin,
					textAlign : 'center',
					zIndex : -1
				}
				break;
			case 'handler' :
				return {
					backgroundColor : this.options.handler,
					height : '10px',
					width : 'auto',
					fontSize : '1px',
					margin : '5px 1px 1px 5px',
					border : '0px solid '+this.options.line,
					cssFloat : 'left', styleFloat : 'left'
				}
				break;
			case 'smallbtn' :
				return {
					background : 'url(http://image3.cetizen.com/2007_cetizen/review/bt_pclose.gif) no-repeat',
					height : '16px',
					width : '16px',
					margin : '3px 0px 0px 0px',
					align : 'absmiddle'
				}
				break;
			case 'smallopenbtn' :
				return {
					backgroundColor : this.options.btn,
					height : '5px',
					width : '10px',
					fontSize : '3px',
					margin : '0px 0px 0px 0px',
					border : '0px solid ' + this.options.line
				}
				break;
			case 'colorpreview' :
				return {
					height: '13px', 
					border : '1px solid '+this.options.line,
					cssFloat:'left',styleFloat:'left',
					margin:'0px 2px 0px 0px',
					padding : '1px',
					fontSize : '1px',
					cursor : 'pointer'
				}
				break;
			case 'input' :
				return {
					border : '1px solid '+this.options.line, 
					width:'55px',
					height: '17px',
					backgroundColor:this.options.font,
					color:this.options.bg,
					margin:'0px 3px 0px 0px'
				}
				break;
			case 'msg' :
				return {
					border : '1px dotted '+this.options.line, 
					color:this.options.font,
					padding:'5px',
					textAlign : 'center'
				}
				break;
			case 'button' :
				return {
					height: '17px',
					fontSize:'12px',
					backgroundColor:this.options.box_bg,
					color:this.options.box_font,
					border:'1px solid '+this.options.line,
					padding:'0px 5px 0px 5px',margin:'0px',
					margin : '0px 1px 0px 1px',
					cursor : 'pointer'
				}
				break;
			case 'scroll' :
				return {
					scrollbarFaceColor : this.options.bg,
					scrollbarHighlightColor : this.options.line,
					scrollbar3dlightColor : this.options.bg,
					scrollbarDarkshadowColor : this.options.bg,
					scrollbarArrowColor : this.options.line,
					scrollbarShadowColor :this.options.handler,
					scrollbarTrackColor: this.options.bg,
					padding : '0px',
					overflowY:'auto' ,
					overflowX:'hidden'
				}
				break;
			default : 
				return {}
				break;
		}
	}	
}
	

/*
* rain.Popup.confirm
* 레인 팝업 확인 창
*/
rain.Popup.confirm = Class.create();
rain.Popup.confirm.prototype = {
	initialize : function(msg, call_back,style_class) {
		if (call_back != undefined) 
			this.onchange = call_back;
		this.style_class = (style_class != null)?style_class:new rain.Popup.style();
		this.obj = rain.nodeUtil.getDiv({},{width:'300px', height:'auto'});
		this.obj.appendChild(rain.nodeUtil.getDiv({innerHTML:msg},Object.extend(this.style_class.getStyle('msg'),{margin:'10px',width:'280px', height:'auto'})));
		var button_area = this.obj.appendChild(rain.nodeUtil.getDiv({},{padding:'5px',width:'280px', height:'35px'}));
		button_area.appendChild(rain.nodeUtil.getButton({innerHTML:'예', onclick:this.sendResult.bind(this,true)},this.style_class.getStyle('button')));
		button_area.appendChild(rain.nodeUtil.getButton({innerHTML:'아니요', onclick:this.sendResult.bind(this,false)},this.style_class.getStyle('button')));
	},
	onchange : function() {},
	sendResult : function(bl) {
		this.popup_class.parentNode.closeChild();
		this.onchange(bl);
	}
}

/*
* rain.Popup
* 레인 팝업 알림창
*/
rain.Popup.alert = Class.create();
rain.Popup.alert.prototype = {
	initialize : function(msg, style_class) {
		this.style_class = (style_class != null)?style_class:new rain.Popup.style();
		this.obj = rain.nodeUtil.getDiv({},{width:'300px', height:'auto'});
		this.obj.appendChild(rain.nodeUtil.getDiv({innerHTML:msg},Object.extend(this.style_class.getStyle('msg'),{margin:'5px',width:'280px', height:'auto'})));
		var button_area = this.obj.appendChild(rain.nodeUtil.getDiv({},{margin:'5px',width:'280px', height:'30px'}));
		button_area.appendChild(rain.nodeUtil.getButton({innerHTML:'확인', onclick:this.sendResult.bind(this)},this.style_class.getStyle('button')));
	},
	sendResult : function() {
		if (this.popup_class != null)
			this.popup_class.close();
	}
}


/*
* rain.Popup
* 레인 팝업 입력창
*/

rain.Popup.prompt = Class.create();
rain.Popup.prompt.prototype = {
	initialize : function(msg, call_back, options, style_class) {
		this.options = Object.extend({
			value : '',
			accept : null,
			unaccept : null,
			strtype : null,
			min : 1,
			max : 150
		},options);
		if (call_back != undefined) 
			this.onchange = call_back;
		
		this.style_class = (style_class != null)?style_class:new rain.Popup.style();

		this.obj = rain.nodeUtil.getDiv({},{width:'300px', height:'auto'});
		this.obj.appendChild(rain.nodeUtil.getDiv({innerHTML:msg},Object.extend(this.style_class.getStyle('msg'),{margin:'5px',width:'280px', height:'auto'})));
		var button_area = this.obj.appendChild(rain.nodeUtil.getDiv({},{width:'280px', height:'35px'}));
		this.input_box = button_area.appendChild(rain.nodeUtil.getInput({
			value : this.options.value
		}, Object.extend(this.style_class.getStyle('input'),{width:'150px'})));
		Event.observe(this.input_box, 'keypress', this.enterKey.bind(this));
		button_area.appendChild(rain.nodeUtil.getButton({innerHTML:'확인', onclick:this.sendResult.bind(this)},this.style_class.getStyle('button')));
	},
	onchange : function() {},
	checkType : function (s,spc) {
		for(var i=0; i<s.length; i++) 
			if (spc.indexOf( s.substring(i, i+1)) < 0) 
				return false;
		return true;
	},
	checkBType : function(s,spc) {
		for(var i=0; i<s.length; i++) 
			if (spc.indexOf( s.substring(i, i+1)) > 0) 
				return false;
		return true;
	},
	enterKey : function(event) {
		if (event.keyCode == 13) 
			this.sendResult();
	},
	sendResult : function() {
		var result = this.input_box.value;
		if (result.length > this.options.max) 
			this.popup_class.add(
			new rain.Popup.alert('최대 ' + this.options.max + '자리 이상을 넘을 수 없습니다.'), 
			{sticker:{
				obj:this.input_box,
				pos : 'BL'
			}}
			);	
		else if (result.length < this.options.min) 
			this.popup_class.add(
				new rain.Popup.alert('최소 ' + this.options.min + '자리 이상을 입력하여 주십시오.', this.style_class)
			);	
		else if (this.options.strtype != null && !this.checkFormat(result)) 
			this.popup_class.add(
				new rain.Popup.alert(this.error_msg, this.style_class)
			);	
		else if (this.options.accept != null && !this.checkType(result,this.options.accept)) 
			this.popup_class.add(
				new rain.Popup.alert('유효하지 않은 문자가 등록되어 있습니다.', this.style_class)
			);	
		else if (this.options.unaccept != null && !this.checkBType(result,this.options.unaccept)) 
			this.popup_class.add(
				new rain.Popup.alert('유효하지 않은 문자가 등록되어 있습니다.', this.style_class)
			);	
		else 	{
			this.onchange(result);
			if (this.popup_class != null)
				this.popup_class.close();
		}
	},
	checkFormat : function(str) {
		switch(this.options.strtype) {
			case 'url' :
				if (!str.match(/^(http:\/\/.+\..+)/i)) {
					this.error_msg = "URL 주소는 http://domain.com/index.html<br> 형태로 입력하여 주십시오";
					return false;
				} else
					return true;
				break;
			case 'email' :
				if (!str.match(/^(.+@.+\..+)/i)) {
					this.error_msg = "메일주소는 email@domain.com 의 형식만 유효합니다.";
					return false;
				} else 
					return true;
				break;
			case 'id' :
				if (!str.match(/^([0-9a-zA-Z]+)$/i)) {
					this.error_msg = "영문자 혹은 숫자만 입력 가능합니다.";
					return false;
				}  else 
					return true;
				break;
			case 'number' :
				if (!str.match(/^([0-9]+)$/i)) {
					this.error_msg = "숫자만 입력하실수 있습니다.";
					return false;
				}  else 
					return true;
				break;
			case 'korean' :
				if (!this.checkBType(str, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!#$%&*+-./=?@^_`{|}~!@#$%^&*()_+|`'\"-=:;<>?,./☆※★○●◎◇＆◆")){
					this.error_msg = "한글과 공백을 제외한 다른 문자가 올수 없습니다.";
					return false;
				} else 
					return true;
				break;
				
		}
	}
}


/*
* rain.Popup.Drag 
* 레인 팝업 창 드래그
*/
rain.Popup.Drag = Class.create();
rain.Popup.Drag.prototype = {
	initialize : function(obj, options) {
		this.obj = $(obj);
		this.options = options;
		this.onmousedown = this.onDragStart.bindAsEventListener(this);
		this.onmousemove = this.onDrag.bindAsEventListener(this);
		this.onmouseup   = this.onDragEnd.bindAsEventListener(this);
		var handler = this.options.handler;
		if (handler != undefined) {
			if (typeof handler == 'string')
				Event.observe($(handler), 'mousedown', this.onmousedown);
			else if (!handler.length) 
				Event.observe(this.obj, 'mousedown', this.onmousedown);
			else 
				for(var i=0; i < handler.length; i++) 
					Event.observe($(handler[i]), 'mousedown', this.onmousedown);
		} else 
				Event.observe(this.obj, 'mousedown', this.onmousedown);
	},
	onDragStart : function(e) {
		this.orgPosition   = this.obj.style.position;
		if (this.orgPosition != 'absolute')
			Position.absolutize(this.obj);
		Event.observe(document, 'mousemove', this.onmousemove);
		Event.observe(document, 'mouseup', this.onmouseup);
		Event.observe(document, 'keypress', this.onmouseup);
		this.startX = Event.pointerX(e);
		this.startY = Event.pointerY(e);
		this.startPos = Position.positionedOffset(this.obj);
		this.orgZ   = this.obj.style.zIndex;
		this.obj.style.zIndex = 1000;
		this.obj.style.right = this.obj.style.bottom = '';
		this.obj.style.top = this.startPos[1]+'px';
		this.obj.style.left = this.startPos[0]+'px';
		if (this.options.limitArea) {
			var limitArea = this.options.limitArea;
			var limCoords = Position.cumulativeOffset(limitArea);
			var limLeft   = limCoords[0];
			var limTop    = limCoords[1];
			var limWidth  = limitArea.scrollWidth || limitArea.offsetWidth ;
			var limHeight = limitArea.scrollHeight || limitArea.offsetHeight;

			this.limit = {
				left   : limLeft,
				right  : limLeft + limWidth,
				top    : limTop,
				bottom : limTop + limHeight
			};
		}
		Event.stop(e);
	},
	onDrag : function(e) {
		var x = Event.pointerX(e);
		var y = Event.pointerY(e);
		var new_x = this.startPos[0] - this.startX + x;
		var new_y = this.startPos[1] - this.startY + y;

		if (this.options.limitArea) {
			if (new_x < this.limit.left) new_x = this.limit.left;
			else if (new_x > this.limit.right - this.obj.offsetWidth) new_x = this.limit.right - this.obj.offsetWidth;

			if (new_y < this.limit.top) new_y = this.limit.top;
			else if (new_y > this.limit.bottom - this.obj.offsetHeight) new_y = this.limit.bottom - this.obj.offsetHeight;
		}
		this.obj.style.top = new_y+'px';
		this.obj.style.left = new_x+'px';
		Event.stop(e);
	},
	onDragEnd : function(e) {
		Event.stopObserving(document, 'mousemove', this.onmousemove);
		Event.stopObserving(document, 'mouseup', this.onmouseup);
		Event.stopObserving(document, 'keypress', this.onmouseup);
		this.obj.style.zIndex = this.orgZ;
		if (this.orgPosition != 'absolute')
			Position.relativize(this.obj);
	}
}

rain.Effect = Class.create();

rain.Effect.AutoScroll = Class.create();
rain.Effect.AutoScroll.prototype = {
	initialize : function(id) {
		this.obj = $(id);
		this.options = Object.extend({
			enable   : true,
			slowDown : false,
			topTrack : false,
			division : 50,
			limitArea : null
		}, arguments[1] || {});
		var offset = this.getPos(this.obj)[0];

		if (this.obj.style.position == '') {
			this.obj.style.position = 'absolute';
			if (offset != this.getPos(this.obj)[0]) {
				this.obj.style.position = 'relative';
			}
		}

		if (this.obj.style.position == 'absolute') {
			this.obj.style.top = this.obj.offsetTop+'px';
		} else {
			if (offset == this.getPos(this.obj)[0]) this.obj.style.top = '0px';
			else this.obj.style.top = (this.getPos(this.obj)[0] - offset) + 'px';
		}

		this._scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
		this._startTop  = parseInt(this.obj.style.top);
		this._startPosY = this.getPos(this.obj)[0];

		if (this._scrollTop > this._startTop) this._scrollTop = 0;


		this.onscroll = this.onScroll.bindAsEventListener(this);
		Event.observe(window, 'scroll',this.onscroll);
	},
	onScroll : function(e) {
		if (!this.options.enable) return;

		var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
		var diff = scrollTop - this._scrollTop;
		var diffChange = false;

		this._targetTop = this._startTop + diff;

		if (this.options.limitArea) {
			var objY = this.getPos(this.obj)[0];
			var area = $(this.options.limitArea);
			var posY = this.getPos(area)[0];

			if (this._startPosY + this.obj.offsetHeight + diff > posY + area.offsetHeight) {
				diff = posY + area.offsetHeight - this._startPosY - this.obj.offsetHeight;
				this._targetTop = this._startTop + diff;
				diffChange = true;
			} else if (this._targetTop < posY) {
				this._targetTop = posY;
				diffChange = true;
			}
		}

		if (this.options.topTrack && !diffChange && scrollTop > this._startPosY) {
			this._targetTop -= this._startPosY;
		}

		if (this._timer) {
			clearTimeout(this._timer);
			this._timer = null;
		}

		this._timer = setTimeout(this.animate.bind(this), 1);
	},
	animate : function() {
		var currTop = parseInt(this.obj.style.top);
		var unit = (this._targetTop-currTop)<0?-1:1;
		var step = Math.ceil(this._targetTop - this._startTop / 100);

		if (this.options.slowDown) {
			step = parseInt((this._targetTop - currTop) / this.options.division);
			if (step == 0) step = unit;
		}
		if ((step > 0 && currTop + step > this._targetTop) || (step < 0 && currTop + step < this._targetTop)) {
			step = this._targetTop - currTop;
		}
		if (this._targetTop != currTop) {
			this.obj.style.top = (currTop+step)+'px';
			setTimeout(this.animate.bind(this), 10);
		}
	},
	getPos : function(obj) {
		return Position.cumulativeOffset(obj);
	},
	setEnable : function(enable) {
		this.options.enable = enable;
	}
}

rain.Effect.Toggle = Class.create();
rain.Effect.Toggle.prototype = {
	initialize : function(id, button) {
		this.obj = $(id);
		$(button).onclick = this.toggle.bind(this);
	},
	toggle : function () {
		Element.toggle(this.obj);	
	}
}


rain.Effect.Slider = Class.create();
rain.Effect.Slider.prototype = {
	initialize : function(id) {
		this.options = Object.extend({
			minValue   : 0,
			maxValue   : 100,
			defValue   : 0, // default value
			step       : 1,
			bind_id : null,
			maxPos     : 100, // position related to parent (px)
			initPos    : {x:1, y:-2}, // initial position (minimun value)
			vertical   : false,
			onChange   : function(v){}
		}, arguments[1]);

		var o = this.options;
		var e = this._element = $(id);
		
		// event binding
		this.onmousedown = this.onDown.bindAsEventListener(this);
		this.onmousemove = this.onMove.bindAsEventListener(this);
		this.onmouseup   = this.onUp.bindAsEventListener(this);
		this.onclick     = this.onClick.bindAsEventListener(this);
		Element.setStyle(e, {
			position   : 'relative',
			width : '109px',
			height : '15px',
//			fontSize : '15px',
			backgroundColor : '#000000',
			border : '1px solid #FFFFFF'
		});
		Event.observe(this._element, 'click', this.onclick);

		var u = this._unit_element = e.appendChild(document.createElement('span'));
		u.ondragstart = u.ondrag = function(){ return false }
		u.onmousedown = this.onmousedown;
		Element.setStyle(u, {
			width : '6px',
			height : '17px',
			position : 'absolute',
			cursor : 'pointer',
			border : '1px solid #FFFFFF',
			top  : o.initPos.y+'px',
			left : o.initPos.x+'px'
		});

		this.setValue(parseInt(o.defValue));
	},
	setValue : function(v) {
		var o = this.options; v = Math.min(Math.max(v,o.minValue),o.maxValue);
		var p = this._val2pos(v);
		if (this.options.vertical) {
			this._unit_element.style.top = p+'px';
		} else {
			this._unit_element.style.left = p+'px';
		}
		this.options.onChange(v, o.bind_id);
	},
	onDown : function(e) {
		var u = this._unit_element;
		if (Event.isLeftClick(e)) {
			this._moving = true;
			this._startPos = [parseInt(u.style.left), parseInt(u.style.top)];
			this._startXY  = [Event.pointerX(e), Event.pointerY(e)];
			Event.observe(document, 'mouseup', this.onmouseup);
			Event.observe(document, 'mousemove', this.onmousemove);
			Event.observe(document, 'keypress', this.onmousemove);
			Event.stop(e);
		}
	},
	onMove : function(e) {
		var newX, newY;
		var o = this.options;
		var u = this._unit_element;
		if (!this._moving || !Event.isLeftClick(e)) return;
		newX = this._startPos[0] + e.clientX - this._startXY[0];
		newY = this._startPos[1] + e.clientY - this._startXY[1];

		if (o.vertical) {
			newY = Math.max(Math.min(newY,o.maxPos),o.initPos.y);
			u.style.top = newY + 'px';
		} else {
			newX = Math.max(Math.min(newX,o.maxPos),o.initPos.x);
			u.style.left = newX + 'px';
		}
	},
	onUp   : function() {
		this._moving = false;
		Event.stopObserving(document, 'mouseup', this.onmousemove);
		Event.stopObserving(document, 'mousemove', this.onmousemove);
		Event.stopObserving(document, 'keypress', this.onmousemove);
	},
	onClick : function(e) {
		var pos = Position.cumulativeOffset(this._element);
		this.setValue(this._pos2val(Event.pointerX(e)-pos[0]-parseInt(this._unit_element.style.width)/2));
	},
	_pos2val : function(p) {
//		alert(p);
		var o = this.options,s=o.step;
		var m = o.vertical?o.initPos.y:o.initPos.x;
		var v = (p-m)*(o.maxValue-o.minValue)/(o.maxPos-m);
		var q = Math.floor(v/s), r=v-q*s, v=q*s;

		return Math.round((v+o.minValue+((s/2)>r?0:s))*100)/100;
	},
	_val2pos : function(v) {
		var o = this.options,s=o.step;
		var m = o.vertical?o.initPos.y:o.initPos.x;
		var p = (v-o.minValue)*(o.maxPos-m)/(o.maxValue-o.minValue);
		var q = Math.floor(p/s), r=p-q*s, p=q*s;

		return Math.round((p+m+((s/2)>r?0:s))*100)/100;
	}
}


/*
* ==================================================================================
* rain.nodeUtil
* node 통제
* ==================================================================================
*/
rain.nodeUtil = {
	isIE : window.ActiveXObject ? true : false,
	isFirefox : navigator.userAgent.toLowerCase().indexOf("firefox")!=-1,
	getFirstChildNode : function(root, node, err_node) {
		var tmp_node = rain.nodeUtil.getChildrenByTagName(root, node);
		return (tmp_node !=null && tmp_node.firstChild) ? tmp_node.firstChild.nodeValue : err_node;
	},
	getInput : function(options,instyle) {
		var obj = Object.extend(document.createElement('input'), Object.extend({type:'text'},options));
		var outstyle = rain.extend({
			border : '1px dotted #454545',
			backgroundColor : '#464646',
			color : '#FFFFFF'
		}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getImage : function(options, instyle) {
		var obj = Object.extend(document.createElement('img'), Object.extend({vspace : 0,hspace:0,border:0},options));
		var outstyle = rain.extend({
			margin : '3px',
			border : '0px'
		}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getText : function(options, instyle) {
		var obj = Object.extend(document.createElement('span'), options);
		var outstyle = rain.extend({}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getTextArea : function(options, instyle) {
		var obj = Object.extend(document.createElement('textarea'), options);
		var outstyle = rain.extend({}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getCheck : function(options, instyle) {
		var obj = Object.extend(document.createElement('input'), Object.extend({unselectable : 'on',type:'checkbox',align:'absmiddle'}, options));
		var outstyle = rain.extend({}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getIndex : function(text, value_obj, width, style_class) {
		var obj = Object.extend(document.createElement('table'), {width : '100%', height:'20px',border : '0', cellPadding :'2', cellSpacing :'0'});
		var tr_obj = obj.insertRow(-1);
		Element.setStyle(tr_obj, {padding:'0px',margin:'0px'});
		var td_obj = Object.extend(tr_obj.insertCell(-1), {width : width + 'px', align:'right',innerHTML : text});
		Element.setStyle(td_obj, {color :style_class.options.font});
		var td_obj = Object.extend(tr_obj.insertCell(-1), {align:'left'});
		if (value_obj != null) td_obj.appendChild(value_obj);
		return obj;
	},
	getComment : function(text, value_obj, style_class) {
		var obj = Object.extend(document.createElement('table'), {height:'20px',border : '0', cellPadding :'0', cellSpacing :'0'});
		var tr_obj = obj.insertRow(-1);
		Element.setStyle(tr_obj, {padding:'0px',margin:'0px'});
		var td_obj = Object.extend(tr_obj.insertCell(-1), {align:'right'});
		if (value_obj != null) td_obj.appendChild(value_obj);
		var td_obj = Object.extend(tr_obj.insertCell(-1), {align:'left'});
		if (typeof text == 'object') 
			td_obj.appendChild(text);
		else
			td_obj.appendChild(document.createTextNode(text));
		
		Element.setStyle(td_obj, {color :style_class.options.font});
		return obj;
	},
	getDiv : function(options, instyle) {
		var obj = Object.extend(document.createElement('div'),Object.extend({unselectable : 'on'},options));
		var outstyle = rain.extend({
			border : '0px',
			padding : '0px',
			margin:'0px',
			textAlign: 'center',
			fontSize : '12px'
		}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getFrames : function(options, url, w, h, iscroll) {
		var obj = Object.extend(document.createElement('iframe'), {src:url,frameBorder:'0',frameSpacing:'0px',padding:'05px'}, options);
		var outstyle = rain.extend({
			width : w,
			height: h,
			scrolling : iscroll
		});
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getSpan : function(options, instyle) {
		var obj = Object.extend(document.createElement('button'),Object.extend({unselectable:'on'},options));
		var outstyle = rain.extend({
			border : '1px',
			padding : '0px',
			margin:'0px',
			verticalAlign : 'middle',
			fontSize : '12px'
		}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	getButton : function(options,instyle) {
		var obj = Object.extend(document.createElement('button'), Object.extend({unselectable : 'on'},options));
		obj.setAttribute('type', 'button',0);
		var outstyle = rain.extend({
			backgroundColor : '#464646',
			color : '#FFFFFF',
			fontSize : '8pt',
			height : '15px',
			padding : '0px 0px 0px 0px',
			border : '0px solid #FFFFFF'
		}, instyle);
		Element.setStyle(obj, outstyle);
		return obj;
	},
	move2Center : function(element, tg_element) {
		var pop_pos = Element.getDimensions(element);
		if (tg_element == null) {
			Position.prepare();
			var scroll_x = Position.deltaX;
			var scroll_y = Position.deltaY;
			var ch = document.body.clientHeight;
			var cw = document.body.clientWidth;
			var parent_pos = Position.cumulativeOffset(Position.offsetParent(element));
		} else {
			var scroll_x = 0,scroll_y = 0;
			var parent_pos = [0,0];
			var cw = tg_element.offsetWidth;
			var ch = tg_element.offsetHeight;
		}		
		var win_top = ((scroll_y + (ch -pop_pos.height)/2) - parent_pos[1]);
		var win_left = (scroll_x + (cw -pop_pos.width)/2 - parent_pos[0]);
		if (win_top <= 0) win_top = 0;
		if (win_left <= 0) win_left = (scroll_x + (cw -pop_pos.width) - parent_pos[0]);
		
		Element.setStyle(element, {top :  win_top+ 'px', left:  win_left + 'px'});
	},
	changeOpacity : function(element, bl_opa) {
		var opa;
		if (bl_opa) {
			var orginal_opa = 100;
			if (rain.nodeUtil.isIE == true) {
				var m = null;
				if (m = element.style.filter.match(/opacity = ([0-9]+)/i)) 
					orginal_opa = parseInt(m[1]);
			} else if(rain.nodeUtil.isFirefox == true && element.style.opacity !='') 
					orginal_opa = parseInt(element.style.opacity) *100;
			element.orginal_opa = orginal_opa;
			opa = 70;
		} else
			opa = parseInt(element.orginal_opa);
		if (rain.nodeUtil.isIE == true) element.style.filter = "alpha(opacity = "+opa+")";
		else if(rain.nodeUtil.isFirefox == true) element.style.opacity = (opa/100);  
		else {};
	},
	getForm : function(objname) {
		var obj = $(objname);
		var forms = document.getElementsByTagName('form');
		var result = null;
		for(var i = 0; i < forms.length; i++) {
			var form = forms[i];
			var elements = Form.getElements(form);
			for(var j = 0; j < elements.length; j++) 
				if (elements[j] == obj) {result = form;break;}
			if (result) break;
		}
		return result;
	},
	getChildrensByTagName : function (node, tagName) {
		var ln = node.childNodes.length;
		var arr = [];	
		for (var z=0; z<ln; z++) {
			if (node.childNodes[z].nodeName==tagName) arr.push(node.childNodes[z]);
		}
		return arr;
	},
	getChildrenByTagName : function (node, tagName) {
		var arr = rain.nodeUtil.getChildrensByTagName(node, tagName);
		return (arr.length > 0)?arr[0]:null;
	},
	getChildrensById : function (element, idName) {
		var arr = [];	
		for(var i = 0 ; i < element.childNodes.length; i++) {
			if (element.childNodes[i].id == idName) arr.push(element.childNodes[i]);
			if (element.childNodes[i].childNodes.length > 0) {
				var child_node = rain.nodeUtil.getChildrensById(element.childNodes[i],idName);
				for (var j =0; j < child_node.length; j++) arr.push(child_node[j]);
			}
		}
		return arr;
	},
	getChildrenById : function (node, idName) {
		var arr = rain.nodeUtil.getChildrensById(node, idName);
		return (arr.length > 0)?arr[0]:null;
	},
	getHash : function(str) {
		var newstr=str.replace(/=/gi, "%3D");
		newstr=newstr.replace(/\&/gi, "%26");
		newstr=newstr.replace(/\?/gi, "%3F");
		return newstr;
	},
	html2Text : function(html) {
		html = html.replace(/\r|\n/gi, '');
		html = html.replace(/<br>/gi, '\r\n');
		html = html.replace(/<p>/gi, '\r\n');
		html = html.replace(/&nbsp;/gi, ' ');
		return html.stripTags();
	},
	text2Html : function(txt) {
//		txt = txt.replace(/</gi, '&lt;');
//		txt = txt.replace(/>/gi, '&gt;');
		txt = txt.replace(/\r/g, '');
		txt = txt.replace(/\n/g, '<br>');
		return txt;
	},
	getSize2Short : function(in_size) {
		in_size = parseInt(in_size);
		if (in_size > 1024*1024*1024) return parseInt(in_size/ (1024*1024*1024)) + " Gb";
		else if (in_size >= 1024*1024) return parseInt(in_size/ (1024*1024)) + " Mb";
		else if (in_size >= 1024) return parseInt(in_size/ 1024) + " Kb";
		else return in_size + " b";
	},
	getHanCut : function (txt, len) {
		var slen = txt.length, count = 0;
		for(var k = 0; k < slen ; k++){
			var temp = txt.charAt(k);
			if(escape(temp).length > 4) count += 2;
			else count++;
			if (len < count) break;
		}
		return (slen == k)?txt:txt.substring(0, k-1)+'..';
	}
}

var rainPopup = {
	check : function() {
		if (this.popup_class == null) {
			this.popup_class = new rain.Popup();
			this.style_class = this.popup_class.style_class;
		}
	},
	showUser : function(user_id, obj, user_nm) {
		this.check();
		if (this.last_userid == user_id) {
			this.popup_class.closeChild();
			this.last_userid = '';
		} else {		
			this.last_userid = user_id;
			var blogUser = new rain.blogUser(user_id, user_nm, this.style_class);
			this.add(blogUser, {is_scrollable:false, toolbar:false, sticker:{obj:obj,pos:'TR'}});
		}
	},
	alert : function(msg) {
		this.add(new rain.Popup.alert(msg,this.style_class), {is_scrollable:true});
	},
	confirm : function(msg, call_back) {
		this.add(new rain.Popup.confirm(msg, call_back, this.style_class), {is_scrollable:true});
	},
	prompt : function(msg, call_back, options) {
		this.add(new rain.Popup.prompt(msg, call_back,options, this.style_class), {is_scrollable:true});
	},
	close : function() {
		if (this.popup_class != null)
			this.popup_class.closeChild();
	},
	add : function(obj, options) {
		this.check();
		this.popup_class.add(obj, options);
	},
	getColor : function (init_color, call_back) {
		this.check();
		var popup_class = this.popup_class;
		function getColor(color) {
			popup_class.closeChild();
			call_back(color);
		}
		this.add(new rain.Popup.ColorPicker(getColor, this.style_class, init_color), {is_scrollable:true});
	}
}

function RainaddEvent(el, evname, func) {
	if (document.all) {
		try {
			el.attachEvent("on" + evname, func);
		} catch (ex) {}
	} else {
		el.addEventListener(evname, func, true);
	}
}

var init_maxwidth = 580;
var init_maxwidth_list = 125;

function checkRainImg(max_width) {
	if (max_width != undefined)
		init_maxwidth = max_width;
	var imgobjs = getElementsByVid('rainimg_resize');
	var len = imgobjs.length;
	for(var i = 0 ; i < len; i++) loadRainImg(imgobjs[i]);
}

function loadRainImg(imgobj) {
	imgobj.src = imgobj;
	try {
		if (imgobj.width > init_maxwidth) {
			imgobj.height = Number(imgobj.height * init_maxwidth / imgobj.width);
			imgobj.width = 	init_maxwidth;
			imgobj.style.width=init_maxwidth;
			imgobj.style.height=Number(imgobj.height * init_maxwidth / imgobj.width);
		}
	} catch(ex) {}
}
function loadRainImgList(imgobj) {
	try {
		if (imgobj.width > init_maxwidth_list) {
			imgobj.height = Number(imgobj.height * init_maxwidth_list / imgobj.width);
			imgobj.width = 	init_maxwidth_list;
			imgobj.style.width=init_maxwidth_list;
			imgobj.style.height=Number(imgobj.height * init_maxwidth_list / imgobj.width);
		}
	} catch(ex) {}
}
function loadRainImgList2(imgobj, maxwidth) {
	var maxwidth=(!maxwidth)?10:maxwidth;
	try {
		if (imgobj.width > maxwidth) {
			imgobj.height = Number(imgobj.height * maxwidth / imgobj.width);
			imgobj.width = 	maxwidth;
			imgobj.style.width=maxwidth;
			imgobj.style.height=Number(imgobj.height * maxwidth / imgobj.width);
			imgobj.src = imgobj;
		}
	} catch(ex) {}
}
function loadRainThumbGameImg(imgobj, maxwidth)
{
	try {
		if (imgobj.width > maxwidth) {
			imgobj.height = Number(imgobj.height * maxwidth / imgobj.width);
			imgobj.width = 	maxwidth;
			imgobj.style.width = maxwidth;
			imgobj.style.height = Number(imgobj.height * maxwidth / imgobj.width);
		}
	} catch(ex) {}
}
function RainImgError(imgobj) {
	try {
		imgobj.src = 'http://image3.cetizen.com/2007_cetizen/cetizen/noimage.gif';
		imgobj.width =125;
		imgobj.height= 93;
		imgobj.style.width = 125;
		imgobj.style.height = 93;
	} catch (ex) 	{}
}
function RainImgError2(imgobj, maxwidth) {
	var maxwidth=(!maxwidth)?100:maxwidth;
	try {
		imgobj.src = 'http://image3.cetizen.com/2007_cetizen/cetizen/d_noimage.gif';
		imgobj.width = maxwidth;
		imgobj.style.width = maxwidth;
	} catch (ex) 	{}
}

function RainImgError48(imgobj, maxwidth) {
	try {
		imgobj.src = 'http://image3.cetizen.com/2007_cetizen/cetizen/noimg'+ maxwidth +'.gif';
		imgobj.width =maxwidth;
		imgobj.height= maxheight;
		imgobj.style.width = maxwidth;
		imgobj.style.height = maxheight;
	} catch (ex) 	{}
}

function RanimgView(img_obj) {
	if (typeof(img_obj) == 'string') {
		var win_scrollbars = 'yes';
		var img_name = img_obj;
	} else if (img_obj.height > 768) {
		var win_scrollbars = 'yes';
		var img_name = img_obj.src;
	} else if (img_obj.width > 1024) {
		var win_scrollbars = 'yes';
		var img_name = img_obj.src;
	} else {
		var win_scrollbars = 'no';
		var img_name = img_obj.src;
	}
	rainPopup.check();
	var obj = rain.nodeUtil.getDiv({}, rain.extend(rainPopup.popup_class.style_class.getStyle('scroll'),{
		width:((win_scrollbars=='yes')?'100px':'auto'),
		height:((win_scrollbars=='yes')?'100px':'auto'),
		overflowY:'auto' ,overflowX:'auto',
		padding: '3px'
	}));
	var imgclass = {
		obj:obj, 
		imgobj: null, 
		resize : function() {
			Element.setStyle(this.obj, {width:(((this.imgobj.width > 1024)?1024:this.imgobj.width)+30) + 'px',height:(((this.imgobj.height > 768)?768:this.imgobj.height)+30) + 'px'});
			if (this.popup_class != null) {
				this.popup_class.is_resized = false;
				this.popup_class.reSize();
			}
		}
	};
	var imgobj = obj.appendChild(
		rain.nodeUtil.getImage(
			{
				src:img_name, 
				onload: imgclass.resize.bind(imgclass), 
				onerror: function() {RainImgError(this)},
				onclick:rainPopup.popup_class.closeChild.bind(rainPopup.popup_class)
			}, {cursor:'pointer'}
		)
	);
	imgclass.imgobj = imgobj;
	var popup_obj = rainPopup.popup_class.add(imgclass);
	if (imgobj.width != null && imgobj.width > 0) {
		imgclass.resize();
	}
	popup_obj.reSize();
}

function RanFramesView(url, w, h, scroll) {
	var win_scrollbars = (!scroll)?'yes':'no';
	rainPopup.check();
	var obj = rain.nodeUtil.getDiv({}, rain.extend(rainPopup.popup_class.style_class.getStyle('scroll'),{
		width:((win_scrollbars=='yes')?'100px':'auto'),
		height:((win_scrollbars=='yes')?'100px':'auto'),
		overflowY:'auto' ,overflowX:'auto',
		padding: '3px'
	}));
	var fpclass = {
		obj:obj, 
		fpobj: null, 
		resize : function() {
			Element.setStyle(this.obj, {width:w + 'px',height:h + 'px'});
			if (this.popup_class != null) {
				this.popup_class.is_resized = false;
				this.popup_class.reSize();
			}
		}
	};
	var fpobj = obj.appendChild(
		rain.nodeUtil.getFrames({onload: fpclass.resize.bind(fpclass)}, url, w, h, scroll)
	);
	fpclass.fpobj = fpobj;
	var popup_obj = rainPopup.popup_class.add(fpclass);
	if (fpobj.width != null && fpobj.width > 0) {
		fpclass.resize();
	}
	popup_obj.reSize();
}