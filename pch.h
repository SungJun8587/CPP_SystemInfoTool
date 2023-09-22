
//***************************************************************************
// pch.h : include file for standard system include files
//
//***************************************************************************

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define WIN32_LEAN_AND_MEAN
#define _HAS_STD_BYTE 0			// c++17 옵션을 활성화 시 std::byte 를 비활성 하는 옵션

#include <windows.h>
#include <atlbase.h>
#include <comdef.h>
#include <tchar.h>
#include <crtdbg.h>
#include <time.h>
#include <typeinfo>
#include <malloc.h>
#include <locale.h> 
#include <strsafe.h>

#pragma warning(disable : 4251 4800)

//***************************************************************************
// customized or added header Files for the SystemInfoTool
#include "SystemInfoToolAll.h"
//***************************************************************************