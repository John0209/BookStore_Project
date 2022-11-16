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
        <link rel="stylesheet" href="./css/adminOverViewStyle.css">
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

                <h2 style="text-align: center;
                    align-items: center; padding-top: 1.5rem;
                    color: #fab804ea;">
                    PHƯƠNG NAM BOOKSTORE MANAGEMENT    
                </h2>
                <!-- home-content -->
                <div class="home-content">

                    <div class="overview-boxes">


                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Dashboard</div>
                                <div class="number"><img class="imageOverview" src="./images/adminDashboard.png" alt="dashboardImg"/></div>
                                <div class="indicator">
                                    <i class='bx bx-notepad'></i>
                                    <span class="text">Show Statistic Values</span>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Employees</div>
                                <div class="number"><img class="imageOverview" src="./images/adminEmployees.png" alt="empImg"/></div>
                                <div class="indicator">
                                    <i class='bx bx-notepad'></i>
                                    <span class="text">Show List Information Of Staffs And Sellers</span>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Booking Request</div>
                                <div class="number"><img class="imageOverview" src="./images/adminBookingRequest.png" alt="BookRequestImg"/></div>
                                <div class="indicator">
                                    <i class='bx bx-notepad'></i>
                                    <span class="text">Show List Booking Request </span>
                                </div>
                            </div>
                        </div>

                        <div class="box">
                            <div class="left-side">
                                <div class="boxtopic">Books</div>
                                <div class="number"><img class="imageOverview" src="./images/adminBook.png" alt="BookImg"/></div>
                                <div class="indicator">
                                    <i class='bx bx-notepad'></i>
                                    <span class="text">Show Infor Of List Books</span>
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