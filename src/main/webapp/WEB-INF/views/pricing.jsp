<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/><meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Pricing | VestaTrade</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>

<%@include file="header.jsp" %>

<div class="page-header text-center" style="background:radial-gradient(ellipse 60% 50% at 50% 0%,rgba(0,212,255,.07),transparent)">
  <div class="container">
    <span class="section-tag">Transparent Pricing</span>
    <h1>Simple, Honest Pricing. No Surprises.</h1>
    <p class="section-sub mx-auto" style="max-width:480px">Zero brokerage on equity delivery. Flat â¹20 on intraday and F&amp;O. No hidden fees, ever.</p>
    <div class="bill-toggle">
      <button class="bill-btn active" data-billing="monthly">Monthly</button>
      <button class="bill-btn" data-billing="annual">Annual <span class="save-tag ms-1">Save 20%</span></button>
    </div>
  </div>
</div>

<!-- PLANS -->
<section>
  <div class="container">
    <div class="row g-4 justify-content-center">
      <!-- STARTER -->
      <div class="col-md-6 col-lg-4">
        <div class="plan-card">
          <div class="plan-name">Starter</div>
          <div class="plan-price"><sup>â¹</sup>0</div>
          <div class="plan-period">Free forever</div>
          <p class="plan-desc">Perfect for first-time investors and occasional traders.</p>
          <div class="plan-divider"></div>
          <ul class="plan-feats">
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Zero delivery brokerage</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> â¹20/order intraday &amp; F&amp;O</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> NSE &amp; BSE trading</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Basic charts &amp; watchlist</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Mobile &amp; web platform</li>
            <li class="off"><i class="bi bi-x-circle ico-off"></i> Advanced charting tools</li>
            <li class="off"><i class="bi bi-x-circle ico-off"></i> AI stock screener</li>
            <li class="off"><i class="bi bi-x-circle ico-off"></i> Priority customer support</li>
          </ul>
          <a href="signup.jsp" class="btn-outline btn-sm d-block text-center">Open Free Account</a>
        </div>
      </div>
      <!-- PRO -->
      <div class="col-md-6 col-lg-4">
        <div class="plan-card featured">
          <div class="plan-name">Pro</div>
          <div class="plan-price" id="proPrice"><sup>â¹</sup>499</div>
          <div class="plan-period" id="proPeriod">/month</div>
          <p class="plan-desc">For active traders who want professional tools and deeper insights.</p>
          <div class="plan-divider"></div>
          <ul class="plan-feats">
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Everything in Starter</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> â¹10/order flat brokerage</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Advanced charting (50+ indicators)</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> AI stock screener</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Options analytics &amp; Greeks</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Priority support</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> GTT &amp; bracket orders</li>
            <li class="off"><i class="bi bi-x-circle ico-off"></i> API trading access</li>
          </ul>
          <a href="signup.jsp" class="btn-primary btn-sm d-block text-center">Start Pro Trial</a>
        </div>
      </div>
      <!-- ELITE -->
      <div class="col-md-6 col-lg-4">
        <div class="plan-card">
          <div class="plan-name">Elite</div>
          <div class="plan-price" id="elitePrice"><sup>â¹</sup>1,499</div>
          <div class="plan-period" id="elitePeriod">/month</div>
          <p class="plan-desc">For institutional-grade traders and high-frequency professionals.</p>
          <div class="plan-divider"></div>
          <ul class="plan-feats">
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Everything in Pro</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> â¹5/order or â¹0 on high volume</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Trading API access</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Basket &amp; algo trading</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Real-time Level 2 data</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Dedicated relationship manager</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> 24/7 priority support</li>
            <li class="on"><i class="bi bi-check-circle-fill ico-on"></i> Co-location services</li>
          </ul>
          <a href="signup.jsp" class="btn-outline btn-sm d-block text-center">Start Elite Trial</a>
        </div>
      </div>
    </div>
    <p class="text-center text-muted mt-4" style="font-size:.81rem">All plans include free Demat account opening. Statutory charges (STT, GST, stamp duty) apply on all trades.</p>
  </div>
</section>

<!-- BROKERAGE TABLE -->
<section class="bg-alt">
  <div class="container">
    <div class="text-center mb-5"><span class="section-tag">Breakdown</span><h2 class="section-title">Brokerage Charges</h2></div>
    <div class="tbl-wrap">
      <div class="table-responsive">
        <table class="table brok-tbl mb-0">
          <thead><tr><th>Segment</th><th>Delivery</th><th>Intraday</th><th>F&amp;O</th><th>Currency</th><th>Commodity</th></tr></thead>
          <tbody>
            <tr><td><strong>Brokerage</strong></td><td><span class="fee-free">FREE</span></td><td><span class="fee-val">â¹20/order</span></td><td><span class="fee-val">â¹20/order</span></td><td><span class="fee-val">â¹20/order</span></td><td><span class="fee-val">â¹20/order</span></td></tr>
            <tr><td><strong>STT / CTT</strong></td><td><span class="fee-val">0.1%</span></td><td><span class="fee-val">0.025%</span></td><td><span class="fee-val">0.0125%</span></td><td><span class="fee-free">NIL</span></td><td><span class="fee-val">0.01%</span></td></tr>
            <tr><td><strong>Exchange Charges</strong></td><td><span class="fee-val">0.00322%</span></td><td><span class="fee-val">0.00322%</span></td><td><span class="fee-val">0.00188%</span></td><td><span class="fee-val">0.00045%</span></td><td><span class="fee-val">0.0026%</span></td></tr>
            <tr><td><strong>GST</strong></td><td colspan="5"><span class="fee-val">18% on brokerage + exchange charges</span></td></tr>
            <tr><td><strong>SEBI Charges</strong></td><td colspan="5"><span class="fee-val">â¹10 per crore</span></td></tr>
            <tr><td><strong>Stamp Duty</strong></td><td><span class="fee-val">0.015%</span></td><td><span class="fee-val">0.003%</span></td><td><span class="fee-val">0.003%</span></td><td><span class="fee-val">0.002%</span></td><td><span class="fee-val">0.002%</span></td></tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>

<!-- FAQ -->
<section>
  <div class="container">
    <div class="text-center mb-5"><span class="section-tag">Help</span><h2 class="section-title">Frequently Asked Questions</h2></div>
    <div class="row justify-content-center"><div class="col-lg-8"><div id="faqList"></div></div></div>
  </div>
</section>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
