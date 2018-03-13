<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>그리드 테스트</title>
<link href="${initParam.rootPath }/resources/css/codemirror.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/dracula.css" rel="stylesheet" type="text/css">
<link href="${initParam.rootPath }/resources/css/simplescrollbars.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${initParam.rootPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/codemirror.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/simplescrollbars.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/javascript.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/css.js"></script>
<script type="text/javascript" src="${initParam.rootPath }/resources/js/clike.js"></script>
<style type="text/css">
body{
 background-color: #eee;
}
</style>
</head>
<body>

	<!-- <div id='codeeditor'></div> -->
	<textarea id="codeMirror-txt"></textarea>
	
<script type="text/javascript">
	$(function(){
		var code = $('#codeMirror-txt')[0];
		var editor = CodeMirror.fromTextArea(code, {
			value: "function test()",
			mode:"css",
			theme:"dracula",
			tabSize: 5,
			lineNumbers: true,
			scrollbarStyle: "overlay",
			/* readOnly: true */
			
		});
	});
/*  	var editor = CodeMirror(document.getElementById("codeeditor"),{
		value: "function test()",
		mode:"css",
		theme:"dracula",
		tabSize: 5,
		lineNumbers: true
	}); */
</script>
</body>
</html>