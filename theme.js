(function () {
  var d = document.documentElement;
  try {
    var t = localStorage.getItem('pm-theme');
    if (t === 'dark' || t === 'light') d.setAttribute('data-theme', t);
  } catch (e) {}

  function current() {
    var a = d.getAttribute('data-theme');
    if (a) return a;
    return window.matchMedia && matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }

  function build() {
    var navin = document.querySelector('.nav-in');
    if (!navin || navin.querySelector('.theme-toggle')) return;
    var btn = document.createElement('button');
    btn.type = 'button';
    btn.className = 'theme-toggle';
    btn.setAttribute('aria-label', 'Toggle dark mode');
    btn.innerHTML = '<svg viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="1.6"/><path d="M12 3a9 9 0 0 1 0 18z" fill="currentColor"/></svg>';
    var cta = navin.querySelector('.nav-cta');
    navin.insertBefore(btn, cta);
    btn.addEventListener('click', function () {
      var next = current() === 'dark' ? 'light' : 'dark';
      d.setAttribute('data-theme', next);
      try { localStorage.setItem('pm-theme', next); } catch (e) {}
    });
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', build);
  else build();
})();
