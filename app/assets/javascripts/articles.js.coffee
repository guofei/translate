# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'page:change', ->
        $('.show-origin').hide()

        $('.hidden-origin').click ->
                $('.translation').removeClass('col-md-6')
                $('.translation').addClass('col-md-12')
                $('.origin').hide()
                $('.show-origin').show()

        $('.show-origin').click ->
                $('.translation').removeClass('col-md-12')
                $('.translation').addClass('col-md-6')
                $('.origin').show()
                $('.show-origin').hide()

        $('#translation_text').mouseup ->
                # textarea = $('#translation_text')[0]
                # line = getLine(textarea)

        $('#translation_text').keyup ->


getLine = (textarea) ->
        textarea.value.substr(0, getCaret(textarea)).split("\n").length

getCaret = (el) ->
        if el.selectionStart
                return el.selectionStart
        else if document.selection
                el.focus()
                r = document.selection.createRange()
                if r is null
                        return 0
                re = el.createTextRange()
                rc = re.duplicate()
                re.moveToBookmark(r.getBookmark())
                rc.setEndPoint('EndToStart', re)
                return rc.text.length
        else
                return 0
