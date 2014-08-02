ua       = navigator.userAgent.toLowerCase()
$body    = $('body')
$header  = $('header')
$article = $('article')
$drower  = $('nav')
$btn     = $('#btn')
openFlg  = 1

cssAnimationTarget = [
	$header
	$article
	$drower
]

cssAnimation = 
	'open'  : 
		'transition-duration'        : '300ms'
		'transform'                  : 'translate3D(-150px,0,0)'
		'transition-timing-function' : 'ease-in-out'
	'close' : 
		'transition-duration'        : '300ms'
		'transform'                  : 'translate3D(0,0,0)'
		'transition-timing-function' : 'ease-in-out'

$btn.on('click',(e)->
	e.preventDefault()
	for target in cssAnimationTarget
		if(openFlg%2) then target.css(cssAnimation.open) else target.css(cssAnimation.close)
	openFlg++
)