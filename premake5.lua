workspace "LiteEngine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
project "LiteEngine"
	location "LiteEngine"
	kind "SharedLib"
	language "C++"
	buildoptions { "/utf-8" }

	targetdir ("bin/" ..outputdir .."/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "hzpch.h"
	pchsource "LiteEngine/src/LiteEngine/hzpch.cpp"
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"LE_PLATFORM_WINDOWS",
			"LE_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir.. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "LE_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "LE_RELEASE"
		symbols "On"

	filter "configurations:Dist"
		defines "LE_DIST"
		symbols "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	buildoptions { "/utf-8" }

	targetdir ("bin/" ..outputdir .."/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"LiteEngine/vendor/spdlog/include",
		"LiteEngine/src/LiteEngine"
	}


	links
	{
		"LiteEngine"
	}
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"LE_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "LE_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "LE_RELEASE"
		symbols "On"

	filter "configurations:Dist"
		defines "LE_DIST"
		symbols "On"