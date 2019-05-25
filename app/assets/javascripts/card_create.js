$(function(){
  $(document).on('turbolinks:load', function () {
    function buildHTML(card) {
      var html = `<div class="card item"{data: { model_name: "list.class.name.underscore", update_url: card_sort_path(card)}}
                    <div class="card-title">
                      ${ card.name }
                    </div>
                    <div class="card__deadline">
                      ${ card.deadline }
                    </div>
                  </div>`
      return html;
    }

    $('#new_card').on('submit', function(e){
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
        $('.list__cards').append(html);
        $('#new_card')[0].reset();
      })
      .fail(function() {
        alert('error');
      })
      return false;
    });
  });
});
