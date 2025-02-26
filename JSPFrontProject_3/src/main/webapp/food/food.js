let food_list=[]
let startPage=0
let endPage=0
let curpage=1
let totalpage=0
window.onload=()=>{
	let input=document.querySelector("#fd")
	input.value='마포'
	dataRecv("마포",curpage)
}
function dataRecv(fd,page){
	    let html='';
		// axios.get() axios.post()
		axios.get('http://localhost/JSPFrontProject_3/food/find_js.do',{
			params:{
				page:page,
				fd:fd
			}
		})
		.then((response)=>{
			console.log(response.data)
			food_list=response.data
			curpage=response.data[0].curpage
			totalpage=response.data[0].totalpage
			startPage=response.data[0].startPage
			endPage=response.data[0].endPage
			
			console.log("curpage="+curpage)
			console.log("totalpage="+totalpage)
			console.log("startPage="+startPage)
			console.log("endPage="+endPage)
			
			food_list.map(function(vo){
				html+='<div class="col-sm-4">'
				     +'<div class="thumbnail">'
				     +'<img src="'+vo.poster+'" style="width:100%" onclick="detail('+vo.fno+')">'
				     +'<p>'+vo.name+'</p>'
				     +'</div>'
				     +'</div>'
			}) 
			let main=document.querySelector("#poster");
			// CSS selector 
			main.innerHTML=html //Ajax의 기본 => Vue/React
			
			let pages=document.querySelector("#pages")
			let pp='<ul class="pagination">'
			if(startPage>1)
				pp+='<li><a href="#">&lt;</a></li>'
			
			for(let i=startPage;i<=endPage;i++)
			{
			    let style=''
				if(i==curpage)
					style='class=active'
				pp+='<li '+style+'><a href="#">'+i+'</a></li>'		
			}
			
			if(endPage<totalpage)
				pp+='<li><a href="#">&gt;</a></li>'
			pp+='</ul>'
			
			pages.innerHTML=pp
		});
}
