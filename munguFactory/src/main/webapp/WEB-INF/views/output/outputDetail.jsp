<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	.col-sm-10 {
	    flex: 0 0 auto;
	    width: 50%;
	}
	
	.form-label, .col-form-label {
	    font-size: 0.75rem;
	    text-transform: uppercase;
	    letter-spacing: inherit;
	    width: 80px;
	}
</style>
</head>
<body>
	<h1 style="translate: 70px 100px;">생산실적 상세정보</h1>
	<!-- Basic Layout -->
    <div class="col-xl" style="width:500px; justify-content: center;">
      <!-- 수정삭제 버튼 -->
      <div class="row justify-content-end" style="translate: 520px 133px;">
        <div class="col-sm-10" style="translate: -8px 2px;">
          <input type="button" value="수정" class="btn btn-primary" style="height: 30px; padding:4px;" onclick="location.href='updateOutputForm?prod_no=${output.prod_no}'">
          <input type="button" value="삭제" class="btn btn-primary" style="height: 30px; padding:4px;" onclick="location.href='deleteOutput?prod_no=${output.prod_no}'">
        </div>
      </div>
      
      <!-- 항목 -->
      <div class="card mb-2" style="translate: 460px 150px; width:400px;">
        <div class="card-body">
          <form id="output" name="frm" action="registerOutput" method="post">
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-name" style="font-weight:bolder;">생산번호</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.prod_no}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-phone" style="font-weight:bolder;">공장코드</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.factory_no}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-company" style="font-weight:bolder;">품번</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.item_no}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-company" style="font-weight:bolder;">품명</label>
              <label class="col-sm-10 col-form-label" for="basic-default-name" style="width: 250px;">${output.item_name}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-email" style="font-weight:bolder;">사원번호</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.emp_no}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-message" style="font-weight:bolder;">작업일시</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name" style="width: 250px;"><fmt:formatDate value="${output.finish_date}" pattern="yyyy-MM-dd HH:mm:ss"/></label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-message" style="font-weight:bolder;">생산수량</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.prod_amount}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label" for="basic-default-message" style="font-weight:bolder;">불량수량</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.poor_quantity}</label>
            </div>
            <div class="row mb-3" style="translate: 20px;">
              <label class="col-sm-2 col-form-label text-right font-weight-bold num_only" for="basic-default-message" style="font-weight:bolder;">수율</label>
              <label class="col-sm-2 col-form-label" for="basic-default-name">${output.yield}%</label>
            </div>
            
            <!-- 목록 -->
            <input type="button" value="목록" class="btn btn-primary" style="translate: 130px; " onclick="location.href='outputList'">
          </form>
        </div>
      </div>
    </div>
</body>
<script type="text/javascript">

	// 수율 계산
	$(function() {
			$('input.num_only').on('keyup', function() {
				
				var prod_amount   = parseInt($("#fn_prod_amount").val() || 0);
				var poor_quantity = parseInt($("#fn_poor_quantity").val() || 0);
				
				var yield = (poor_quantity / prod_amount) * 100;
				
				$("#fn_yield").val(yield+'%');
			});
		});

</script>
</html>