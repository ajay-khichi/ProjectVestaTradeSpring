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
        <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
        <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap" />
        <link rel="stylesheet" href="css/style.css" />
      </head>

      <body>

        <%@include file="headeradmin.jsp" %>


          <div class="container py-5">

            <div class="d-grid gap-2 col-6 mx-auto">
              <h2 class="heading">Update / Delete / Block Customer</h2>
              <% Customer u=(Customer)request.getAttribute("user"); %>
                <form action="amdcst" method="post">
                  <p class="section-tag mt-2">Personal Details</p>
                  <div class="row g-2">
                    <div class="col-12"><label class="form-label">Password *</label>
                      <input type="text" name="password" value="<%=u.getPassword() %>" class="form-control" required />
                    </div>
                    <div class="col-6"><label class="form-label">First Name *</label>
                      <input type="text" name="firstName" value="<%=u.getFirstName() %>" class="form-control"
                        placeholder="Rahul" required />
                    </div>

                    <div class="col-6"><label class="form-label">Last Name *</label>
                      <input type="text" name="lastName" value="<%=u.getLastName()%>" class="form-control"
                        placeholder="Kumar" required />
                    </div>

                    <div class="col-12"><label class="form-label">Email *</label>
                      <input type="email" name="email" value="<%=u.getEmail()%>" class="form-control"
                        placeholder="rahul@email.com" required />
                    </div>

                    <div class="col-12"><label class="form-label">Mobile *</label>
                      <input type="tel" name="mobile" value="<%=u.getMobile() %>" class="form-control"
                        placeholder="9876543210" required pattern="[6-9][0-9]{9}" maxlength="10" />
                    </div>

                    <div class="col-12"><label class="form-label">Gender *</label>
                      <input type="text" name="gender" value="<%=u.getGender() %>" class="form-control" required />
                    </div>

                  </div>

                  <p class="section-tag mt-3">KYC Details</p>
                  <div class="row g-2">
                    <div class="col-6"><label class="form-label">PAN *</label>
                      <input type="text" name="pan" value="<%=u.getPan() %>" class="form-control"
                        placeholder="ABCDE1234F" required maxlength="10"
                        oninput="this.value=this.value.toUpperCase()" />
                    </div>

                    <div class="col-6"><label class="form-label">Aadhaar *</label>
                      <input type="text" name="aadhar" value="<%=u.getAadhar() %>" class="form-control"
                        placeholder="XXXX XXXX XXXX" required maxlength="14" oninput="formatAadhar(this)" />
                    </div>

                    <p class="section-tag mt-3">Financial Details</p>
                    <div class="row g-2">
                      <div class="col-6"><label class="form-label">Bank Account *</label>
                        <input type="text" name="bankAccount" value="<%=u.getBankAccount() %>" class="form-control"
                          placeholder="Account number" required maxlength="18" />
                      </div>

                      <div class="col-6"><label class="form-label">IFSC Code *</label>
                        <input type="text" name="ifscCode" value="<%=u.getIfscCode() %>" class="form-control"
                          placeholder="HDFC0001234" required maxlength="11"
                          oninput="this.value=this.value.toUpperCase()" />
                      </div>
                    </div>

                    <div class="mt-4 text-center">
                      <button type="submit" name="b1" value="Update" class="btn btn-primary me-2">Update</button>
                      <button type="submit" name="b1" value="Delete" class="btn btn-danger me-2">Delete</button>
                      <button type="submit" name="b1" value="Block" class="btn btn-warning">Block</button>
                    </div>
                </form>

                <a href="adminhome" class="btn btn-info btn-lg mt-3">Back to Home</a>
            </div>
          </div>
          </div>

          <%@include file="footer.jsp" %>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="js/main.js"></script>
      </body>

      </html>