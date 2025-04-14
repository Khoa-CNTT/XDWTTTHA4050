<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Karma Shop</title>
                    <!-- Latest compiled and minified CSS -->
                    <link rel="shortcut icon" href="/client/img/fav.png">
                    <link rel="stylesheet" href="/client/css/linearicons.css">
                    <link rel="stylesheet" href="/client/css/owl.carousel.css">
                    <link rel="stylesheet" href="/client/css/font-awesome.min.css">
                    <link rel="stylesheet" href="/client/css/themify-icons.css">
                    <link rel="stylesheet" href="/client/css/nice-select.css">
                    <link rel="stylesheet" href="/client/css/nouislider.min.css">
                    <link rel="stylesheet" href="/client/css/bootstrap.css">
                    <link rel="stylesheet" href="/client/css/main.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script>

                    </script>
                </head>


                <body>
                    <!-- Start Header Area -->
                    <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                    <!-- End Header Area -->

                    <!-- Start Banner Area -->
                    <section class="banner-area organic-breadcrumb">
                        <div class="container">
                            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                                <div class="col-first">
                                    <h1>Lịch sử mua hàng</h1>
                                    <nav class="d-flex align-items-center">
                                        <a href="/">Trang chủ<span class="lnr lnr-arrow-right"></span></a>
                                        <a href="/order-history">Lịch sử mua hàng</a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- End Banner Area -->

                    <!--================Cart Area =================-->
                    <section class="cart_area">
                        <div class="container" style="max-width: 1320px;width: 100%;">
                            <div class="cart_inner">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Product</th>
                                                <th scope="col">Subtotal</th>
                                                <th scope="col">Total</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty orders}">
                                                <tr>
                                                    <td colspan="6">
                                                        <h5>Không có đơn hàng nào</h5>
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:forEach items="${orders}" var="order">
                                                <tr>
                                                    <td></td>
                                                    <td colspan="3">
                                                        <h5><fmt:formatNumber pattern="#,###" value="${order.totalPrice}"
                                                            type="currency" currencySymbol="₫" />đ</h5>
                                                        
                                                    </td>
                                                    <td colspan="2">
                                                        <h5>${order.status}</h5>
                                                    </td>
                                                </tr>
                                                <c:forEach items="${order.orderDetails}" var="orderDetail">
                                                    <tr>
                                                        <td>
                                                            <div class="media">
                                                                <div class="d-flex">
                                                                    <img src="/images/product/${orderDetail.product.image}"
                                                                        alt="">
                                                                </div>
                                                                <div class="media-body">
                                                                    <p>${orderDetail.product.name}</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            
                                                        </td>
                                                        <td>
                                                            <h5>
                                                                <fmt:formatNumber pattern="#,###"
                                                                    value="${orderDetail.price * orderDetail.quantity}"
                                                                    type="number" />đ
                                                            </h5>
                                                            
                                                        </td>
                                                        <td>
                                                            <div class="product_count">
                                                                <input type="text" name="qty"
                                                                    value="${orderDetail.quantity}" title="Quantity:"
                                                                    class="input-text qty">
                                                            </div>
                                                        </td>

                                                    </tr>
                                                </c:forEach>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </section>
                    <!--================End Cart Area =================-->

                    <!-- start footer Area -->
                    <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
                    <!-- End footer Area -->

                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
                        crossorigin="anonymous"></script>
                    <script src="/client/js/vendor/bootstrap.min.js"></script>
                    <script src="/client/js/jquery.ajaxchimp.min.js"></script>
                    <script src="/client/js/jquery.nice-select.min.js"></script>
                    <script src="/client/js/jquery.sticky.js"></script>
                    <script src="/client/js/nouislider.min.js"></script>
                    <script src="/client/js/jquery.magnific-popup.min.js"></script>
                    <script src="/client/js/owl.carousel.min.js"></script>
                    <script src="/client/js/main.js"></script>

                </body>

                </html>