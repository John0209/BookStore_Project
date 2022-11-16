<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Inventory History</title>

    <!-- BoxIcon CDN Link -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<%--    Link Button CSS--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- link file CSS -->
    <link rel="stylesheet" href="./css/staffManageInventory.css">
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
                    <form action="staffInventoryAction?action=searchInventory" method="POST">
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
                <h2 id="nameTable">LIST OF BOOK INVENTORY</h2>
            </div>
            <%-- Button History--%>
            <div class="history">
                <form action="staffInventoryAction?action=historyInventory" method="POST">
                    <button id="btnHistory">
                        <i class="fa-solid fa-recycle"></i>
                    </button>
                </form>
            </div>
            <%-- End Button History--%>
        </div>
        <%--End Home Content--%>

        <%--  Write   Body Code--%>
        <table class="table">
            <thead class="thead-dark" style="font-size: 15px">
            <tr>
                <th>.No</th>
                <th>Image</th>
                <th>Name Book</th>
                <th>Quantity</th>
                <th>Reason</th>
                <th>Inventory Date</th>
                <th>Employee Implement</th>
                <th></th>
            </tr>
            </thead>
            <tbody style="font-size: 15px">

            <c:forEach var="i" items="${listInventory}" varStatus="loop">
            <c:if test="${i.inventory_Status==true}">
                <%--                                Start Show Item Inventory--%>
            <tr>
                <td>${loop.count}</td>
                <td><img style="height: 100px;width: 100px"
                         src="<c:url value="/images/${i.inventory_Img}"/>"/></td>
                <td>
                    <a href="staffBookAction?action=bookDetail&bookId=${i.inventory_Book_Id}&categoryId=${i.inventory_Category_Id}&bookName=${i.inventory_Name_Book}">
                            ${i.inventory_Name_Book}</a></td>
                <td>${i.quantity_Inventory}</td>
                <td>${i.note_Inventory}</td>
                <td>${i.date_Inventory}</td>
                <td>${i.employee_Inventory}</td>
                <td>
                        <%--                                            <button style="font-size: 15px" class="btn btn-info">Update--%>
                        <%--                                            </button>--%>
                    <button style="font-size: 30px;border: none" data-toggle="modal"
                            data-target="#myModal${loop.index}"><i class="fa-solid fa-trash"></i>
                    </button>
                </td>
            </tr>
                <%-- End Show Item Inventory--%>

                <%--Delete Book Inventory--%>
            <div class="modal fade" id="myModal${loop.index}">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <header class="head-form mb-0">
                            <h2>Are You Sure To Delete The Book ?</h2>
                        </header>

                        <div class="modal-body">
                                <%--Form --%>
                            <form action="staffInventoryAction?action=deleteInventory" method="POST">
                                <input type="hidden" name="count"
                                       value="1"/>
                                <input type="hidden" name="nameBook"
                                       value="${i.inventory_Name_Book}"/>
                                <input type="hidden" name="inventory_Detail_Id"
                                       value="${i.inventory_Detail_Id}"/>
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
                <%--Delete Book Inventory--%>
            </c:if>
            </c:forEach>
            </tbody>
        </table>
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