<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
#massage_box {
	position: absolute;
	left: expression((       body.clientWidth-350)/2 );
	top: expression(body.scrollTop +(       body.clientHeight-this.offsetHeight)/2
		);
	width: 350px;
	height: 130px;
	filter: dropshadow(color =       #666666, offx =       3, offy =         3,
		positive = 
		     2);
	z-index: 2;
	visibility: hidden
}

#mask {
	position: absolute;
	top: 0;
	left: 0;
	width: expression(body.clientWidth);
	height: expression(body.scrollHeight >          body.clientHeight ?     
		   body.scrollHeight :       body.clientHeight);
	background: #666;
	filter: ALPHA(opacity =         60);
	z-index: 1;
	visibility: hidden
}

.massage {
	border: #036 solid;
	border-width: 1 1 3 1;
	width: 95%;
	height: 95%;
	background: #fff;
	color: #036;
	font-size: 12px;
	line-height: 150%
}

.header {
	background: #554295;
	height: 10%;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	padding: 3 5 0 5;
	color: #fff
}

body {
	margin: 0;
	padding: 0;
	font: normal 18px Verdana, Arial, Helvetica, sans-serif;
	line-height: 1.8em;
	min-width: 980px;
}

#cover_div {
	left: 0px;
	top: 0px;
	position: fixed;
	display: none;
	z-index: 10;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.7;
	filter: alpha(opacity =   30);
}

#cover_context_div {
	top: 50%;
	left: 50%;
	position: fixed;
	display: none;
	padding: 20px;
	border: 20px solid #696969;
	z-index: 100;
	-webkit-box-shadow: 0px 0px 20px #000;
	-moz-box-shadow: 0px 0px 20px #000;
	box-shadow: 0px 0px 20px #000;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="canonical" href="http://www.aectrading.nl/-1">
<meta property="og:title"
	content="&#x5728;&#x7EBF;&#x4E0B;&#x5355;&#x20;&#x7C;&#x20;Aectrading.nl" />
<meta property="og:url" content="http://www.aectrading.nl/-1" />
<meta name="description" content="">
<base href="<%=basePath%>">



<title>在线下单 | Aectrading.nl</title>

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans%7COpen+Sans"
	media="screen" rel="stylesheet" type="text/css">
<link
	href="http://a.jwwb.nl/assets/css/frontend.css?bust=e93df29145196fa607a28770ca9be519"
	media="screen" rel="stylesheet" type="text/css">
<link
	href="http://temp-bfbacowbqpbhvmxnwabi.jouwweb.nl/internal_upload/public/y/f/m/temp-bfbacowbqpbhvmxnwabi/stijl.css?bust=1454426197"
	rel="stylesheet" type="text/css">
<link
	href="http://a.jwwb.nl/assets/favicon.ico?bust=3968f56488b72ab841ab4418903fb23b"
	rel="shortcut icon">
<link
	href="http://a.jwwb.nl/assets/favicon.ico?bust=3968f56488b72ab841ab4418903fb23b"
	rel="icon">
<link
	href="http://a.jwwb.nl/assets/favicon-152.png?bust=25471ed26678b45115f73f00c4d1c497"
	rel="apple-touch-icon-precomposed">
<script>
	window.google_analytics_uacct = "UA\x2D8406245\x2D4";
</script>
<script>
	google_analytics_domain_name = "www.aectrading.nl/";
</script>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link type="text/css" rel="stylesheet" href="css/jquery.modaldialog.css" />
<script type="text/javascript" language="JavaScript"
	src="http://code.jquery.com/jquery-latest.js"> </script>
<script type="text/javascript" language="JavaScript"
	src="js/jquery.modaldialog.js"> </script>

<!--  -->
<script type="text/javascript">
	function HS_DateAdd(interval, number, date) {
		number = parseInt(number);
		if (typeof (date) == "string") {
			var date = new Date(date.split("-")[0], date.split("-")[1], date
					.split("-")[2])
		}
		if (typeof (date) == "object") {
			var date = date
		}
		switch (interval) {
		case "y":
			return new Date(date.getFullYear() + number, date.getMonth(), date
					.getDate());
			break;
		case "m":
			return new Date(date.getFullYear(), date.getMonth() + number,
					checkDate(date.getFullYear(), date.getMonth() + number,
							date.getDate()));
			break;
		case "d":
			return new Date(date.getFullYear(), date.getMonth(), date.getDate()
					+ number);
			break;
		case "w":
			return new Date(date.getFullYear(), date.getMonth(), 7 * number
					+ date.getDate());
			break;
		}
	}
	function checkDate(year, month, date) {
		var enddate = [ "31", "28", "31", "30", "31", "30", "31", "31", "30",
				"31", "30", "31" ];
		var returnDate = "";
		if (year % 4 == 0) {
			enddate[1] = "29"
		}
		if (date > enddate[month]) {
			returnDate = enddate[month]
		} else {
			returnDate = date
		}
		return returnDate;
	}

	function WeekDay(date) {
		var theDate;
		if (typeof (date) == "string") {
			theDate = new Date(date.split("-")[0], date.split("-")[1], date
					.split("-")[2]);
		}
		if (typeof (date) == "object") {
			theDate = date
		}
		return theDate.getDay();
	}
	function HS_calender() {
		var lis = "";
		var style = "";
		style += "<style type='text/css'>";
		style += ".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
		style += ".calender ul {list-style-type:none; margin:0; padding:0;}";
		style += ".calender .day { background-color:#EDF5FF; height:20px;}";
		style += ".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
		style += ".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
		style += ".calender li a:hover { color:#f30; text-decoration:underline}";
		style += ".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
		style += ".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
		style += ".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
		style += ".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
		style += ".calender .LastMonth { float:left;}";
		style += ".calender .NextMonth { float:right;}";
		style += ".calenderBody {clear:both}";
		style += ".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
		style += ".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
		style += ".today a { color:#f30; }";
		style += ".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
		style += ".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
		style += ".calenderBottom a.closeCalender{float:right}";
		style += ".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
		style += "</style>";

		var now;
		if (typeof (arguments[0]) == "string") {
			selectDate = arguments[0].split("-");
			var year = selectDate[0];
			var month = parseInt(selectDate[1]) - 1 + "";
			var date = selectDate[2];
			now = new Date(year, month, date);
		} else if (typeof (arguments[0]) == "object") {
			now = arguments[0];
		}
		var lastMonthEndDate = HS_DateAdd("d", "-1",
				now.getFullYear() + "-" + now.getMonth() + "-01").getDate();
		var lastMonthDate = WeekDay(now.getFullYear() + "-" + now.getMonth()
				+ "-01");
		var thisMonthLastDate = HS_DateAdd("d", "-1", now.getFullYear() + "-"
				+ (parseInt(now.getMonth()) + 1).toString() + "-01");
		var thisMonthEndDate = thisMonthLastDate.getDate();
		var thisMonthEndDay = thisMonthLastDate.getDay();
		var todayObj = new Date();
		today = todayObj.getFullYear() + "-" + todayObj.getMonth() + "-"
				+ todayObj.getDate();

		for (i = 0; i < lastMonthDate; i++) { // Last Month's Date
			lis = "<li class='lastMonthDate'>" + lastMonthEndDate + "</li>"
					+ lis;
			lastMonthEndDate--;
		}
		for (i = 1; i <= thisMonthEndDate; i++) { // Current Month's Date

			if (today == now.getFullYear() + "-" + now.getMonth() + "-" + i) {
				var todayString = now.getFullYear() + "-"
						+ (parseInt(now.getMonth()) + 1).toString() + "-" + i;
				lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"
						+ now.getFullYear()
						+ "-"
						+ (parseInt(now.getMonth()) + 1)
						+ "-"
						+ i
						+ "'>"
						+ i
						+ "</a></li>";
			} else {
				lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"
						+ now.getFullYear()
						+ "-"
						+ (parseInt(now.getMonth()) + 1)
						+ "-"
						+ i
						+ "'>"
						+ i
						+ "</a></li>";
			}

		}
		var j = 1;
		for (i = thisMonthEndDay; i < 6; i++) { // Next Month's Date
			lis += "<li class='nextMonthDate'>" + j + "</li>";
			j++;
		}
		lis += style;

		var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"
				+ now.getFullYear()
				+ "-"
				+ now.getMonth()
				+ "-"
				+ now.getDate() + "'),this) title='Next Month'>&raquo;</a>";
		CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"
				+ now.getFullYear()
				+ "-"
				+ now.getMonth()
				+ "-"
				+ now.getDate() + "'),this) title='Previous Month'>&laquo;</a>";
		CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"
				+ now.getFullYear()
				+ "</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"
				+ (parseInt(now.getMonth()) + 1).toString() + "</a></span>月";

		if (arguments.length > 1) {
			arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
			arguments[1].parentNode.innerHTML = CalenderTitle;

		} else {
			var CalenderBox = style
					+ "<div class='calender'><div class='calenderTitle'>"
					+ CalenderTitle
					+ "</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"
					+ lis
					+ "</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>×</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"
					+ todayString + "'>Today</a></span></span></div></div>";
			return CalenderBox;
		}
	}
	function _selectThisDay(d) {
		var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
		boxObj.targetObj.value = d.title;
		boxObj.parentNode.removeChild(boxObj);
	}
	function closeCalender(d) {
		var boxObj = d.parentNode.parentNode.parentNode;
		boxObj.parentNode.removeChild(boxObj);
	}

	function CalenderselectYear(obj) {
		var opt = "";
		var thisYear = obj.innerHTML;
		for (i = 1970; i <= 2020; i++) {
			if (i == thisYear) {
				opt += "<option value="+i+" selected>" + i + "</option>";
			} else {
				opt += "<option value="+i+">" + i + "</option>";
			}
		}
		opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"
				+ opt + "</select>";
		obj.parentNode.innerHTML = opt;
	}

	function selectThisYear(obj) {
		HS_calender(obj.value
				+ "-"
				+ obj.parentNode.parentNode.getElementsByTagName("span")[1]
						.getElementsByTagName("a")[0].innerHTML + "-1",
				obj.parentNode);
	}

	function CalenderselectMonth(obj) {
		var opt = "";
		var thisMonth = obj.innerHTML;
		for (i = 1; i <= 12; i++) {
			if (i == thisMonth) {
				opt += "<option value="+i+" selected>" + i + "</option>";
			} else {
				opt += "<option value="+i+">" + i + "</option>";
			}
		}
		opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"
				+ opt + "</select>";
		obj.parentNode.innerHTML = opt;
	}
	function selectThisMonth(obj) {
		HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0]
				.getElementsByTagName("a")[0].innerHTML
				+ "-" + obj.value + "-1", obj.parentNode);
	}
	function HS_setDate(inputObj) {
		var calenderObj = document.createElement("span");
		calenderObj.innerHTML = HS_calender(new Date());
		calenderObj.style.position = "absolute";
		calenderObj.targetObj = inputObj;
		inputObj.parentNode.insertBefore(calenderObj, inputObj.nextSibling);
	}
</script>
<!--  -->

<script type="text/javascript">
	$(document).ready(function() {
		for ( var i = 1; i <= $('#packageAmount').val(); i++) {
			var package = createPackage(i);
			$('#container').append(package);
		}
	});
	function reducePackage() {
		var value = $('#packageAmount').val();
		$('#packageAmount').val(Number(value) - 1);
		deletePackage(Number(value));
		checkBtns();

	}
	function addPackage() {
		var value = Number($('#packageAmount').val()) + 1;
		$('#packageAmount').val(value);
		var package = createPackage(value);
		$('#container').append(package);
		checkBtns();
	}

	function checkBtns() {
		if ($('#packageAmount').val() <= 1) {
			$('#reduceBtn').prop('disabled', true);
		} else {
			$('#reduceBtn').prop('disabled', false);
		}
		if ($('#packageAmount').val() >= 10) {
			$('#addBtn').prop('disabled', true);
		} else {
			$('#addBtn').prop('disabled', false);
		}
	}
	function createPackage(number) {
		var elem = '<li style="margin-bottom:30px;" id="pkg_number_'+number+'">'
				+ '<hr>' + '<div><label>包裹 '
				+ number
				+ '</label></div>'
				+ '<div class="jw-element-form-group">'
				+ '<label class="jw-element-form-label"'
				+'for="receiver'+number+'">包裹收件人'
				+ '*</label>'
				+ '<div class="jw-element-form-content ">'
				+ '<input type="text" required = "true"'
				+'name="receiver'+number+'"'
				+'id="receiver'+number+'"'
				+'class=" jw-element-form-input-text" value="">'
				+ '</div>'
				+ '</div>'
				+ '<div class="jw-element-form-group">'
				+ '<label class="jw-element-form-label"'
				+'for="receiverPhone'+number+'">包裹电话'
				+ '*</label>'
				+ '<div class="jw-element-form-content ">'
				+ '<input type="text" required = "true"'
				+'name="receiverPhone'+number+'"'
				+'id="receiverPhone'+number+'"'
				+'class=" jw-element-form-input-text" value="">'
				+ '</div>'
				+ '</div>'
				+ '<div class="jw-element-form-group">'
				+ '<label class="jw-element-form-label"'+
'for="receiverAddress'+number+'">包裹地址（不填省市）'
				+ '*</label>'
				+ '<div class="jw-element-form-content ">'
				+ '<input type="text" required = "true"'+
'name="receiverAddress'+number+'"'+
'id="receiverAddress'+number+'"'+
'class=" jw-element-form-input-text" value="">'
				+ '</div>'
				+ '</div>'
				+ '<div class="jw-element-form-group">'
				+ '<label class="jw-element-form-label"'+
'for="receiverPostcode'+number+'">包裹邮编'
				+ '*</label>'
				+ '<div class="jw-element-form-content ">'
				+ '<input type="text" maxLength = 6 srequired = "true"'+'onafterpaste="this.value=this.value.replace(/\D/g,\'\')" onkeyup="this.value=this.value.replace(/\D/g,\'\')"'+
'name="receiverPostcode'+number+'"'+
'id="receiverPostcode'+number+'"'+
'class=" jw-element-form-input-text" value="">'
				+ '</div>'
				+ '</div>'
				+ '<div class="jw-element-form-group">'
				+ '<label class="jw-element-form-label"'+
'for="receiverCity'+number+'">包裹省市'
				+ '*</label>'
				+ '<div class="jw-element-form-content ">'
				+ '<input type="text" required = "true"'+
'name="receiverCity'+number+'"'+
'id="receiverCity'+number+'"'+
'class=" jw-element-form-input-text" value="">'
				+ '</div>'
				+ '										</div>'
				+ '										<div class="jw-element-form-group">'
				+ '											<label class="jw-element-form-label"'+
'												for="packageWeight'+number+'">包裹重量（Kg）'
				+ '												*</label>'
				+ '											<div class="jw-element-form-content ">'
				+ '												<input type="number" required = "true"'+'onafterpaste="this.value=this.value.replace(/\D/g,\'\')" onkeyup="this.value=this.value.replace(/\D/g,\'\')"'+
'													name="packageWeight'+number+'"'+
'													id="packageWeight'+number+'"'+
'													class=" jw-element-form-input-text" value="">'
				+ '											</div>'
				+ '										</div>'
				+ '										<div class="jw-element-form-group">'
				+ '											<label class="jw-element-form-label"'+
'												for="packageValue'+number+'">包裹总价值（单位默认欧元,115欧元为上限)'
				+ '												*</label>'
				+ '											<div class="jw-element-form-content ">'
				+ '												<input type="number" required = "true"'+'onafterpaste="this.value=this.value.replace(/\D/g,\'\')" onkeyup="this.value=this.value.replace(/\D/g,\'\')"'+
'													name="packageValue'+number+'"'+
'													id="packageValue'+number+'"'+
'													class=" jw-element-form-input-text" value="">'
				+ '											</div>'
				+ '										</div>'
				+ '										<div class="jw-element-form-group">'
				+ '											<label class="jw-element-form-label"'+
'												for="packageAttribute'+number+'">包裹属性'
				+ '												*</label>'
				+ '											<div class="jw-element-form-content ">'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label> <input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														id="packageAttribute'+number+'"'+
'														value="babyProducts">baby'
				+ '														products婴儿用品</label>'
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="lifeArticles">life'
				+ '														articles生活用品</label>'
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="cosmetics">cosmetics化妆品</label>'
				+ ''
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="clothes">clothes衣服</label>'
				+ ''
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="shoes">shoes鞋子</label>'
				+ ''
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="snacks">snacks零食</label>'
				+ ''
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="used personal-use goods">used'
				+ '														personal-use goods个人二手物品</label>'
				+ ''
				+ '												</div>'
				+ '												<div class="jw-element-form-checkbox">'
				+ '													<label><input type="checkbox"'+
'														name="packageAttribute'+number+'"'+
'														value="food supplements">'
				+ '														food supplements保健品</label>'
				+ ''
				+ '												</div>'
				+ '											</div>'
				+ '										</div>' +

				'</li>';
		return elem;
	}

	function deletePackage(number) {
		var elem = $('#pkg_number_' + number);
		elem.remove();
	}
</script>

<script> 
//取出传回来的参数error并与yes比较
	var success ='<%=request.getParameter("success")%>';
	if (success == 'yes') {
		alert("提交成功!");
	} else if (success == 'no') {
		alert("提交失败!请重新填写！");
	}
</script>

<script type="text/javascript">
	function checkBox() {
		//
		var packageNumber = Number($('#packageAmount').val());
		for ( var p = 1; p <= packageNumber; p++) {
			var weight = document.getElementById("packageWeight" + p).value;//document.getElementsByName("packageWeight" + p).value;
			var value = document.getElementById("packageValue" + p).value;
			var postcode = document.getElementById("receiverPostcode" + p).value;
			var pattern = /\d{6}/;
			if (!pattern.test(postcode)) {
				alert("包裹" + p + "邮编不是6位数字！");
				return false;
			}
			if (weight <= 0) {
				alert("包裹" + p + "重量不能小于0！");
				return false;
			} else if (value < 0) {
				alert("包裹" + p + "价值不能小于0！");
				return false;
			} else if (value > 115) {
				alert("包裹" + p + "价值上限115欧！");
				return false;
			}
		}
		for ( var p = 1; p <= packageNumber; p++) {
			var ids = document.getElementsByName("packageAttribute" + p);
			var flag = false;
			for ( var i = 0; i < ids.length; i++) {
				if (ids[i].checked) {
					flag = true;
					break;
				}
			}
			if (!flag) {
				alert("包裹" + p + "属性请最少选择一项！");
				return false;
			}
		}
	}

	function displayMessage() {
		if (navigator.userAgent.indexOf("Firefox") == -1) {
			var obj = document.getElementsByTagName('SELECT');
			for ( var i = 0; i < obj.length; i++) {
				if (obj[i].type.indexOf("select") != -1)
					obj[i].style.visibility = 'hidden';
			}
			mask.style.visibility = 'visible';
			massage_box.style.visibility = 'visible';
		}
	}
	function hiddenMessage() {
		mask.style.visibility = 'hidden';
		massage_box.style.visibility = 'hidden';
	}
	var Obj = '';
	document.onmouseup = MUp;
	document.onmousemove = MMove;
	function MDown(Object) {
		Obj = Object.id;
		document.all(Obj).setCapture();
		pX = event.x - document.all(Obj).style.pixelLeft;
		pY = event.y - document.all(Obj).style.pixelTop;
	}

	function MMove() {
		if (Obj != '') {
			document.all(Obj).style.left = event.x - pX;
			document.all(Obj).style.top = event.y - pY;
		}
	}

	function MUp() {
		if (Obj != '') {
			document.all(Obj).releaseCapture();
			Obj = '';
		}
	}

	function displayWait() {
		displayMessage();
	}
	function WaitDia() {
		document.getElementById("myDialog").showModal();
	}

	function cover() {
		//mask.style.visibility = 'visible';
		//massage_box.style.visibility = 'visible';
		document.getElementById('cover_div').style.display = 'block';
		document.getElementById('cover_context_div').style.display = 'block';
		getCenter();
	}
	//去掉遮罩
	function clearCover() {
		document.getElementById('cover_div').style.display = 'none';
		document.getElementById('cover_context_div').style.display = 'none';
	}

	//定位到浏览器中央
	function getCenter() {
		var width = document.getElementById('cover_context_div').offsetWidth;
		var height = document.getElementById('cover_context_div').offsetHeight;
		document.getElementById('cover_context_div').style.top = (document.documentElement.clientHeight - height)
				/ 2 + 'px';
		document.getElementById('cover_context_div').style.left = (document.documentElement.clientWidth - width)
				/ 2 + 'px';
	}
</script>

</head>
<body id="top"
	class="jw-header-is-text jw-is-frontend jw-is-no-sidebar jw-is-no-second-sidebar jw-is-no-slideshow jw-is-no-touch-device jw-is-no-touch-device jw-is-no-hero"
	data-jouwweb-website="635352" data-jouwweb-page="2330094"
	data-jouwweb-language="nl" data-jouwweb-backend="jouwweb.nl"
	data-template-threshold="960">
	<div class="jw-background-wrapper">
		<div class="jw-background"></div>
		<div class="jw-body">


			<div class="bg-1"></div>
			<div class="bg-2"></div>

			<div class="wrapper">

				<header class="topbar jw-header-container">
				<div class="jw-header jw-header-text jw-header-text-toggle"
					data-stylable="true">
					<a id="jw-header-title" class="jw-header-title"
						href="http://www.aectrading.nl/"><span style="font-size: 85%;"><span
							style="color: #ffffff;">Asia-Euro Connect</span>&nbsp;</span> &nbsp; <span
						style="font-size: 70%;"><span style="color: #ff6600;">亚欧快递（贸易）公司</span>
					</span> </a>
				</div>
				<button class="jw-mobile-toggle">
					<span class="jw-mobile-bar"></span><span class="jw-mobile-bar"></span><span
						class="jw-mobile-bar"></span>
				</button>
				</header>

				<nav class="menu clear jw-menu-collapse">
				<ul id="jw-menu" class="jw-menu jw-menu-horizontal">
					<li class="jw-menu-item"><a id="jouwweb-page-2329933"
						class="jw-menu-link" href="http://www.aectrading.nl/">Home</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2330478"
						class="jw-menu-link" href="http://www.aectrading.nl/-6">使用需知</a>
					</li>
					<li class="jw-menu-item jw-menu-is-active"><a
						id="jouwweb-page-2330094" class="jw-menu-link"
						href="http://asiaeuroconnect.aectrading.ali-sh.goodrain.net:10080">在线下单</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2348588"
						class="jw-menu-link" href="http://www.aectrading.nl/-8">提货路线</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2330034"
						class="jw-menu-link" href="http://www.aectrading.nl/-7">在线查询</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2330459"
						class="jw-menu-link" href="http://www.aectrading.nl/-3">资料下载</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2330473"
						class="jw-menu-link" href="http://www.aectrading.nl/-5">最新消息</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2330472"
						class="jw-menu-link" href="http://www.aectrading.nl/-4">意见反馈</a>
					</li>
					<li class="jw-menu-item"><a id="jouwweb-page-2332811"
						class="jw-menu-link" href="http://www.aectrading.nl/-2">常见问题</a>
					</li>
				</ul>
				</nav>

				<div class="slideshow"></div>

				<div class="content-wrap">
					<div class="gradient"></div>

					<div class="content-area">
						<main>
						<div class="jw-section jw-section-content content">
							<div id="jw-breadrumbs" class="jw-breadcrumbs">
								<a id="jouwweb-page-2329933" href="http://www.aectrading.nl/">Home</a><span
									class="sep"> &raquo; </span><span class="js-active-menu-item">在线下单</span>
							</div>

							<div id="jw-element-23482115" style="width: 100%;"
								data-jw-element-id="23482115"
								class="jw-intent jw-tree-node jw-element  jw-tree-container  jw-vertical_split">



								<div id="jw-element-23482139" style="width: 100%;"
									data-jw-element-id="23482139"
									class="jw-intent jw-tree-node jw-element  jw-node-is-first-child jw-node-is-last-child jw-contact-form">

									<form name="wholeform" action="writeExcel" method="POST"
										onsubmit="cover();">
										<div class="jw-element-form-group">
											<label class="jw-element-form-label" for="sender">寄件人
												*</label>
											<div class="jw-element-form-content ">
												<input type="text" name="sender" id="sender" required="true"
													class="&#x20;jw-element-form-input-text" value="">
											</div>
										</div>
										<div class="jw-element-form-group">
											<label class="jw-element-form-label" for="senderAddress">提货地址
												（填街名门牌号，城市名和邮编）*</label>
											<div class="jw-element-form-content ">
												<input type="text" name="senderAddress" id="senderAddress"
													required="true" class="&#x20;jw-element-form-input-text"
													value="">
											</div>
										</div>
										<div class="jw-element-form-group">
											<label class="jw-element-form-label" for="senderPhoneNumber">寄件人电话
												*</label>
											<div class="jw-element-form-content ">
												<input type="text" name="senderPhoneNumber" required="true"
													id="senderPhoneNumber"
													class="&#x20;jw-element-form-input-text" value="">
											</div>
										</div>
										<div class="jw-element-form-group">
											<label class="jw-element-form-label" for="senderEmail">回单邮箱
												*</label>
											<div class="jw-element-form-content ">
												<input type="email" name="senderEmail" id="senderEmail"
													required="true" class="&#x20;jw-element-form-input-text"
													value="">
											</div>
										</div>
										<div class="jw-element-form-group">
											<label class="jw-element-form-label" for="CollectionDate">提货日期
												* </label>
											<div class="jw-element-form-content ">
												<input type="text" name="CollectionDate"
													onfocus="HS_setDate(this)" required="true"
													class="dynamic-form-date&#x20;jw-element-form-input-text"
													id="CollectionDate" value="">
											</div>
										</div>
										<div class="jw-element-form-group">
											<label class="jw-element-form-label" for="formPrint">AEC代打印运单
												*</label>
											<div class="jw-element-form-content ">
												<div class="jw-element-form-checkbox">
													<label><input type="radio" name="formPrint"
														id="formPrintYes" value="Yes">是</label>
												</div>
												<div class="jw-element-form-checkbox">
													<label><input type="radio" checked="checked"
														name="formPrint" id="formPrintNo" value="No">否</label>
												</div>
											</div>
										</div>
										<!--  -->

										<div>
											<div>
												<span>包裹个数</span>
											</div>

											<div class="row">
												<div class="col-lg-2">
													<div class="input-group">
														<span class="input-group-btn">
															<button style="color:#FFFFFF;background-color:#1C86EE;"
																type="button" class="btn btn-default btn-md"
																id="reduceBtn" onclick="reducePackage()">
																<span class="glyphicon glyphicon-minus"></span>
															</button> </span> <input type="text" class="form-control" value='1'
															name="packageAmount" id="packageAmount" readonly> <span
															class="input-group-btn">
															<button style="color:#FFFFFF;background-color:#1C86EE;"
																type="button" class="btn btn-default btn-md" id="addBtn"
																onclick="addPackage()">
																<span class="glyphicon glyphicon-plus"></span>
															</button> </span>
													</div>
												</div>

												<div>
													<ul id="container" style="margin-top: 60px;">
													</ul>
												</div>

											</div>

										</div>

										<!--  -->
										<div class="jw-element-form-group hidden">
											<label class="jw-element-form-label"
												for="dynamic-form-61928-submit">Laat dit veld leeg</label>
											<div class="jw-element-form-content ">
												<input type="text" name="captcha"
													id="dynamic-form-61928-submit"
													class="&#x20;jw-element-form-input-text" value="">
											</div>
										</div>
										<!--  
										<div class="jw-element-form-group">
											<div class="jw-element-form-content jw-element-form-offset">
												<div class="jw-element-form-checkbox">
													<label for="dynamic-form-61928-copy"><input
														type="hidden" name="copy" value="0"><input
														type="checkbox" name="copy" id="dynamic-form-61928-copy"
														value="1">Stuur mij een kopie</label>
												</div>
											</div>
										</div>
										-->
										<div class="jw-element-form-group">
											<button type="submit" name="submit"
												onclick="return checkBox();"
												class="&#x20;jw-element-form-offset&#x20;jw-btn&#x20;jw-btn-sm&#x20;jw-btn-roundness-default&#x20;jw-btn-style-default&#x20;jw-btn__default-color"
												value="">提交</button>
										</div>

										<!--  
										<div id="massage_box" onclick="hiddenMessage();"
											style="font-family:SimSun;">
											<div class="massage">
												<div class="header" onmousedown="MDown(massage_box);">
													<div
														style="display: inline; width: 150px; position: absolute">
														正在提交中 ... ...</div>
													<span
														onClick="massage_box.style.visibility='hidden'; mask.style.visibility='hidden'"
														style="float: right; display: inline; cursor: hand"><img
														src="images/guanbi.png" height="30px" width="30px" /> </span>
												</div>
												<div
													style="margin-top: 20px; margin-left: 20px; width: 128px; height: 128px; float: left;">
													<img src="images/cxz_ly.gif" />
												</div>
												<div
													style="margin-top: 50px; width: 136px; height: 128px; float: right;">
													提交请求已发送 <br /> 等待返回提交结果
												</div>
											</div>
										</div>
										<div id="mask" onclick="hiddenMessage();"></div>

										  -->

									</form>
								</div>
							</div>
						</div>
						</main>
					</div>

					<footer>
					<div
						class="jw-section-is-pinnable jw-section jw-section-footer footer">
						<div class="jw-credits clear">
							<div id="jw-footer-text" class="jw-credits-owner jw-footer-text">
								<div class="jw-footer-text-content">&copy; 2016 Asia-Euro
									Connect, Bahialaan 100, 3065WC, Rotterdam</div>
							</div>
						</div>
					</div>
					</footer>
				</div>

			</div>
			<div id="jw-variable-loaded" style="display: none;"></div>
			<div id="jw-variable-values" style="display: none;">
				<span data-jw-variable-key="background-color"
					class="jw-variable-value-background-color"></span> <span
					data-jw-variable-key="background"
					class="jw-variable-value-background"></span> <span
					data-jw-variable-key="font-family"
					class="jw-variable-value-font-family"></span> <span
					data-jw-variable-key="paragraph-color"
					class="jw-variable-value-paragraph-color"></span> <span
					data-jw-variable-key="paragraph-link-color"
					class="jw-variable-value-paragraph-link-color"></span> <span
					data-jw-variable-key="paragraph-font-size"
					class="jw-variable-value-paragraph-font-size"></span> <span
					data-jw-variable-key="heading-color"
					class="jw-variable-value-heading-color"></span> <span
					data-jw-variable-key="heading-link-color"
					class="jw-variable-value-heading-link-color"></span> <span
					data-jw-variable-key="heading-font-size"
					class="jw-variable-value-heading-font-size"></span> <span
					data-jw-variable-key="heading-font-family"
					class="jw-variable-value-heading-font-family"></span> <span
					data-jw-variable-key="hero-font-family"
					class="jw-variable-value-hero-font-family"></span> <span
					data-jw-variable-key="sidebar-text-color"
					class="jw-variable-value-sidebar-text-color"></span> <span
					data-jw-variable-key="sidebar-text-link-color"
					class="jw-variable-value-sidebar-text-link-color"></span> <span
					data-jw-variable-key="sidebar-text-font-size"
					class="jw-variable-value-sidebar-text-font-size"></span> <span
					data-jw-variable-key="content-color"
					class="jw-variable-value-content-color"></span> <span
					data-jw-variable-key="menu-color"
					class="jw-variable-value-menu-color"></span> <span
					data-jw-variable-key="accent-color"
					class="jw-variable-value-accent-color"></span> <span
					style="font-family:SimSun;"></span>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="http://a.jwwb.nl/assets/js/frontend/head_frontend.js?bust=4d4b920218030815c539be04edbc0486"></script>
	<script type="text/javascript"
		src="http://a.jwwb.nl/assets//js/lib/jquery.iframe-transport.js?bust=bdca201d16f0bbf6b507c7f42beda34f"></script>
	<script type="text/javascript"
		src="http://a.jwwb.nl/assets//js/lib/moment.js?bust=0e2906f1781abbe5ef8e8178185f1c3a"></script>
	<script type="text/javascript"
		src="http://a.jwwb.nl/assets//js/lib/pikaday.js?bust=0fb6465157b03444e5a078abee7e8449"></script>
</body>
</html>
