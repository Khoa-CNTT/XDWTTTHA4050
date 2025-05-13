<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>${product.name } - Karma Shop</title>
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
                        <link rel="stylesheet" href="/client/css/main.css">
                        <meta name="_csrf" content="${_csrf.token}" />
                        <!-- default header name is X-CSRF-TOKEN -->
                        <meta name="_csrf_header" content="${_csrf.headerName}" />

                        <link
                            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                            rel="stylesheet">

                    </head>


                    <body>

                        <!-- Start Header Area -->
                        <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                        <!-- End Header Area -->

                        <!--================Single Product Area =================-->
                        <div class="product_image_area">
                            <div class="container">
                                <div>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">${product.name}</li>

                                        </ol>
                                    </nav>
                                </div>
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">
                                        ${error}
                                    </div>
                                </c:if>
                                <div class="row s_product_inner">
                                    <div class="col-lg-6">
                                        <div>
                                            <div class="single-prd-item">
                                                <img class="img-fluid" src="/images/product/${product.image}" alt="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 offset-lg-1">
                                        <div class="s_product_text">
                                            <h3>${product.name}</h3>
                                            <h2>
                                                <fmt:formatNumber value="${product.price}" pattern="#,###" />₫
                                            </h2>
                                            <ul class="list">
                                                <li><a class="active" href="#"><span>Factory</span> :
                                                        ${product.factory}</a>
                                                </li>
                                            </ul>
                                            <p>${product.detailDesc}</p>
                                            <div class="product_count">
                                                <label for="qty">Quantity:</label>
                                                <input type="text" name="qty" id="sst" value="1" title="Quantity:"
                                                    class="input-text qty" data-cart-detail-index="0" disabled>
                                                <button class="increase items-count" type="button"><i
                                                        class="lnr lnr-chevron-up"></i></button>
                                                <button class="reduced items-count" type="button"><i
                                                        class="lnr lnr-chevron-down"></i></button>
                                            </div>
                                            <div class="size-product">
                                                <c:forEach var="size" items="${fn:split(product.size, ',')}">
                                                    <label style="margin-right: 10px;">
                                                        <input type="radio" name="selectedSize" value="${size}"
                                                            required>
                                                        ${size}
                                                    </label>
                                                </c:forEach>
                                            </div>
                                            <!-- <form action="/add-product-from-view-detail" method="post"
                                            modelAttribute="product"> -->
                                            <div class="d-flex justify-content-between">
                                                <div>
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}">
                                                    <input class="form-control d-none" type="text" value="${product.id}"
                                                        name="id">
                                                    <input class="form-control d-none" type="text" name="quantity"
                                                        id="cartDetails0.quantity" id="cartDetails0.quantity" value="1">
                                                    <button data-product-id="${product.id}" style="top: 20px;"
                                                        class="btnAddToCartDetail mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4 border-0">
                                                        Add to
                                                        Cart</button>
                                                </div>
                                            </div>

                                            <!-- </form> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--================End Single Product Area =================-->

                        <!--================Product Description Area =================-->
                        <section class="product_description_area">
                            <div class="container">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="contact-tab" data-toggle="tab" href="#contact"
                                            role="tab" aria-controls="contact" aria-selected="false">Comments</a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">
                                    <div class="tab-pane fade show active" id="contact" role="tabpanel"
                                        aria-labelledby="contact-tab">

                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="comment_list">
                                                    <c:forEach items="${comments}" var="comment">
                                                        <div class="review_item">
                                                            <div class="media">
                                                                <div class="d-flex">
                                                                    <img src="/client/img/product/review-3.png" alt="">
                                                                </div>
                                                                <div class="media-body">
                                                                    <h4>${comment.user.fullName}</h4>
                                                                </div>
                                                            </div>
                                                            <p>${comment.content}</p>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <form:form action="/comment/${product.id}" method="post"
                                                    modelAttribute="comment">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}">
                                                    <div class="review_box">
                                                        <h4>Đăng bình luận</h4>
                                                        <form class="row contact_form" action="contact_process.php"
                                                            method="post" id="contactForm" novalidate="novalidate">
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <textarea class="form-control" name="content"
                                                                        rows="1" placeholder="Message"></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 text-right">
                                                                <button type="submit" value="submit"
                                                                    class="btn primary-btn">Submit
                                                                    Now</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!--================End Product Description Area =================-->

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
                        <script src="/client/js/jquery.magnific-popup.min.js"></script>
                        <script src="/client/js/owl.carousel.min.js"></script>
                        <!--gmaps Js-->
                        <script
                            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
                        <script src="/client/js/gmaps.min.js"></script>
                        <script src="/client/js/main.js"></script>
                        <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

                    </body>

                    </html>