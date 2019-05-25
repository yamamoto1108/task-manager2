$(function() {
  $(ducument).on ('turbolinks:load', function() {

    function appendList(user) {
      var html = `<div class="team__member__search" id="${ user.id }_search">
                    <p class="team__member__name">${ user.name }</p>
                    <div class="team__member__add" id="${ user.id }_add" data-user-id="${ user.id }" data-user-name="${ user.name }">追加</div>
                  </div>`
      $("#member__search__result").append(html)
    }

    function appendUser(user) {  //メンバーの表示
      var html = `<div class='team__member'>
                    <input name='team[user_ids][]' type='hidden' value='${ user.id }'>
                    <p class='team__member__name'>${ user.name }</p>
                    <div class='team__member__delete btn btn-outline-danger'>削除</div>
                  </div>`
      $("#team__members").append(html)
    }

    function appendErrMsgToHTML(msg) {
      var html = `<div class="error-msg">${ msg }</div>`
      $("#member__search__result").append(html);
    }

    $("#member__search").on("click", function() {
      var input = $("#member__search__field").val();
      console.log(input);
      $.ajax({
        type: 'GET',
        url: '/users',
        data: { keyword: input },
        dataType: 'json'
      })

      .done(function(users) {
        $("#member__search__result").empty();
        if (users.length !== 0) {
          users.forEach(function(user) {
            appendList(user);
            //検索リストで追加ボタンがクリックされたとき
            $(".team__member__search").on("click", `#${user.id}_add`, function() {  //ajaxで後から追加された要素にもイベントを発火させる際の記述方法
              appendUser(user);
              $(`#${user.id}_search`).remove();  //メンバーに追加されたユーザーを検索リストから削除
            });
          });
          
        } else {
          appendErrMsgToHTML("一致するユーザーがありません");
        }
      })

      .fail(function() {
        alert('ユーザー検索に失敗しました');
      })
    });

    $("#team__members").on("click", ".team__member__delete", function() {
      $(this).parent().remove();  //削除されたユーザーをメンバーリストから削除
    });
  });
});
