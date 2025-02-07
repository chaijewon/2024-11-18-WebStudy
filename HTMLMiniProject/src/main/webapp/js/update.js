let bCheck=true
$(function(){
	$('.ups').hide()
	// let a=document.getElementClassName("ups")
	// a.style.display=none
	$('.update').click(function(){
		let rno=$(this).attr('data-rno')
		$('.ups').hide();
		$(this).text("수정");
		if(bCheck==true)
		{
			$('#m'+rno).show();
			$(this).text("취소");
			bCheck=false;
		}
		else
		{
			$('#m'+rno).hide();
			$(this).text("수정");
			bCheck=true;
		}
	})
})