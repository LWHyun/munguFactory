<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script type="text/javascript">

$(function(){
	if(${upMsg} == 0) {
		alert("수정에 실패하였습니다.");
	}
});
</script>
</head>
<body>
		
		 <table>
			
            <div class="container-xxl flex-grow-1 container-p-y">
            <sec:authorize access="hasAnyRole('user','admin')" var="roleUser"/>
			<sec:authorize access="hasRole('admin')" var="roleAdmin"/>
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"></span>공장 정보</h4>
                <!-- Basic with Icons -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0"></h5>
                      <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                      <form>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-fullname">공장코드</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                            	${factoryDTO.factory_no}
                            	<input type="hidden" value="${factoryDTO.factory_no }" name="factory_no">
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-company">공장명</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              ${factoryDTO.factory_name }
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-company">주소</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              ${factoryDTO.factory_address1 }
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-company">상세주소</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              ${factoryDTO.factory_address2 }
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 form-label" for="basic-icon-default-phone">전화번호</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              ${factoryDTO.factory_call }
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 form-label" for="basic-icon-default-message">사용여부</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              <c:if test="${factoryDTO.factory_use == 1 }">사용</c:if>
							  <c:if test="${factoryDTO.factory_use == 0 }">미사용</c:if>
                            </div>
                          </div>
                        </div>
                        <div class="row justify-content-end" style="margin-left: 400px">
                          <div class="col-sm-10">
                          	<sec:authorize access="hasRole('admin')">
                            <input type="button" class="btn btn-primary" value="수정" onclick="location.href='${pageContext.request.contextPath }/admin/factoryInfoEdit?factory_no=${factoryDTO.factory_no}'">
                            </sec:authorize>
                            <input type="button" class="btn btn-primary" value="목록" onclick="location.href='${pageContext.request.contextPath }/user/factoryList'">
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
         </table>
            <!-- / Content -->
</body>
</html>