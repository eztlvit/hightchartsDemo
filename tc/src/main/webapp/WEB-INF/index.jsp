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
	
	<div id="d1">
		<ul class="u1">
			<li data-id="1"><input type="checkbox" id="1" onclick=""/>1</li>
			<li data-id="2"><input type="checkbox" id="2" onclick=""/>2</li>
			<li data-id="3"><input type="checkbox" id="3" onclick=""/>3</li>
			<li data-id="4"><input type="checkbox" id="4" onclick=""/>4</li>
		</ul>
	</div>
	<input type="button" onclick="change()" value="改变"/>
	<input type="button" onclick="recover()" value="恢复"/>
	<h1>选中</h1>
	<div id="d2">
		<ul class="u2">
			
		</ul>
	</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function change(){
		var li = $(".u1 li input[type='checkbox']");
		li.each(function (i){
			if($(this).is(":checked")){
				$(this).prop("checked",false);
				//$(this).attr("type","hidden");
				var tl = $(this).parent();
				$(".u2").append(tl);
			}
		});
	};
	
	function recover(){
		/* var li = $(".u2 li");
		for ( var j = 0; j < li.length; j++) {
			$(li[j]).children().attr("type","checkbox");
			$(".u1").append(li[j]);
		}
		$(".u2 li").remove(); */
		
		var li = $(".u2 li input[type='checkbox']");
		li.each(function (i){
			if($(this).is(":checked")){
				$(this).prop("checked",false);
				$(".u1").append($(this).parent());
			}
		});
	}
</script>
</html>