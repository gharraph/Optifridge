# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $('#item_item_kind_name').autocomplete
        source: $('#item_item_kind_name').data('autocomplete-source')

#source -- can pass a url for it to query through ajax
#
#
# $.document.ready(){
#   $('#item_item_kind_name').autocomplete(){
#       source: $('#item_item_kind_name').data('autocomplete-source')
#   }
# }