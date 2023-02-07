/*=============================================================================================================================
작성자 : 장가영
작성일 : 2021-09-15

	1. list folder의 page / script 모음
	2. 좋아요 눌러서 DB에 추가하기 구현				2021.09.30 ( 노동혁 )
	3. 음악 플레이리스트에 추가 구현				2021.10.02 (김무겸) 
	
=============================================================================================================================*/

/*
 * playlist.jsp, likelist.jsp, playerlist.jsp 페이지에 적용
===================================================================================================================
 */

//========================================플러스아이콘 세부메뉴 이벤트=================================================
$(function(){
	$(".p-add .add-list").hide();
    $(".p-add").click(function(){
    	$("ul", this).show();
    });
    $(".p-add ul").mouseleave(function(){
   		$("ul", this).hide();
   	});
    $(".p-add").mouseleave(function(){
   		$("ul", this).hide();
   	});
});
/*
$(function(){
	$(".p-add .add-list").hide();
    $(".p-add").click(function(){
    	$(".add-list", this).slideDown('fast');
    });
    $(".p-add ul").mouseleave(function(){
    	$(this).slideUp('fast');
    });
    $(".p-add li").mouseleave(function(){
    	$(".add-list").slideUp('fast');
    });
    
});
*/


/*
 * playlist.jsp 페이지에 적용
===================================== 하트아이콘 변경 이벤트 시작============================================
 */


//하트 아이콘 효과-곡 (색상 채워주기)


function likelist(num)
{
	//alert($("#likemno"+num).val());
	 $.ajax({
			url: "../list/likelistok.jsp",
			type: "post",
			dataType: "html",
			data: "mno="+$("#likemno"+num).val() + "&uno="+$("#likeuno"+num).val(),
			success: function(data)
			{	
				data = data.trim();
				if(data == "ADD")
				{
					 $("#like"+num).removeClass('far fa-heart fa-lg');
			    	 $("#like"+num).addClass('fas fa-heart fa-lg');
			    	 const Toast = Swal.mixin({
						  width: 280,
						  toast: true,
						  position: 'bottom',
						  showConfirmButton: false,
						  timer: 1000,
						  timerProgressBar: false
						});

						Toast.fire({
						  icon: 'success',
						  title: '좋아요 리스트 추가'
						});
						//document.location = "../list/likelist.jsp?uno="+$("#likeuno").val();
						return;
				}else
				{
					$("#like"+num).removeClass('fas fa-heart fa-lg');
			    	$("#like"+num).addClass('far fa-heart fa-lg');
			    	const Toast = Swal.mixin({
						  width: 280,
						  toast: true,
						  position: 'bottom',
						  showConfirmButton: false,
						  timer: 1000,
						  timerProgressBar: false
						});

						Toast.fire({
						  icon: 'success',
						  title: '좋아요 리스트 해제'
						});
						//document.location = "../list/likelist.jsp?uno="+$("#likeuno").val();
						return;
				}
				
			},
			error: function (request, status, error)
			{
				alert("error!!");
			}
		});
}



// 하트 아이콘 효과 -페이지(색상 채워주기)
//$(function(){
//	 $(".p-subcon2 .far").click(function()
//	 {
//		 
//	     if($(this).hasClass('far fa-heart'))
//	     {
//	    	 $(this).removeClass('far fa-heart fa-2x');
//	    	 $(this).addClass('fas fa-heart fa-2x');
//	     }else
//	     {
//	    	 $(this).removeClass('fas fa-heart fa-2x');
//	    	 $(this).addClass('far fa-heart fa-2x');
//	     }
//	 });
//});
// 하트 아이콘 효과-곡 (테두리색 변경)	
/*

$(function(){
		$(".fa-lg1").click(function()
		{
			  if($(this).hasClass('active')){
	               $(this).removeClass('active');
	          }else{
	               $(this).addClass('active');
	          }
       });
});
*/
function AddPlaylistMusic(i,j)
{
	$.ajax({
			url: "../list/mtplaylist.jsp",
			type: "post",
			dataType: "html",
			data: "mno="+$("#likemno"+i).val() + "&uno="+$("#likeuno"+i).val() + "&pno="+$("#podpno"+j).val(),
			success: function(data)
			{	
				data = data.trim();		
				const Toast = Swal.mixin({
					  width: 280,
					  toast: true,
					  position: 'bottom',
					  showConfirmButton: false,
					  timer: 1000,
					  timerProgressBar: false
					});

					Toast.fire({
					  icon: 'success',
					  title: '플레이리스트 추가'
					});
			},
			error: function (request, status, error)
			{
				alert("error!!");
			}
		});
}