$(function(){
  $(document).on('turbolinks:load', function () {
    function buildHTML(list) {
      var html = `<div class="list item">
                    <div class="list__name">
                      ${ list.name }
                    </div>
                    <div class="list__cards card-sortable">
                      <%= render ${ list.cards } %>
                    </div>
                    <div class="card__add">
                      <%= link_to 'Add Card', new_board_card_path(@board), remote: true, class: 'btn btn-outline-secondary' %>
                      <div id="card-form" class="modal fade"{"aria-hidden" => "true", :role => "dialog", :tabindex => "-1"} >
                      </div>
                    </div>
                  </div>`
      return html;
    }

    $('#new_list').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      console.log(formData)
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
