/* ============================================================
   VestaTrade - Global JavaScript
   Handles: ticker, market table, FAQ, pricing toggle, UI utils
   Auth (login / register) is handled by Java Spring backend.
   ============================================================ */

/* -- Ticker tape -- */
var TICKER_DATA = [
  { sym:'NIFTY 50',   price:'24,832.65', change:'+1.24%', up:true  },
  { sym:'SENSEX',     price:'81,454.32', change:'+0.98%', up:true  },
  { sym:'RELIANCE',   price:'2,948.10',  change:'+2.10%', up:true  },
  { sym:'TCS',        price:'4,125.35',  change:'+0.82%', up:true  },
  { sym:'INFY',       price:'1,876.50',  change:'-0.38%', up:false },
  { sym:'HDFC BANK',  price:'1,642.80',  change:'+1.32%', up:true  },
  { sym:'WIPRO',      price:'565.40',    change:'-0.72%', up:false },
  { sym:'ICICI BANK', price:'1,198.60',  change:'+1.58%', up:true  },
  { sym:'BHARTIARTL', price:'1,572.20',  change:'+0.45%', up:true  },
  { sym:'HCLTECH',    price:'1,894.75',  change:'+1.92%', up:true  },
  { sym:'BAJFINANCE', price:'7,234.50',  change:'-1.12%', up:false },
  { sym:'SBIN',       price:'824.30',    change:'+0.63%', up:true  },
  { sym:'ITC',        price:'462.15',    change:'+0.28%', up:true  },
  { sym:'AXISBANK',   price:'1,134.20',  change:'-0.55%', up:false },
];

function buildTicker() {
  var wrap = document.getElementById('ticker');
  if (!wrap) return;
  var all  = TICKER_DATA.concat(TICKER_DATA);
  var html = '';
  for (var i = 0; i < all.length; i++) {
    var d = all[i];
    html += '<div class="ticker-item">' +
      '<span class="t-sym">' + d.sym + '</span>' +
      '<span class="t-price">&#8377;' + d.price + '</span>' +
      '<span class="' + (d.up ? 't-up' : 't-dn') + '">' +
        (d.up ? '&#9650;' : '&#9660;') + ' ' + d.change +
      '</span></div>';
  }
  wrap.innerHTML = html;
}

/* -- Market table -- */
var ALL_STOCKS = [
  { sym:'RELIANCE',   name:'Reliance Industries',   price:2948.10, chg:60.80,  pct:2.10, high:2965.50, low:2890.00, vol:3200000, sector:'Energy',  up:true,  path:'M0,30 C20,28 40,20 60,18 S90,10 120,8'  },
  { sym:'TCS',        name:'Tata Consultancy Svcs', price:4125.35, chg:33.60,  pct:0.82, high:4142.00, low:4080.00, vol:1800000, sector:'IT',       up:true,  path:'M0,25 C20,22 40,18 60,15 S90,10 120,8'  },
  { sym:'INFY',       name:'Infosys Limited',        price:1876.50, chg:7.20,   pct:0.38, high:1902.00, low:1868.00, vol:4100000, sector:'IT',       up:false, path:'M0,10 C20,12 40,16 60,18 S90,22 120,28' },
  { sym:'HDFC BANK',  name:'HDFC Bank Limited',      price:1642.80, chg:21.50,  pct:1.32, high:1655.00, low:1618.00, vol:5600000, sector:'Banking',  up:true,  path:'M0,28 C20,25 40,20 60,15 S90,10 120,6'  },
  { sym:'WIPRO',      name:'Wipro Limited',           price:565.40,  chg:4.10,   pct:0.72, high:572.00,  low:561.00,  vol:2300000, sector:'IT',       up:false, path:'M0,8 C20,12 40,16 60,20 S90,24 120,30'  },
  { sym:'ICICI BANK', name:'ICICI Bank Limited',      price:1198.60, chg:18.70,  pct:1.58, high:1208.00, low:1176.00, vol:6200000, sector:'Banking',  up:true,  path:'M0,30 C20,24 40,18 60,14 S90,8 120,5'   },
  { sym:'BHARTIARTL', name:'Bharti Airtel Limited',   price:1572.20, chg:7.10,   pct:0.45, high:1585.00, low:1560.00, vol:3800000, sector:'Telecom',  up:true,  path:'M0,22 C20,20 40,17 60,15 S90,12 120,10' },
  { sym:'HCLTECH',    name:'HCL Technologies Ltd',    price:1894.75, chg:35.60,  pct:1.92, high:1908.00, low:1858.00, vol:2900000, sector:'IT',       up:true,  path:'M0,28 C20,22 40,18 60,12 S90,8 120,5'   },
  { sym:'BAJFINANCE', name:'Bajaj Finance Limited',   price:7234.50, chg:82.20,  pct:1.12, high:7340.00, low:7210.00, vol:1200000, sector:'NBFC',     up:false, path:'M0,8 C20,11 40,15 60,20 S90,25 120,29'  },
  { sym:'SBIN',       name:'State Bank of India',     price:824.30,  chg:5.20,   pct:0.63, high:832.00,  low:815.00,  vol:9400000, sector:'Banking',  up:true,  path:'M0,26 C20,23 40,18 60,15 S90,11 120,8'  },
  { sym:'ITC',        name:'ITC Limited',             price:462.15,  chg:1.30,   pct:0.28, high:466.00,  low:459.00,  vol:7100000, sector:'FMCG',     up:true,  path:'M0,20 C20,19 40,17 60,15 S90,13 120,11' },
  { sym:'AXISBANK',   name:'Axis Bank Limited',       price:1134.20, chg:6.30,   pct:0.55, high:1148.00, low:1128.00, vol:4200000, sector:'Banking',  up:false, path:'M0,10 C20,13 40,17 60,20 S90,23 120,28' },
  { sym:'SUNPHARMA',  name:'Sun Pharmaceutical',      price:1682.40, chg:24.10,  pct:1.45, high:1695.00, low:1658.00, vol:1900000, sector:'Pharma',   up:true,  path:'M0,28 C20,24 40,18 60,14 S90,9 120,6'   },
  { sym:'TATAMOTORS', name:'Tata Motors Limited',     price:968.40,  chg:12.60,  pct:1.32, high:978.00,  low:952.00,  vol:8700000, sector:'Auto',     up:true,  path:'M0,27 C20,23 40,18 60,13 S90,9 120,6'   },
  { sym:'MARUTI',     name:'Maruti Suzuki India Ltd', price:12450.75,chg:145.00, pct:1.15, high:12640.00,low:12380.00,vol:480000,  sector:'Auto',     up:false, path:'M0,8 C20,12 40,16 60,20 S90,24 120,29'  },
];

var _moveFilter = 'all';
var _sortKey    = null;
var _sortAsc    = true;

function _el(id)  { return document.getElementById(id); }
function _val(id) { var e = _el(id); return e ? e.value : ''; }

function _filterStocks() {
  var search = _val('searchInput').toLowerCase();
  var sector = _val('sectorFilter');
  var data = ALL_STOCKS.filter(function(s) {
    var ms = s.sym.toLowerCase().indexOf(search) > -1 || s.name.toLowerCase().indexOf(search) > -1;
    var mv = _moveFilter === 'all' || (_moveFilter === 'up' && s.up) || (_moveFilter === 'down' && !s.up) || _moveFilter === 'active';
    return ms && (!sector || s.sector === sector) && mv;
  });
  if (_sortKey) {
    data.sort(function(a, b) {
      var va = a[_sortKey], vb = b[_sortKey];
      if (typeof va === 'string') return _sortAsc ? va.localeCompare(vb) : vb.localeCompare(va);
      return _sortAsc ? va - vb : vb - va;
    });
  }
  return data;
}

function _fmt(n) { return n.toLocaleString('en-IN', { minimumFractionDigits:2 }); }

function renderHomeTable() {
  var tbody = _el('homeTableBody');
  if (!tbody) return;
  var data = _filterStocks().slice(0, 6);
  var html = '';
  for (var i = 0; i < data.length; i++) {
    var s = data[i]; var cls = s.up ? 'chg-up' : 'chg-dn'; var sign = s.up ? '+' : '-';
    html += '<tr>' +
      '<td class="vol-cell">' + (i+1) + '</td>' +
      '<td><div class="stk-sym">' + s.sym + '</div><div class="stk-name">' + s.name + '</div></td>' +
      '<td class="mono" style="font-weight:500">&#8377;' + _fmt(s.price) + '</td>' +
      '<td><span class="' + cls + '">' + sign + s.pct.toFixed(2) + '%</span></td>' +
      '<td class="vol-cell">' + (s.vol/1e6).toFixed(1) + 'M</td>' +
      '<td><svg class="sparkline" viewBox="0 0 120 35" preserveAspectRatio="none">' +
        '<path d="' + s.path + '" stroke="' + (s.up?'#00ff87':'#ff4560') + '" stroke-width="2" fill="none"/></svg></td>' +
      '<td><button class="btn-trade">Trade</button></td>' +
    '</tr>';
  }
  tbody.innerHTML = html;
}

function renderMarketsTable() {
  var tbody = _el('mktTableBody');
  if (!tbody) return;
  var data = _filterStocks();
  var html = '';
  for (var i = 0; i < data.length; i++) {
    var s = data[i]; var cls = s.up ? 'chg-up' : 'chg-dn'; var sign = s.up ? '+' : '-';
    html += '<tr>' +
      '<td class="vol-cell">' + (i+1) + '</td>' +
      '<td><div class="stk-sym">' + s.sym + '</div><div class="stk-name">' + s.name + '</div></td>' +
      '<td class="mono" style="font-weight:500">&#8377;' + _fmt(s.price) + '</td>' +
      '<td><span class="' + cls + '">' + sign + s.chg.toFixed(2) + '</span></td>' +
      '<td><span class="' + cls + '">' + sign + s.pct.toFixed(2) + '%</span></td>' +
      '<td class="vol-cell">&#8377;' + s.high.toLocaleString('en-IN') + '</td>' +
      '<td class="vol-cell">&#8377;' + s.low.toLocaleString('en-IN') + '</td>' +
      '<td class="vol-cell">' + (s.vol/1e6).toFixed(1) + 'M</td>' +
      '<td><span class="sector-tag">' + s.sector + '</span></td>' +
      '<td><div class="d-flex gap-1">' +
        '<button class="btn-trade btn-sm" onclick="toggleStar(this)"><i class="bi bi-star"></i></button>' +
        '<button class="btn-trade btn-sm">Trade</button>' +
      '</div></td>' +
    '</tr>';
  }
  tbody.innerHTML = html;
  var rc = _el('rowCount');
  if (rc) rc.textContent = data.length;
}

function toggleStar(btn) {
  var ico = btn.querySelector('i');
  var on  = ico.classList.contains('bi-star-fill');
  ico.className   = on ? 'bi bi-star' : 'bi bi-star-fill';
  btn.style.color = on ? '' : 'var(--accent)';
}

function setMoveFilter(type, btn) {
  _moveFilter = type;
  document.querySelectorAll('.tab-btn[data-move]').forEach(function(b) { b.classList.remove('active'); });
  if (btn) btn.classList.add('active');
  renderMarketsTable();
}

function homeFilter(type, btn) {
  _moveFilter = type;
  document.querySelectorAll('.tab-btn[data-home]').forEach(function(b) { b.classList.remove('active'); });
  if (btn) btn.classList.add('active');
  renderHomeTable();
}

function sortTable(key) {
  if (_sortKey === key) { _sortAsc = !_sortAsc; } else { _sortKey = key; _sortAsc = true; }
  renderMarketsTable();
}

function selectIdx(card) {
  document.querySelectorAll('.idx-card').forEach(function(c) { c.classList.remove('active'); });
  card.classList.add('active');
}

/* -- Pricing toggle -- */
var PRICES = {
  monthly: { pro:'499',  elite:'1,499', proPeriod:'/month',                  elitePeriod:'/month'                  },
  annual:  { pro:'399',  elite:'1,199', proPeriod:'/month, billed annually',  elitePeriod:'/month, billed annually' }
};

function setBilling(type, btn) {
  document.querySelectorAll('.bill-btn').forEach(function(b) { b.classList.remove('active'); });
  if (btn) btn.classList.add('active');
  var p = PRICES[type];
  var pp = _el('proPrice');   if (pp)  pp.innerHTML    = '<sup>&#8377;</sup>' + p.pro;
  var ep = _el('elitePrice'); if (ep)  ep.innerHTML    = '<sup>&#8377;</sup>' + p.elite;
  var pt = _el('proPeriod');  if (pt)  pt.textContent  = p.proPeriod;
  var et = _el('elitePeriod');if (et)  et.textContent  = p.elitePeriod;
}

/* -- FAQ -- */
function buildFAQ(faqs) {
  var list = _el('faqList');
  if (!list) return;
  var html = '';
  for (var i = 0; i < faqs.length; i++) {
    html += '<div class="faq-item">' +
      '<div class="faq-q" onclick="toggleFaq(' + i + ')">' +
        '<span>' + faqs[i].q + '</span>' +
        '<i class="bi bi-plus-lg faq-icon" id="fi' + i + '"></i>' +
      '</div>' +
      '<div class="faq-a" id="fa' + i + '">' + faqs[i].a + '</div>' +
    '</div>';
  }
  list.innerHTML = html;
}

function toggleFaq(i) {
  var a = _el('fa' + i); if (a)  a.classList.toggle('open');
  var f = _el('fi' + i); if (f)  f.classList.toggle('open');
}

/* -- Aadhaar auto-format (signup form) -- */
function formatAadhar(inp) {
  var v = inp.value.replace(/\D/g, '').slice(0, 12);
  inp.value = v.replace(/(\d{4})(?=\d)/g, '$1 ').trim();
}

/* -- Init -- */
document.addEventListener('DOMContentLoaded', function() {
  buildTicker();
  renderHomeTable();
  renderMarketsTable();

  var si = _el('searchInput');  if (si) si.addEventListener('input',  renderMarketsTable);
  var sf = _el('sectorFilter'); if (sf) sf.addEventListener('change', renderMarketsTable);
  var ef = _el('exchFilter');   if (ef) ef.addEventListener('change', renderMarketsTable);

  document.querySelectorAll('.tab-btn[data-move]').forEach(function(btn) {
    btn.addEventListener('click', function() { setMoveFilter(btn.dataset.move, btn); });
  });
  document.querySelectorAll('.tab-btn[data-home]').forEach(function(btn) {
    btn.addEventListener('click', function() { homeFilter(btn.dataset.home, btn); });
  });
  document.querySelectorAll('.bill-btn').forEach(function(btn) {
    btn.addEventListener('click', function() { setBilling(btn.dataset.billing, btn); });
  });

  buildFAQ([
    { q:'Is the Starter plan really free forever?',    a:'Yes. No time limits, no hidden fees. Zero brokerage on equity delivery and all basic features included.' },
    { q:'Are there any account opening charges?',      a:'No. Account opening is 100% free. Annual maintenance charge (AMC) is waived for the first year.' },
    { q:'What statutory charges apply to my trades?',  a:'STT, exchange charges, GST, stamp duty, and SEBI fees are government levied and passed on at actual cost with zero markup.' },
    { q:'Can I upgrade or downgrade my plan anytime?', a:'Yes. Upgrades take effect immediately; downgrades apply from the next billing cycle.' },
    { q:'What payment methods are accepted?',          a:'UPI, debit/credit cards, net banking, and wallet payments via PCI-DSS compliant gateways.' },
    { q:'Is there a free trial for Pro and Elite?',    a:'Yes. Both include a 30-day free trial. No credit card required to start.' },
  ]);
});
