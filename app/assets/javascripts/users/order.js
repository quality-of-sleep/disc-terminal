$(document).on('turbolinks:load', function() {
		// 新規住所追加ボタン押したときの処理
		$('.new_address').on('click', function(){
				$('#form-area').fadeToggle(2000);
				$('.cancel_button').show(4000);
				$('.form_title').show(4000);
    		$('.new_address').addClass('hidden');
    		$('.hero').addClass('z-index');
		});
    		// キャンセルしたときの処理
    $('.cancel_button').on('click',function() {
    		$('#form-area').fadeToggle(2000);
				$('.cancel_button').fadeToggle(2000);
		  	$('.new_address').removeClass('hidden');
		  	$('.hero').removeClass('z-index');
	 	 });

	// ラジオボタン切り替え時の処理
		$('.credit_card').on('click', function(){
			$('.credit_card_button').removeClass('hidden');
	 		$('.confirmation_btn').addClass('hidden');
		});
		$('.not_credit_card').on('click', function(){
	 		$('.credit_card_button').addClass('hidden');
	 		$('.confirmation_btn').removeClass('hidden');
		});
});