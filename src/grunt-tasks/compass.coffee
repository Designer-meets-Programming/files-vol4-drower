(->
	_ = require 'underscore'
	module.exports.extendGrantTask = (grunt)->
		# ======================================================================
		# パラメータ
		# ======================================================================
		config = grunt.config()
		gc     = grunt.glabalParam
		# ----------------------------------------------------------------------
		sassStlyeTpye      = 'scss'
		sassCacheDir       = gc.cacheDir + '.sass'
		 # ヘルパー関数のパスの設定 trueで相対パス。falseで絶対パス
		devRelativeAssets  = true
		prodRelativeAssets = true
		# 絶対パスで指定する場合のhttpathからsassファイルまでのパス
		sassSrcPath        = gc.httpPath + gc.srcDir + ''
		sassRaw            = 'preferred_syntax = :'+sassStlyeTpye+'\n'
		sassRequire        = gc.sass.require
		# 外部Sassファイルの読み込み
		sassImportPath     = gc.sass.importPath
		# ======================================================================
		# タスク設定
		# ======================================================================
		grunt.extendConfig({
			compass : 
				options : 
					httpPath       : sassSrcPath
					sassDir        : gc.sassDir
					cssDir         : gc.cssDir
					imagesDir      : gc.imagesDir
					javascriptsDir : gc.jsDir
					fontsDir       : gc.fontDir
					cacheDir       : sassCacheDir
					importPath     : sassImportPath
					require        : sassRequire
					raw            : sassRaw
					quiet          : true
				# --------------------------------------------------------------
				develop : 
					options : 
						environment      : 'development'
						outputStyle      : 'expanded'
						noLineComments   : true
						assetCacheBuster : false
						debugInfo        : false
						trace            : true
						watch            : true
						relativeAssets   : devRelativeAssets
				# --------------------------------------------------------------
				product : 
					options : 
						environment      : 'production'
						outputStyle      : 'compressed'
						noLineComments   : false
						assetCacheBuster : false
						debugInfo        : false
						trace            : false
						watch            : false
						force            : true
						relativeAssets   : prodRelativeAssets
		})
		# ======================================================================
		# タスク登録
		# ======================================================================
		# Compass dev mode
		# ----------------------------------------------------------------------
		compassDevFunc = ()->
			grunt.loadNpmTasks 'grunt-contrib-compass'
			grunt.task.run 'compass:develop'
		# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
		grunt.registerTask 'cmps:dev', 'compass develop mode', compassDevFunc
		grunt.registerTask 'cpms:dev', 'compass develop mode', compassDevFunc
		# ----------------------------------------------------------------------
		# Compass product mode
		# ----------------------------------------------------------------------
		compassProdFunc = ()->
			grunt.loadNpmTasks 'grunt-contrib-compass'
			grunt.task.run 'compass:product'
		# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
		grunt.registerTask 'cmps:prod', 'compass product mode', compassProdFunc
		grunt.registerTask 'cpms:prod', 'compass product mode', compassProdFunc
		

	return
)()