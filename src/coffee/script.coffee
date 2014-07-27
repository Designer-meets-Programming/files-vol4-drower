ua       = navigator.userAgent.toLowerCase()
click    = if((ua.indexOf('iphone') > 0 && ua.indexOf('ipad') == -1) || ua.indexOf('android') > 0) then 'click' else 'click'
$body    = $('body')
$header  = $('header')
$article = $('article')
$drower  = $('nav')
$bnt     = $('#btn')

$bnt.on(click,->
	if($body.hasClass('open'))
		$body.removeClass('open').addClass('close')
	else
		$body.removeClass('close').addClass('open')

	return
)