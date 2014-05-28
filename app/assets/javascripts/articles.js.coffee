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
