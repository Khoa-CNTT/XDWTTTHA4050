<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Shop</title>
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <link rel="stylesheet" href="/client/css/linearicons.css">
                    <link rel="stylesheet" href="/client/css/owl.carousel.css">
                    <link rel="stylesheet" href="/client/css/font-awesome.min.css">
                    <link rel="stylesheet" href="/client/css/themify-icons.css">
                    <link rel="stylesheet" href="/client/css/nice-select.css">
                    <link rel="stylesheet" href="/client/css/nouislider.min.css">
                    <link rel="stylesheet" href="/client/css/bootstrap.css">
                    <link rel="stylesheet" href="/client/css/main.css">
                    <link rel="shortcut icon" href="/client/img/fav.png">


                </head>


                <body id="category">

                    <jsp:include page="/WEB-INF/view/client/layout/header.jsp"></jsp:include>

                    <!-- Start Banner Area -->
                    <section class="banner-area organic-breadcrumb">
                        <div class="container">
                            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                                <div class="col-first">
                                    <h1>Shop Category page</h1>
                                    <nav class="d-flex align-items-center">
                                        <a href="/">Home<span class="lnr lnr-arrow-right"></span></a>
                                        <a href="/product">Shop</a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- End Banner Area -->
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-3 col-lg-4 col-md-5">
                                <div class="sidebar-categories">
                                    <div class="head">Product Filters</div>
                                </div>
                                <div class="sidebar-filter mt-50">
                                    <div class="common-filter">
                                        <div class="head">Size</div>
                                        <form action="#">
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">36</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">37</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">38</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">39</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">41</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">42</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">43</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size"><label
                                                    style="margin-bottom: -15px;">44</label></div>
                                        </form>
                                    </div>
                                    <div class="common-filter">
                                        <div class="head">Brands</div>
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand"><label>Adidas</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand"><label>Nike</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand"><label>Converse</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand"><label>Puma</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand"><label>Vans</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand"><label>Fila</label></li>
                                            </ul>
                                        </form>
                                    </div>
                                    <div class="common-filter">
                                        <div class="head">Đối tượng</div>
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="target"><label>Nam</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="target"><label>Nữ</label></li>
                                            </ul>
                                        </form>
                                    </div>
                                    <div class="common-filter">
                                        <div class="head">Price</div>
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="price"><label>Giá tăng dần</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="price"><label>Giá giảm dần</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="price"><label>Không sắp xếp</label></li>
                                            </ul>
                                        </form>
                                    </div>
                                    <div class="common-filter">
                                        <button style="top: 20px;"
                                            class="mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4 border-0">
                                            Lọc sản phẩm
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-8 col-md-7">

                                <!-- Start Best Seller -->
                                <section class="lattest-product-area pb-40 category-list">
                                    <!-- single product -->
                                    <div class="row">
                                        <c:forEach items="${products}" var="product">
                                            <div class="col-lg-3 col-lg-4">
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
                                                                <fmt:formatNumber value="${product.price}"
                                                                    pattern="#,###" />₫
                                                            </h6>
                                                        </div>
                                                        <form action="/add-product-to-cart/${product.id}" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}">
                                                            <button style="top: 20px;"
                                                                class="mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4 border-0">
                                                                Add to
                                                                Cart</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </section>
                                <!-- End Best Seller -->
                                <!-- Start Filter Bar -->
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                href="/product?page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                        <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                            <li class="page-item">
                                                <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                    href="/product?page=${loop.index + 1}">
                                                    ${loop.index + 1}
                                                </a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item">
                                            <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                href="/product?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                                <!-- End Filter Bar -->
                            </div>
                        </div>
                    </div>

                    <!-- start footer Area -->
                    <jsp:include page="/WEB-INF/view/client/layout/footer.jsp"></jsp:include>
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
                    <script src="/client/js/main.js"></script>
                </body>

                </html>