<%@page import="java.util.List" %>
<%@page import="com.ignishers.pojo.Customer" %>
<%@page import="com.ignishers.pojo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Markets | VestaTrade</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
		<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap" />
		<link rel="stylesheet" href="css/style.css" />
	</head>

	<body>
		<%@include file="headeradmin.jsp" %>
		<div class="container py-5">
			<div class="d-grid gap-2 col-6 mx-auto">
				<h2 class="heading">All Customers</h2>
				<table class="table">
					<tr>
						<th>Customer ID</th>
						<th>Customer Name</th>
						<th>Customer Email</th>
						<th>Customer Pan</th>
						<th>Customer Bank Account</th>
						<th>Customer IFSC</th>
						<th>Account Status</th>
					</tr>
					<% List<User> userList = (List<User>)request.getAttribute("users");
						if(userList == null || userList.isEmpty()){
							out.print("<tr>");
							out.print("<td colspan='7'>No user there!</td>");
							out.print("</tr>");
						}
						else{
							for(User u : userList) {
								if(u instanceof Customer) {
								Customer c = (Customer) u;
					%>
					<tr>
						<td><%=c.getId() %></td>
						<td><%=c.getFirstName()+" "+c.getLastName() %></td>
						<td><%=c.getEmail() %></td>
						<td><%=c.getPan() %></td>
						<td><%=c.getBankAccount() %></td>
						<td><%=c.getIfscCode() %></td>
						<td><%=c.getAccountStatus() %></td>
					</tr>
					<%  	}
						}
					}
     				%>
				</table>	
				<a href=" adminhome" class="btn btn-info btn-lg">Back to Home</a>
			</div>
		</div>
		<%@include file="footer.jsp" %>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="js/main.js"></script>
	</body>
</html>