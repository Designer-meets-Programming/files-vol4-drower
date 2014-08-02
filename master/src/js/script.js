var $article, $body, $btn, $drower, $header, cssAnimation, cssAnimationTarget, openFlg, ua;

ua = navigator.userAgent.toLowerCase();

$body = $('body');

$header = $('header');

$article = $('article');

$drower = $('nav');

$btn = $('#btn');

openFlg = 1;

cssAnimationTarget = [$header, $article, $drower];

cssAnimation = {
  'open': {
    'transition-duration': '300ms',
    'transform': 'translate3D(-150px,0,0)',
    'transition-timing-function': 'ease-in-out'
  },
  'close': {
    'transition-duration': '300ms',
    'transform': 'translate3D(0,0,0)',
    'transition-timing-function': 'ease-in-out'
  }
};

$btn.on('click', function(e) {
  var target, _i, _len;
  e.preventDefault();
  for (_i = 0, _len = cssAnimationTarget.length; _i < _len; _i++) {
    target = cssAnimationTarget[_i];
    if (openFlg % 2) {
      target.css(cssAnimation.open);
    } else {
      target.css(cssAnimation.close);
    }
  }
  return openFlg++;
});

//# sourceMappingURL=script.js.map
