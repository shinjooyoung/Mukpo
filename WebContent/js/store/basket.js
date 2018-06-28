$(document).ready(function(){
	var mIdArr = new Array(); 
	//메뉴 추가 버튼 
	$(".shop-cart-btn").click(function(){
		$('.pull-right').css('display','block');
		$('.ordermenu').css('display','none');
		var mName = $('h5[class="'+$(this).attr('name')+'"]').text();  
		var mPrice = $('strong[class="'+$(this).attr('name')+'"]').text();
		var mId=$(this).attr('name');
		
		if(mIdArr[0] == undefined){
			mIdArr[0]=mId;
			$(".shop-cart-table tbody").append('<tr><th>PRODUCT</th><td><div class="product-cart"><img src="/images/img70.png" alt=""></div><div class="product-cart-title"><span>'+mName+'</span></div></td><th>PRICE</th><td><strong>'+mPrice+'</strong></td><th>QUANTITY</th><td><div class="price-textbox"><span class="minus-text"><i class="icon-minus"></i></span><input type="hidden" name="mName" value="'+mName+'"/><input type="hidden" name="mPrice" value="'+mPrice+'"/><input name="mCnt" type="text" value="1"><span class="plus-text"><i class="icon-plus"></i></span></div></td><th>TOTAL</th><td>'+mPrice+'</td><td class="shop-cart-close"><input type="hidden" name="mId" value="'+mId+'" /><i class="icon-cancel-5" name="'+mId+'"></i></td></tr>');
		}else{
			var dulpChk = false;
			var idxSame = 0;
			for(var a=0; a<mIdArr.length; a++){
				if(mIdArr[a]==mId){
					idxSame = a;
					dulpChk =true;
				}
			}
			if(dulpChk==false){
				mIdArr[mIdArr.length]=mId;	
				$(".shop-cart-table tbody").append('<tr><th>PRODUCT</th><td><div class="product-cart"><img src="/images/img70.png" alt=""></div><div class="product-cart-title"><span>'+mName+'</span></div></td><th>PRICE</th><td><strong>'+mPrice+'</strong></td><th>QUANTITY</th><td><div class="price-textbox"><span class="minus-text"><i class="icon-minus"></i></span><input type="hidden" name="mName" value="'+mName+'"/><input type="hidden" name="mPrice" value="'+mPrice+'"/><input name="mCnt"value="1" type="text"><span class="plus-text"><i class="icon-plus"></i></span></div></td><th>TOTAL</th><td>'+mPrice+'</td><td class="shop-cart-close"><input type="hidden" name="mId" value="'+mId+'"><i class="icon-cancel-5"name="'+mId+'"></i></td></tr>');
			}
		}
		
		
	});
	//선택한 매뉴의 갯수 빼기
	$(document).on("click","span[class='minus-text']",function(){
		var mPrice = $(this).parent().parent().prev().prev().children().text(); //원가
		
		$(this).next().next().next().val($(this).next().next().next().val()-1);
		$(this).parent().parent().next().next().text(mPrice*$(this).next().next().next().val());
	});
	//선택한 매뉴의 갯수 더하기
	$(document).on("click","span[class='plus-text']",function(){
		var mPrice = $(this).parent().parent().prev().prev().children().text(); //원가
		
		var tt = $(this).prev().val();
		tt = Number(tt); //숫자 형변환
		$(this).prev().val(tt+1);
		
		$(this).parent().parent().next().next().text(mPrice*$(this).prev().val());
	});
	// 선택한 메뉴 삭제 
	$(document).on("click","i[class='icon-cancel-5']",function(){
			
		var lastmenu =$(this).parent().parent().next().text();
		if(lastmenu==""){
			$('.pull-right').css('display','none');
			$('.ordermenu').css('display','block');
		}
		mIdArr.splice(mIdArr.indexOf(($(this).attr('name')),1));
		$(this).parent().parent().remove();
	});

	});