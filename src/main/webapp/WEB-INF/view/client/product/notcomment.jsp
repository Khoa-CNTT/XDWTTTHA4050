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
                <meta name="_csrf" content="${_csrf.token}" />
                <!-- default header name is X-CSRF-TOKEN -->
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
                    rel="stylesheet">


            </head>


            <body>

                <!-- Start Header Area -->
                <jsp:include page="/WEB-INF/view/client/layout/header.jsp" />
                <!-- End Header Area -->

                <div class="container" style="margin-top: 100px;">
                    <div class="row ">
                        <div class="col-12 mt-5">
                            <div class="alert alert-danger" role="alert">
                                Bạn không được để lại bình luận khi chưa mua hàng
                            </div>
                        </div>
                    </div>
                </div>

                <!-- start features Area -->
                <jsp:include page="/WEB-INF/view/client/layout/features.jsp" />
                <!-- end features Area -->


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
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
            </body>

            </html>