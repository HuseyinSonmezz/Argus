$CurrentDir = $PSScriptRoot

if (Test-Path (Join-Path $CurrentDir "WPy64-313130\python\python.exe")) {
    $ToolsDir = $CurrentDir
} else {
    $ToolsDir = Join-Path $CurrentDir "Tools"
}

function nexus {
    $PythonExe = Join-Path $ToolsDir "WPy64-313130\python\python.exe"
    $NexusPy = Join-Path $ToolsDir "nexus.py"
    
    & $PythonExe $NexusPy $args
}
