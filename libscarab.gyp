{
	"variables": {
		"target_arch%": "x64",
		"library": "static_library"
	},
	"target_defaults": {
		"include_dirs": [
			".",
			"include",
			"config/<(OS)/<(target_arch)"
		],
		"libraries": [
			"-lflint",
			"-lgmp",
			"-lmpfr"
		]
	},
	"targets": [
		{
			"target_name": "scarab",
			"product_prefix": "lib",
			"type": "<(library)",
			"sources": [
				"src/scarab.c",
				"src/types.c",
				"src/util.c"
			],
			"direct_dependent_settings": {
				"include_dirs": [
					".",
					"include",
					"config/<(OS)/<(target_arch)"
				]
			}
		},
		{
			"target_name": "test",
			"type": "executable",
			"sources": [
				"src/test.c"
			],
			"dependencies": [
				"scarab"
			]
		}
	]
}
