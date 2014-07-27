var $article, $bnt, $body, $drower, $header, click, ua;

ua = navigator.userAgent.toLowerCase();

click = (ua.indexOf('iphone') > 0 && ua.indexOf('ipad') === -1) || ua.indexOf('android') > 0 ? 'click' : 'click';

$body = $('body');

$header = $('header');

$article = $('article');

$drower = $('nav');

$bnt = $('#btn');

$bnt.on(click, function() {
  if ($body.hasClass('open')) {
    $body.removeClass('open').addClass('close');
  } else {
    $body.removeClass('close').addClass('open');
  }
});

//# sourceMappingURL=script.js.map
