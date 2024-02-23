#include <windows.h>
#include <stdio.h>
#include <winuser.h>
#include <stdlib.h> // Include this for system function

typedef BOOL (WINAPI *REGISTERHOTKEY)(HWND, int, UINT, UINT);

#define HOTKEY_ID 1

LRESULT CALLBACK LowLevelKeyboardProc(int nCode, WPARAM wParam, LPARAM lParam);

void ShowBalloonTip(HWND hwnd, LPCSTR title, LPCSTR text);

int main() {
  // Load the RegisterHotKey function from user32.dll
  REGISTERHOTKEY RegisterHotKey = (REGISTERHOTKEY)GetProcAddress(GetModuleHandle("user32.dll"), "RegisterHotKey");

  // Register the Ctrl + Alt + 0 hotkey combination
  RegisterHotKey(NULL, HOTKEY_ID, MOD_CONTROL | MOD_ALT, 0x30);

  // Install the low-level keyboard hook
  HHOOK hhk = SetWindowsHookEx(WH_KEYBOARD_LL, LowLevelKeyboardProc, NULL, 0);

  // Message loop to listen for keyboard messages
  MSG msg;
  while (GetMessage(&msg, NULL, 0, 0)) {
    TranslateMessage(&msg);
    DispatchMessage(&msg);
  }

  // Uninstall the keyboard hook
  UnhookWindowsHookEx(hhk);

  return 0;
}

LRESULT CALLBACK LowLevelKeyboardProc(int nCode, WPARAM wParam, LPARAM lParam) {
  if (nCode == HC_ACTION) {
    KBDLLHOOKSTRUCT* p = (KBDLLHOOKSTRUCT*)lParam;
    if (p->vkCode == 0x30 && (GetAsyncKeyState(VK_CONTROL) & 0x8000) && (GetAsyncKeyState(VK_MENU) & 0x8000)) {
      // Ctrl + Alt + 0 hotkey detected

      // Open the clipboard
      if (OpenClipboard(NULL)) {
        HANDLE hData = GetClipboardData(CF_TEXT);  // Adjust if necessary
        wchar_t* text = (wchar_t*)GlobalLock(hData);

        // Save the clipboard content to a file in UTF-8 encoding
        FILE* fp = fopen("portapapeles", "w, ccs=UTF-8");
        if (fp) {
          fwprintf(fp, L"%s", text);  // Use fwprintf for formatted output
          fclose(fp);

          ShowBalloonTip(NULL, "System", "Done");

          // Execute the command after saving the file
          system("start /B python clipboard.py");
        }

        GlobalUnlock(hData);
        CloseClipboard();
      }
    }
  }

  return CallNextHookEx(NULL, nCode, wParam, lParam);
}

void ShowBalloonTip(HWND hwnd, LPCSTR title, LPCSTR text) {
  // Create a NOTIFYICONDATA structure
  NOTIFYICONDATA nid;
  ZeroMemory(&nid, sizeof(nid));

  nid.cbSize = sizeof(NOTIFYICONDATA);
  nid.hWnd = hwnd;
  nid.uID = 1; // Unique ID for the notification
  nid.uFlags = NIF_INFO;
  nid.dwInfoFlags = NIIF_INFO;

  // Set the notification title and text
  nid.szInfoTitle[0] = '\0';
  strcpy(nid.szInfoTitle, title);
  nid.szInfo[0] = '\0';
  strcpy(nid.szInfo, text);

  // Show the notification
  Shell_NotifyIcon(NIM_ADD, &nid);

  // Hide the notification after 5 seconds
  Sleep(1000);
  Shell_NotifyIcon(NIM_DELETE, &nid);
}
