
// # // Place all the behaviors and hooks related to the matching controller here.
// # // All this logic will automatically be available in application.js.
// # // You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function(){
  var item_kinds_path = $('#item_item_kind_name').data('autocomplete-source');
		$('#item_item_kind_name').autocomplete({
			source: item_kinds_path,
			select: function (event, ui) {}
	});

	$('#item_item_kind_name').on("autocompleteselect", function (event, ui) {
		$('#item_storage').remove();
		var item_kind_path =  "/item_kinds/" + ui.item.label;
		$.get(item_kind_path, function (data) {
			$(data).insertBefore('#new_item .btn');
		});
	});

    $('.expiration').datepicker({
        dateFormat: 'yy-mm-dd'
    });
});

