{
	"variables": {
		"target_arch%": "x64",
		"library": "static_library"
	},
	"target_defaults": {
		"defines": [],
		"include_dirs": [
			".",
			"config/<(OS)/<(target_arch)"
		]
	},
	"targets": [
		{
			"target_name": "flint",
			"product_prefix": "lib",
			"type": "<(library)",
			"sources": [
				"<!@(ls -1 -R flint/**/*.c)"
			],
			"direct_dependent_settings": {
				"include_dirs": [
					".",
					"config/<(OS)/<(target_arch)"
				]
			}
		}
	]
}
