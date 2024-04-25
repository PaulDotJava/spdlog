-- premake5.lua

-- Define project
project "spdlog"
    language "C++"
    cppdialect "C++20"
    kind "StaticLib"
    warnings "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")

    files {
        "src/*.cpp",
        "include/**.h",
        "include/**.hpp"
    }

    includedirs {
        "include"
    }

    filter "system:windows"
        defines {
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"
    
    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"
