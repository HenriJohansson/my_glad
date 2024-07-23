project "GLAD"
    kind "StaticLib"
    language "C"
    staticruntime "On"

    targetdir ("bin/" .. OutputDir .. "/%{prj.name}")
    objdir ("bing-int/" .. OutputDir .. "/%{prj.name}")

    files {
        "include/glad/glad.h",
        "include/KHR/khrplatform.h",
        "src/glad.c"
    }

    includedirs {
        "include"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"        
        
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter { "system:windows", "configurations:Release"}
        runtime "Release"
        optimize "On"
        buildoptions "/MT"
    
    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"
