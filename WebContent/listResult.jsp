<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Hotel List</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- 
	<script>
		$(function() {
			$.getJSON('./public_data.json', function(data) {
				var html = []; 
				$.each(data, function(i, item) {
					var col=item.header.columns[0];
					html.push('<div >');
					html.push('<table border="1">');
					html.push('<tr>');
					html.push('<th>'+col.rowNum+'</th>');	//번호
					html.push('<th>'+col.bplcNm+'</th>');	//사업장명
					html.push('<th>'+col.siteWhlAddr+'</th>');	//소재지주소
					html.push('<th>'+col.rdnWhlAddr+'</th>');	//도로명전체주소
					html.push('</tr>');
					var rowL=item.body.rows[0].row.length;
					//if(item.body.rows[0].row.siteWhlAddr.contains)
					for(var i=0; i<rowL; i++){
						html.push('<tr>');
						html.push('<td>'+ item.body.rows[0].row[i].rowNum + '</td>');
						html.push('<td>'+ item.body.rows[0].row[i].bplcNm + '</td>');
						html.push('<td>'+ item.body.rows[0].row[i].siteWhlAddr + '</td>');
						html.push('<td>'+ item.body.rows[0].row[i].rdnWhlAddr + '</td>');
						html.push('</tr>');
					}
					html.push('</table>');
					html.push('</div>');
					//html.push('<li id="' + key + '">' + val + '</li>');
					});
				console.log(html); 
				$('#target').html(html.join(''));
			});
		});
	</script>
	 -->
	 
</head>
<body>
	<h1>listResult.jsp</h1>
	<div id="target"></div>
	<table border="1">
		<tr>
			<c:forEach var="values" items="${hList}">
				<th>${values.rowNum}</th>
				<th>${values.bplcNm}</th>
				<th>${values.siteWhlAddr}</th>
				<th>${values.rdnWhlAddr}</th>
			</c:forEach>
		</tr>
		<c:forEach var="values" items="${hList2}">
		<tr>
			<td>${values.rowNum}</td>
			<td>${values.bplcNm}</td>
			<td>${values.siteWhlAddr}</td>
			<td>${values.rdnWhlAddr}</td>
		</tr>
		</c:forEach>
		
	</table>
</body>
</html>