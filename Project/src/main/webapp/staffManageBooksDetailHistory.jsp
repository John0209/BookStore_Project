<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Book Detail</title>

    <!-- BoxIcon CDN Link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- link file CSS -->
    <link rel="stylesheet" href="./css/staffManageBookDetail.css">

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
            <a href="staffNodifyPage">
                <i class='bx bxs-bell'></i>
                <span class="links_name">Notification</span>
            </a>
        </li>
        <li>
            <a href="staffImportationAction?action=getRequest">
                <i class='bx bx-notification'></i>
                <span class="links_name">Request</span>
            </a>
        </li>
        <li>
            <a href="staffImportationAction?action=getImportation">
                <i class='bx bx-add-to-queue'></i>
                <span class="links_name">Importation</span>
            </a>
        </li>
        <li>
            <a type="submit" href="staffBookAction?action=bookPage1">
                <i class='bx bx-book'></i>
                <span class="links_name">Books</span>
            </a>
        </li>
        <li>
            <a href="staffInventoryAction?action=getInventory">
                <i class='bx bx-carousel'></i>
                <span class="links_name">Inventory</span>
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

<section class="home-section">
    <!-- home-content -->
                    <div class="categoryText">
                        <a style="color: black" href="staffBookAction?action=bookPage1">Category </a> >
                        <a style="color: #17A2B8" href="staffBookAction?action=${nameCategory}"> ${nameCategory}</a>

                    </div>
                    <c:forEach items="${listBook}" var="b" varStatus="loop">
                        <c:set var="bookId" value="${bookIdServlet}"></c:set>
                        <c:if test="${b.book_Id==bookId}">
                            <button class="Check"><i class="fa-regular fa-circle-check"></i></button>
                            <!-- Button Return -->
                            <button  class="btnDelete" data-toggle="modal"
                                     data-target="#myDelete${loop.index}">
                                <i class="fa-solid fa-rotate-left"></i>
                            </button>
                            <%--         Item Book Need Show--%>
                            <div class="itemList row">
                                <div class="border col-lg-4">
                                    <img src="<c:url value="/images/${b.image_Book}"/>" class="rounded"/><br/>
                                </div>
                                <div class="item col-lg-5">
                                    <strong class="name">${b.name}</strong><br/>
                                    <p class="price">
                                            <fmt:formatNumber value="${b.price_Book}" type="number"/>
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

                            <%--Return Book --%>
                            <div class="modal fade" id="myDelete${loop.index}">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                            <h2 style="margin-top:10px;text-align: center;font-size: 20px;color: #ffae00">Are You Sure To Return The Book ?</h2>

                                        <div class="modal-body">
                                                <%--Form --%>
                                            <form action="staffBookDeletedAction?action=returnBook" method="POST">
                                                <input type="hidden" name="count"
                                                       value="1"/>
                                                <input type="hidden" name="bookName"
                                                       value="${b.name}"/>
                                                <input type="hidden" name="bookId"
                                                       value="${b.book_Id}"/>
                                                    <%-- Are You Sure --%>
                                        </div>
                                        <!-- Modal footer -->
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-danger add">Return</button>
                                            </form>
                                            <button class="btn btn-warning xclose" data-dismiss="modal">Close
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--Return Book --%>


                        </c:if>
                    </c:forEach>
</section>

<script src="./js/script.js"></script>


<div class="modal fade" id="myModalImportation">
    <div class="modal-dialog">
        <div class="modal-content">

            <header class="head-form mb-0">
                <h2 style="padding-left: 120px;font-size: 25px;color: red">Import Book</h2>
            </header>

            <div class="modal-body">
                <%--Form --%>
                <form action="staffImportationAction" method="POST">
                    <%--  ID BOOK Insert To Inventory SQL--%>
                    <input type="hidden" name="book_Id_Importation" value="${bookIdServlet}"/>
                    <input type="hidden" name="request_Id" value="${request_Id}"/>

                    <%--Enter Quantity--%>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-address-book"></i></span>
                            </div>
                            <input type="text" name="quantityImportation" class="form-control input-sm"
                                   style="font-size: 15px" placeholder="Quantity">
                        </div>
                    </div>

                    <%-- Enter Price--%>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-address-book"></i></span>
                            </div>
                            <input type="text" name="priceImportation" class="form-control input-sm"
                                   style="font-size: 15px" placeholder="Price">
                        </div>
                    </div>

                    <%--   Enter note--%>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-briefcase"></i></span>
                            </div>
                            <select style="font-size: 15px" class="form-control" name="note">
                                <option>Note</option>
                                <option value="Importation Enough Books">Importation Enough Books</option>
                                <option value="Importation Missing Books">Importation Missing Books</option>
                            </select>
                            <input type="text" name="noteOther" class="form-control input-sm" style="font-size: 15px"
                                   placeholder="Other Note"/>
                        </div>
                    </div>

            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" name="action" value="updateStatusRequestUnDone" class="btn btn-danger noImportation">No Importation</button>
                <button type="submit" name="action" value="insertImportation" class="btn btn-info add">Add</button>
                </form>
                <button class="btn btn-warning xclose" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<%--End Form Add to Importation--%>

<%--Form Add to Inventory--%>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <header class="head-form">
                <h2 style="padding-left: 96px;font-size: 25px;color: red">Add Book To Inventory</h2>
            </header>

            <div class="modal-body">
                <%--Form --%>
                <form action="staffInventoryAction?action=insertInventory" method="POST">
                    <%--  ID BOOK Insert To Inventory SQL--%>
                    <input type="hidden" name="book_Id_Inventory" value="${bookIdServlet}"/>

                    <%--  DO Note And Quantity Inventory --%>
                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-briefcase"></i></span>
                            </div>
                            <select style="font-size: 15px" class="form-control" name="note">
                                <option >Reason</option>
                                <option value="Moldy Book">Moldy Book</option>
                                <option value="Book Lose Team">Book Lose Team</option>
                                <option value="Book Is Bent">Book Is Bent</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fa fa-address-book"></i></span>
                            </div>
                            <input type="text" name="quantity" class="form-control input-sm"
                                  style="font-size: 15px" placeholder="Quantity">
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
<%--End Form Add to Inventory--%>

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