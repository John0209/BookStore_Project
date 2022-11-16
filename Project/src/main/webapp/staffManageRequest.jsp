<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Request</title>

    <!-- BoxIcon CDN Link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <%-- Link Button CSS--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- link file CSS -->
    <link rel="stylesheet" href="./css/staffManageRequest.css">

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
                    <form action="staffImportationAction?action=searchRequest" method="POST">
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
        <%-- Form Delete Request--%>
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
        <%-- End Form Delete Request--%>
    </div>

</div>

<div class="wrapper-body">

    <div class="sidebar">
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
    </div>

    <!-- home content -->
    <div class="home-section">
        <!-- home-content -->
        <div class="home-content">
            <div>
                <h2 id="nameTable">LIST OF BOOK REQUEST</h2>
            </div>
            <%-- Button History--%>
            <div class="history">
                <form action="staffImportationAction?action=historyRequest" method="POST">
                    <button id="btnHistory">
                        <i class="fa-solid fa-recycle"></i>
                    </button>
                </form>
            </div>
            <%-- End Button History--%>
        </div>
        <%--End Home Content--%>

        <%--       Write   Body Code--%>
        <table class="table">
            <thead class="thead-dark" style="font-size: 15px">
            <tr>
                <th>.No</th>
                <th>Image</th>
                <th>Name Book</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Note</th>
                <th>Date Request</th>
                <th>Date Complete</th>
                <th>Status</th>
                <th>New Book</th>
                <th></th>
            </tr>
            </thead>
            <tbody style="font-size: 15px">
            <c:forEach var="i" items="${listRequest}" varStatus="loop">
                <c:if test="${i.request_Status != 0}">
                    <%-- Start Show Item Request--%>

                    <tr>
                        <td>${loop.count}</td>
                        <td><img style="height: 100px;width: 100px"
                                 src="<c:url value="/images/${i.request_Image}"/>"/></td>
                        <td>
                            <c:if test="${i.status_Book_Request==false}">
                                <a href="staffBookAction?action=bookDetailRequest&bookNameRequest=${i.request_Name_Book}&qtyRequest=${i.request_Quantity}&priceRequest=${i.request_Price}">
                                        ${i.request_Name_Book}</a>
                            </c:if>

                            <c:if test="${i.status_Book_Request==true}">

                                ${i.request_Name_Book}</a>
                            </c:if>
                        </td>
                        <td>${i.request_Quantity}</td>
                        <td><fmt:formatNumber value="${i.request_Price}" type="number"/>
                            <small style="text-decoration:underline">đ</small>
                        </td>
                        <td>${i.request_Note}</td>
                        <td>${i.request_Date}</td>
                        <td>${i.request_Date_Done}</td>
                            <%--Set Status Book --%>
                        <td>
                            <c:if test="${i.request_Status==1}">
                                <p style="color: #fab804ea">Proceeding</p>
                            </c:if>
                            <c:if test="${i.request_Status==2}">
                                <p style="color: #1ace1a">Done</p>
                            </c:if>
                            <c:if test="${i.request_Status==3}">
                                <p style="color: red">Un Done</p>
                            </c:if>
                        </td>
                            <%--End Set Status Book --%>

                            <%--Create Book --%>
                        <td>
                            <c:if test="${i.status_Book_Request==true}">
                                <button style="font-size: 30px;border: none" data-toggle="modal"
                                        data-target="#myModalBook${loop.index}"><i class="fa-solid fa-plus"></i>
                                </button>
                            </c:if>
                        </td>
                            <%--End Create Book--%>

                            <%--Start Delete Book--%>
                        <td>
                            <c:if test="${i.request_Status ==2}">
                                <button style="font-size: 30px;border: none" data-toggle="modal"
                                        data-target="#myModal${loop.index}">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </c:if>
                        </td>
                            <%--End Delete Book--%>
                    </tr>
                    <%-- End Show Item Request--%>

                    <%--Delete Request--%>
                    <div class="modal fade" id="myModal${loop.index}">
                        <div style="height: 100%" class="modal-dialog">
                            <div class="modal-content">

                                <header class="head-form mb-0">
                                    <h2>Are You Sure To Delete The Book ?</h2>
                                </header>

                                <div class="modal-body">
                                        <%--Form --%>
                                    <form action="staffImportationAction?action=deleteRequest"

                                          method="POST">
                                        <input type="hidden" name="count"
                                               value="1"/>
                                        <input type="hidden" name="nameBook"
                                               value="${i.request_Name_Book}"/>
                                        <input type="hidden" name="request_Id"
                                               value="${i.request_Id}"/>
                                            <%--Form --%>
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
                    <%--End Delete Request--%>

                    <%--Start Form Create Book--%>
                    <div class="modal fade" id="myModalBook${loop.index}">
                        <div style=" margin-top: 70px;" class="modal-dialog">
                            <div class="modal-content">

                                <header class="head-form mb-0">
                                    <h2 style="padding-left: 75px;font-size: 30px">Create Book</h2>
                                </header>

                                <div class="modal-body">
                                        <%--Form --%>
                                    <form action="staffBookAction?action=createBook" method="POST">
                                        <input type="hidden" name="request_Id"
                                               value="${i.request_Id}"/>
                                            <%--  Start Image Book --%>
                                        <div class="form-group">
                                            <input type="hidden" name="imageUpload" value="${i.request_Image}">
                                        </div>
                                            <%--  End Image Book --%>

                                            <%--  Start Name Book --%>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-solid fa-book"></i></span>
                                                </div>
                                                <input type="text" name="nameBook" class="form-control input-sm"
                                                       style="font-size: 20px" value="${i.request_Name_Book}" readonly="readonly">
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
                                                       style="font-size: 20px" placeholder="Author" >
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
                                                       style="font-size: 20px" value="0" readonly="readonly">
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
                                                       style="font-size: 20px" value="${i.request_Price}" readonly="readonly">
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
                                                        name="category">
                                                    <option>Category</option>
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
                                                       style="font-size: 20px" placeholder="Public Of Year" value="2022" readonly="readonly">
                                            </div>
                                        </div>
                                            <%--  End Public Book --%>

                                            <%--  Start Description Book --%>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                                                    class="fa-regular fa-file"></i></span>
                                                </div>
                                                <input type="text" name="description"
                                                       class="form-control input-sm"
                                                       style="font-size: 20px" placeholder="Description">
                                            </div>
                                        </div>
                                            <%--  End Description Book --%>

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
                    <%--End Form Create Book--%>

                </c:if>
            </c:forEach>

            </tbody>
        </table>

    </div>
</div>

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
<%--<script>--%>
<%--    $(document).ready(function(){--%>
<%--        $('.toast').toast('show');--%>
<%--    });--%>
<%--</script>--%>
</body>

</html>