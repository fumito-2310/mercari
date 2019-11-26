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







// document.addEventListener(
//   "DOMContentLoaded", e => {
//     if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
//       Payjp.setPublicKey("pk_test_7d386521f59112ddf7a3b132"); //ここに公開鍵を直書き
//       let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
//       btn.addEventListener("click", e => { //ボタンが押されたときに作動します
//         e.preventDefault(); //ボタンを一旦無効化します
//         let card = {
//           number: document.getElementById("card_number").value,
//           cvc: document.getElementById("cvc").value,
//           exp_month: document.getElementById("exp_month").value,
//           exp_year: document.getElementById("exp_year").value
//         }; //入力されたデータを取得します。
//         Payjp.createToken(card, (status, response) => {
//           if (status === 200) { //成功した場合
//             $("#card_number").removeAttr("name");
//             $("#cvc").removeAttr("name");
//             $("#exp_month").removeAttr("name");
//             $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
//             $("#card_token").append(
//               $('<input type="hidden" name="payjp-token">').val(response.id)
//             ); //取得したトークンを送信できる状態にします
//             document.inputForm.submit();
//             alert("登録が完了しました"); //確認用
//           } else {
//             alert("カード情報が正しくありません。"); //確認用
//           }
//         });
//       });
//     }
//   },
//   false
// );




// var form = $("#card__form");
//   Payjp.setPublicKey("PAYJP_KEY");
// //まずはテスト鍵をセットする↑
//   $("#submit_btn").on("click",function(e){
//     e.preventDefault();
//   //↑ここでrailsの処理を止めることでjsの処理を行う
//     var card = {
//       number: $("#payment_card_no").val(),
//       cvc: $("#payment_card_cvc").val(),
//       exp_month: $("#expiry_date_month").val(),
//       exp_year: $("#expiry_date_year").val()
//     };
//    //↑Pay.jpに登録するデータを準備する
//     Payjp.createToken(card,function(status,response){
//    //↑先ほどのcard情報がトークンという暗号化したものとして返ってくる
//       form.find("input[type=submit]").prop("disabled", true);
//       if(status == 200){//←うまくいった場合200になるので
//         $("#card_number").removeAttr("name");
//         $("#card_cvc").removeAttr("name");
//         $("#exp_month").removeAttr("name");
//         $("#exp_year").removeAttr("name");
//        //↑このremoveAttr("name")はデータを保持しないように消している
//         var payjphtml = `<input type="hidden" name="payjpToken" value=${response.id}>`
//         form.append(payjphtml);
//         //↑これはdbにトークンを保存するのでjsで作ったトークンをセットしてる
//         document.inputForm.submit();
//        //↑そしてここでsubmit！！これでrailsのアクションにいく！もちろん上でトークンをセットしているのでparamsの中には{payjpToken="トークン"}という情報が入っている
//       }else{
//         alert("カード情報が正しくありません。");
//       }
//     });
//   });
