(->
	_ = require 'underscore'
	module.exports.extendGrantTask = (grunt)->
		# ======================================================================
		# パラメータ
		# ======================================================================
		# config = grunt.config()
		# gc     = grunt.glabalParam
		# ----------------------------------------------------------------------
		# syncHost     = gc.host
		# syncBaseDir  = '../'
		# syncIndex    = 'index.html'
		# syncWatchSrc = [
		#	syncBaseDir + '*.html',
		#	gc.jsDir + '*.js',
		#	gc.cssDir + '*.css'
		#]
		#syncGhosts = 
		#	scroll : true,
		#	links  : false,
		#	forms  : true
		# ======================================================================
		# タスク設定
		# ======================================================================
		#grunt.extendConfig({
		#	browser_sync : 
		#		files :
		#			src : syncWatchSrc
		#		options : 
		#			host      : syncHost,
		#			debugInfo : true,
		#			ghostMode : syncGhosts
		#			server    : 
		#				baseDir : syncBaseDir,
		#				index   : syncIndex
		#})
		# ======================================================================
		# タスク登録
		# ======================================================================
		#grunt.registerTask 'sync', 'bower sync', ()->
		#	grunt.loadNpmTasks 'grunt-browser-sync'
		#	grunt.task.run('browser_sync')
	return
)()