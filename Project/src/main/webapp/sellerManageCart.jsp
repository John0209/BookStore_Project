<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Cart</title>

    <!-- BoxIcon CDN Link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <%--    Link Button CSS--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- link file CSS -->
    <link rel="stylesheet" href="css/sellerManageCart.css">
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
                    <img src="images/admin1.png" alt="image admin">
                    <div class="name_role">
                        <span class="name">${sessionScope.USER["fullName"]}</span>
                        <i class='bx bxs-chevron-down'></i>
                    </div>
                </div>
            </div>
        </div>
        <%-- Form Update --%>
        <c:set var="toast" value="${update}"></c:set>
        <c:if test="${toast==1}">
            <div  class="toastx">
                <div class="toast-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="toast-body">
                    <h3 class="toast-title">Update Success</h3>
                    <p class="toast-msg"> Book ${nameBook} Has Been Successfully Update</p>
                </div>
            </div>
        </c:if>
        <%-- End Form Update --%>
        <%-- Form Delete --%>
        <c:set var="toast" value="${count}"></c:set>
        <c:if test="${toast==1}">
            <div  class="toastx">
                <div class="toast-icon">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div class="toast-body">
                    <h3 class="toast-title">Delete Success</h3>
                    <p class="toast-msg"> Book ${nameBook} Has Been Successfully Deleted</p>
                </div>
            </div>
        </c:if>
        <%-- End Form Delete --%>
    </div>

</div>

<div class="wrapper-body">
    <div class="sidebar">
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
    </div>

    <!-- home content -->
    <div class="home-section">
        <!-- home-content -->
        <h2 id="nameTable">YOUR CART</h2>
        <%--End Home Content--%>

        <%--  Write   Body Code--%>
        <c:forEach var="x" items="${listCart}" varStatus="loop">

            <%--Start Show Item Cart--%>
            <div class="cartDetail">
                    <%--Start Show Item--%>
                <div class="itemDetail">

                    <div>
                        <img style="height: 100px;width: 100px"
                             src="<c:url value="/images/${x.image}"/>"/>
                    </div>
                    <div>
                        <p id="nameBook"> ${x.bookName}</p><br>
                        <div class="price">
                            <p id="quantity">x${x.quantity}</p>
                            <p id="total"><fmt:formatNumber type="number" value="${x.quantity * x.price}"/>
                                <small style="text-decoration:underline">đ</small></p>
                        </div>
                    </div>
                        <%-- End Show Item --%>

                        <%-- Start button Update Cart--%>
                    <button style="font-size: 30px;border: none" id="btnUpdate" data-toggle="modal"
                            data-target="#myModalUpdate${loop.index}"><i class="fa-solid fa-pen-to-square"></i>
                    </button>
                        <%-- End button Update Cart--%>
                    <c:set var="total" value="${total + x.quantity * x.price}"></c:set>
                        <%-- Start button Delete Cart--%>
                    <button style="font-size: 30px;border: none" data-toggle="modal" id="btnDelete"
                            data-target="#myModal${loop.index}"><i class="fa-solid fa-trash"></i>
                    </button>
                        <%-- End button Delte Cart--%>

                </div>
                    <%-- End Show Item Cart--%>

                    <%--Delete Book Cart--%>
                <div class="modal fade" id="myModal${loop.index}">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <header class="head-form mb-0">
                                <h2>Are You Sure To Delete The Book ?</h2>
                            </header>

                            <div class="modal-body">
                                    <%--Form --%>
                                <form action="sellerCartAction?action=deleteCart" method="POST">
                                    <input type="hidden" name="count"
                                           value="1"/>
                                    <input type="hidden" name="nameBook"
                                           value="${x.bookName}"/>
                                    <input type="hidden" name="bookId" value="${x.bookId}"/>
                                        <%-- Are You Sure --%>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger add">Delete</button>
                                </form>
                                <button class="btn btn-warning xclose" data-dismiss="modal">Close
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--End Delete Book Cart--%>

                    <%--Update Cart--%>
                <div class="modal fade" id="myModalUpdate${loop.index}">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <header class="head-form">
                                <h2>Update Quantity Book</h2>
                            </header>

                            <div class="modal-body">
                                    <%--Form --%>
                                <form action="sellerCartAction?action=modifyCart" method="POST">
                                        <%--  ID BOOK Insert To Inventory SQL--%>
                                            <input type="hidden" name="update"
                                                   value="1"/>
                                            <input type="hidden" name="nameBook"
                                                   value="${x.bookName}"/>
                                    <input type="hidden" name="bookId" value="${x.bookId}"/>
                                        <%--  DO Quantity Add to Cart --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa fa-address-book"></i></span>
                                            </div>
                                            <input type="number" name="quantityUpdate" class="form-control input-sm"
                                                   style="font-size: 15px" placeholder="Quantity" required min="1" max="${x.quantity_Book}">
                                        </div>
                                    </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer" id="modal-footer">
                                <button type="submit" class="btn btn-info add">Update</button>
                                </form>
                                <button class="btn btn-warning xclose" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--End Update Cart--%>
            </div>
            <hr/>
        </c:forEach>
        <%-- Button Buy --%>
        <c:choose>
            <c:when test="${listCart != null}">
        <form action="sellerCartAction?action=buyCart" method="POST">
            <div class="totalCart">
                <p id="priceCart">
                <h1>Total: <fmt:formatNumber type="number" value="${total}"/>
                    <small style="text-decoration:underline">đ</small></h1></p>
                <button id="btnBuy" class="btn btn-primary" type="submit">Buy</button>
            </div>
        </form>
            </c:when>
            <c:otherwise>
                <p class="text">You Do Not Have A Book In Your Cart</p>
                <form action="sellerBookAction?action=bookPage1" method="post">
                <button type="submit" class="btn btn-info btnAddBook">Add Book To Cart</button>
                </form>
            </c:otherwise>
        </c:choose>
        <%-- End Button Buy --%>
    </div>

</div>
<script src="./js/script.js"></script>


<%--Update Book Inventory--%>

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