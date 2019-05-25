$(function(){
  $(document).on('turbolinks:load', function () {
    function buildHTML(list) {
      var html = `<div class="list item">
                    <div class="list__name">
                      ${ list.name }
                    </div>
                  </div>`
      return html;
    }

    $('#new_list').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })

      .done(function(data) {
        var html = buildHTML(data);
        $('.board__lists').append(html);
        $('#new_list')[0].reset();
      })
      .fail(function() {
        alert('error');
      })
      return false;
    });
  });
});
