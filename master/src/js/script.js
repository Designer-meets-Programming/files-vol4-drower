var $article, $body, $btn, $drower, $header, cssAnimation, cssAnimationTarget, ua;

ua = navigator.userAgent.toLowerCase();

$body = $('body');

$header = $('header');

$article = $('article');

$drower = $('nav');

$btn = $('#btn');

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
  },
  'btnOpen': {
    'transition-duration': '300ms',
    'transition-timing-function': 'ease-in-out',
    'transform': 'translate(3px,0)'
  },
  'span1Open': {
    'transition-duration': '300ms',
    'transform-origin': '0 100%',
    'transition-timing-function': 'ease-in-out',
    'transform': 'rotate(42deg)',
    'width': '28px'
  },
  'span2Open': {
    'transition-duration': '300ms',
    'transform': 'scale(0)',
    'transition-timing-function': 'ease-in-out'
  },
  'span3Open': {
    'transition-duration': '300ms',
    'transform-origin': '0 0',
    'transform': 'rotate(-42deg)',
    'transition-timing-function': 'ease-in-out',
    'width': '28px'
  },
  'btnClose': {
    'transition-duration': '300ms',
    'transition-timing-function': 'ease-in-out',
    'transform': 'translate(0,0)'
  },
  'span1Close': {
    'transition-duration': '300ms',
    'transform-origin': '0 100%',
    'transition-timing-function': 'ease-in-out',
    'transform': 'rotate(0deg)',
    'width': '30px'
  },
  'span2Close': {
    'transition-duration': '300ms',
    'transform': 'scale(1)',
    'transition-timing-function': 'ease-in-out'
  },
  'span3Close': {
    'transition-duration': '300ms',
    'transform-origin': '0 0',
    'transform': 'rotate(0deg)',
    'transition-timing-function': 'ease-in-out',
    'width': '30px'
  }
};

$btn.on('click', function(e) {
  var target, _i, _j, _len, _len1, _results, _results1;
  e.preventDefault();
  if (!$body.hasClass('open')) {
    $body.addClass('open');
    _results = [];
    for (_i = 0, _len = cssAnimationTarget.length; _i < _len; _i++) {
      target = cssAnimationTarget[_i];
      target.css(cssAnimation.open);
      $btn.css(cssAnimation.btnOpen);
      $('span:nth-child(1)', $btn).css(cssAnimation.span1Open);
      $('span:nth-child(2)', $btn).css(cssAnimation.span2Open);
      _results.push($('span:nth-child(3)', $btn).css(cssAnimation.span3Open));
    }
    return _results;
  } else {
    $body.removeClass('open');
    _results1 = [];
    for (_j = 0, _len1 = cssAnimationTarget.length; _j < _len1; _j++) {
      target = cssAnimationTarget[_j];
      target.css(cssAnimation.close);
      $btn.css(cssAnimation.btnClose);
      $('span:nth-child(1)', $btn).css(cssAnimation.span1Close);
      $('span:nth-child(2)', $btn).css(cssAnimation.span2Close);
      _results1.push($('span:nth-child(3)', $btn).css(cssAnimation.span3Close));
    }
    return _results1;
  }
});

//# sourceMappingURL=script.js.map
