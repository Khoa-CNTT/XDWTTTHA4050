<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <header class="header_area sticky-header">
                <div class="main_menu">
                    <nav class="navbar navbar-expand-lg navbar-light main_box">
                        <div class="container">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <a class="navbar-brand logo_h" href="/"><img src="/client/img/logo.png" alt=""></a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                                <ul class="nav navbar-nav menu_nav ml-auto">
                                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                                    <li class="nav-item"><a class="nav-link" href="/product">Shop</a></li>
                                </ul>
                                <c:if test="${not empty pageContext.request.userPrincipal}">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="nav-item">
                                            <a href="/cart" class="cart">
                                                <span class="ti-bag"></span>
                                                <span class="cart-count" id="sumCart">
                                                    ${sessionScope.sum}
                                                </span>
                                            </a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a href="#" class="user">
                                                <span class="ti-user"></span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                                                <span
                                                    class="dropdown-item">${pageContext.request.userPrincipal.name}</span>
                                                <a class="dropdown-item" href="/account-management">Quản lý tài
                                                    khoản</a>
                                                <a class="dropdown-item" href="/order-history">Lịch sử mua hàng</a>
                                                <form action="/logout" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="dropdown-item" type="submit">Đăng xuất</button>
                                                </form>
                                            </div>
                                        </li>
                                    </ul>
                                </c:if>
                                <c:if test="${empty pageContext.request.userPrincipal}">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="nav-item active"><a class="a-login nav-link" href="/login">Đăng
                                                nhập</a></li>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                    </nav>
                </div>

            </header>