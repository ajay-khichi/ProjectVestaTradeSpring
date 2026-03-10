<%@page import="java.util.List" %>
<%@page import="com.ignishers.pojo.Customer" %>
<%@page import="com.ignishers.enums.AccountStatus" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Account Verification | VestaTrade</title>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap" />
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
    <%@include file="headeradmin.jsp" %>
        <div class="container py-5">
            <div class="d-grid gap-2 col-10 mx-auto">
                <h2 class="heading">Account Verification</h2>
                <% 
                String msg1=(String) request.getAttribute("msg"); 
                if(msg1 !=null) { 
                	out.print("<div class='alert alert-info'>" + msg + "</div>");
            	}
            	%>
            	<table class="table">
                	<tr>
                    	<th>Name</th>
	                    <th>Email</th>
	                    <th>PAN</th>
	                    <th>DOB</th>
	                    <th>Aadhar</th>
	                    <th>Current Status</th>
	                    <th>Action</th>
	                </tr>
	                <% List<Customer> cstList = (List<Customer>)request.getAttribute("unverifiedCustomers");
	                        if(cstList == null || cstList.isEmpty()){
	                        out.print("<tr> <td colspan='7'>No pending verification found!</td> </tr>");
	                        }
	                        else{
	                        for(Customer c : cstList) {
	                        %>
	                <tr>
	                   	<td><%=c.getFirstName()+" "+c.getLastName() %></td>
						<td><%=c.getEmail() %></td>
						<td><%=c.getPan() %></td>
						<td><%=c.getDateOfBirth() %></td>
						        <td><%=c.getAadhar() %></td>
						<td><%=c.getAccountStatus() %></td>
				        <td>
	            			<form action=" updateAccountStatus" method="post" class="d-flex w-100">
	                              <input type="hidden" name="email" value="<%=c.getEmail()%>" />
	                                <select name="newStatus" class="form-select form-select-sm me-2"
	                                        required>
	                                        <option value="" disabled selected>Select Status</option>
	                                        <% 
	                                        for(AccountStatus status : AccountStatus.values()) { %>
	                                            <option value="<%=status.name()%>">
	                                                <%=status.name()%>
	                                            </option>
	                                            <% } %>
	                                </select>
	                               <button type="submit" class="btn btn-primary btn-sm">Save</button>
	                        </form>
	                    </td>
	               	</tr>
	                        <% } } %>
            	</table>
            	<a href="editcustomers" class="btn btn-info btn-lg mt-3">Back to Menu</a>
        	</div>
      	</div>
		<%@include file="footer.jsp" %>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>