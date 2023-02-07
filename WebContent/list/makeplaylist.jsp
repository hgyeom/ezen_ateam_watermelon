<%@ page contentType="text/html;charset=utf-8" %>	
<%@ include file="../include/head.jsp" %>

<script>

window.onload=function()
{
	<%
	if(dto.CountPlaylist(uno) == 5)
	{
	%>
		alert("플레이리스트는 최대 5개만 생성할 수 있습니다.");
		document.location = "../main/main.jsp";
	<%
	}
	%>
}


	
</script>
<!-- ===================================================================== -->
	<div class="sub-wrap" id="sub-wrap2">
	    <div class="nav">
			<div id="nav">  플레이리스트 만들기</div>
		</div>
		<div class="contents">
			<div class="p-container1">
				<div class= "p-subcon1" style="background: linear-gradient(to bottom right, #477D95, #000000);">
					<ul class="m-subcon">
						<li class="m-title"><h1>플레이리스트 만들기</h1>
			       			<div class= "Rename">
			       				<i onclick="javascript:MakePlaylist();" class="fas fa-plus fa-lg" aria-hidden="true"></i>
		      				</div>
	       				</li>
					</ul>
				</div>
			</div>
			<div class="p-container2">
				<div class="m-subcon2">
			 	<ul>
			 		<li></li>
			  	</ul>
				</div>
			</div>	
			<div class="p-container3">
				<div class="p-subcon3">
					<div class="makilisttext">	
		      			<h3>플레이리스트에 추가할 곡을 찾아보세요</h3>
		      		</div>
		      		<div class="m-searchbtn">
		      			<input type="search" id="search" placeholder="아티스트, 곡 입력">
		      			<button class="icon"><a href="#"><i class="fa fa-search fa-2x"></i></a></button>
		      		</div>	
			   	</div>
		   </div>  
		</div>
	</div>
</div>   			   
<%@ include file="../include/tail.jsp" %>