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

<div id="Cart">

<h2>Shopping Cart</h2>
<stripes:form
	beanclass="org.mybatis.jpetstore.web.actions.CartActionBean">
	<table>
		<tr>
			<th><b>Item ID</b></th>
			<th><b>Product ID</b></th>
			<th><b>Description</b></th>
			<th><b>In Stock?</b></th>
			<th><b>Quantity</b></th>
			<th><b>List Price</b></th>
			<th><b>Total Cost</b></th>
			<th>&nbsp;</th>
		</tr>

		<c:if test="${actionBean.cart.numberOfItems == 0}">
			<tr>
				<td colspan="8"><b>Your cart is empty.</b></td>
			</tr>
		</c:if>

		<c:forEach var="cartItem" items="${actionBean.cart.cartItems}">
			<tr>
				<td><stripes:link
					beanclass="org.mybatis.jpetstore.web.actions.CatalogActionBean"
					event="viewItem">
					<stripes:param name="itemId" value="${cartItem.item.itemId}" />
				${cartItem.item.itemId}
			  </stripes:link></td>
				<td>${cartItem.item.product.productId}</td>
				<td>${cartItem.item.attribute1} ${cartItem.item.attribute2}
				${cartItem.item.attribute3} ${cartItem.item.attribute4}
				${cartItem.item.attribute5} ${cartItem.item.product.name}</td>
				<td>${cartItem.inStock}</td>
				<td><stripes:text size="3" name="${cartItem.item.itemId}"
					value="${cartItem.quantity}" /></td>
				<td><fmt:formatNumber value="${cartItem.item.listPrice}"
					pattern="$#,##0.00" /></td>
				<td><fmt:formatNumber value="${cartItem.total}"
					pattern="$#,##0.00" /></td>
				<td><stripes:link class="Button"
					beanclass="org.mybatis.jpetstore.web.actions.CartActionBean"
					event="removeItemFromCart">
					<stripes:param name="cartItem" value="${cartItem.item.itemId}" />
            	Remove
            </stripes:link></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7">Sub Total: <fmt:formatNumber
				value="${actionBean.cart.subTotal}" pattern="$#,##0.00" /> <stripes:submit
				name="updateCartQuantities" value="Update Cart" /></td>
			<td>&nbsp;</td>
		</tr>
	</table>

</stripes:form> <c:if test="${actionBean.cart.numberOfItems > 0}">
	<stripes:link class="Button"
		beanclass="org.mybatis.jpetstore.web.actions.OrderActionBean"
		event="newOrderForm">
      	Proceed to Checkout
      </stripes:link>
</c:if></div>

<div id="MyList">
  <c:if test="${sessionScope.accountBean != null}">
	<c:if test="${!sessionScope.accountBean.authenticated}">
	  <c:if test="${!empty sessionScope.accountBean.account.listOption}">
	    <%@ include file="IncludeMyList.jsp"%>
      </c:if>
	</c:if>
  </c:if>
</div>

<div id="Separator">&nbsp;</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>