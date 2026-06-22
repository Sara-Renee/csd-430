<%-- Sara White - CSD-430 - Assignment 3.2 JSP--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String friendliness = request.getParameter("friendliness");
    String comments = request.getParameter("comments");
    String[] services = request.getParameterValues("services");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Lawn Experts Feedback Results</title>
    <link rel="stylesheet" href="stylesheet.css">
</head>

<body>
    <div class="results">
        <h1><b>The Lawn Experts</b></h1>
        <h2>Thank you for submitting your feedback!</h2>

         <p>The information you submitted is displayed below.</p>
         <p>If you'd like a copy of your feedback, click the button below to print or save this page.</p><br>

        <button onclick="window.print()">Print or Save a Copy</button>
        <br>

        <table border="1">
            <tr>
                <th>Field</th>
                <th>Submitted Information</th>
            </tr>
            <tr>
                <td>First Name</td>
                <td><%= firstName %></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><%= lastName %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= email %></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><%= phone %></td>
            </tr>
            <tr>
                <td>Services Received</td>
                <td>
                    <%
                        if (services != null) {
                            for (String service : services) {
                    %>
                                <%= service %><br>
                    <%
                            }
                        } else {
                    %>
                            No services selected.
                    <%
                        }
                    %>
                </td>
            </tr>
            <tr>
                <td>Friendliness Rating</td>
                <td><%= friendliness %></td>
            </tr>
            <tr>
                <td>Additional Comments</td>
                <td><%= comments %></td>
            </tr>
        </table>
    </div>
</body>
</html>

<%--References

GeeksforGeeks. (n.d.). JSP – Form Processing. 
https://www.geeksforgeeks.org/advance-java/jsp-form-processing/

W3 Schools. (n.d.). HTML Input Types. 
https://www.w3schools.com/html/html_form_input_types.asp

--%>





