document.addEventListener(
  "DOMContentLoaded", e =>{
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_553d87ec2d170b4446edee3a"); //公開鍵直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得される
      btn.addEventListener("click", e => { //ボタンが押されてイベント発火
        e.preventDefault();
        let card = {
          number: document.getElementById("card_num").value,
          cvc: document.getElementById("security_code").value,
          exp_month: document.getElementById("expiration_month").value,
          exp_year: document.getElementById("expiration_year").value,
        }; //入力されたデータを取得
        console.log(card);
        console.log(card.number);
        console.log(card.cvc);
        console.log(card.exp_month);
        console.log(card.exp_year);
        Payjp.createToken(card, (status, response) => {
          if (status === 200){
            $("#card_num").removeAttr("name");
            $("#security_code").removeAttr("name");
            $("#expiration_month").removeAttr("name");
            $("#expiration_year").removeAttr("name");//データを自サーバに保存しないようにname属性を削除
            var token = response.id;
            $("#charge-form").append($('<input type="hidden" name="payjp_token" class="payjp-token" />').val(token));
            $("#charge-form").get(0).submit();
          }else{
            alert("Error");
          }
        });
      });
    }
  },
  false
);