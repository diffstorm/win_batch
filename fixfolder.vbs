'Fix against directory hider virus

'attrib -h -r -s /s /d H:\*.*

cDrive = "H:"

Set FSO = CreateObject("Scripting.FileSystemObject")
ShowSubfolders FSO.GetFolder(cDrive)

Sub ShowSubFolders(Folder)
 str = ""
 For Each Subfolder in Folder.SubFolders
  str = str & " " & Subfolder.Path
  subFolder.Attributes = 0
  ShowSubfolders Subfolder
 Next
End Sub