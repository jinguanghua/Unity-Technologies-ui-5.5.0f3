@echo off

set monobleeding=E:\GameDevelop\Unity\Unity-5.5.1f1\Editor\Data\MonoBleedingEdge
set output="D:\github\Projects-Unity3D\UGUI\Unity-Technologies-ui-5.5.0f3\Unity-Technologies-ui-a72913523bde\Output"
set unityui="E:\GameDevelop\Unity\Unity-5.5.1f1\Editor\Data\UnityExtensions\Unity\GUISystem"

set pdb2md=%monobleeding%\lib\mono\4.5\pdb2mdb.exe
set mono=%monobleeding%\bin\mono.exe

set uidll=UnityEngine.UI.dll
set editoruidll=UnityEditor.UI.dll
set uimdb=%uidll%.mdb
set editoruimdb=%editoruidll%.mdb

echo "生成mdb..."
d:
cd %output%
%mono% %pdb2md% %uidll%

cd Editor
%mono% %pdb2md% %editoruidll%

cd ../Standalone
%mono% %pdb2md% %uidll%

cd ..

echo "复制mdb到Unity目录..."
copy %output%\%uimdb% %unityui%
copy %output%\Editor\%editoruimdb% %unityui%\Editor
copy %output%\Standalone\%uimdb% %unityui%\Standalone

echo "复制dll到Unity目录..."
copy %output%\%uidll% %unityui%
copy %output%\Editor\%editoruidll% %unityui%\Editor
copy %output%\Standalone\%uidll% %unityui%\Standalone




pause
