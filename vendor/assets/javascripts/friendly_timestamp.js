var get_cookie, set_cookie;

$(document).ready(function() {
  var d, n;
  d = new Date;
  n = d.getTimezoneOffset();
  return set_cookie('time_zone_offset_utc_mn', n, 30);
});

set_cookie = function(cname, cvalue, exdays) {
  var d;
  d = new Date;
  d.setTime(d.getTime() + exdays * 24 * 60 * 60 * 1000);
  return document.cookie = cname + '=' + cvalue + ';expires=' + d.toUTCString() + ';path=/';
};

get_cookie = function(cname) {
  var c, ca, i, name;
  name = cname + '=';
  ca = document.cookie.split(';');
  i = 0;
  while (i < ca.length) {
    c = ca[i];
    while (c.charAt(0) === ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) === 0) {
      return c.substring(name.length, c.length);
    }
    i++;
  }
  return '';
};
