<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Login</title>
                <!-- Latest compiled and minified CSS -->
                <link rel="shortcut icon" href="/client/img/fav.png">

                <link rel="stylesheet" href="/client/css/linearicons.css">
                <link rel="stylesheet" href="/client/css/owl.carousel.css">
                <link rel="stylesheet" href="/client/css/themify-icons.css">
                <link rel="stylesheet" href="/client/css/font-awesome.min.css">
                <link rel="stylesheet" href="/client/css/nice-select.css">
                <link rel="stylesheet" href="/client/css/nouislider.min.css">
                <link rel="stylesheet" href="/client/css/bootstrap.css">
                <link rel="stylesheet" href="/client/css/main.css">


            </head>


            <body>
                <!--================Login Box Area =================-->
                <section class="login_box_area section_gap">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="login_box_img">
                                    <img class="img-fluid" src="/client/img/login.jpg" alt="">
                                    <div class="hover">
                                        <h4>New to our website?</h4>
                                        <p>There are advances being made in science and technology everyday, and a good
                                            example of this is the</p>
                                        <a class="primary-btn" href="/register">Create an Account</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="login_form_inner">
                                    <h3>Log in to enter</h3>
                                    <form class="row login_form" action="/login" method="post" novalidate="novalidate">
                                        <c:if test="${param.error != null}">
                                            <div class="my-2" style="color: red;">Invalid email or password.</div>
                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="my-2" style="color: green;">You have been logged out.</div>
                                        </c:if>
                                        <div class="col-md-12 form-group">
                                            <input type="text" class="form-control" id="name" name="username"
                                                placeholder="Username" onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = 'Username'">
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <input type="password" class="form-control" id="name" name="password"
                                                placeholder="Password" onfocus="this.placeholder = ''"
                                                onblur="this.placeholder = 'Password'">
                                        </div>
                                        <div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <button type="submit" value="submit" class="primary-btn">Log In</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--================End Login Box Area =================-->

                <jsp:include page="/WEB-INF/view/client/layout/footer.jsp" />


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
            </body>

            </html>