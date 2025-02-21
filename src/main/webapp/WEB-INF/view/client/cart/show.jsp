<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                                <h1>Shopping Cart</h1>
                                <nav class="d-flex align-items-center">
                                    <a href="/">Home<span class="lnr lnr-arrow-right"></span></a>
                                    <a href="/cart">Cart</a>
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
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${cartDetails}" var="cartDetail">
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
                                                        <fmt:formatNumber pattern="#,###" value="${cartDetail.price}"
                                                            type="currency" currencySymbol="₫" />đ
                                                    </h5>
                                                </td>
                                                <td>
                                                    <div class="product_count">
                                                        <input type="text" name="qty" value="${cartDetail.quantity}"
                                                            data-id="${cartDetail.id}" data-price="${cartDetail.price}"
                                                            title="Quantity:" class="input-text qty">
                                                        <button class="increase items-count" type="button"><i
                                                                class="lnr lnr-chevron-up"></i></button>
                                                        <button class="reduced items-count" type="button"><i
                                                                class="lnr lnr-chevron-down"></i></button>
                                                    </div>
                                                </td>
                                                <td>
                                                    <h5 data-id="${cartDetail.id}">
                                                        <fmt:formatNumber pattern="#,###"
                                                            value="${cartDetail.price * cartDetail.quantity}"
                                                            type="number" />đ
                                                    </h5>
                                                </td>
                                                <td>
                                                    <a href="/cart/delete/${cartDetail.id}"
                                                        class="btn btn-danger">Delete</a>
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
                                            <td>

                                            </td>
                                            <td>

                                            </td>
                                            <td>
                                                <h5>Shipping</h5>
                                            </td>
                                            <td>
                                                <div class="shipping_box">
                                                    <ul class="list">
                                                        <li><a href="#">Flat Rate: $5.00</a></li>
                                                        <li><a href="#">Free Shipping</a></li>
                                                        <li><a href="#">Flat Rate: $10.00</a></li>
                                                        <li class="active"><a href="#">Local Delivery: $2.00</a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="out_button_area">
                                            <td>

                                            </td>
                                            <td>

                                            </td>
                                            <td>

                                            </td>
                                            <td>
                                                <div class="checkout_btn_inner d-flex align-items-center">
                                                    <a class="primary-btn" href="#">Proceed to checkout</a>
                                                </div>
                                            </td>
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
                <!-- <script>
                    // function updateQuantity(id, price, change) {
                    //     var result = document.getElementById('sst-' + id);
                    //     var totalElement = document.getElementById('total-' + id);
                    //     var subtotalElement = document.getElementById('subtotal');
                    //     var sst = parseInt(result.value);

                    //     if (!isNaN(sst)) {
                    //         sst += change;
                    //         if (sst >= 1) {
                    //             result.value = sst;
                    //             var newTotal = sst * price;
                    //             totalElement.innerHTML = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'VND' }).format(newTotal);

                    //             // Update subtotal
                    //             var allTotals = document.querySelectorAll('[id^="total-"]');
                    //             var subtotal = 0;
                    //             allTotals.forEach(function (item) {
                    //                 subtotal += parseFloat(item.innerHTML.replace(/[^0-9.-]+/g, ""));
                    //             });
                    //             subtotalElement.innerHTML = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'VND' }).format(subtotal);
                    //         }
                    //     }
                    // }
                </script> -->
            </body>

            </html>