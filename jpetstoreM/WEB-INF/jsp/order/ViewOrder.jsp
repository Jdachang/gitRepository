<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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





<div id="BackLink"><stripes:link
	beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean">
	Return to Main Menu</stripes:link></div>

<div id="Catalog">

<table>
	<tr>
		<th align="center" colspan="2">Order #${actionBean.order.orderId}
		<fmt:formatDate value="${actionBean.order.orderDate}"
			pattern="yyyy/MM/dd hh:mm:ss" /></th>
	</tr>
	<tr>
		<th colspan="2">Payment Details</th>
	</tr>
	<tr>
		<td>Card Type:</td>
		<td><c:out value="${actionBean.order.cardType}" /></td>
	</tr>
	<tr>
		<td>Card Number:</td>
		<td><c:out value="${actionBean.order.creditCard}" /> * Fake
		number!</td>
	</tr>
	<tr>
		<td>Expiry Date (MM/YYYY):</td>
		<td><c:out value="${actionBean.order.expiryDate}" /></td>
	</tr>
	<tr>
		<th colspan="2">Billing Address</th>
	</tr>
	<tr>
		<td>First name:</td>
		<td><c:out value="${actionBean.order.billToFirstName}" /></td>
	</tr>
	<tr>
		<td>Last name:</td>
		<td><c:out value="${actionBean.order.billToLastName}" /></td>
	</tr>
	<tr>
		<td>Address 1:</td>
		<td><c:out value="${actionBean.order.billAddress1}" /></td>
	</tr>
	<tr>
		<td>Address 2:</td>
		<td><c:out value="${actionBean.order.billAddress2}" /></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><c:out value="${actionBean.order.billCity}" /></td>
	</tr>
	<tr>
		<td>State:</td>
		<td><c:out value="${actionBean.order.billState}" /></td>
	</tr>
	<tr>
		<td>Zip:</td>
		<td><c:out value="${actionBean.order.billZip}" /></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><c:out value="${actionBean.order.billCountry}" /></td>
	</tr>
	<tr>
		<th colspan="2">Shipping Address</th>
	</tr>
	<tr>
		<td>First name:</td>
		<td><c:out value="${actionBean.order.shipToFirstName}" /></td>
	</tr>
	<tr>
		<td>Last name:</td>
		<td><c:out value="${actionBean.order.shipToLastName}" /></td>
	</tr>
	<tr>
		<td>Address 1:</td>
		<td><c:out value="${actionBean.order.shipAddress1}" /></td>
	</tr>
	<tr>
		<td>Address 2:</td>
		<td><c:out value="${actionBean.order.shipAddress2}" /></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><c:out value="${actionBean.order.shipCity}" /></td>
	</tr>
	<tr>
		<td>State:</td>
		<td><c:out value="${actionBean.order.shipState}" /></td>
	</tr>
	<tr>
		<td>Zip:</td>
		<td><c:out value="${actionBean.order.shipZip}" /></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><c:out value="${actionBean.order.shipCountry}" /></td>
	</tr>
	<tr>
		<td>Courier:</td>
		<td><c:out value="${actionBean.order.courier}" /></td>
	</tr>
	<tr>
		<td colspan="2">Status: <c:out value="${actionBean.order.status}" /></td>
	</tr>
	<tr>
		<td colspan="2">
		<table>
			<tr>
				<th>Item ID</th>
				<th>Description</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Total Cost</th>
			</tr>
			<c:forEach var="lineItem" items="${actionBean.order.lineItems}">
				<tr>
					<td><stripes:link
						beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
						event="viewItem">
						<stripes:param name="itemId" value="${lineItem.item.itemId}" />
						${lineItem.item.itemId}
					</stripes:link></td>
					<td><c:if test="${lineItem.item != null}">
						${lineItem.item.attribute1}
						${lineItem.item.attribute2}
						${lineItem.item.attribute3}
						${lineItem.item.attribute4}
						${lineItem.item.attribute5}
						${lineItem.item.product.name}
					</c:if> <c:if test="${lineItem.item == null}">
						<i>{description unavailable}</i>
					</c:if></td>

					<td>${lineItem.quantity}</td>
					<td><fmt:formatNumber value="${lineItem.unitPrice}"
						pattern="$#,##0.00" /></td>
					<td><fmt:formatNumber value="${lineItem.total}"
						pattern="$#,##0.00" /></td>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="5">Total: <fmt:formatNumber
					value="${actionBean.order.totalPrice}" pattern="$#,##0.00" /></th>
			</tr>
		</table>
		</td>
	</tr>

</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>
