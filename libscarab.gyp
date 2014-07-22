{
	"variables": {
		"target_arch%": "x64",
		"library": "static_library"
	},
	"target_defaults": {
		"defines": [],
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
			"target_name": "library",
			"product_prefix": "lib",
			"type": "<(library)",
			"sources": [
				"src/scarab.c",
				"src/types.c",
				"src/util.c"
			]
		},
		{
			"target_name": "test",
			"type": "executable",
			"sources": [
				"src/scarab.c",
				"src/types.c",
				"src/util.c",
				"src/test.c"
			]
		}
	]
}
