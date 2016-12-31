@echo Off
set config=Release
set version=%1

REM Build
"%programfiles(x86)%\MSBuild\12.0\Bin\MSBuild.exe" "couchbase-net-client.sln" /p:Configuration="%config%" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false

REM Package
mkdir Build
call .nuget\nuget pack Couchbase\Couchbase.nuspec -Version "%version%" -OutputDirectory Build -IncludeReferencedProjects -properties Configuration=Release