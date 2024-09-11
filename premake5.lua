workspace "NJGameFramework"
    architecture "x64"

    configurations {
        "Debug",
        "Release",
        "Dist"
    }

    startproject "GameFramework"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GameFramework"
    location "GameFramework"
    kind "ConsoleApp"
    language "C++"
    


    targetdir("Bin/" .. outputdir .. "/%{prj.name}")
    objdir("BinInt/" .. outputdir .. "/%{prj.name}")
    

    files {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.hpp",
        "%{prj.name}/src/**.c",
        "%{prj.name}/src/**.cpp" 
    }

    includedirs {
        "Breaker-Engine/vendor",
        "Breaker-Engine/src"
    }

    links {
        "Breaker"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines {
            "BR_PLATFORM_WINDOWS"
        }

    
    filter "configurations:Debug"
        defines "BR_DEBUG"
        symbols "On"
    
    filter "configurations:Release"
        defines "BR_RELEASE"
        optimize "On"
    
    filter "configurations:Dist"
        defines "BR_DIST"
        optimize "On"   
    


    
