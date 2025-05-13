<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <title>Dashboard - SB Admin</title>
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <link href="css/styles.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
            <div id="layoutSidenav">
                <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Dashboard</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item active">Thống kê</li>
                            </ol>
                            <div class="row">
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-primary text-white mb-4">
                                        <div class="card-body">Số lượng sản phẩm (${productCount})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/product">View Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6"> 
                                    <div class="card bg-warning text-white mb-4">
                                        <div class="card-body">Số lượng đơn hàng (${orderCount})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/order">View Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-md-6">
                                    <div class="card bg-success text-white mb-4">
                                        <div class="card-body">Số lượng khách hàng (${userCount})</div>
                                        <div class="card-footer d-flex align-items-center justify-content-between">
                                            <a class="small text-white stretched-link" href="/admin/user">View Details</a>
                                            <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-pie me-1"></i>
                                            Thống kê thanh toán
                                        </div>
                                        <div class="card-body">
                                            <canvas id="paymentPieChart" width="100%" height="40"></canvas>
                                        </div>
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
            <script src="js/scripts.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
                crossorigin="anonymous"></script>
            <script src="js/chart-area-demo.js"></script>
            <script src="js/chart-bar-demo.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
            <script>
                fetch('/api/orders/total-price-by-payment-status')
                    .then(response => response.json())
                    .then(data => {
                        console.log("Data from API:", data);
            
                        const ctx = document.getElementById('paymentPieChart').getContext('2d');
            
                        const parseNumberFromVND = (vndString) => {
                
                            const cleanString = vndString.replace(" VND", "").replace(/\./g, "");
                            return parseFloat(cleanString) || 0; 
                        };
            
                        const successValue = parseNumberFromVND(data.success); 
                        const unpaidValue = parseNumberFromVND(data.unpaid);  
            
                        new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: ['Đã thanh toán', 'Chưa thanh toán'],
                                datasets: [{
                                    data: [successValue, unpaidValue],
                                    backgroundColor: ['#28a745', '#dc3545'],
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                responsive: true,
                                plugins: {
                                    legend: {
                                        position: 'bottom'
                                    },
                                    title: {
                                        display: true,
                                        text: 'Tổng giá trị đơn hàng theo trạng thái thanh toán'
                                    },
                                    tooltip: {
                                        callbacks: {
                                            label: function(tooltipItem) {
                                                const label = tooltipItem.label || '';
                                                const originalValue = [data.success, data.unpaid][tooltipItem.dataIndex];
                                                return `${label}: ${originalValue}`;
                                            }
                                        }
                                    }
                                }
                            }
                        });
                    })
                    .catch(error => {
                        console.error('Lỗi khi lấy dữ liệu thống kê:', error);
                    });
            </script>
            
        </body>

        </html>