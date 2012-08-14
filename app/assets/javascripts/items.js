// # // Place all the behaviors and hooks related to the matching controller here.
// # // All this logic will automatically be available in application.js.
// # // You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function(){
    var item_kinds_path = $('#item_item_kind_name').data('autocomplete-source');
    $('#item_item_kind_name').autocomplete({
        source: item_kinds_path
    });

    $('.expiration').datepicker({
        dateFormat: 'yy-mm-dd'
    });
});