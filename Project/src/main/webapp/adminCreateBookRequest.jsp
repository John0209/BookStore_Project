<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Create Booking Request</title>
        <link href="https://fonts.googleapis.com/css?family=Assistant:400,700" rel="stylesheet">
        <link rel="stylesheet" href="./css/signUpForm.css">
    </head>
    <body>
        <!-- partial:index.partial.html -->
        <section class='login' id='login'>
            <div class='head'>
                <h1 class='company'>Phuong Nam Book Store</h1>
            </div>
            <c:set var="createBookRequestMsgQuantity" value="${requestScope.ERROR_INSERT_QUANTITY_BOOKING_MSG}"/>
            <c:set var="createBookRequestMsgPrice" value="${requestScope.ERROR_INSERT_PRICE_BOOKING_MSG}"/>

            <p class='msg'>Create Booking Request</p>
            <div class='form'>
                <form action="adminCreateBookRequestAction" method="POST"  enctype="multipart/form-data">
                    <span class='text'>Choose Image: </span><input type="file" name="imgImage" id='Image' required><br>
                    <input type="text" placeholder='Book Name' name="txtBookName" class='text' required  minlength="2" maxlength="60"><br>
                    <input type="number" placeholder='Quantity' name="txtQuantityBook" class='number' required><br>
                    <c:if test="${not empty createBookRequestMsgQuantity}">
                        <span class='text' style="color: red" >${createBookRequestMsgQuantity}</span>
                    </c:if>
                    <input type="number" placeholder='Price' name="txtPrice" class='number' required><br>
                    <c:if test="${not empty createBookRequestMsgPrice}">
                        <span class='text' style="color: red" >${createBookRequestMsgPrice}</span>
                    </c:if>
                    <input type="text" placeholder='Note' name="txtNote" class='text' maxlength="60"><br>
                    <table border="0">
                        <tbody class="text">
                            <tr>
                                <td>Status</td>
                                <td><input type="radio" name="radioStatus" class="radio" value="1" checked="checked">Proceeding</td>
                            </tr>
                            <tr>
                                <td>Status Of Book</td>
                                <td><input type="radio" name="radioStatusBook" class="radio" value="true" checked="checked">New<br/></td>
                                <td><input type="radio" name="radioStatusBook" class="radio" value="false">Old<br/></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="wrapper-button">
                        <a href="./adminShowListBookingRequest" class='btn-login'>Back Manage List Booking Request</a>
                        <input type="submit" class='btn-signup' value="Create" />
                    </div>                       
                </form>
                <div>
                    <span class='text' style="color: red" >${requestScope.BOOK_REQUEST_ERROR}</span>
                </div>
            </div>
        </section>
        <!-- partial -->
        <script  src="./js/LoginForm.js"></script>
    </body>
</html>
