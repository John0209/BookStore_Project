<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Manage Employees</title>
        <!-- link file CSS -->
        <link rel="stylesheet" href="./css/adminManageEmployeesStyle.css">
        <!-- BoxIcon CDN Link -->
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                            <!--SEARCH_EMPLOYEE-->
                            <form action="adminShowListEmployees">
                                <input type="text" placeholder="Search... " name="txtSearch" value="${param.txtSearch}">
                                <button type='submit'><i class='bx bx-search-alt-2'></i></button>
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
                <!-- home-content -->
                <div class="home-content">
                    <div class="overview-tableEmployee">
                        <div class="wraper_addNewEmployee_nameTable">
                            <a href="adminCreateEmployeePage" class="addNewEmployee">
                                <i class='bx bx-add-to-queue'></i>
                                <span class="links_name">Add New Employee</span>
                            </a>
                        </div>
                        <hr style="width: 25.7rem;"/>
                        <%-- Show message after update--%>
                        <c:set var="updateEmpMsg" value="${requestScope.UPDATE_EMPLOYEE_MSG}"/>
                        <c:if test="${not empty updateEmpMsg}">
                            <div  class="toastx">
                                <div class="toast-icon">
                                    <i class="fa-sharp fa-solid fa-circle-check"></i>
                                </div>
                                <div class="toast-body">
                                    <h3 class="toast-title">Successfully</h3>
                                    <p class="toast-msg">${updateEmpMsg}</p>
                                </div>
                            </div>
                        </c:if>
                        <!--Show msg after duplicate id-->
                        <c:set var="errUpdateEmpMsg" value="${requestScope.ERROR_UPDATE_EMPLOYEE_MSG}"/>
                        <c:if test="${not empty errUpdateEmpMsg}">
                            <div  class="toastx-inactive">
                                <div class="toast-icon-inactive">
                                    <i class="fa-sharp fa-solid fa-exclamation"></i> 
                                </div>
                                <div class="toast-body-inactive">
                                    <h3 class="toast-title-inactive">Error</h3>
                                    <p class="toast-msg-inactive">${errUpdateEmpMsg}</p>
                                </div>
                            </div>
                        </c:if>
                        <%-- Show message after inactive--%>
                        <c:set var="inActiveEmpMsg" value="${requestScope.DELETE_EMPLOYEE_MSG}"/>
                        <c:if test="${not empty inActiveEmpMsg}">
                            <div  class="toastx-inactive">
                                <div class="toast-icon-inactive">
                                    <i class="fa-sharp fa-solid fa-exclamation"></i> 
                                </div>
                                <div class="toast-body-inactive">
                                    <h3 class="toast-title-inactive">Successfully</h3>
                                    <p class="toast-msg-inactive">${inActiveEmpMsg}</p>
                                </div>
                            </div>
                        </c:if>
                        <!--Show msg after Insert-->
                        <c:set var="insertEmpMsg" value="${requestScope.INSERT_EMPLOYEE_MSG}"/>
                        <c:if test="${not empty insertEmpMsg}">
                            <div  class="toastx">
                                <div class="toast-icon">
                                    <i class="fa-sharp fa-solid fa-circle-check"></i>
                                </div>
                                <div class="toast-body">
                                    <h3 class="toast-title">Successfully</h3>
                                    <p class="toast-msg">${insertEmpMsg}</p>
                                </div>
                            </div>
                        </c:if>

                        <h2 id="nameTable">LIST OF EMPLOYEES</h2>
                        <div class="tableEmployee">
                            <table id="employees">
                                <c:set var="listEmployees" value="${requestScope.LIST_EMPLOYEES}"/>
                                <c:if test="${not empty listEmployees}">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Account</th>
                                            <th>Password</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Address</th>
                                            <th>Gender</th>
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="employeeDTO" items="${listEmployees}" varStatus="counter">
                                        <form action="adminUpdateEmployeeAction">
                                            <tr>
                                                <td>
                                                    ${employeeDTO.employee_Id}
                                                    <input class="textInforEmployee" type="hidden"
                                                           name="txtHiddenEmployee_Id"
                                                           value="${employeeDTO.employee_Id}"/>
                                                </td>
                                                <td>
                                                    ${employeeDTO.account_Id}
                                                    <input class="textInforEmployee" type="hidden" name="txtHiddenAccount_Id" value="${employeeDTO.account_Id}"/>
                                                </td>
                                                <td>
                                                    <input class="textInforEmployee" type="password" name="txtPassword" value="${employeeDTO.password}" required minlength="5"  maxlength="20" />
                                                </td>
                                                <td>
                                                    <input class="textInforEmployee" type="text" name="txtFullName" value="${employeeDTO.fullName}" required minlength="3"  maxlength="30"/>
                                                </td>
                                                <td>
                                                    <input class="textInforEmployee" type="number" name="txtPhone"
                                                           value="${employeeDTO.phone}"
                                                           style="width: 8em"/> <%-- minlength="10"  maxlength="11" size="12" --%>
                                                </td>
                                                <td>
                                                    <input class="textInforEmployee" type="text" name="txtAddress" value="${employeeDTO.address}" required minlength="4" maxlength="30"/>
                                                </td>
                                                <td>
                                                    <select class="textInforEmployee" name="txtGender">
                                                        <option value="${employeeDTO.gender}">${employeeDTO.gender}</option>
                                                        <c:choose>
                                                            <c:when test="${employeeDTO.gender=='Male'}">
                                                                <option value="Female">Female</option>
                                                                <option value="Other">Other</option>
                                                            </c:when>
                                                            <c:when test="${employeeDTO.gender=='Female'}">
                                                                <option value="Male">Male</option>
                                                                <option value="Other">Other</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="Female">Female</option>
                                                                <option value="Male">Male</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="textInforEmployee" name="txtRole">
                                                        <option value="${employeeDTO.role}">${employeeDTO.role}</option>
                                                        <c:choose>
                                                            <c:when test="${employeeDTO.role=='Seller'}">
                                                                <option value="Staff">Staff</option>

                                                            </c:when>
                                                            <c:when test="${employeeDTO.role=='Staff'}">
                                                                <option value="Seller">Seller</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                disable
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td>
                                                    <select class="textInforEmployee" name="txtStatus_Employee">
                                                        <c:choose>
                                                            <c:when test="${employeeDTO.status_Employee==false}">
                                                                <option style="color: red" value="false">Inactive</option>
                                                                <option style="color: green" value="true">Active</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option style="color: green" value="true">Active</option>
                                                                <option style="color: red" value="false">Inactive</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </td>
                                                <td>
                                                    <input
                                                        <c:if test="${employeeDTO.role=='Admin'}">disabled
                                                            style="background: #4a9a4a; color: #333; font-weight:600;"</c:if>
                                                            class="buttonActionUpdate" type="submit" value="Update"
                                                        />
                                                </td>
                                                <td>
                                                    <c:url var="urlRewriting" value="adminDeleteEmployeeAction">
                                                        <c:param name="employee_Id" value="${employeeDTO.employee_Id}"/>
                                                    </c:url>
                                                    <a  
                                                        <c:if test="${employeeDTO.role == 'Admin'}">
                                                            style="background: #d04141; color: #333; pointer-events:none; font-weight:600;"</c:if>
                                                        class="buttonActionDelete" href=${urlRewriting}>Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:if>
                            <c:if test="${empty listEmployees}">
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
        </div>
        <script src="./js/script.js"></script>
    </body>
</html>