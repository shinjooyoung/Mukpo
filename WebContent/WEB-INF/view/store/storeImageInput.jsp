<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>사진업로드</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/css/store/fileinput.css" media="all" rel="stylesheet"
	type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="/css/store/theme.css" media="all" rel="stylesheet"
	type="text/css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/store/sortable.js" type="text/javascript"></script>
<script src="/js/store/fileinput.js" type="text/javascript"></script>
<script src="/js/store/kr.js" type="text/javascript"></script>
<script src="/js/store/theme.js" type="text/javascript"></script>
<script src="/js/store/theme2.js" type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	type="text/javascript"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="container kv-main">
		<form action="storeImageInputOk.do" enctype="multipart/form-data">
		
			<div class="form-group">
				<div class="file-loading">
					<input id="file-5" class="file" type="file" multiple
						data-preview-file-type="any" data-upload-url="#">
				</div>
			</div>
			<input type="hidden" name="rCid" value="${rCid}">
			<div class="form-group">
				<button class="btn btn-primary">등록</button>
				<button class="btn btn-default" type="reset">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>