$ ->
  $('[data-toggle="tooltip"]').tooltip()
  return

$ ->
  $('[data-editor="h1"]').click ->
    insertAtCaret('#md-editor textarea', '# Your title')
    return

$ ->
  $('[data-editor="h2"]').click ->
    insertAtCaret('#md-editor textarea', '## Your title')
    return

$ ->
  $('[data-editor="h3"]').click ->
    insertAtCaret('#md-editor textarea', '### Your title')
    return

$ ->
  $('[data-editor="h4"]').click ->
    insertAtCaret('#md-editor textarea', '#### Your title')
    return

$ ->
  $('[data-editor="h5"]').click ->
    insertAtCaret('#md-editor textarea', '##### Your title')
    return

$ ->
  $('[data-editor="italic"]').click ->
    insertAtCaret('#md-editor textarea', '*Italic text*')
    return

$ ->
  $('[data-editor="bold"]').click ->
    insertAtCaret('#md-editor textarea', '__Bold text__')
    return

$ ->
  $('[data-editor="ol"]').click ->
    insertAtCaret('#md-editor textarea', "\n\n1. Item 1\n2. Item 2\n3. Item 3 \n\n")
    return

$ ->
  $('[data-editor="ul"]').click ->
    insertAtCaret('#md-editor textarea', "\n\n* Item 1\n* Item 2\n* Item 3 \n\n")
    return

$ ->
  $('[data-editor="underline"]').click ->
    insertAtCaret('#md-editor textarea', '_Underlined text_')
    return

$ ->
  $('[data-editor="table"]').click ->
    insertAtCaret('#md-editor textarea', "\n|Header|Header|Header|\n|:------|:-------:|------:|\n|Left alignment|Centered|Right alignment|\n\n")
    return

$ ->
  $('[data-editor="link"]').click ->
    insertAtCaret('#md-editor textarea', "\n[This is a link](http://google.com)\n")
    return

$ ->
  $('[data-editor="image"]').click ->
    insertAtCaret('#md-editor textarea', "\n![Alt](https://www.google.com.co/images/srpr/logo11w.png)\n")
    return

$ ->
  $('[data-editor="preview"]').click ->
    preview()
    return

insertAtCaret = (areaId, text) ->
  txtarea = $(areaId)[0]
  if !txtarea
    return
  scrollPos = txtarea.scrollTop
  strPos = 0
  br = if txtarea.selectionStart or txtarea.selectionStart == '0' then 'ff' else if document.selection then 'ie' else false
  if br is 'ie'
    txtarea.focus()
    range = document.selection.createRange()
    range.moveStart 'character', -txtarea.value.length
    strPos = range.text.length
  else if br is 'ff'
    strPos = txtarea.selectionStart
  front = txtarea.value.substring(0, strPos)
  back = txtarea.value.substring(strPos, txtarea.value.length)
  txtarea.value = front + text + back
  strPos = strPos + text.length
  if br is 'ie'
    txtarea.focus()
    ieRange = document.selection.createRange()
    ieRange.moveStart 'character', -txtarea.value.length
    ieRange.moveStart 'character', strPos
    ieRange.moveEnd 'character', 0
    ieRange.select()
  else if br is 'ff'
    txtarea.selectionStart = strPos
    txtarea.selectionEnd = strPos
    txtarea.focus()
  txtarea.scrollTop = scrollPos
  return

preview = ->
  if $('#md-editor').prop('hidden')
    $('#md-preview').text('Preview')
    $('#md-editor').removeAttr('hidden')
    $('#md-preview-card').attr('hidden', 'true')
    false
  else
    $.post(
      '/editor/preview',
      {md: $('#md-editor textarea').val()},
      (data) ->
        $('#md-preview').text('Editor')
        $('#md-editor').attr('hidden', 'true')
        $('#md-preview-card').removeAttr('hidden')
        $('#md-preview-card .card-body').html(data)
    )
  return
