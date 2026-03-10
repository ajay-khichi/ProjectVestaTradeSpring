<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg">
  <div class="container">
    <a class="navbar-brand" href="adminhome">Vesta<span>Trade</span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav"><i class="bi bi-list"></i></button>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav mx-auto gap-1">
        <li class="nav-item"><a class="nav-link" href="adminhome">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="adminstock">Stocks</a></li>
        <li class="nav-item"><a class="nav-link" href="editcustomers">Customers</a></li>
        <li class="nav-item"><a class="nav-link" href="editprofile">Edit Profile</a></li>
      </ul>
      <div class="d-flex gap-2 mt-2 mt-lg-0">
        <a href="logout" class="nav-link btn-login">Log Out</a>
      </div>
    </div>
  </div>
</nav>

<div class="page-header">
  <div class="container">
    <div class="row align-items-end g-4">
      <div class="col-lg-5">
        <h1>
			<%
      	String msg = (String)request.getAttribute("msg");
      	if(msg!=null)
      		out.print(msg);
      %>
		</h1>
        <p>Live prices and data for NSE &amp; BSE listed stocks</p>
      </div>
    </div>
  </div>
</div>
