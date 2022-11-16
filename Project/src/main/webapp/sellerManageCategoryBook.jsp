<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seller Category Book</title>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/staffManageBook.css">
        <!-- BoxIcon CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    </head>

    <body>
        <!--header-->
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
                            <form action="sellerBookAction?action=searchBook" method="POST">
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

        <!-- sidebar -->
        <nav class="sidebar">
            <!-- link in sidebar -->
            <ul class="nav-links">
                <li>
                    <a href="sellerNodifyPage">
                        <i class='bx bxs-bell'></i>
                        <span class="links_name">Notification</span>
                    </a>
                </li>
                <li>
                    <a href="sellerCartAction?action=viewCart">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="links_name">Cart</span>
                    </a>
                </li>
                <li>
                    <a href="sellerOrderAction?action=getOrder">
                        <i class="fa-solid fa-basket-shopping"></i>
                        <span class="links_name">Order</span>
                    </a>
                </li>
                <li>

                    <a type="submit" href="sellerBookAction?action=bookPage1">
                        <i class='bx bx-book'></i>
                        <span class="links_name">Books</span>
                    </a>
                </li>

                <li>
                    <a href="./logoutAction">
                        <i class='bx bx-log-out'></i>
                        <span class="links_name">Log out</span>
                    </a>
                </li>
            </ul>
        </nav>

        <!-- home content -->
        <section class="home-section">
            <!-- home-content -->
                            <div class="categoryText">
                                <a style="color: black" type="submit" href="sellerBookAction?action=bookPage1">Category  </a> >
                                ${nameCategory}
                            </div>
                            <div class="itemList row">
                            <c:forEach items="${listCategoryBook}" var="b">
                                <div class="item col-lg-6">
                                <form style="height: 325px;width: 450px"action="sellerBookAction?action=bookDetail&bookId=${b.book_Id}&categoryId=${b.category}" method="POST">
                                    <div class="border">
                                    <img src="<c:url value="/images/${b.image_Book}"/>"/>
                                        <p class="name">${b.name}</p>
                                        <p class="price"><fmt:formatNumber value="${b.price_Book}" type="number"/>
                                            <small style="text-decoration:underline">đ</small> <button class="viewDetail btn btn-info" type="submit">View Detail</button><p>

                                    </div>
                                </form>
                                </div>
                            </c:forEach>
                            </div>
                                <%--Start Page--%>
                                <div class="page row">
                                    <div class="col-lg-4"></div>
                                    <div class="col-lg-4 d-flex justify-content-center">
                                        <ul class="pagination">
                                            <li class="page-item"><a class="page-link" href="sellerBookAction?action=${nameCategory}">1</a></li>
                                        <c:if test="${numLastCategory>4}">
                                            <li class="page-item"><a class="page-link" href="sellerBookAction?action=${nameCategory}">2</a></li>
                                        </c:if>
                                        <c:if test="${numLastCategory>8}">
                                            <li class="page-item"><a class="page-link" href="sellerBookAction?action=${nameCategory}">3</a></li>
                                        </c:if>
                                        </ul>
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                                <%-- End Page--%>
        </section>

        <script src="./js/script.js"></script>

    </body>
</html>