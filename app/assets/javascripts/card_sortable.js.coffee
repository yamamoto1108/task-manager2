$ ->
  $(document).on 'turbolinks:load', -> 
    $('.card-sortable').sortable
      items: '.item'

      update: (e, ui) ->
        item = ui.item
        item_data = item.data()
        params = { _method: 'put' }
        params[item_data.modelName] = { row_order_position: item.index() }
        $.ajax
          type: 'POST'
          url: item_data.updateUrl
          dataType: 'json'
          data: params
