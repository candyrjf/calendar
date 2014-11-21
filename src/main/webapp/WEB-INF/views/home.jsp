
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>2010136130_최소라</title>

<meta name="viewport" content="width=device-width, initial- scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/mytheme/css/style.css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js?ver=1.3.2"></script>
<link rel="styleshet"
	href="htp:/code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.cs" />
<script src="htp:/code.jquery.com/jquery-1.6.4.min.js"></script>
<script src="htp:/code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.js"></script>
<style type="text/css" style="display: none !important;">
* {
	margin: 0;
	padding: 0;
}

body {
	overflow-x: hidden;
}

#demo-top-bar {
	text-align: left;
	background: #222;
	position: relative;
	zoom: 1;
	width: 100% !important;
	z-index: 6000;
	padding: 20px 0 20px;
}

#demo-bar-inside {
	width: 960px;
	margin: 0 auto;
	position: relative;
}

#demo-bar-buttons {
	padding-top: 10px;
	float: right;
}

#demo-bar-buttons a {
	font-size: 12px;
	margin-left: 20px;
	color: white;
	margin: 2px 0;
	text-decoration: none;
	font: 14px "Lucida Grande", Sans-Serif !important;
}

#demo-bar-buttons a:hover, #demo-bar-buttons a:focus {
	text-decoration: underline;
}

#demo-bar-badge {
	display: inline-block;
	width: 302px;
	padding: 0 !important;
	margin: 0 !important;
	background-color: transparent !important;
}

#demo-bar-badge a {
	display: block;
	width: 100%;
	height: 50px;
	border-radius: 0;
	bottom: auto;
	margin: 0;
	background:
		url(${pageContext.request.contextPath}/resources/images/logo.png)
		no-repeat;
	background-size: 100%;
	overflow: hidden;
	text-indent: -9999px;
	background-size: 100%;
}

#demo-bar-badge:before, #demo-bar-badge:after {
	display: none !important;
}
</style>
</head>

<body>
	<div data-role="page" id="main">
		<div id="demo-top-bar">
			<div id="demo-bar-inside">
				<h2 id="demo-bar-badge">
					<a href="#main">Welcome!</a>
				</h2>

				<div id="demo-bar-buttons">
					<a class="header-button" href="#user">calendarUser</a> &nbsp; <a
						class="header-button" href="#events">events</a> &nbsp;<a
						class="header-button" href="#attendee">eventAttendees</a>
				</div>
			</div>
		</div>

		<h1 align="center">Assignment 4</h1>
		<h2 align="center">Calendar-dev를 Web 기반 어플리케이션으로 전환하기</h2>
		<h3 align="center">요구 사항 2 - CalendarService 제작과 이벤트 레벨 관리 및 트랜잭션
			테스트 하기</h3>
		<br> <br>
	</div>
	<div data-role="page" id="user">
		<div class="container">
			<div class="row">
				<h1>CalendarUser</h1>
				<table style="width: 100%;" border="1">
					<tr>
						<td><h3 align="center">id</h3></td>
						<td><h3 align="center">name</h3></td>
						<td><h3 align="center">email</h3></td>
					</tr>
					<c:forEach var="calendarUser" items="${calendarUsers}">
						<tr>
							<td align="center">${calendarUser.id}</td>
							<td align="center">${calendarUser.name}</td>
							<td align="center">${calendarUser.email}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<div data-role="page" id="events">
		<div class="container">
			<div class="row">
				<br> <br>
				<h1>Events</h1>
				<table style="width: 100%;" border="1">
					<tr>
						<td><h3 align="center">id</h3></td>
						<td><h3 align="center">when</h3></td>
						<td><h3 align="center">summary</h3></td>
						<td><h3 align="center">description</h3></td>
						<td><h3 align="center">Owner</h3></td>
						<td><h3 align="center">Likes</h3></td>
						<td><h3 align="center">Level</h3></td>
					</tr>
					<c:forEach var="events" items="${events}">
						<tr>
							<td align="center">${events.id}</td>
							<td align="center">${event.when.time}</td>
							<td align="center">${events.summary}</td>
							<td align="center">${events.description}</td>
							<td align="center">${events.owner.getName()}</td>
							<td align="center">${events.numLikes}</td>
							<td align="center">${events.eventLevel}</td>
						</tr>

					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<div data-role="page" id="attendee">
		<div class="container">
			<div class="row">
				<br> <br>
				<h1>EventAttendees</h1>
				<table style="width: 100%;" border="1">
					<tr>
						<td><h3 align="center">id</h3></td>
						<td><h3 align="center">event</h3></td>
						<td><h3 align="center">attendee</h3></td>
					</tr>
					<c:forEach var="eventAttentees" items="${eventAttentees}">
						<tr>
							<td align="center">${eventAttentees.id}</td>
							<td align="center">${eventAttentees.event.getSummary()}</td>
							<td align="center">${eventAttentees.attendee.getName()}</td>
						</tr>

					</c:forEach>
				</table>
			</div>
		</div>
	</div>

</body>
</html>