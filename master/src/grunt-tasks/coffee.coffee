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
			coffee : 
				develop : 
					options : 
						sourceMap : true
						bare      : gc.coffeeBare
					expand  : true
					flatten : false
					cwd     : gc.coffeeDir
					src     : ['{,*/}*.coffee']
					dest    : gc.jsDir
					ext     : '.js'
				product : 
					options : 
						sourceMap : false
						bare      : gc.coffeeBare
					expand  : true
					flatten : true
					cwd     : gc.coffeeDir
					src     : ['{,*/}*.coffee']
					dest    : gc.jsDir
					ext     : '.js'
		})
		# ======================================================================
		# タスク登録
		# ======================================================================
		grunt.registerTask 'coffee:build', 'coffee script compile', (type)->
			# type -> prod : string // product mode
			# type -> dev  : string // develop mode
			grunt.loadNpmTasks('grunt-contrib-coffee')
			if(type == 'dev')  then grunt.task.run('coffee:develop')
			if(type == 'prod')
				grunt.loadNpmTasks('grunt-contrib-uglify')
				grunt.loadNpmTasks('grunt-exec')
				dir    = grunt.glabalParam.jsDir
				tmpDir = 'asset'
				grunt.config.set(['coffee','product','dest'], dir+tmpDir)
				# uglifyの設定
				grunt.config.set(['uglify','js','files'],[{
					expand : true
					cwd    : dir+tmpDir
					src    : '*.js'
					dest   : dir
				}])
				# execの設定
				grunt.config.set(['exec','command'],'rm -rf '+dir+tmpDir)
				# --------------------------------------------------------------
				grunt.task.run('coffee:product')
				grunt.task.run('uglify:js')
				grunt.task.run('exec')
	return
)()