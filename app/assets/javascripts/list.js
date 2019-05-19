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
                      <%= form_for @card do |f| %>
                        <%= f.text_field :name, class: 'list__name__form', placeholder: 'Type Card Name' %>
                        <%= f.submit 'Add Card', class: 'btn btn-outline-secondary' %>
                      <% end %>
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
