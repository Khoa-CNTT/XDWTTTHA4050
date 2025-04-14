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
                <link rel="stylesheet" href="/client/css/font-awesome.min.css">
                <link rel="stylesheet" href="/client/css/themify-icons.css">
                <link rel="stylesheet" href="/client/css/bootstrap.css">
                <link rel="stylesheet" href="/client/css/owl.carousel.css">
                <link rel="stylesheet" href="/client/css/nice-select.css">
                <link rel="stylesheet" href="/client/css/nouislider.min.css">
                <link rel="stylesheet" href="/client/css/ion.rangeSlider.css" />
                <link rel="stylesheet" href="/client/css/ion.rangeSlider.skinFlat.css" />
                <link rel="stylesheet" href="/client/css/magnific-popup.css">
                <link rel="stylesheet" href="/client/css/main.css">


            </head>


            <body>

                <!-- Start Header Area -->
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                <!-- End Header Area -->

                <!-- start banner Area -->
                <jsp:include page="/WEB-INF/view/client/layout/banner.jsp" />
                <!-- End banner Area -->

                <!-- start features Area -->
                <jsp:include page="/WEB-INF/view/client/layout/features.jsp" />
                <!-- end features Area -->

                <!-- start product Area -->
                <section class="section_gap">
                    <!-- single product slide -->
                    <div class="single-product-slider">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-6 text-center">
                                    <div class="section-title">
                                        <h1>Latest Products</h1>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor
                                            incididunt ut labore et
                                            dolore
                                            magna aliqua.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <!-- single product -->
                                <c:forEach items="${products}" var="product">
                                    <div class="col-lg-3 col-md-6">
                                        <div class="single-product">
                                            <img class="img-fluid" style="height: 8rem;"
                                                src="resources/images/product/${product.image}" alt="">
                                            <div class="product-details">
                                                <h6 style="font-size: 15px">
                                                    <a style="color: black;" href="/product/${product.id}">
                                                        ${product.name}
                                                    </a>
                                                </h6>
                                                <div class="price">
                                                    <h6>
                                                        <fmt:formatNumber value="${product.price}" pattern="#,###" />₫
                                                    </h6>
                                                </div>
                                                <form action="/add-product-to-cart/${product.id}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}">
                                                    <button style="top: 20px;"
                                                        class="mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4">
                                                        Add to
                                                        Cart</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </section>
                <!-- end product Area -->

                <!-- Start exclusive deal Area -->
                <section class="exclusive-deal-area">
                    <div class="container-fluid">
                        <div class="row justify-content-center align-items-center">
                            <div class="col-lg-6 no-padding exclusive-left">
                                <div class="row clock_sec clockdiv" id="clockdiv">
                                    <div class="col-lg-12">
                                        <h1>Exclusive Hot Deal Ends Soon!</h1>
                                        <p>Who are in extremely love with eco friendly system.</p>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="row clock-wrap">
                                            <div class="col clockinner1 clockinner">
                                                <h1 class="days">150</h1>
                                                <span class="smalltext">Days</span>
                                            </div>
                                            <div class="col clockinner clockinner1">
                                                <h1 class="hours">23</h1>
                                                <span class="smalltext">Hours</span>
                                            </div>
                                            <div class="col clockinner clockinner1">
                                                <h1 class="minutes">47</h1>
                                                <span class="smalltext">Mins</span>
                                            </div>
                                            <div class="col clockinner clockinner1">
                                                <h1 class="seconds">59</h1>
                                                <span class="smalltext">Secs</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="" class="primary-btn">Shop Now</a>
                            </div>
                            <div class="col-lg-6 no-padding exclusive-right">
                                <div class="active-exclusive-product-slider">
                                    <!-- single exclusive carousel -->
                                    <div class="single-exclusive-slider">
                                        <img class="img-fluid" src="/client/img/product/e-p1.png" alt="">
                                        <div class="product-details">
                                            <div class="price">
                                                <h6>$150.00</h6>
                                                <h6 class="l-through">$210.00</h6>
                                            </div>
                                            <h4>addidas New Hammer sole
                                                for Sports person</h4>
                                            <div class="add-bag d-flex align-items-center justify-content-center">
                                                <a class="add-btn" href=""><span class="ti-bag"></span></a>
                                                <span class="add-text text-uppercase">Add to Bag</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single exclusive carousel -->
                                    <div class="single-exclusive-slider">
                                        <img class="img-fluid" src="/client/img/product/e-p1.png" alt="">
                                        <div class="product-details">
                                            <div class="price">
                                                <h6>$150.00</h6>
                                                <h6 class="l-through">$210.00</h6>
                                            </div>
                                            <h4>addidas New Hammer sole
                                                for Sports person</h4>
                                            <div class="add-bag d-flex align-items-center justify-content-center">
                                                <a class="add-btn" href=""><span class="ti-bag"></span></a>
                                                <span class="add-text text-uppercase">Add to Bag</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End exclusive deal Area -->

                <!-- start footer Area -->
                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />
                <!-- End footer Area -->

                <script src="/client/js/vendor/jquery-2.2.4.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                    integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
                    crossorigin="anonymous"></script>
                <script src="/client/js/vendor/bootstrap.min.js"></script>
                <script src="/client/js/jquery.ajaxchimp.min.js"></script>
                <script src="/client/js/jquery.nice-select.min.js"></script>
                <script src="/client/js/jquery.sticky.js"></script>
                <script src="/client/js/nouislider.min.js"></script>
                <script src="/client/js/countdown.js"></script>
                <script src="/client/js/jquery.magnific-popup.min.js"></script>
                <script src="/client/js/owl.carousel.min.js"></script>
                <!--gmaps Js-->
                <script src="/client/js/gmaps.min.js"></script>
                <script src="/resources/client/js/main.js"></script>
            </body>

            </html>