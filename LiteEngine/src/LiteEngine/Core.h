#pragma once

#ifdef LE_PLATFORM_WINDOWS
	#ifdef LE_BUILD_DLL
		#define LITEENGINE_API __declspec(dllexport)
	#else
		#define LITEENGINE_API __declspec(dllimport)
	#endif
#else
	#error LiteEngine only supports Windows!
#endif