<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Request Import Book</title>

        <!-- BoxIcon CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/adminRequestImportBook.css">
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
                            <!--SEARCH-BOOK-REQUEST-->
                            <form action="adminShowListBookingRequest">
                                <input type="text" placeholder="Search..." name="txtSearchBookRequest" value="${param.txtSearch}">
                                <button type="submit"><i class='bx bx-search-alt-2'></i></button>
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
            <!-- home-content -->
            <div class="home-content">
                <div class="overview-tableBookRequest">
                    <div class="wraper_addBookingRequest_nameTable">
                        <a href="./adminCreateBookRequestPage" class="addBookingRequest">
                            <i class='bx bx-add-to-queue'></i>
                            <span class="links_name">Add Book Request</span>
                        </a>
                    </div>
                    <hr style="width: 25.7rem;"/>
                    <h2 id="nameTable">LIST OF BOOK REQUEST</h2>
                    <div class="tableBookRequest">
                        <c:set var="listBookingRequest" value="${requestScope.LIST_BOOKING_REQUESTS}"/>
                        <c:if test="${not empty listBookingRequest}">
                            <table class="table">
                                <thead style="padding-top: 12px;
                                       padding-bottom: 12px;
                                       text-align: center;
                                       background-color: #1d727e;
                                       color: white;
                                       font-size: 1.5rem;">
                                    <tr>
                                        <th>ID</th>
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Date</th>
                                        <th>Date Complete</th>
                                        <th>Note</th>
                                        <th>Status</th>
                                        <th>Status_Book</th>
                                        <th>Update</th>
                                    </tr>
                                </thead>
                                <tbody style="font-size: 15px">
                                    <c:forEach var="bookRequestDTO" items="${listBookingRequest}" varStatus="loop">
                                        <c:if test="${bookRequestDTO.status > 0}">
                                            <tr>
                                                <td>
                                                    <p>${bookRequestDTO.request_Id}</p>
                                                </td>
                                                <td>
                                                    <img style="height: 100px;width: 100px" src="./images/${bookRequestDTO.image}" alt="..."
                                                         id="imageBookRequest">
                                                </td>
                                                <td>
                                                    <p>${bookRequestDTO.name_Book}</p>
                                                </td>
                                                <td>
                                                    <p>${bookRequestDTO.quantity_Request}</p>
                                                </td>
                                                <td><fmt:formatNumber value="${bookRequestDTO.price_Request}" type="number"/>
                                                    <small style="text-decoration:underline">đ</small>
                                                </td>

                                                <td>
                                                    <p>${bookRequestDTO.date_Request}</p>
                                                </td>
                                                <td>
                                                    <p>${bookRequestDTO.date_Request_Done}</p>
                                                </td>
                                                <td>
                                                    <p>${bookRequestDTO.note}</p>
                                                </td>
                                                <td id="statusProcess">

                                                    <c:if test="${bookRequestDTO.status == 1}">
                                                        <span style="color: #fab804ea">Proceeding</span>
                                                    </c:if>
                                                    <c:if test="${bookRequestDTO.status == 2}">
                                                        <span style="color: #1ace1a">Done</span>
                                                    </c:if>
                                                    <c:if test="${bookRequestDTO.status == 3}">
                                                        <span style="color: red;">Un Done</span>
                                                    </c:if>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${bookRequestDTO.status_Book_Request==false}">
                                                            <p>Old</p>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <p>New</p>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <button class="btnUpdate" data-toggle="modal"
                                                            data-target="#myModalUpdate${loop.index}">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                            <%--Form Update Book--%>
                                        <div class="modal fade" id="myModalUpdate${loop.index}">
                                            <div style=" margin-top: 70px;" class="modal-dialog">
                                                <div class="modal-content">

                                                    <header class="head-form mb-0">
                                                        <h2 style="text-align: center;font-size: 30px;color: #0d8cba">Update
                                                            Book</h2>
                                                    </header>

                                                    <div class="modal-body">
                                                        <%--Form --%>
                                                        <form action="adminUpdateBookRequestAction"
                                                              method="POST">
                                                            <input type="hidden" name="update"
                                                                   value="1"/>
                                                            <input type="hidden" name="txtHiddenRequest_Id"
                                                                   value="${bookRequestDTO.request_Id}"/>
                                                            <%--  Start Name Book --%>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i
                                                                                class="fa-solid fa-book"></i></span>
                                                                    </div>
                                                                    <input type="text" name="txtName_Book"
                                                                           class="form-control input-sm"
                                                                           style="font-size: 20px"
                                                                           value="${bookRequestDTO.name_Book}">
                                                                </div>
                                                            </div>
                                                            <%--  End Name Book --%>


                                                            <%--  Start Quantity Book --%>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i
                                                                                class="fa-solid fa-arrow-up-9-1"></i></span>
                                                                    </div>
                                                                    <input type="number" name="txtQuantity_Request"
                                                                           class="form-control input-sm"
                                                                           style="font-size: 20px"
                                                                           value="${bookRequestDTO.quantity_Request}">
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
                                                                    <input type="number" name="txtPrice_Request"
                                                                           class="form-control input-sm"
                                                                           style="font-size: 20px"
                                                                           value="${bookRequestDTO.price_Request}">
                                                                </div>
                                                            </div>
                                                            <%--  End Price Book --%>
                                                            <%--  Start Author --%>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i
                                                                                class="fa-solid fa-person"></i></span>
                                                                    </div>
                                                                    <input type="text" name="txtNote"
                                                                           class="form-control input-sm"
                                                                           style="font-size: 20px" placeholder="Note"
                                                                           value="${bookRequestDTO.note}">
                                                                </div>
                                                            </div>
                                                            <%--  End Author --%>
                                                            <%--  Start Category Book --%>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i
                                                                                class="fa fa-briefcase"></i></span>
                                                                    </div>
                                                                    <select style="font-size: 20px" class="form-control"
                                                                            name="status">
                                                                        <c:choose>
                                                                            <c:when test="${bookRequestDTO.status==1}">
                                                                                <option style="color: #fab804ea" value="1">Proceeding</option>
                                                                                <option style="color: #1ace1a" value="2">Done</option>
                                                                                <option style="color: red" value="3">Un Done</option>
                                                                            </c:when>
                                                                            <c:when test="${bookRequestDTO.status==2}">
                                                                                <option style="color: #1ace1a" value="2">Done</option>
                                                                                <option style="color: #fab804ea" value="1">Proceeding</option>
                                                                                <option style="color: red" value="3">Un Done</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option style="color: #1ace1a" value="2">Done</option>
                                                                                <option style="color: #fab804ea" value="1">Proceeding</option>
                                                                                <option style="color: red" value="3">Un Done</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <%--  End Category Book --%>
                                                            <%--  Start Category Book --%>
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text"><i
                                                                                class="fa fa-briefcase"></i></span>
                                                                    </div>
                                                                    <select style="font-size: 20px" class="form-control"
                                                                            name="txtStatus">
                                                                        <c:choose>
                                                                            <c:when test="${bookRequestDTO.status_Book_Request==false}">
                                                                                <option value="0">Old</option>
                                                                                <option value="1">New</option>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <option value="1">New</option>
                                                                                <option value="0">Old</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <%--  End Category Book --%>



                                                    </div>
                                                    <!-- Modal footer -->
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-info add">Update</button>
                                                        </form>
                                                        <button class="btn btn-warning xclose" data-dismiss="modal">Close
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--End Form Update Book--%>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty listBookingRequest}">
                            <h2 style="text-align: center;
                                align-items: center;
                                color: red">
                                CAN NOT FIND THIS RECORD !       
                            </h2>
                        </c:if>
                    </div>
                </div>
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
    </body>
</html>