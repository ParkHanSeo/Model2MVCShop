<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%
	Product product = (Product)request.getAttribute("product");
%>
 --%>
<!DOCTYPE html>
<html lane="ko">
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<meta charset="EUC-KR">
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->   
   
	<script type="text/javascript">
	/*function fncAddProduct(){		
		document.detailForm.action='/updateProduct.do';
		document.detailForm.submit();
	}*/
	
	function fncUpdateProduct(){
		
		//Form 유효성 검증
	 	//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		var prodName=$("input[name='prodName']").val();
		var prodDetail=$("input[name='prodDetail']").val();
		var manuDate=$("input[name='manuDate']").val();
		var price=$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert(prodName);
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(prodDetail == null || prodDetail.length<1){
			alert(prodDetail);
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
			
		//document.detailForm.action='/product/updateProduct';
		//document.detailForm.submit();
		$('form').attr("method", "POST").attr("action", "/product/updateProduct").submit();
	}
	
	
	
	$(function(){
		
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncUpdateProduct();
		});
		
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});
		
	});
	
	//<form name="updateProduct" method="post" action="/product/updateProduct">
</script>
</head>



<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품정보수정</h3>
	       <h5 class="text-muted">상품정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>		
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post" name="updateProduct" enctype="multipart/form-data">
		
		<input type="hidden" name="prodNo" value="${product.prodNo}"/>
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상 품 명</label>
		    <div class="col-sm-4">
		      <input type="prodName" class="form-control" id="prodName" name="prodName" value="${product.prodName}" placeholder="변경상품명">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="prodDetail" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}" placeholder="변경상세정보">
		    </div>
		  </div>
		  
 		  <div class="form-group">
 		   <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
			      <img src="../images/ct_icon_date.gif" width="15" height="15" 
					onclick="show_calendar('document.updateProduct.manuDate', document.updateProduct.manuDate.value)"/>
    		<div class="col-sm-4">
      		<input type="manuDate" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자">
    		</div>
  		  </div>	
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가  격</label>
		    <div class="col-sm-4">
		      <input type="price" class="form-control" id="price" name="price" value="${product.price}" placeholder="변경되는가격입력">
		    </div>
		  </div>	
		  
  			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="file" class="form-control" id="fileUpload" name="fileUpload">
				</div>
			</div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		  
		</form>		  		  	  	  		  		
		
	</div>



</body>
</html>