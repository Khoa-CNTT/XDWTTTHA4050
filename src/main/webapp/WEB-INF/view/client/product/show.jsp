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
                    <style>
                        .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                        }
                    </style>
                    <meta name="_csrf" content="${_csrf.token}" />
                    <!-- default header name is X-CSRF-TOKEN -->
                    <meta name="_csrf_header" content="${_csrf.headerName}" />

                    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                        rel="stylesheet">

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
                                    <div class="common-filter" id="sizeFilter">
                                        <div class="head">Size</div>
                                        <form action="#">
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size" value="S"><label
                                                    style="margin-bottom: -15px;">S</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size" value="M"><label
                                                    style="margin-bottom: -15px;">M</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size" value="L"><label
                                                    style="margin-bottom: -15px;">L</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size" value="XL"><label
                                                    style="margin-bottom: -15px;">XL</label></div>
                                            <div class="form-check form-check-inline"><input class="pixel-radio"
                                                    type="checkbox" name="size" value="XXL"><label
                                                    style="margin-bottom: -15px;">XXL</label></div>
                                        </form>
                                    </div>
                                    <div class="common-filter" id="factoryFilter">
                                        <div class="head">Brands</div>
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand" value="Cardian"><label>Cardian</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand" value="Dress"><label>Dress</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand" value="Jacket"><label>Jacket</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand" value="Tee"><label>Tee</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="brand" value="Order"><label>Order</label></li>
                                            </ul>
                                        </form>
                                    </div>
                                    <div class="common-filter" id="targetFilter">
                                        <div class="head">Đối tượng</div>
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="target" value="men"><label>Nam</label></li>
                                                <li class="filter-list"><input class="pixel-radio" type="checkbox"
                                                        name="target" value="women"><label>Nữ</label></li>
                                            </ul>
                                        </form>
                                    </div>
                                    <div class="common-filter">
                                        <div class="head">Price</div>
                                        <form action="#">
                                            <ul>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="price" value="gia-tang-dan"><label>Giá tăng dần</label>
                                                </li>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="price" value="gia-giam-dan"><label>Giá giảm dần</label>
                                                </li>
                                                <li class="filter-list"><input class="pixel-radio" type="radio"
                                                        name="price" value="gia-nothing" checked><label>Không sắp
                                                        xếp</label>
                                                </li>
                                            </ul>
                                        </form>
                                    </div>
                                    <div class="common-filter">
                                        <button style="top: 20px;"
                                            class="mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4 border-0"
                                            id="btnFilter">
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
                                        <c:if test="${totalPages == 0}">
                                            <h1>Không có sản phẩm nào</h1>
                                        </c:if>

                                        <c:forEach items="${products}" var="product">
                                            <div class="col-lg-3 col-lg-4">
                                                <div class="single-product">
                                                    <a href="/product/${product.id}">
                                                        <img class="img-fluid" style="height: 15rem;"
                                                            src="resources/images/product/${product.image}" alt="">
                                                    </a>
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
                                                        <!-- <form action="/add-product-to-cart/${product.id}" method="post"> -->
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}">
                                                        <button data-product-id="${product.id}" style="top: 20px;"
                                                            class="btnAddToCartHomePage mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4 border-0">
                                                            Add to
                                                            Cart</button>
                                                        <!-- </form> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </section>
                                <!-- End Best Seller -->
                                <!-- Start Pagination -->
                                <c:if test="${totalPages > 0}">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item">
                                                <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                    href="/product?page=${currentPage - 1}${queryString}"
                                                    aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                <li class="page-item">
                                                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                        href="/product?page=${loop.index + 1}${queryString}">
                                                        ${loop.index + 1}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                    href="/product?page=${currentPage + 1}${queryString}"
                                                    aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </c:if>
                                <!-- End Pagination -->
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
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
                </body>

                </html>