<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/adminHomeStyle.css">
        <!-- BoxIcon CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <body>
        <div class="header">
            <div class="header-menu">
                <!-- even menu sidebar -->
                <div class="sidebar-button__logo">
                    <div class="sidebar-button">
                        <i class='bx bx-menu sidebarBtn'></i>
                    </div>
                    <!-- div of logo -->
                    <div class="logo-details">
                        <img src="./images/logo.jpg" alt="Logo Phuong Nam Bookstore">
                        <span class="logo_name">Book Store</span>
                    </div>
                </div>
                <div class="seachbox-profile">
                    <div class="wraper_searchbox_profile">
                        <div class="search-box">
                            <input type="text" placeholder="Search...">
                            <button type='submit'><i class='bx bx-search-alt-2'></i></button>
                        </div>
                        <div class="profile_details">
                            <img src="./images/admin1.png" alt="image admin">
                            <div class="name_role">
                                <span class="name">${sessionScope.USER["fullName"]}</span>
                                <i class='bx bxs-chevron-down'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="wrapper-body">
            <div class="sidebar">
                <!-- link in sidebar -->
                <ul class="nav-links">
                    <li>
                        <a href="./adminOverViewPage">
                            <i class='bx bx-home'></i>
                            <span class="links_name">Overview</span>
                        </a>
                    </li>
                    <li>
                        <a href="./adminManageInforDashboard">
                            <i class='bx bx-grid-alt'></i>
                            <span class="links_name">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="./adminShowListEmployees">
                            <i class='bx bx-user'></i>
                            <span class="links_name">Employees</span>
                        </a>
                    </li>
                    <li>
                        <a href="./adminShowListBookingRequest">
                            <i class='bx bx-import'></i>
                            <span class="links_name">Booking Request</span>
                        </a>
                    </li>
                    <li>
                        <a type="submit" href="adminBookAction?action=bookPage1">
                            <i class='bx bx-book'></i>
                            <span class="links_name">Books</span>
                        </a>
                    </li>
                    <li>
                        <a href="./adminShowListImportations">
                            <i class='bx bxs-report'></i>
                            <span class="links_name">Importation</span>
                        </a>
                    </li>
                    <!--                    <li>
                                            <a href="./adminShowListOrders">
                                                <i class='bx bx-list-ol'></i>
                                                <span class="links_name">Order</span>
                                            </a>
                                        </li>-->
                    <li>
                        <a href="./logoutAction">
                            <i class='bx bx-log-out'></i>
                            <span class="links_name">Log out</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- home content -->
            <div class="home-section">
                <!-- home-content -->
                <div class="home-content">

                    <div class="overview-boxes">

                        <c:set var="sumOfTotalOrder" value="${requestScope.TOTAL_OF_ORDER}"/>
                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Total Order</div>
                                <div class="number" style="color: #267871;">
                                   <fmt:formatNumber value="${sumOfTotalOrder}" type="number"/>
                                        <small style="text-decoration:underline">Đ</small>
                                   </div>
                                <div class="indicator">
                                    <i class='bx bx-up-arrow-alt box1'></i>
                                    <span class="text">During The Current Year</span>
                                </div>
                            </div>
                        </div>

                        <c:set var="sumTotalMoneyLastMonthBookRequest" value="${requestScope.TOTAL_MONEY_OF_LAST_MONTH}"/>        
                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Total Money Of Request</div>
                                <div class="number" style="color: #0d8cba;">
                                <fmt:formatNumber value="${sumTotalMoneyLastMonthBookRequest}" type="number"/>
                                    <small style="text-decoration:underline">Đ</small>
                                </div>
                                <div class="indicator">
                                    <i class='bx bx-up-arrow-alt box2'></i>
                                    <span class="text">Money Book Request Last Month</span>
                                </div>
                            </div>
                        </div>

                        <c:set var="totalOfQuantityInventoryCurrentYear" value="${requestScope.TOTAL_QUANTITY_INVENTORY_CURRENT_YEAR}"/>        
                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Total Inventory</div>
                                <div class="number"  style="color: #bcd214;">${totalOfQuantityInventoryCurrentYear} Book(s)</div>
                                <div class="indicator">
                                    <i class='bx bx-up-arrow-alt box3'></i>
                                    <span class="text">Inventory Current Year</span>
                                </div>
                            </div>
                        </div>

                        <c:set var="listMostInventoryBook" value="${requestScope.MOST_INVENTORY_BOOK}"/>
                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Most Remaining Books</div>
                                <c:forEach var="bookDTO" items="${listMostInventoryBook}">
                                    <div class="number" style="color: #ed6b15;">${bookDTO.quantity_Book} Book(s)</div>
                                    <div class="name-product">Name: ${bookDTO.name}</div>
                                    <div class="indicator">
                                        <i class='bx bx-up-arrow-alt box4'></i>
                                        <span class="text">Year Of Public: ${bookDTO.year_Of_Public}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <!-- add chart -->
                    <div class="graphBox">
                        <!--                        <div class="boxShow">
                                                    <canvas id="myChart" style="max-height: 440px; width:100%"></canvas>
                                                </div>-->
                        <div class="boxShow">
                            <div class="overview-tableEmployee">
                                <h2 id="nameTable">TOTAL ORDER / MONTH</h2>
                                <div class="tableEmployee">
                                    <table id="totalOrder">
                                        <c:set var="listStatisticTotalIn12Month" value="${requestScope.TOTAL_ORDER_EACH_MONTH}"/>
                                        <c:if test="${not empty listStatisticTotalIn12Month}">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Month</th>
                                                    <th>Year</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="listTotalDTO" items="${listStatisticTotalIn12Month}" varStatus="counter">
                                                    <tr>
                                                        <td>
                                                            ${counter.count}
                                                        </td>
                                                        <td>
                                                            ${listTotalDTO.date_To_Order_Month}
                                                        </td>
                                                        <td>
                                                            ${listTotalDTO.date_To_Order_Year}
                                                        </td>
                                                        <td><fmt:formatNumber value="${listTotalDTO.total_Order}" type="number"/>
                                                            <small style="text-decoration:underline">đ</small>
                                                        </td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${empty listStatisticTotalIn12Month}">
                                        <h2 style="text-align: center;
                                            align-items: center;
                                            color: red">
                                            NOT HAVE THE RECORD !       
                                        </h2>
                                    </c:if> 
                                </div>
                            </div>
                        </div>
                        <div class="boxShow">
                            <div class="overview-tableEmployee">
                                <h2 id="nameTable">TOTAL BOOKING REQUEST / MONTH</h2>
                                <div class="tableEmployee">
                                    <table id="totalBooking">
                                        <c:set var="listStatisticTotalBookingRequestIn12Month" value="${requestScope.TOTAL_BOOKING_REQUEST_EACH_MONTH}"/>
                                        <c:if test="${not empty listStatisticTotalBookingRequestIn12Month}">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Month</th>
                                                    <th>Year</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="listTotalBookingRequestDTO" items="${listStatisticTotalBookingRequestIn12Month}" varStatus="counter">
                                                    <tr>
                                                        <td>
                                                            ${counter.count}
                                                        </td>
                                                        <td>
                                                            ${listTotalBookingRequestDTO.date_To_Order_Month}
                                                        </td>
                                                        <td>
                                                            ${listTotalBookingRequestDTO.date_To_Order_Year}
                                                        </td>
                                                        <td><fmt:formatNumber value="${listTotalBookingRequestDTO.total_Order}" type="number"/>
                                                            <small style="text-decoration:underline">đ</small>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    <c:if test="${empty listStatisticTotalBookingRequestIn12Month}">
                                        <h2 style="text-align: center;
                                            align-items: center;
                                            color: red">
                                            NOT HAVE THE RECORD !       
                                        </h2>
                                    </c:if> 
                                </div>
                            </div>  
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="./js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
        <!--<script src="./js/my_chart.js"></script>-->
    </body>

</html>