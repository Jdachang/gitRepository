﻿<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="stripes"
	uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<link rel="StyleSheet" href="../css/jpetstore.css" type="text/css"
	media="screen" />

<meta name="generator"
	content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
<title>JPetStore Demo</title>
<meta content="text/html; charset=windows-1252"
	http-equiv="Content-Type" />
<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="Pragma" content="no-cache" />
</head>

<body>
<div id="Header">
<div id="Logo">
<div id="LogoContent"><stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
	<img src="../images/logo-topbar.gif" />
</stripes:link></div>
</div>
<%
 out.println("###"+request.getSession().getId());
%>
<div id="Menu">
<div id="MenuContent"><stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
	event="viewCart">
	<img align="middle" name="img_cart" src="../images/cart.gif" />
</stripes:link> <img align="middle" src="../images/separator.gif" />


 <c:if
	test="${sessionScope.accountBean == null}">
	<stripes:link
		beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
		event="signonForm">
          Sign In
	</stripes:link>
</c:if> <c:if test="${sessionScope.accountBean != null}">
	<c:if test="${!sessionScope.accountBean.authenticated}">
		<stripes:link
			beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
			event="signonForm">
            Sign In
	      </stripes:link>
	</c:if>
</c:if> <c:if test="${sessionScope.accountBean != null}">
	<c:if test="${sessionScope.accountBean.authenticated}">
		<stripes:link
			beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
			event="signoff">
            Sign Out
	      </stripes:link>
		<img align="middle" src="../images/separator.gif" />
		<stripes:link
			beanclass="org.mybatis.jpetstore.web.actions.AccountActionBean"
			event="editAccountForm">
            My Account
	      </stripes:link>
	</c:if>
</c:if> <img align="middle" src="../images/separator.gif" /> <a
	href="../help.html">?</a></div>
</div>

<div id="QuickLinks"><stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
	event="viewCategory">
	<stripes:param name="categoryId" value="FISH" />
	<img src="../images/sm_fish.gif" />
</stripes:link> <img src="../images/separator.gif" /> <stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
	event="viewCategory">
	<stripes:param name="categoryId" value="DOGS" />
	<img src="../images/sm_dogs.gif" />
</stripes:link> <img src="../images/separator.gif" /> <stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
	event="viewCategory">
	<stripes:param name="categoryId" value="REPTILES" />
	<img src="../images/sm_reptiles.gif" />
</stripes:link> <img src="../images/separator.gif" /> <stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
	event="viewCategory">
	<stripes:param name="categoryId" value="CATS" />
	<img src="../images/sm_cats.gif" />
</stripes:link> <img src="../images/separator.gif" /> <stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
	event="viewCategory">
	<stripes:param name="categoryId" value="BIRDS" />
	<img src="../images/sm_birds.gif" />
</stripes:link>
</div>
</div>

<div id="Content"><stripes:messages />





<jsp:useBean id="catalog"
	class="org.mybatis.jpetstore.web.actions.CatalogActionBean" />

<div id="BackLink"><stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
	event="viewCategory">
	<stripes:param name="categoryId"
		value="${actionBean.product.categoryId}" />
	Return to ${actionBean.product.categoryId}
</stripes:link></div>

<div id="Catalog">

<h2>${actionBean.product.name}</h2>

<table>
	<tr>
		<th>Item ID</th>
		<th>Product ID</th>
		<th>Description</th>
		<th>List Price</th>
		<th>&nbsp;</th>
	</tr>
	<c:forEach var="item" items="${actionBean.itemList}">
		<tr>
			<td><stripes:link
				beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
				event="viewItem">
				<stripes:param name="itemId" value="${item.itemId}" />
				${item.itemId}
			</stripes:link></td>
			<td>${item.product.productId}</td>
			<td>${item.attribute1} ${item.attribute2} ${item.attribute3}
			${item.attribute4} ${item.attribute5} ${actionBean.product.name}</td>
			<td><fmt:formatNumber value="${item.listPrice}"
				pattern="$#,##0.00" /></td>
			<td><stripes:link class="Button"
				beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
				event="addItemToCart">
				<stripes:param name="workingItemId" value="${item.itemId}" />
        	Add to Cart
        </stripes:link></td>
		</tr>
	</c:forEach>
	<tr>
		<td>
		</td>
	</tr>
</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>




