import std.stdio;

import core.sys.windows.windows;
import core.runtime;
import std.stdio;


void main()
{
  HMODULE h = cast(HMODULE)Runtime.loadLibrary("realmgame.dll");
  if(h)
    {
      writeln("Realm app found");
    }
  else
    {
      writeln("Could not find realm app");
      return;
    }
  FARPROC fp = GetProcAddress(h,"realm_main");
  if(fp)
    {
      writeln("Starting realm_main()");
      auto fun = cast(void function()) fp;
      fun();
    }
  else
    {
      writeln("Could not find realm_main()");
    }

}
