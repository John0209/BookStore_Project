<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Manage Books</title>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/adminManageBooksStyle.css">
        <!-- BoxIcon CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    </head>

    <body>

        <div class="header">
            <div class="header-menu">
                <!-- even menu sidebar -->
                <div class="sidebar-button__logo">
                    <div class="sidebar-button">
                        <i class='bx bx-menu sidebarBtn'></i>
                        <!-- <span class="dashboard">Dashboard</span> -->
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
                            <form action="adminBookAction?action=searchBook" method="POST">
                                <input type="text" placeholder="Search..." name="search" value="${search}">
                                <button type='submit'><i class='bx bx-search-alt-2'></i></button>
                            </form>
                        </div>
                        <div class="profile_details">
                            <img src="images/admin1.png" alt="image admin">
                            <div class="name_role">
                                <span class="name">${sessionScope.USER["fullName"]}</span>
                                <i class='bx bxs-chevron-down'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
        <section class="home-section">

            <form class="formCategory" action="adminBookAction" method="POST">
                <spam class="categoryText">Category</spam>
                <select class="comboxCategory" name="action">
                    <option value="Romance">Romance</option>
                    <option value="Self-help">Self-help</option>
                    <option value="Novel">Novel</option>
                    <option value="Fantasy">Fantasy</option>
                </select>
                <button class="choice btn btn-secondary" type="submit">Go</button>
            </form><br/>
            <div class="itemList row">
                <c:forEach items="${listBook}" var="b">
                    <div class="item col-lg-6">
                        <form style="height: 325px;width: 450px"
                              action="adminBookAction?action=bookDetail&bookId=${b.book_Id}&categoryId=${b.category}"
                              method="POST">
                            <div class="border">
                                <img src="<c:url value="/images/${b.image_Book}"/>"/>
                                <p class="name">${b.name}</p>
                                <p class="price">
                                    <fmt:formatNumber value="${b.price_Book}" type="number"/>
                                    <small style="text-decoration:underline">đ</small>
                                    <button class="viewDetail btn btn-info" type="submit">View Detail
                                    </button>
                                <p>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
            <div class="page row">
                <div class="col-lg-4"></div>
                <div class="col-lg-4 d-flex justify-content-center" >
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="adminBookAction?action=bookPage1">1</a></li>
                        <li class="page-item"><a class="page-link" href="adminBookAction?action=bookPage2">2</a></li>
                        <li class="page-item"><a class="page-link" href="adminBookAction?action=bookPage3">3</a></li>
                        <li class="page-item"><a class="page-link" href="adminBookAction?action=bookPage4">4</a></li>
                        <c:if test="${numLastBook>16}">
                            <li class="page-item"><a class="page-link" href="adminBookAction?action=bookPage5">5</a></li>
                        </c:if>
                        <c:if test="${numLastBook>20}">
                            <li class="page-item"><a class="page-link" href="adminBookAction?action=bookPage6">6</a></li>
                        </c:if>
                    </ul>
                </div>
                <div class="col-lg-4"></div>
            </div>
        </section>
        <script src="./js/script.js"></script>

    </body>

</html>