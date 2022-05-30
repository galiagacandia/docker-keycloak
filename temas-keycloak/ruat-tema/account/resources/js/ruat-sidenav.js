/* ---------------------------------------------------
    OFFCANVAS SIDEBAR SCRIPTS
----------------------------------------------------- */

var sidebarCollapse = document.getElementById("sidebarCollapse");
var container = document.getElementById("container");
//var offcanvas_el = document.querySelector("#offcanvas");
var offcanvas_el = document.getElementById("offcanvas");
var offcanvas = mdb.Offcanvas.getInstance(offcanvas_el);
if(!offcanvas){
  offcanvas = new mdb.Offcanvas(offcanvas_el)
}

offcanvas_el.addEventListener('hide.mdb.offcanvas', function () {
  sidebarCollapse.classList.remove('active');
})

offcanvas_el.addEventListener('show.mdb.offcanvas', function () {
  sidebarCollapse.classList.add('active');
})

function toggleMyOffcanvas() {
  container.style.paddingLeft=offcanvas_el.offsetWidth+"px";
  if (window.innerWidth < 800) {
    // Prevent hiding animation triggering if page first loaded in mobile view
    offcanvas_el.style.visibility = 'hidden';
    container.style.paddingLeft="0";
    if (offcanvas_el.classList.contains('show')) {
      offcanvas.hide();
    }
  } else {
    if (!offcanvas_el.classList.contains('show')) {
      offcanvas.show();
    }
  }
}

function highlightNav() {
  var paths = location.pathname.split("/"); // uri to array
  paths.shift(); // Remove domain name
  paths = '/' + paths.join('/'); // Add leading slash and join into a string
  paths = (paths == '/') ? '/' : paths.replace(/\/$/, ""); // Remove trailing slash if present
  const menuItem = document.querySelector('.offcanvas-body a[href="' + paths + '"]');
  if (menuItem) {
    menuItem.classList.add('active');
  }
}

window.onload = function() {
  toggleMyOffcanvas();
  highlightNav();
}

window.onresize = function() {
  toggleMyOffcanvas();
}