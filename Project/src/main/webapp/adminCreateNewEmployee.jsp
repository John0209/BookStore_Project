<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Create New Employee</title>
        <link href="https://fonts.googleapis.com/css?family=Assistant:400,700" rel="stylesheet">
        <link rel="stylesheet" href="./css/signUpForm.css">
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <section class='login' id='login'>
            <div class='head'>
                <h1 class='company'>Phuong Nam Book Store</h1>
            </div>
            <c:set var="createEmpMsgAccountID" value="${requestScope.ERROR_ACCOUNT_INSERT_EMPLOYEE_MSG}"/>
            <c:set var="createEmpMsgConfirmPass" value="${requestScope.ERROR_CONFIRM_INSERT_EMPLOYEE_MSG}"/>
            <c:set var="createEmpMsgConfirmPhone" value="${requestScope.ERROR_PHONE_INSERT_EMPLOYEE_MSG}"/>

            <p class='msg'>Welcome to Create Account</p>
            <div class='form'>
                <form action="adminCreateEmployeeAction" method="POST">
                    <input type="text" placeholder='AccountID' name="txtAccountID" class='text' id='AccountID' required  minlength="4"  maxlength="25"><br>
                    <c:if test="${not empty createEmpMsgAccountID}">
                        <span class='text' style="color: red" >${createEmpMsgAccountID}</span>
                    </c:if>
                    <input type="password" placeholder='Password' name="txtPassword" class='password' required minlength="5"  maxlength="20"><br>
                    <input type="password" placeholder='Confirm-Password' name="txtConfirmPassword" class='password' required  minlength="5"  maxlength="20"><br>
                    <c:if test="${not empty createEmpMsgConfirmPass}">
                        <span class='text' style="color: red" >${createEmpMsgConfirmPass}</span>
                    </c:if>
                    <input type="text" placeholder='Name' name="txtFullName" class='text' required  minlength="3"  maxlength="30"><br>
                    <input type="number" placeholder='Phone' name="txtPhone" class='number' id='phone'><br>
                    <c:if test="${not empty createEmpMsgConfirmPhone}">
                        <span class='text' style="color: red" >${createEmpMsgConfirmPhone}</span>
                    </c:if>
                    <input type="text" placeholder='Address' name="txtAddress" class='text' id='address' minlength="4" maxlength="30" required><br>
                    <table border="0">
                        <tbody class="text">
                            <tr>
                                <td>Gender</td>
                                <td><input type="radio" name="radioGender" class="radio" value="Male" checked="checked"> Male</td>
                                <td><input type="radio" name="radioGender" class="radio" value="Female"> Female</td>
                                <td><input type="radio" name="radioGender" class="radio" value="Other"> Other</td>
                            </tr>
                            <tr>
                                <td>Role</td>
                                <td><input type="radio" name="radioRole" class="radio" value="Seller" checked="checked"> Seller<br/></td>
                                <td><input type="radio" name="radioRole" class="radio" value="Staff"> Staff<br/></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="wrapper-button">
                        <a href="./adminShowListEmployees" class='btn-login'>Back Manage Employees</a>
                        <input type="submit" class='btn-signup' value="Create Account"/>
                    </div>       
                </form>

            </div>
        </section>
        <!-- partial -->
        <script  src="./js/LoginForm.js"></script>
    </body>
</html>
