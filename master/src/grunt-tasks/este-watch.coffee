(->
	_ = require 'underscore'
	module.exports.extendGrantTask = (grunt)->
		# ======================================================================
		# パラメータ
		# ======================================================================
		config = grunt.config()
		gc     = grunt.glabalParam
		# ======================================================================
		# タスク設定
		# ======================================================================
		grunt.extendConfig({
			esteWatch : 
				options : 
					dirs       : gc.watchDirs
					livereload : 
						enabled : false
				# --------------------------------------------------------------
				# Coffee
				# --------------------------------------------------------------
				coffee : (filePath)->
					filePath = filePath.replace(gc.coffeeDir, '')
					grunt.config.set ['coffee','develop','src'], filePath
					['coffee:build:dev']
				# --------------------------------------------------------------
				# Sass
				# --------------------------------------------------------------
				sass : (filePath)->
					grunt.config.set ['compass','develop','options','watch'], false
					grunt.config.set ['compass','develop','options','force'], false
					['cmps:dev']
				scss : (filePath)->
					grunt.config.set ['compass','develop','options','watch'], false
					grunt.config.set ['compass','develop','options','force'], false
					['cmps:dev']
		})
		# ======================================================================
		# タスク登録
		# ======================================================================
		grunt.registerTask 'watch', 'watch', ()->
			grunt.loadNpmTasks 'grunt-este-watch'
			grunt.task.run 'esteWatch'
	return
)()