<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Book Detail</title>

    <!-- BoxIcon CDN Link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- link file CSS -->
    <link rel="stylesheet" href="./css/sellerManageBookDetail.css">
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
                    <input type="text" placeholder="Search...">
                    <button type="submit"><i class='bx bx-search-alt-2'></i></button>
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

                    <div class="categoryText">
                        <a style="color: black" href="sellerBookAction?action=bookPage1">Category </a> >
                        <a style="color: #17A2B8" href="sellerBookAction?action=${nameCategory}"> ${nameCategory}</a>
                    </div>
                    <c:forEach items="${listBook}" var="b" varStatus="loop">
                        <c:set var="bookId" value="${bookIdServlet}"></c:set>
                        <c:if test="${b.book_Id==bookId}">

                            <%--Item Book Need Show--%>
                            <div class="itemList row">
                                <div class="border col-lg-4">
                                    <img src="<c:url value="/images/${b.image_Book}"/>" class="rounded"/><br/>
                                </div>
                                <div class="item col-lg-5">
                                    <strong class="name">${b.name}</strong>
                                    <p class="price">
                                            <fmt:formatNumber value="${b.price_Book}" type="number"/>
                                        <small style="text-decoration:underline">đ</small>
                                    <p><br/>
                                    <p class="quantity">Quantity: ${b.quantity_Book}</p>
                                    <p class="author">Author: <u>${b.author}</u></p>
                                    <p class="yearPublic">Year Of Public: ${b.year_Of_Public}</p>
                                        <%--   Button add Add Cart and Importation--%>
                                    <div class="button">
                                        <button class="inventory btn btn-info" data-toggle="modal"
                                                data-target="#myModal${loop.index}">Add Cart
                                        </button>

                                    </div>
                                </div>
                            </div>
                            <div class="boxDescription">
                                <div class="description">
                                    <strong>Information Detail</strong>
                                    <p class="text">${b.descriptionBook}</p>
                                </div>
                            </div>
                            <%--                            End Show Item Book--%>
                            <%--Form Add Cart--%>
                            <div class="modal fade" id="myModal${loop.index}">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <header class="head-form">
                                            <h2 style="text-align: center;font-size: 25px;color: red">Add Book To Cart</h2>
                                        </header>

                                        <div class="modal-body">
                                                <%--Form --%>
                                            <form action="sellerCartAction?action=addToCart" method="POST">
                                                    <%--  ID BOOK Insert To Inventory SQL--%>
                                                <input type="hidden" name="book_Id_Cart" value="${bookIdServlet}"/>
                                                <input type="hidden" name="orderId" value="0"/>
                                                        <input type="hidden" name="quantityBook" value="${b.quantity_Book}"/>
                                                    <%--  DO Quantity Add to Cart --%>

                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"><i class="fa fa-address-book"></i></span>
                                                        </div>
                                                        <input type="number" name="quantity" class="form-control input-sm"
                                                               style="font-size: 15px" placeholder="Quantity" required min="1" max="${b.quantity_Book}">
                                                    </div>
                                                </div>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer" id="modal-footer">
                                            <button type="submit" class="btn btn-info add">Add</button>
                                            </form>
                                            <button class="btn btn-warning xclose" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--End Form Add Cart--%>

                        </c:if>
                    </c:forEach>

</section>

<script src="./js/script.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>