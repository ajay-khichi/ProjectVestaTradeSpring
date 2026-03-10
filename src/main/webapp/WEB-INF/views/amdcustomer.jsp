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


<div class="container py-5">

<div class="d-grid gap-2 col-6 mx-auto">
	<h2 class="heading">Update / Delete / Block Customer</h2>
	<%
      	String msg1 = (String)request.getAttribute("msg");
      	if(msg1!=null)
      		out.print(msg1);
      %>
  <form action="amdcst" method="post">
        <div class="row g-2">
          <div class="col-12"><label class="form-label">Email *</label>
          <input type="email" name="email" class="form-control" placeholder="rahul@email.com" required/></div>
          
          <div class="col-12"><label class="form-label">Mobile *</label>
          <input type="tel" name="mobile" class="form-control" placeholder="9876543210" required pattern="[6-9][0-9]{9}" maxlength="10"/></div>
        </div>

        <p class="section-tag mt-3">Financial Details</p>
        <div class="row g-2">
          <div class="col-6"><label class="form-label">Bank Account *</label>
          <input type="text" name="bankAccount" class="form-control" placeholder="Account number" required maxlength="18"/></div>
          
          <div class="col-6"><label class="form-label">IFSC Code *</label><input type="text" name="ifscCode" class="form-control" placeholder="HDFC0001234" required maxlength="11" oninput="this.value=this.value.toUpperCase()"/></div>
        </div>

        <p class="section-tag mt-3">Password</p>
        <div class="row g-2">
          <div class="col-12"><label class="form-label">Password *</label>
          <input type="password" name="password" class="form-control" placeholder="Min 8 characters" required minlength="8"/></div>
        </div>

        <button type="submit" class="btn btn-primary d-block w-100 mt-3" name="b1" value="Update">
          Update Customer <i class="bi bi-arrow-right ms-2"></i>
        </button>
        <button type="submit" class="btn btn-danger d-block w-100 mt-3" name="b1" value="Delete">
          Delete Customer <i class="bi bi-arrow-right ms-2"></i>
        </button>
        <button type="submit" class="btn btn-warning d-block w-100 mt-3" name="b1" value="Block">
          Block Customer <i class="bi bi-arrow-right ms-2"></i>
        </button>
  </form>
  <a href="adminhome" class="btn btn-info btn-lg">Back to Home</a><br>
</div>
</div>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
