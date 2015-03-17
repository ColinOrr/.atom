# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrapped(true)

atom.workspaceView.command 'custom:copyline', ->
  editor = atom.workspace.getActiveEditor()
  if not editor.getSelectedText()
    cursor = editor.getCursor()
    originalPosition = cursor.getScreenPosition()
    editor.selectLine()
    editor.copySelectedText()
    cursor.setScreenPosition(originalPosition)
  else
    editor.copySelectedText()

atom.workspaceView.command 'custom:cutline', ->
  editor = atom.workspace.getActiveEditor()
  if not editor.getSelectedText()
    cursor = editor.getCursor()
    originalPosition = cursor.getScreenPosition()
    editor.selectLine()
    editor.cutSelectedText()
    cursor.setScreenPosition(originalPosition)
  else
    editor.cutSelectedText()
    
atom.workspaceView.command 'custom:pasteline', ->
  editor = atom.workspace.getActiveEditor()
  clipboardText = atom.clipboard.read()
  if clipboardText.indexOf('\n') == clipboardText.length - 1 and not editor.getSelectedText()
    cursor = editor.getCursor()
    originalPosition = cursor.getScreenPosition()
    cursor.moveToBeginningOfLine()
    editor.pasteText()
    originalPosition.row += 1
    cursor.setScreenPosition(originalPosition)
  else
    editor.pasteText()
