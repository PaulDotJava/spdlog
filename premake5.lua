project "spdlog"
    language "C++"
    cppdialect "C++20"
    kind "StaticLib"
    warnings "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/*.cpp",
        "include/**.h",
        "include/**.hpp"
    }

    includedirs {
        "include"
    }

    filter "system:windows"
        systemversion "latest"
        defines {
            "_CRT_SECURE_NO_WARNINGS",
            "SPDLOG_COMPILED_LIB"
        }

    filter "system:linux"
        defines { "SPDLOG_COMPILED_LIB" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "speed"
    
    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"
