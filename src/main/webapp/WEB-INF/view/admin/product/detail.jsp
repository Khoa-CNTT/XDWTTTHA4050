<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - SB Admin</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">Dashboard</li>
                                    </ol>
                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Product Detail with id: ${id}</h3>
                                                </div>
                                                <hr />
                                                <div class="card" style="width: 60%">
                                                    <img src="/images/product/${product.image}" alt="Product Image"
                                                        class="card-img-top">
                                                    <div class="card-header">
                                                        <h3>Product information</h3>
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">ID: ${product.id}</li>
                                                        <li class="list-group-item">Name: ${product.name}</li>
                                                        <li class="list-group-item">Price:
                                                            <fmt:formatNumber value="${product.price}"
                                                                pattern="#,###" /> đ
                                                        </li>
                                                    </ul>
                                                </div>
                                                <a href="/admin/product" class="btn btn-primary">Back</a>

                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </main>
                            <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>