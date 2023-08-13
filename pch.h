
//***************************************************************************
// pch.h : include file for standard system include files
//
//***************************************************************************

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <atlbase.h>
#include <comdef.h>
#include <stdlib.h>
#include <crtdbg.h>
#include <Shellapi.h>
#include <strsafe.h>
#include <locale.h>

#pragma warning(disable : 4251 4800)

//***************************************************************************
// customized or added header Files for the SystemInfoTool
#include "SystemInfoToolAll.h"
//***************************************************************************