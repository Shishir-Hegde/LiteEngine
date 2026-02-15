workspace "LiteEngine"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "LiteEngine/vendor/GLFW/include"
IncludeDir["Glad"] = "LiteEngine/vendor/Glad/include"

include "LiteEngine/vendor/GLFW"
include "LiteEngine/vendor/Glad"

project "LiteEngine"
    location "LiteEngine"
    kind "SharedLib"
    language "C++"
    buildoptions { "/utf-8" }

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    -- Precompiled headers
    pchheader "hzpch.h"
    pchsource "LiteEngine/src/hzpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "LiteEngine/src/hzpch.cpp" -- explicitly include PCH source
    }

    includedirs
    {
        "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}"
    }

    links
    {
        "GLFW",
        "Glad",
        "opengl32.lib",
        "dwmapi.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "LE_PLATFORM_WINDOWS",
            "LE_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands
        {
            ("{MKDIR} ../bin/" .. outputdir .. "/Sandbox"),
            ("{COPYFILE} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox/%{file.basename}%{file.extension}")
        }


	filter "configurations:Debug"
		defines "LE_DEBUG"
		buildoptions "/MDd"
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

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "LiteEngine/vendor/spdlog/include",
        "LiteEngine/src"
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