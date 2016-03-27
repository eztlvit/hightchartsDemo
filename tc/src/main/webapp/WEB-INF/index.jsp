<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript"
	src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script type="text/javascript"
	src="http://cdn.hcharts.cn/highstock/highstock.js"></script>
<script type="text/javascript"
	src="http://cdn.hcharts.cn/highmaps/highmaps.js"></script>
<script src="http://cdn.hcharts.cn/highcharts/modules/exporting.js"
	type="text/javascript"></script>
<script type="text/javascript">
	function initReport() {
		var user = {
			name : "e1",
			phone : "11张机票购买未满",
			address : "t1"
		};
		$.ajax({
			type : "post",
			dataType : "json",
			data : user,
			url : "/tc/initReprot",
			success : function(data) {
				initChart(data);
			}
		});
	};

	function initChart(data) {
		$('#container').highcharts({
			char : {
				type : 'column'
			},
			title : {
				text : 'My first Highcharts chart'
			},
			xAxis : {
				categories : [ 'my', 'first', 'chart' ]
			},
			yAxis : {
				title : {
					text : 'something'
				}
			},
			series : data
		});
	};

	$(function() {
		initReport();
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="container" style="min-width: 700px; height: 400px"></div>
	${msg}
	<form action="/tc/submit/{id}" method="post"
		enctype="application/x-www-form-urlencoded">
		<input type="hidden" value="111555555555555555555" name="id"/>
		<input name="name" value="张" type="text" /> <input name="phone"
			value="三" type="text" /> <input name="address" value="三" type="text" />
		<input type="submit" name="submit" value="submit" />
	</form>
</body>
</html>