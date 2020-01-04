$(document).on('turbolinks:load', function() {
  let form = $("#charge-form");
  Payjp.setPublicKey('pk_test_7d386521f59112ddf7a3b132');
  $(document).on("click", "#token_submit", function(e) {

    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);

    let card = {
        number: $("#card_number").val(),
        cvc: $("#cvc").val(),
        exp_month: $("#exp_month").val(),
        exp_year: $("#exp_year").val(),
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('入力が正しくありません');
        $('input').prop("disabled", false);
      }
      else {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        let token = response.id;

        form.append($('<input type="hidden" name="payjp-token" />').val(token));
        form.get(0).submit();
        alert("登録が完了しました"); //確認用
      }
    });
  });
});
