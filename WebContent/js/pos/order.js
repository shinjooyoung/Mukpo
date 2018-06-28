$(document).ready(function(){		//윤경식 추가
		var mIdArr = new Array();
		var tableNum=0;
		//메뉴 추가 버튼
		$(".shop-cart-btn").click(function(){
			$('.pull-right').css('display','block');
			$('.ordermenu').css('display','none');
			var mName = $('h5[class="'+$(this).attr('name')+'"]').text();  
			var mPrice = $('strong[class="'+$(this).attr('name')+'"]').text();
			var mId=$(this).attr('name');
			
			if(mIdArr[0] == undefined){
				mIdArr[0]=mId;
				$(".shop-cart-table tbody").append('<tr><th>PRODUCT</th><td><div class="product-cart"><img src="/images/img70.png" alt=""></div><div class="product-cart-title"><span>'+mName+'</span></div></td><th>PRICE</th><td><strong>'+mPrice+'</strong></td><th>QUANTITY</th><td><div id="'+mId+'"class="price-textbox"><span class="minus-text"><i class="icon-minus"></i></span><input type="hidden" name="mName" value="'+mName+'"/><input type="hidden" name="mPrice" value="'+mPrice+'"/><input name="mCnt" type="text" value="1"><span class="plus-text"><i class="icon-plus"></i></span></div></td><th>TOTAL</th><td>'+mPrice+'</td><td class="shop-cart-close"><i class="icon-cancel-5" name="'+mId+'"></i></td></tr>');
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
					$(".shop-cart-table tbody").append('<tr><th>PRODUCT</th><td><div class="product-cart"><img src="/images/img70.png" alt=""></div><div class="product-cart-title"><span>'+mName+'</span></div></td><th>PRICE</th><td><strong>'+mPrice+'</strong></td><th>QUANTITY</th><td><div id="'+mId+'"class="price-textbox"><span class="minus-text"><i class="icon-minus"></i></span><input type="hidden" name="mName" value="'+mName+'"/><input type="hidden" name="mPrice" value="'+mPrice+'"/><input name="mCnt"value="1" type="text"><span class="plus-text"><i class="icon-plus"></i></span></div></td><th>TOTAL</th><td>'+mPrice+'</td><td class="shop-cart-close"><i class="icon-cancel-5"name="'+mId+'"></i></td></tr>');
				}else{
					
					var num=$("#"+mId).children().next().next().next().val(); //수량
					num = Number(num);
					$("#"+mId).children().next().next().next().val(num+1);
					
					num=$("#"+mId).children().next().next().next().val();
					var price = $("#"+mId).children().next().next().val();  //단가
					var result = $("#"+mId).parent().next().next().text(price*num);  //가격 창

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

	
	$(document).on("click",'.pull-right',function(){
		var mName= new Array();
		var mPrice = new Array();
		var mNum = new Array();
		var mSum = new Array();
		
		for(var j=0; j<mIdArr.length; j++){
			mName[j]=$('#'+mIdArr[j]).children().next().val();   				//메뉴명
			mPrice[j]=$('#'+mIdArr[j]).children().next().next().val();  		//메뉴 단가
			mNum[j]=$('#'+mIdArr[j]).children().next().next().next().val();		//메뉴 수량
			mSum[j]=mNum[j]*mPrice[j];											//메뉴별 합계
		}
		var rCid =$('input[name="rCid"]').val();								//사업자 등록번호
																
		$.ajax({ url :'/pos/insertOrderList.do',  //controll에 보낼 url 주소
		
			type :"POST",
			dataType:"json",
			data:{"rCid":rCid,"oTablenum":tableNum},
			success : function(data) {
				if(data != null){
				}
			},
			error : function(error) {
				alert("error : "+error);
			}
		}); //ajax end
		
	});
	$('.btnPos').click(function(){  											//테이블 번호 구하기
		tableNum=$(this).parent().parent().parent().prev().text();
		
	});
	
	
	
	//예약 상세내역 보기
	$(".reserveOrder").click(function(){	// 상세내역 버튼
		var rId = $(this).attr("rId");		// 버튼의 rId값 가져오기
		
		$.ajax({							// 예약한 메뉴 가져오기
			url : '/reserve/reserveDetail.do',
			type : 'POST',
			dataType : 'JSON',
			data : { "rId" : rId },
			success : function(data){

				if(data != null){
					$('.reserveListView').html('');
					var tag = '';
					tag += '<div class="shop-checkout-title">'
						+ '<h6>'
						+ '메뉴 <span>금액</span>'
						+ '</h6>';
					$('.reserveListView').append(tag);
					
					$(data).each(function(index, item){

						tag = '</div>'
							+ '<div class="shop-checkout-row">'
							+ '<p>'
							+ '<span>'+this.M_NAME+'</span> x'+this.RM_CNT+' <small>'+this.MENU_PRICE_TOTAL+'</small>'
							+ '</p>'
							+ '</div>';
						$('.reserveListView').append(tag);
					}); 
				}
			}
				
			}); 
		
		$.ajax({							// 예약리스트 data 가져오기
			url : '/reserve/reserveListView.do',
			type : 'POST',
			dataType : 'JSON',
			data : { "rId" : rId },
			success : function(data){
				if(data != null) {
					$(data).each(function(index, item){
					$('.reserveDetailInfoList').html('');
					var tag = '';
					tag += '<div class="checkout-total">'
						+ '<h6>'
						+ '예약날짜 <small>'+this.rDate+'</small>'
						+ '</h6>'
						+ '</div>'
						+ '<div class="checkout-total">'
						+ '<h6>'
						+ '예약시간 <small>'+this.rTime+'</small>'
						+ '</h6>'
						+ '</div>'
						+ '<div class="checkout-total">'
						+ '<h6>'
						+ '인원수 <small>'+this.rPnum+'명</small>'
						+ '</h6>'
						+ '</div>'
						+ '<div class="checkout-total">'
						+ '<h6>'
						+ '테이블번호 <small>'+this.rTnum+'</small>'
						+ '</h6>'
						+ '</div>'
						+ '<div class="checkout-total">'
						+ '<h6>'
						+ '예치금 <small class="price-big">'+this.rKeepmoney+'</small>'
						+ '</h6>'
						+ '</div>';
					
						$('.reserveDetailInfoList').append(tag);
				});
				}
			}
});
}); 
	

});

