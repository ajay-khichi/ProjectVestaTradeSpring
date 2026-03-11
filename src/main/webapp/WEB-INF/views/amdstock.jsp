<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Markets | VestaTrade</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>

<%@include file="headeradmin.jsp" %>



<div class="container mt-5">

<h3 class="text-center">Stock Management</h3>
<%
      	String msg1 = (String)request.getAttribute("msg");
      	if(msg1!=null)
      		out.print(msg1);
      %>
<form action="amdstock" method="post">

<div class="mb-3">
<label>Symbol</label>
<input type="text" name="symbol" class="form-control" required>
</div>

<div class="mb-3">
<label>Company Name</label>
<input type="text" name="companyName" class="form-control">
</div>

<div class="mb-3">
<label>Price</label>
<input type="number" step="0.01" name="price" class="form-control">
</div>

<div class="mb-3">
<label>Available Shares</label>
<input type="number" name="shares" class="form-control">
</div>

<div class="text-center">

<button type="submit" name="action" value="Add" class="btn btn-success">
Add Stock
</button>

<button type="submit" name="action" value="Update" class="btn btn-warning">
Update Stock
</button>

<button type="submit" name="action" value="Delete" class="btn btn-danger">
Delete Stock
</button>

</div>

</form>
 <a href="adminhome" class="btn btn-info btn-lg">Back to Home</a><br>

</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
