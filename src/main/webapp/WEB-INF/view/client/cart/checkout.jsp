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
                        $(document).ready(function () {
                            $('input[name="paymentMethod"]').on('change', function () {
                                if (this.checked) {
                                    $('input[name="paymentMethod"]').not(this).prop('checked', false);
                                }
                            });
                        });
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
                                    <h1>Checkout Cart</h1>
                                    <nav class="d-flex align-items-center">
                                        <a href="/">Home<span class="lnr lnr-arrow-right"></span></a>
                                        <a href="/checkout">Checkout</a>
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
                                                <th scope="col">Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${cartDetails}" var="cartDetail" varStatus="status">
                                                <tr>
                                                    <td>
                                                        <div class="media">
                                                            <div class="d-flex">
                                                                <img src="/images/product/${cartDetail.product.image}"
                                                                    alt="">
                                                            </div>
                                                            <div class="media-body">
                                                                <p>${cartDetail.product.name}</p>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <h5>
                                                            <fmt:formatNumber pattern="#,###"
                                                                value="${cartDetail.price}" type="currency"
                                                                currencySymbol="₫" />đ
                                                        </h5>
                                                    </td>
                                                    <td>
                                                        <div class="product_count">
                                                            <input type="text" name="qty" value="${cartDetail.quantity}"
                                                                data-id="${cartDetail.id}"
                                                                data-price="${cartDetail.price}"
                                                                data-cart-detail-index="${status.index}"
                                                                title="Quantity:" class="input-text qty">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <h5 data-id="${cartDetail.id}">
                                                            <fmt:formatNumber pattern="#,###"
                                                                value="${cartDetail.price * cartDetail.quantity}"
                                                                type="number" />đ
                                                        </h5>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <h5>Subtotal</h5>
                                                </td>
                                                <td>
                                                    <h5 data-price="${total}">
                                                        <fmt:formatNumber pattern="#,###" value="${total}"
                                                            type="currency" />
                                                    </h5>
                                                </td>
                                            </tr>

                                            <tr class="shipping_area">
                                                <c:if test="${not empty cartDetails}">
                                                    <form:form action="/place-order" method="post"
                                                        modelAttribute="cart">
                                                        <td>
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}">
                                                            <div class="mt-5 row g-4 justify-content-start">
                                                                <div class="col-12 col-md-6">
                                                                    <div class="p-4">
                                                                        <h5 class="mb-4">Thông tin người nhận</h5>
                                                                        <div class="row">
                                                                            <div class="col-12 form-group mb-3">
                                                                                <label>Tên người nhận</label>
                                                                                <input type="text" class="form-control"
                                                                                    name="receiverName" required>
                                                                            </div>
                                                                            <div class="col-12 form-group mb-3">
                                                                                <label>Số điện thoại</label>
                                                                                <input type="text" class="form-control"
                                                                                    name="receiverPhone" required>
                                                                            </div>
                                                                            <div class="col-12 form-group mb-3">
                                                                                <label>Địa chỉ</label>
                                                                                <input type="text" class="form-control"
                                                                                    name="receiverAddress" required>
                                                                            </div>
                                                                            <div class="mt-4">
                                                                                <i class="lnr lnr-arrow-left"></i>
                                                                                <a href="/cart">Quay lại giỏ hàng</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <h5 class="mb-3" style="padding: 25px 50px">Hình thức thanh
                                                                toán
                                                            </h5>
                                                            <div class="common-filter">
                                                                <ul>
                                                                    <li class="filter-list"><input
                                                                            class="form-check-input pixel-radio"
                                                                            type="checkbox" name="paymentMethod"
                                                                            value="COD" id="COD" checked><label
                                                                            class="form-check-label" for="COD">Thanh
                                                                            toán khi nhận
                                                                            hàng</label></li>
                                                                    <li class="filter-list"><input
                                                                            class="form-check-input pixel-radio"
                                                                            type="checkbox" name="paymentMethod"
                                                                            value="BANKING" id="BANKING"><label
                                                                            class="form-check-label" for="BANKING">Thanh
                                                                            toán
                                                                            qua
                                                                            VNPAY</label></li>
                                                                    <input style="display: none;" name="total"
                                                                        value="${total}">
                                                                </ul>
                                                                <div class="mt-4">
                                                                    <button class="btn primary-btn ">Xác
                                                                        nhận Thanh toán</button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </form:form>
                                                </c:if>
                                            </tr>


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