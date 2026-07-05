@echo off

set ROOT_DIR=%~dp0
set OLLAMA_CORE=%ROOT_DIR%System\Ollama_Core
set OLLAMA_MODELS=%ROOT_DIR%System\Agents_Files

set OLLAMA_HOST=127.0.0.1:11434
set PATH=%PATH%;%OLLAMA_CORE%

taskkill /F /IM ollama.exe >nul 2>&1
taskkill /F /IM "ollama app.exe" >nul 2>&1

start /B "" "%OLLAMA_CORE%\ollama.exe" serve >nul 2>&1
timeout /t 3 /nobreak >nul

powershell.exe -NoProfile -NoExit -Command ^
    "function argus { " ^
    "    Clear-Host; " ^
    "    Write-Host '                                                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '       c            *       .-.               *                                    ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                           |   |     *                  *      r                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                           |   |                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                           |   |                   a                               ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '             e             |   |                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                     _.-'''' - = - ''''-._      *                                  ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '     t              ''''- ._   :   _. -''''                  *                     ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                         |   :   |                                                 ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                         |   :   |                e                                ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '           d             |   :   |                                                 ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                 ___   ____  ______ __  __ _____             b                     ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                /   | / __ \/ ____// / / // ___/                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '    *          / /| |/ /_/ / / __ / / / / \__ \                                    ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '              / ___ / _, _/ /_/ // /_/ / ___/ /       y        *                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '             /_/  |_/_/ |_|\____/ \____//____/                                     ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                                                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '    Y                    |   :   |                                                 ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                         | - : - |            A             *                      ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                         \   |   /                                                 ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '      *          F        \  |  /                   *                              ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                           \ | /                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                            ''v''         *                E                       ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '       S             *                            *                                ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                                                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                                                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '          The Shadows Are Listening. Awaiting Input.                               ' -ForegroundColor Green; " ^
    "    Write-Host '                  [ DEVELOPED BY YAFES ]                                           ' -ForegroundColor Cyan; " ^
    "    Write-Host '                                                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '                                                                                   ' -ForegroundColor DarkCyan; " ^
    "    Write-Host '- Type ''info'' for system overview and commands.                                  ' -ForegroundColor Gray; " ^
    "    Write-Host ''; " ^
    "}; " ^
    "function global:info { " ^
    "    Write-Host '==================================================' -ForegroundColor DarkCyan; " ^
    "    Write-Host '[*] DEVELOPER & SYSTEM INFO' -ForegroundColor Cyan; " ^
    "    Write-Host '    Project Argus is a fully portable, offline Command & Control (C2)' -ForegroundColor White; " ^
    "    Write-Host '    interface developed by Yafes, a Turkish developer.' -ForegroundColor Gray; " ^
    "    Write-Host '    It operates with embedded Ollama and Python engines, requiring zero' -ForegroundColor White; " ^
    "    Write-Host '    external dependencies. The system features automated file sharing/parsing,' -ForegroundColor Gray; " ^
    "    Write-Host '    a native translation engine.' -ForegroundColor White; " ^
    "    Write-Host '    GitHub: https://github.com/HuseyinSonmezz' -ForegroundColor Gray; " ^
    "    Write-Host ''; " ^
    "    Write-Host '[*] AGENT ROSTER & CORE MODELS' -ForegroundColor Cyan; " ^
    "    Write-Host '    [LYNX]    - Offensive & Payload' -ForegroundColor DarkRed; " ^
    "    Write-Host '    [ROSETTA] - OSINT & Social Engineering' -ForegroundColor DarkYellow; " ^
    "    Write-Host '    [HERMIT]  - Data Analysis & Processing' -ForegroundColor Green; " ^
    "    Write-Host '    [ZENITH]  - Stoicism & Machiavellianism' -ForegroundColor DarkMagenta; " ^
    "    Write-Host '    [JANUS]   - Linguistics & Translation' -ForegroundColor Blue; " ^
    "    Write-Host '    [CORES]   - Mistral, Hermes3:8b, Llama3, Llama3.1' -ForegroundColor Yellow; " ^
    "    Write-Host ''; " ^
    "    Write-Host '[*] SYSTEM COMMANDS' -ForegroundColor Cyan; " ^
    "    Write-Host '    [agent_name]   ' -NoNewline -ForegroundColor Yellow; Write-Host '- Launches direct terminal link to the specified agent.' -ForegroundColor White; " ^
    "    Write-Host '    [toEN / toTR]  ' -NoNewline -ForegroundColor Yellow; Write-Host '- Offline Directly Translation, (if you have a complex text, use The Janus.)' -ForegroundColor Gray; " ^
    "    Write-Host '                     Usage: toen ''text'' , totr ''text''.' -ForegroundColor White; " ^
    "    Write-Host '    [nexus]        ' -NoNewline -ForegroundColor Yellow; Write-Host '- The courier tool for automated file analysis.' -ForegroundColor Gray; " ^
    "    Write-Host '                     Usage: nexus agent ''prompt'' file.txt [save]' -ForegroundColor White; " ^
    "    Write-Host '                     Use ''save'' at the end to inject results into the Agent_Reports directory.' -ForegroundColor Gray; " ^
    "    Write-Host '==================================================' -ForegroundColor DarkCyan; " ^
    "}; " ^
    "function global:lynx { Write-Host '[-] LYNX: Target acquired. Awaiting strike order.' -ForegroundColor DarkRed; ollama run lynx; }; " ^
    "function global:hermit { Write-Host '[-] HERMIT: Data processing matrix online.' -ForegroundColor Green; ollama run hermit; }; " ^
    "function global:zenith { Write-Host '[-] ZENITH: Strategic oversight engaged.' -ForegroundColor DarkMagenta; ollama run zenith; }; " ^
    "function global:rosetta { Write-Host '[-] ROSETTA: Intelligence grid active.' -ForegroundColor DarkYellow; ollama run rosetta; }; " ^
    "function global:janus { Write-Host '[-] JANUS: Linguistic matrix online. Awaiting data.' -ForegroundColor DarkBlue; ollama run janus; }; " ^
    "function global:toEN { & '%ROOT_DIR%Tools\WPy64-313130\python\python.exe' '%ROOT_DIR%Tools\translator.py' 'en' $args }; " ^
    "function global:toTR { & '%ROOT_DIR%Tools\WPy64-313130\python\python.exe' '%ROOT_DIR%Tools\translator.py' 'tr' $args }; " ^
    "function global:nexus { & '%ROOT_DIR%Tools\WPy64-313130\python\python.exe' '%ROOT_DIR%Tools\nexus.py' $args }; " ^
    "argus;"