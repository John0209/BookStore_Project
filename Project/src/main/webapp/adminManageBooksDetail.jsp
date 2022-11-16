<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Book Detail</title>

        <!-- BoxIcon CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/staffManageBookDetail.css">
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
            <%-- Form Update --%>
            <c:set var="toast" value="${update}"></c:set>
            <c:if test="${toast==1}">
                <div class="toastx">
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
        <!-- home-content -->
        <div class="categoryText">
            <a style="color: black" href="adminBookAction?action=bookPage1">Category </a> >
            <a style="color: #17A2B8" href="adminBookAction?action=${nameCategory}"> ${nameCategory}</a>
        </div>
        <c:forEach items="${listBook}" var="b" varStatus="loop">
            <c:set var="bookId" value="${bookIdServlet}"></c:set>
            <c:if test="${b.book_Id==bookId}">
                <button class="Check"><i class="fa-regular fa-circle-check"></i></button>
                <%--  Button Update--%>
                <button  class="btnUpdate" data-toggle="modal"
                        data-target="#myModal${loop.index}">
                    <i class="fa-solid fa-pen-to-square"></i>
                </button>
                <%--  Item Book Need Show--%>
                <div class="itemList row">
                    <div class="border col-lg-4">
                        <img src="<c:url value="/images/${b.image_Book}"/>" class="rounded"/><br/>
                    </div>
                    <div class="item col-lg-5">
                        <strong class="name">${b.name}</strong>
                        <p class="price">
                                <fmt:formatNumber type="number" value="${b.price_Book}"/>
                            <small style="text-decoration:underline">đ</small>
                        <p><br/>
                        <p class="quantity">Quantity: ${b.quantity_Book}</p>
                        <p class="author">Author: <u>${b.author}</u></p>
                        <p class="yearPublic">Year Of Public: ${b.year_Of_Public}</p>
                    </div>

                </div>
                <%--   Show Description Book   --%>
                <div class="boxDescription">
                    <div class="description">
                        <strong>Information Detail</strong>
                        <p class="text">${b.descriptionBook}</p>
                    </div>
                </div>
                <%-- End Show Item Book--%>

                <%--Form Update Book--%>
                <div class="modal fade" id="myModal${loop.index}">
                    <div style=" margin-top: 70px;" class="modal-dialog">
                        <div class="modal-content">

                            <header class="head-form mb-0">
                                <h2 style="padding-left: 28%;font-size: 30px;color: #0d8cba">Update Book</h2>
                            </header>

                            <div class="modal-body">
                                    <%--Form --%>
                                <form action="adminBookAction?action=updateBook" method="POST">
                                    <input type="hidden" name="update"
                                           value="1"/>
                                    <input type="hidden" name="bookId"
                                           value="${b.book_Id}"/>
                                        <%--  Start Name Book --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-solid fa-book"></i></span>
                                            </div>
                                            <input type="text" name="bookName" class="form-control input-sm"
                                                   style="font-size: 20px" value="${b.name}">
                                        </div>
                                    </div>
                                        <%--  End Name Book --%>

                                        <%--  Start Author --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-solid fa-person"></i></span>
                                            </div>
                                            <input type="text" name="author" class="form-control input-sm"
                                                   style="font-size: 20px" placeholder="Author" value="${b.author}">
                                        </div>
                                    </div>
                                        <%--  End Author --%>

                                        <%--  Start Quantity Book --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-solid fa-arrow-up-9-1"></i></span>
                                            </div>
                                            <input type="number" name="quantity"
                                                   class="form-control input-sm"
                                                   style="font-size: 20px" value="${b.quantity_Book}">
                                        </div>
                                    </div>
                                        <%--  End Quantity Book --%>

                                        <%--  Start Price Book --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-solid fa-money-bill-wave"></i></span>
                                            </div>
                                            <input type="number" name="price" class="form-control input-sm"
                                                   style="font-size: 20px" value="${b.price_Book}">
                                        </div>
                                    </div>
                                        <%--  End Price Book --%>

                                        <%--  Start Category Book --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa fa-briefcase"></i></span>
                                            </div>
                                            <select style="font-size: 20px" class="form-control"
                                                    name="categoryId">
                                                <option value="${categoryId}">${nameCategory}</option>
                                                <option value="1">Romance</option>
                                                <option value="2">Self-help</option>
                                                <option value="3">Novel</option>
                                                <option value="4">Fantasy</option>
                                            </select>
                                        </div>
                                    </div>
                                        <%--  End Category Book --%>

                                        <%--  Start Public Book --%>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-solid fa-calendar-days"></i></span>
                                            </div>
                                            <input type="number" name="publicOfYear"
                                                   class="form-control input-sm"
                                                   style="font-size: 20px" placeholder="Public Of Year"
                                                   value="${b.year_Of_Public}">
                                        </div>
                                    </div>
                                        <%--  End Public Book --%>

                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-info add">Update</button>
                                </form>
                                <button class="btn btn-warning xclose" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%--End Form Update Book--%>
            </c:if>
        </c:forEach>
    </section>

    <script src="./js/script.js"></script>
    </body>
</html>