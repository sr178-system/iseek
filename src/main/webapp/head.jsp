<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
		<title>header</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="edge,IE=8"/>
		<!-- 引入 Bootstrap -->
		<link rel="stylesheet" href="/css/bootstrap.min.css">  
		<script src="/js/jquery.min.js"></script>
		<script src="/js/bootstrap.min.js"></script>
		<style type="text/css">
		body{font-family: '微软雅黑'}
		.custom-jumbotron{
			background-color: #65c3df !important;
			padding-top: 0;
			height: 60px;
			padding: 0;
		}
		.custom-navbar-inverse{
		    background-color: #65c3df;
		    border-color: #65c3df;
		    border-radius: 0;
		    border: 0;
		    min-height: 59px;
		    height: 59px;
		    position: absolute;
		    width: 100%;
		    z-index: 9999;
		}
		.custom-navbar-header{
			width: 123px;
			background: url(image/reg-logo.png);
			background-size: cover;
			vertical-align: middle;
			height: 36px;
			box-sizing: border-box;
			margin-top: 13px;
			margin-left: 0 !important;
		}
		
		</style>
   </head>
<body>
	<div class="jumbotron custom-jumbotron">
		<nav class="navbar navbar-inverse custom-navbar-inverse" role="navigation">
			<div class="container-fluid container">
				<div class="navbar-header"><a class="navbar-brand custom-navbar-header" href="javascript:;"></a></div>
			</div>
		</nav>
	</div>
</body>
</html>