<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

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
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a product</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/product/create"
                                                enctype="multipart/form-data" modelAttribute="newProduct" class="row">

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Name:</label>
                                                    <c:set var="nameError">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:input type="text"
                                                        class="form-control ${not empty nameError ? 'is-invalid' : ''}"
                                                        path="name" />
                                                    ${nameError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price:</label>
                                                    <c:set var="priceError">
                                                        <form:errors path="price" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:input type="number" min="0" step="0.01"
                                                        class="form-control ${not empty priceError ? 'is-invalid' : ''}"
                                                        path="price" />
                                                    ${priceError}
                                                    <div class="invalid-feedback">
                                                        Price must be greater than or equal to 0.
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-12 ">
                                                    <label class="form-label">Detail description:</label>
                                                    <c:set var="detailDescError">
                                                        <form:errors path="detailDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:input type="text"
                                                        class="form-control ${not empty detailDescError ? 'is-invalid' : ''}"
                                                        path="detailDesc" />
                                                    ${detailDescError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Short description:</label>
                                                    <c:set var="shortDescError">
                                                        <form:errors path="shortDesc" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:input type="text"
                                                        class="form-control ${not empty shortDescError ? 'is-invalid' : ''}"
                                                        path="shortDesc" />
                                                    ${shortDescError}
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Quantity:</label>
                                                    <c:set var="quantityError">
                                                        <form:errors path="quantity" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <form:input type="number" min="0"
                                                        class="form-control ${not empty quantityError ? 'is-invalid' : ''}"
                                                        path="quantity" />
                                                    ${quantityError}
                                                    <div class="invalid-feedback">
                                                        Quantity must be greater than or equal to 0.
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="Cardian">Cardian</form:option>
                                                        <form:option value="Dress">Dress</form:option>
                                                        <form:option value="Jacket">Jacket</form:option>
                                                        <form:option value="Tee">Tee</form:option>
                                                        <form:option value="Order">Order</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Target:</label>
                                                    <form:select class="form-select" path="target">
                                                        <form:option value="MEN">Men</form:option>
                                                        <form:option value="WOMEN">Women</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Image:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        name="avatarFile" accept=".jpg, .jpeg, .png" required />
                                                    <div class="invalid-feedback">
                                                        Please choose an image file.
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <img style="max-height: 250px; display: none;" alt="avatarPreview"
                                                        id="avatarPreview">
                                                </div>
                                                <div class="mb-3 col-12 col-md-12">
                                                    <label class="form-label">Size:</label>
                                                    <form:checkbox path="size" value="S" />S
                                                    <form:checkbox path="size" value="M" />M
                                                    <form:checkbox path="size" value="L" />L
                                                    <form:checkbox path="size" value="XL" />XL
                                                    <form:checkbox path="size" value="XXL" />XXL
                                                </div>
                                                <div class="mb-5 col-12">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                </div>
                                            </form:form>
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