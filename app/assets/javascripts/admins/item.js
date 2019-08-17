$(document).ready(function () {
  // 全ての子孫要素から取得する.find()
	// $($('.new-item').find('select, input[type=text]')).addClass('form-control').css({'width':'30%' ,'display':'inline'});

	// 最初はディスク削除ボタンを隠す
	$("div>.remove_fields").hide();

// 要素を追加したときの関数
// $('a').on('click', function(){} という記述法では追加要素に適用されない
	$(document).on('click','.nested-fields a',function(){

		// 追加要素にもbootstrapを適用させるためclassを付与
		var add_form_control = function(){
			$('input[type=text]').addClass('form-control').css({'width':'50%' ,'display':'inline'});
		}
		// disc番号と曲順は隠しておく
		var hide_text = function(){
			$('.song-number, .disc-number').hide();
		}

		// disc番号を生成
		i = 1
		var disc_number = function(){
			$('.disc-number').each(function(){
				$(this).closest('.disc').addClass('disc-' + i);
				$(this).val(i);
				i ++
			});
		}

		// disc番号毎の曲順を生成
		j = 1
		var song_number = function(){
			$('.disc').each(function(){ // disc毎にループを掛ける
				k = 1
				$(`.disc-${j} .song-number`).each(function(){	// 変数展開にはバッククォートを用いる
					$(this).val(k);
					k ++
				});
				j ++
			});
		}

		// フォーム生成と同じタイミングでは動かないのでずらす
		setTimeout(add_form_control,1);
		setTimeout(hide_text,3);
		setTimeout(disc_number,5);
		setTimeout(song_number,10);
	  });

});





