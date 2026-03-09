<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>VestaTrade | Smart Stock Trading Platform</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:wght@300;400;500&display=swap"/>
  <link rel="stylesheet" href="css/style.css"/>
</head>
<body>

<%@include file="header.jsp" %>

<div class="ticker-wrap"><div class="ticker-track" id="ticker"></div></div>

<!-- HERO -->
<section class="hero">
  <div class="hero-bg"></div>
  <div class="hero-grid"></div>
  <div class="container position-relative">
    <div class="row align-items-center g-5">
      <div class="col-lg-6">
        <div class="hero-badge anim-up"><span class="dot"></span>Live Market Â· NSE &amp; BSE</div>
        <h1 class="anim-up delay-1">Trade Smarter.<br>Grow <span class="text-accent">Faster.</span><br>Invest <span class="text-green">Confidently.</span></h1>
        <p class="anim-up delay-2">VestaTrade gives you professional-grade tools, real-time data, and zero-commission trades â everything you need to master the market.</p>
        <div class="hero-actions anim-up delay-3">
          <a href="signup" class="btn-primary">Open Free Account</a>
          <a href="markets" class="btn-outline"><i class="bi bi-play-circle me-2"></i>Explore Markets</a>
        </div>
        <div class="hero-stats anim-up delay-4">
          <div><div class="stat-val">â¹2.4T+</div><div class="stat-label">Daily Volume</div></div>
          <div><div class="stat-val">1.8M+</div><div class="stat-label">Active Traders</div></div>
          <div><div class="stat-val">99.9%</div><div class="stat-label">Uptime SLA</div></div>
        </div>
      </div>
      <div class="col-lg-6 anim-right delay-2">
        <div class="chart-card">
          <div class="chart-head">
            <div><div class="chart-sym">NIFTY 50</div><div class="chart-exch">NSE Â· Index</div></div>
            <div class="text-end"><div class="chart-price">24,832.65</div><div class="chart-chg"><i class="bi bi-arrow-up"></i> +1.24% today</div></div>
          </div>
          <svg class="chart-svg" viewBox="0 0 300 110" preserveAspectRatio="none">
            <defs><linearGradient id="cg" x1="0" y1="0" x2="0" y2="1"><stop offset="0%" stop-color="#00d4ff" stop-opacity="0.22"/><stop offset="100%" stop-color="#00d4ff" stop-opacity="0"/></linearGradient></defs>
            <path d="M0,88 C20,82 30,72 50,68 S80,52 100,56 S130,46 150,42 S180,32 200,27 S230,18 250,15 S280,9 300,6" stroke="#00d4ff" stroke-width="2.5" fill="none"/>
            <path d="M0,88 C20,82 30,72 50,68 S80,52 100,56 S130,46 150,42 S180,32 200,27 S230,18 250,15 S280,9 300,6 L300,110 L0,110 Z" fill="url(#cg)"/>
          </svg>
          <div class="mini-grid">
            <div class="mini-tile"><div class="mini-sym">RELIANCE</div><div class="mini-val text-green">â¹2,948 <small>+2.1%</small></div></div>
            <div class="mini-tile"><div class="mini-sym">TCS</div><div class="mini-val text-green">â¹4,125 <small>+0.8%</small></div></div>
            <div class="mini-tile"><div class="mini-sym">INFY</div><div class="mini-val text-red">â¹1,876 <small>-0.4%</small></div></div>
            <div class="mini-tile"><div class="mini-sym">HDFC BANK</div><div class="mini-val text-green">â¹1,642 <small>+1.3%</small></div></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- FEATURES -->
<section class="bg-alt">
  <div class="container">
    <div class="row g-4">
      <div class="col-12 col-md-6 col-xl-3"><div class="card card-line"><div class="feat-icon teal"><i class="bi bi-lightning-charge-fill"></i></div><h5>Zero-Commission Trading</h5><p>Trade NSE &amp; BSE stocks, F&amp;O, currencies, and commodities with absolutely zero brokerage on delivery.</p></div></div>
      <div class="col-12 col-md-6 col-xl-3"><div class="card card-line"><div class="feat-icon green"><i class="bi bi-bar-chart-line-fill"></i></div><h5>Advanced Charting</h5><p>50+ technical indicators, multi-timeframe analysis, and drawing tools powered by professional-grade charts.</p></div></div>
      <div class="col-12 col-md-6 col-xl-3"><div class="card card-line"><div class="feat-icon orange"><i class="bi bi-shield-check-fill"></i></div><h5>Bank-Grade Security</h5><p>256-bit encryption, 2FA, and SEBI-registered platform. Your investments are secured and insured.</p></div></div>
      <div class="col-12 col-md-6 col-xl-3"><div class="card card-line"><div class="feat-icon red"><i class="bi bi-cpu-fill"></i></div><h5>AI Market Insights</h5><p>AI-powered stock screener and recommendations tailored to your risk profile and investment goals.</p></div></div>
    </div>
  </div>
</section>

<!-- MARKET TABLE -->
<section>
  <div class="container">
    <div class="row mb-4 align-items-end">
      <div class="col-lg-6"><span class="section-tag">Live Data</span><h2 class="section-title">Today's Market Movers</h2></div>
      <div class="col-lg-6 text-lg-end mt-3 mt-lg-0">
        <div class="tab-bar justify-content-lg-end">
          <button class="tab-btn active" data-home="all">All</button>
          <button class="tab-btn" data-home="up">Top Gainers</button>
          <button class="tab-btn" data-home="down">Top Losers</button>
        </div>
      </div>
    </div>
    <div class="tbl-wrap">
      <div class="table-responsive">
        <table class="table mb-0">
          <thead><tr><th>#</th><th>Stock</th><th>Price</th><th>Change %</th><th>Volume</th><th>Trend</th><th></th></tr></thead>
          <tbody id="homeTableBody"></tbody>
        </table>
      </div>
    </div>
    <div class="text-center mt-4"><a href="markets" class="btn-outline">View All Stocks <i class="bi bi-arrow-right ms-2"></i></a></div>
  </div>
</section>

<!-- HOW IT WORKS -->
<section class="bg-alt">
  <div class="container">
    <div class="text-center mb-5">
      <span class="section-tag">Process</span>
      <h2 class="section-title">Start Trading in 3 Steps</h2>
      <p class="section-sub mx-auto" style="max-width:460px">Open your account in minutes. Verify KYC, fund your wallet, and start investing.</p>
    </div>
    <div class="row g-4 text-center">
      <div class="col-md-4"><div class="step-num">01</div><div class="step-icon"><i class="bi bi-person-plus-fill"></i></div><h5 class="fw-bold mb-2">Create Account</h5><p class="text-muted">Sign up with your mobile, complete e-KYC with Aadhaar &amp; PAN in under 5 minutes.</p></div>
      <div class="col-md-4"><div class="step-num">02</div><div class="step-icon"><i class="bi bi-wallet2"></i></div><h5 class="fw-bold mb-2">Fund Your Account</h5><p class="text-muted">Transfer funds instantly via UPI, NEFT, or IMPS from any bank. Zero deposit fees.</p></div>
      <div class="col-md-4"><div class="step-num">03</div><div class="step-icon"><i class="bi bi-graph-up-arrow"></i></div><h5 class="fw-bold mb-2">Start Investing</h5><p class="text-muted">Browse stocks, place orders, track your portfolio in real-time. Your journey to wealth begins.</p></div>
    </div>
  </div>
</section>

<!-- TESTIMONIALS -->
<section>
  <div class="container">
    <div class="text-center mb-5"><span class="section-tag">Reviews</span><h2 class="section-title">Trusted by 1.8M+ Traders</h2></div>
    <div class="row g-4">
      <div class="col-md-4"><div class="testimonial-card"><div class="stars">âââââ</div><p class="t-text">"VestaTrade changed how I invest. The UI is clean, execution is fast, and I love the AI insights feature."</p><div class="t-author"><div class="t-avatar" style="background:rgba(0,212,255,.14);color:var(--accent)">RK</div><div><div class="t-name">Rahul Kumar</div><div class="t-role">Equity Trader Â· Mumbai</div></div></div></div></div>
      <div class="col-md-4"><div class="testimonial-card"><div class="stars">âââââ</div><p class="t-text">"Zero brokerage on delivery is a game-changer. I've saved thousands in fees. The charting tools are top-notch."</p><div class="t-author"><div class="t-avatar" style="background:rgba(0,255,135,.14);color:var(--green)">PS</div><div><div class="t-name">Priya Sharma</div><div class="t-role">Long-term Investor Â· Bangalore</div></div></div></div></div>
      <div class="col-md-4"><div class="testimonial-card"><div class="stars">âââââ</div><p class="t-text">"The F&amp;O trading tools are excellent. Fast order execution and their support team is very responsive."</p><div class="t-author"><div class="t-avatar" style="background:rgba(255,107,53,.14);color:var(--orange)">AV</div><div><div class="t-name">Amit Verma</div><div class="t-role">F&amp;O Trader Â· Delhi</div></div></div></div></div>
    </div>
  </div>
</section>

<!-- CTA -->
<section class="cta-strip">
  <div class="container">
    <h2>Ready to Start Your Investment Journey?</h2>
    <p>Join over 1.8 million traders who trust VestaTrade. Free account, zero commissions.</p>
    <div class="d-flex gap-3 justify-content-center flex-wrap">
      <a href="signup" class="btn-primary">Open Free Account</a>
      <a href="contact" class="btn-outline">Talk to an Advisor</a>
    </div>
  </div>
</section>

<%@include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
