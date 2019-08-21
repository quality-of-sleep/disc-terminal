$(document).on('turbolinks:load', function() {
  // 全ての子孫要素から取得する.find()
  $($('.item-page').find('select, input[type=text], input[type=number]')).addClass('form-control').css({'display':'inline'});
  $($('.item-page').find('select')).addClass('btn btn-default dropdown-toggle');
  $($('.review-page').find('select, input[type=text], input[type=number]')).addClass('form-control').css({'display':'inline'});
  $($('.review-page').find('select')).addClass('btn btn-default dropdown-toggle');

  // for index-page
	$('.btn-info').css({'padding':'6px'});

	// 一番目のディスク削除ボタンを隠す(divの直下のclassのみ適用)
	// $("div>.remove_fields").hide();

	// disc番号と曲順を隠す
		var hide_text = function(){
			$('.song-number, .disc-number').hide();
		}
		hide_text() // 実行

	// disc番号を生成。既にディスク複数ある場合にも対応
		var disc_number = function(){
			i = 1
			$('.disc-number').each(function(){
				$(this).closest('.disc').addClass('disc-' + i); // var song_numberで用いる
				$(this).val(i);		// disc-number(params)を変更
				$(this).prev().text('Disc-' + i); // label名を変更
				i ++
			});
		}
		disc_number() // 実行

		// disc番号毎の曲順を生成
		var song_number = function(){
			j = 1
			$('.disc').each(function(){ // disc毎にループを掛ける
				k = 1
				$(`.disc-${j} .song-number`).each(function(){	// 変数展開にはバッククォートを用いる
					$(this).val(k);
					k ++
				});
				j ++
			});
		}
		song_number() // 実行

		// 追加ボタン装飾
		var add_add_btn = function(){
			$('.add_fields').addClass('btn btn-success btn-block');
		}
		add_add_btn() // 実行

		// 削除ボタン装飾
		var add_remove_btn = function(){
			$('.remove_fields').addClass('btn btn-danger');
		}
		add_remove_btn() // 実行

	// 要素を追加したときの関数
	// $('a').on('click', function(){} という記述法では追加要素に適用されない
	$(document).on('click','.nested-fields a',function(){

		// 追加要素にもbootstrapを適用させるためclassを付与
		var add_form_control = function(){
			$('.disc input[type=text]').addClass('form-control').css({'width':'90%' ,'display':'inline'});
		}

		var disc_remove_margin = function(){
			$("div>.remove_fields").css({'margin-bottom':'15px'});
		}


		// フォーム生成と同じタイミングでは動かないのでずらす
		setTimeout(add_add_btn,3);
		setTimeout(add_remove_btn,5);
		setTimeout(disc_remove_margin,7);
		setTimeout(add_form_control,9);
		setTimeout(hide_text,10);
		setTimeout(disc_number,15);
		setTimeout(song_number,20);
	  });

});

	// ディスクを追加したとき自動で曲入力欄を生成 {$(document).on(~}); の下に記述}
	$(document).on('click','a[data-associations=discs]',function(){

	// 自動で曲入力欄を生成
		var add_song = function(){
			$($('a[data-associations=songs]').last()).trigger('click');
		};
		setTimeout(add_song,20);
	});


	// ディスクを削除したとき
// $(document).on('click','div>.remove_fields',function(){

	// });



