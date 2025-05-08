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
                <link rel="stylesheet" href="/client/css/tryon.css">
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
                                            <img class="img-fluid" style="height: 15rem;"
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
                                                <button data-product-id="${product.id}" style="top: 20px;"
                                                    class="btnAddToCartHomepage mx-auto btn border border-secondary rounded-pill px-3 primary-btn px-4">
                                                    Add to
                                                    Cart
                                                </button>
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

                <!-- Start Try-On Button and Modal -->
                <div class="tryon-btn" onclick="openTryOnModal()">
                    <span>Try-On</span>
                </div>

                <!-- Chatbot Button and Form -->
                <div class="chatbot-btn" onclick="toggleChatbot()">
                    <span>Chatbot</span>
                </div>

                <div class="chatbot-overlay" id="chatbotOverlay">
                    <div class="chatbot-container">
                        <div class="chatbot-header">
                            <h3>Karma Assistant</h3>
                            <button class="close-button" onclick="toggleChatbot()">×</button>
                        </div>
                        <div class="chatbot-messages" id="chatbotMessages">
                            <!-- Tin nhắn sẽ được thêm động bằng JavaScript -->
                        </div>
                        <div class="chatbot-input">
                            <input type="text" id="chatbotInput" placeholder="Type your message..."
                                onkeypress="if(event.key === 'Enter') sendMessage();" />
                            <button onclick="sendMessage()">Send</button>
                        </div>
                    </div>
                </div>

                <div class="tryOnOverlay" id="tryOnOverlay">
                    <div class="tryOnContainer">
                        <div class="header">
                            <h2>AI Virtual Try-On</h2>
                            <button class="closeButton" onclick="closeTryOnModal()">×</button>
                        </div>

                        <div class="mainContent">
                            <div class="sidebar">
                                <div class="optionBlock">
                                    <div class="sectionHeader">👤 Upload Model Image</div>
                                    <div class="uploadArea">
                                        <input type="file" id="modelInput" onchange="handleModelUpload(event)"
                                            accept="image/*" hidden />
                                        <div class="uploadPlaceholder"
                                            onclick="document.getElementById('modelInput').click()">
                                            <div id="modelPreviewWrapper">
                                                <div class="uploadPlus">+</div>
                                                <div>Click to upload model image</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="optionBlock">
                                    <div class="sectionHeader">👚 Select Dress</div>
                                    <div class="buttonGroup">
                                        <button class="optionButton" id="uploadDressBtn"
                                            onclick="setDressSource('upload')">Upload</button>
                                        <!-- <button class="optionButton active" id="productDressBtn" onclick="setDressSource('product')">Use Product</button> -->
                                    </div>

                                    <div id="dressUploadSection">
                                        <div class="uploadArea">
                                            <input type="file" id="dressInput" onchange="handleDressUpload(event)"
                                                accept="image/*" hidden />
                                            <div class="uploadPlaceholder"
                                                onclick="document.getElementById('dressInput').click()">
                                                <div id="dressPreviewWrapper">
                                                    <div class="uploadPlus">+</div>
                                                    <div>Click to upload dress image</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="uploadArea">
                                            <input type="file" id="pantsInput" onchange="handlePantsUpload(event)"
                                                accept="image/*" hidden />
                                            <div class="uploadPlaceholder"
                                                onclick="document.getElementById('pantsInput').click()">
                                                <div id="pantsPreviewWrapper">
                                                    <div class="uploadPlus">+</div>
                                                    <div>Click to upload pants image (optional)</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="productSection" style="display: block;">
                                        <div class="productSection">
                                            <div id="selectedProductPreview" class="selectedProductPreview"
                                                style="display: none;"></div>
                                            <div class="productGrid" id="productGrid">
                                                <!-- Sản phẩm sẽ được đổ động bằng JavaScript -->
                                            </div>
                                        </div>
                                    </div>

                                    <button class="generateButton" id="generateButton"
                                        onclick="handleGenerateImage()">Generate</button>
                                </div>
                            </div>

                            <div class="displayArea" id="displayArea">
                                <div class="emptyState" id="emptyState">
                                    <div class="emptyIcon">👚</div>
                                    <div class="emptyText">Upload a model image and select a dress to see the result
                                    </div>
                                </div>
                                <div class="loadingState" id="loadingState" style="display: none;">
                                    <div class="spinner"></div>
                                    <div>Generating your virtual try-on...</div>
                                </div>
                                <div class="resultContainer" id="resultContainer" style="display: none;">
                                    <img id="generatedImage" alt="Try-On Result" />
                                    <div class="resultButtons">
                                        <button class="actionButton" onclick="handleDownload()">Download</button>
                                        <button class="actionButton" onclick="handleClearGenerated()">Clear</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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