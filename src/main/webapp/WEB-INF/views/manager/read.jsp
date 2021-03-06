<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>

<div class="modal1 modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>${manager.enabled == false ? "등록" :" 삭제" } 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="delCancel btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="delAgree btn btn-primary">${manager.enabled == false ? "등록" :" 삭제" }</button>
      </div>
    </div>
  </div>
</div>

<div class="modal2 modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
      </div>
      <div class="modal-body">
        <p>${manager.enabled == false ? "등록" :" 삭제" } 하였습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="delCommit btn btn-primary" >확인</button>
      </div>
    </div>
  </div>
</div>

<div class="content">

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
				<div class="card">
					<div class="card-header card-header-primary">
						<h4 class="card-title">Edit Profile</h4>
						<p class="card-category">Complete your profile</p>
					</div>
					<div class="card-body">
						<form>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">매장명</label> <input
											type="text" class="form-control" readonly="readonly" value=${manager.sname }>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">ID</label> <input
											type="text" class="form-control" readonly="readonly" name='mid' value=${manager.mid }>
									</div>
								</div>
								
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">Phone</label> <input
											type="text" class="form-control" readonly="readonly" value =${manager.phone }>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">Email address</label> 
										<input type="email" class="form-control" readonly="readonly" value=${manager.email }>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="bmd-label-floating">가입일</label> <input
											type="text" class="form-control" readonly="readonly" value=${manager.regdate }>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										
											<label class="bmd-label-floating">enabled</label> 
											
											<input type="text" class="form-control" readonly="readonly" value =${manager.enabled == false ? "승인되지&nbsp않음" :" 승인됨" }>
										
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="bmd-label-floating">approval</label> <input
											type="text" class="form-control" readonly="readonly" value="승인되지 않은 사용자 입니다.">
									</div>
								</div>
							</div>
							<button type="submit" class="delBtn btn btn-${manager.enabled == false ? 'primary' : 'danger' } btn-round pull-right">${manager.enabled == false ? "등록" : "삭제" }</button>
							<button type="submit" class="modBtn btn btn-primary btn-round pull-right">수정</button>
							
							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card card-profile">
					<div class="card-avatar">
						<a href="javascript:;"> <img class="img"
							src="../resources/assets/img/faces/marc.jpg" />
						</a>
					</div>
					<div class="card-body">
						<h4 class="card-title">${store.sname }</h4>
						<p class="card-description">${store.address }</p>
						<a href="javascript:;" class="btn btn-primary btn-round">Follow</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
/* manList.sendList(${pageDTO.page} , ${pageDTO.perSheet}).then(res => res.json()).then(result => {
	for (let resultElement of result) {
		
		tableList.innerHTML += "<tr><td><img src= '"+resultElement.logoImg+"'></td>" +
		"<td onclick='sendRead("+JSON.stringify(resultElement.mid)+")'>"+resultElement.mid+"</td>" +
		"<td>"+resultElement.email+"</td>" +
		"<td>"+resultElement.phone+"</td>" +
		"<td>"+resultElement.enabled+"</td>" +
		"<td>"+resultElement.approval+"</td>" +
		"<td>"+resultElement.regdate+"</td>" +
		"<td>"+resultElement.updatedate+"</td></tr>"
	}
	
}) */

	const mid = document.querySelector("input[name='mid']").value
// delete

document.querySelector(".delBtn").addEventListener("click" , function(e){

	e.preventDefault()

	$(".modal1").modal("show")

} , false)

document.querySelector(".delAgree").addEventListener("click" , function(e){

	e.preventDefault()
	$(".modal1").modal("hide")
	

	//console.log(mid)
	const sendDelete=(
	function sendDel(){
	
 		return fetch ("/admin/manager/delete" , {
				method : 'post' ,
				headers : {'Content-Type':'application/json'} ,
				body : mid		
 		}).then(res => res.text()).then(result => $(".modal2").modal("show"))
 		
	})();
	
	//location.href = "/admin/manager/read?mid=" + mid
} , false)

// delCommit
document.querySelector(".delCommit").addEventListener("click" , function(e){

	e.preventDefault()
	
	location.href = "/admin/manager/read?mid=" + mid
} , false)

// delCancel
document.querySelector(".delCancel").addEventListener("click" , function(e){

	e.preventDefault()
	
	$(".modal1").modal("hide")
} , false)




</script>

<%@ include file="../includes/footer.jsp"%>