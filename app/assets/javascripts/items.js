// # // Place all the behaviors and hooks related to the matching controller here.
// # // All this logic will automatically be available in application.js.
// # // You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(function(){
    var item_kinds_path = $('#item_item_kind_name').data('autocomplete-source');
    $('#item_item_kind_name').autocomplete({
        source: item_kinds_path
    });

    $('#item_item_kind_name').on("autocompleteselect", function (event, ui) {
        $('#item_storage').empty();
        var item_kind_path =  "/item_kinds/" + ui.item.label;
        $.getJSON(item_kind_path, function (data) {
            $.each(data, function (index, value) {
                var option = '<option value="' + value + '">' + value + '</option>';
                $('#item_storage').append(option);
            });
        });
    });

    $('.expiration').datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: function (dateText, inst) {
            var itemId = $(this).parents("li").attr("id");
            $.ajax({
                url: '/items/' + itemId,
                type: 'PUT',
                data: "expiration=" + dateText
            });
        }
    });

    // $('.image-upload').click(function(e) {
    //     e.preventDefault();
    //     $('.modal').modal('show');
    // });
    // Wasn't able to load image in a modal but saving this here for now.
    // $('.add-image').click(function(e) {
    //     // $('.add-image').submit(function(e){
    //     //     alert('Submitted');
    //     // });
    //     var form_data = $('.image-form').find('input').serializeArray();
    //     console.log(form_data);
    //     var file = $('#image_file').val();
    //     // $.ajax({
    //     //     url: '/images',
    //     //     type: 'POST',
    //     //     data: "file=" + file,
    //     //     success: function(e){
    //     //         alert('Uploaded');
    //     //     }
    //     // });
    //     //Need to save image
    //     //Need to ping OCR-IT
    //     //Need to wait for a response
    //     //Need to process the response
    //     //Then we can drop the modal
    //     $('.modal').modal('hide');
    // });

});

