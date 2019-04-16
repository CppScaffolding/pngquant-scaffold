-- scaffold geniefile for pngquant

pngquant_script = path.getabsolute(path.getdirectory(_SCRIPT))
pngquant_root = path.join(pngquant_script, "pngquant")

pngquant_includedirs = {
	path.join(pngquant_script, "config"),
	pngquant_root,
}

pngquant_libdirs = {}
pngquant_links = {}
pngquant_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { pngquant_includedirs }
	end,

	_add_defines = function()
		defines { pngquant_defines }
	end,

	_add_libdirs = function()
		libdirs { pngquant_libdirs }
	end,

	_add_external_links = function()
		links { pngquant_links }
	end,

	_add_self_links = function()
		links { "pngquant" }
	end,

	_create_projects = function()

project "pngquant"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		pngquant_includedirs,
	}

	defines {}

	files {
		path.join(pngquant_script, "config", "**.h"),
		path.join(pngquant_root, "**.h"),
		path.join(pngquant_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
