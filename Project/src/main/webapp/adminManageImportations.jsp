<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Manage Importations</title>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/adminManageImportationsStyle.css">
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
                            <!--SEARCH_EMPLOYEE-->
                            <form action="adminShowListImportations">
                                <input type="text" placeholder="Search... " name="txtSearch" value="${param.txtSearch}">
                                <button type='submit'><i class='bx bx-search-alt-2'></i></button>
                            </form>
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
                    <div class="overview-tableEmployee">
                        <h2 id="nameTable">LIST OF IMPORTATIONS</h2>
                        <div class="tableEmployee">
                            <table id="employees">
                                <c:set var="listImportations" value="${requestScope.LIST_IMPORTATIONS}"/>
                                <c:if test="${not empty listImportations}">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>NameBook</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Total</th>
                                            <th>Date Importation</th>
                                            <th>Note</th>
                                            <th>Employee Implement</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="importationDTO" items="${listImportations}" varStatus="counter">
                                            <tr>
                                                <td>${counter.count}</td>
                                                <td>
                                                    ${importationDTO.import_Name_Book}
                                                </td>
                                                <td>
                                                    ${importationDTO.import_Quantity_Request}
                                                </td>
                                                <td><fmt:formatNumber value="${importationDTO.import_Detail_Price_Book}" type="number"/>
                                                    <small style="text-decoration:underline">đ</small>
                                                </td>
                                                <td><fmt:formatNumber value="${importationDTO.import_Detail_Total}" type="number"/>
                                                    <small style="text-decoration:underline">đ</small>
                                                </td>

                                                <td>
                                                    ${importationDTO.import_Date}
                                                </td>
                                                <td>
                                                    ${importationDTO.import_Note}
                                                </td>
                                                <td>
                                                    ${importationDTO.import_Employee}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${empty listImportations}">
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
        <script src="./js/script.js"></script>
    </body>
</html>