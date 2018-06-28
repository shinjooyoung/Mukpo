$(document).ready(function(){
	 
    $('#menumgbtn').click(function() {  //메뉴 관리 화면
        
        $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
        $('#addmenu').css('display', 'none');      //메뉴 등록 화면
        $('#managere').css('display', 'none');      //예약 관리 화면
        $('#detail').css('display', 'none');      //메뉴 상세 화면
        $('#storedelete').css('display','none');   //메장 삭제 화면
        $('#storemodify').css('display','none');   //메장 수정 화면
        $('#list').css('display', 'block');      // 메뉴 관리 화면
     });
     
    $('#reservemgbtn').click(function() {// 예약 관리 화면 클릭 시
        var rCid=$("#paramval").val();
        $.ajax({ url : '/store/storeReserve.do', 
           type : "POST", 
           dataType : "json", 
           data : {"rCid" :rCid },
           success : function(data) {
                if (data != null) {
                   $('#relist').html("");
                   $(data).each(function(index,item) {
                      var tag = ""; 
                      tag += "<tr><td class='reserveTd' value='"+this.mId+"' style='font-size: 13px; text-align: center;'>"+this.mId+"</td><td style='font-size: 13px; text-align: center;'>"+this.rMpwp+"</td><td style='font-size: 13px; text-align: center;'>"+this.rDate+"</td><td style='font-size: 13px; text-align: center;'>"+this.rPnum+"</td><td style='font-size: 13px; text-align: center;'>"+this.rTnum+"</td><td style='font-size: 13px; text-align: center;'><c:if test='${fn:contains('"+this.rYn+"', 'RW')}'>예약대기</c:if></td><td style='font-size: 13px; text-align: center;'><button class='btn btn-primary btn-lg active reserveOk' style='font-size: 13px; padding: 5px;' name='"+this.rId+"'>O</button><button class='btn btn-primary btn-lg active reserveNo' style='font-size: 13px; padding: 5px;'>X</button></td></tr>";
                       $('#relist').append(tag); 


                   });
                   }
          $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
            $('#addmenu').css('display', 'none');      //메뉴 등록 화면
            $('#managere').css('display', 'block');      //예약 관리 화면
            $('#detail').css('display', 'none');      //메뉴 상세 화면
            $('#storedelete').css('display','none');   //메장 삭제 화면
            $('#storemodify').css('display','none');   //메장 수정 화면
            $('#list').css('display', 'none');      // 메뉴 관리 화면
             
             },
             error : function(error) {
                alert("error" + error); //에러 던지기
             }
          }); //ajax end
   
     
      }); //예약 관리 화면 end  
   
    
    $('#storedeletebtn').click(function() {     // 삭제 관리 화면  클릭시 
  	  $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
        $('#addmenu').css('display', 'none');		//메뉴 등록 화면
        $('#managere').css('display', 'none');		//예약 관리 화면
        $('#detail').css('display', 'none');		//메뉴 상세 화면
        $('#storedelete').css('display','block');	//메장 삭제 화면
        $('#storemodify').css('display','none');	//메장 수정 화면
        $('#list').css('display', 'none');		// 메뉴 관리 화면
     });
    
    
    $('#storemodifybtn').click(function() {     // 수정 관리 화면 클릭시
  	  $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
        $('#addmenu').css('display', 'none');		//메뉴 등록 화면
        $('#managere').css('display', 'none');		//예약 관리 화면
        $('#detail').css('display', 'none');		//메뉴 상세 화면
        $('#storedelete').css('display','none');	//메장 삭제 화면
        $('#storemodify').css('display','block');	//메장 수정 화면
        $('#list').css('display', 'none');		// 메뉴 관리 화면
     });
    $('.menu-detail').click(function() {        //메뉴 상세 보기 클릭시
  	  $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
        $('#addmenu').css('display', 'none');		//메뉴 등록 화면
        $('#managere').css('display', 'none');		//예약 관리 화면
        $('#detail').css('display', 'block');		//메뉴 상세 화면
        $('#storedelete').css('display','none');	//메장 삭제 화면
        $('#storemodify').css('display','none');	//메장 수정 화면
        $('#list').css('display', 'none');		// 메뉴 관리 화면
    });
    $('#addbtn').click(function() {				//메뉴 등록 화면 클릭시
  	  $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
        $('#addmenu').css('display', 'block');		//메뉴 등록 화면
        $('#managere').css('display', 'none');		//예약 관리 화면
        $('#detail').css('display', 'none');		//메뉴 상세 화면
        $('#storedelete').css('display','none');	//메장 삭제 화면
        $('#storemodify').css('display','none');	//메장 수정 화면
        $('#list').css('display', 'none');		// 메뉴 관리 화면

    });
   
    
    $('.menu-modify').click(function(){			//메뉴 수정 화면
  	  $('#modifymenu').css('display', 'block');   //메뉴 수정 화면
        $('#addmenu').css('display', 'none');		//메뉴 등록 화면
        $('#managere').css('display', 'none');		//예약 관리 화면
        $('#detail').css('display', 'none');		//메뉴 상세 화면
        $('#storedelete').css('display','none');	//메장 삭제 화면
        $('#storemodify').css('display','none');	//메장 수정 화면
        $('#list').css('display', 'none');		// 메뉴 관리 화면
    });

    //매장 관리 마우스 올렸을때 옵션 보이게
    $(".storemg-ck").mouseenter(function() {
    	$(".storemg").css("display","block");
    });
    //매장 관리 마우스 올렸을때 옵션 지우게
    $(".storemg-main").mouseleave(function() {
    	$(".storemg").css("display","none");
    });
    
    //매뉴 관리 마우스 올렸을때 옵션 보이게
    $(".menumg-ck").mouseenter(function() {
    	$(".menumg").css("display","block");
    });
    //메뉴 관리 마우스 올렸을때 옵션 지우게
    $(".menumg-main").mouseleave(function() {
    	$(".menumg").css("display","none");
    });
    
    //예약 관리 마우스 올렸을때 옵션 보이게
    $(".reservemg-ck").mouseenter(function() {
    	$(".reservemg").css("display","block");
    });
    //예약 관리 마우스 올렸을때 옵션 지우게
    $(".reservemg-main").mouseleave(function() {
    	$(".reservemg").css("display","none");
    });
    
    
    
    $('.menu').mouseenter(function() {

       $(this).children('.menu-list').css('display', 'none');
       $(this).children('.rollover').css('display', 'block');

    });
    $('.menu').mouseleave(function() {
       $(this).children('.rollover').css('display', 'none');
       $(this).children('.menu-list').css('display', 'block');

    }); 
    //동적 테이블 취소 눌렀을떄
      $(document).on("click", ".reserveNo", function(){
        
              var mId = $(this).parent().prevAll(".reserveTd").text();
              var rCid=$("#paramval").val();
              var rId =$(this).prev().attr('name');
              
              
              $.ajax({ url :'/store/storeReserveUpdate.do',
                 
                  type : "POST", 
                  dataType : "json", 
                  data : {"mId" :mId,"rCid":rCid,"rId":rId  },
                  success : function(data) {
                       alert(mId+"주문이 취소 되었습니다.");
                       if (data != null) {
                          $('#relist').html("");
                          $(data).each(function(index,item) {
                             var tag = ""; 
                             tag += "<tr><td class='reserveTd' value='"+this.mId+"' style='font-size: 13px; text-align: center;'>"+this.mId+"</td><td style='font-size: 13px; text-align: center;'>"+this.rMpwp+"</td><td style='font-size: 13px; text-align: center;'>"+this.rDate+"</td><td style='font-size: 13px; text-align: center;'>"+this.rPnum+"</td><td style='font-size: 13px; text-align: center;'>"+this.rTnum+"</td><td style='font-size: 13px; text-align: center;'><c:if test='${fn:contains('"+this.rYn+"', 'RW')}'>예약대기</c:if></td><td style='font-size: 13px; text-align: center;'><button class='btn btn-primary btn-lg active reserveOk' style='font-size: 13px; padding: 5px;' name='"+this.rId+"'>O</button><button class='btn btn-primary btn-lg active reserveNo' style='font-size: 13px; padding: 5px;'>X</button></td></tr>";
                              $('#relist').append(tag); 


                          });
                          }
                       $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
                         $('#addmenu').css('display', 'none');      //메뉴 등록 화면
                         $('#managere').css('display', 'block');      //예약 관리 화면
                         $('#detail').css('display', 'none');      //메뉴 상세 화면
                         $('#storedelete').css('display','none');   //메장 삭제 화면
                         $('#storemodify').css('display','none');   //메장 수정 화면
                         $('#list').css('display', 'none');      // 메뉴 관리 화면
                    
                    },
                    error : function(error) {
                       alert("error" + error); //에러 던지기
                    }
                 }); //ajax end
              
      });
 
       //동적 테이블 수락 눌렀을떄
         $(document).on("click", ".reserveOk", function(){
                 var mId = $(this).parent().prevAll(".reserveTd").text();
                 var rCid=$("#paramval").val();
                 var rId =$(this).attr('name');
                 $.ajax({ url :'/store/storeReserveUpdateOk.do',
                     type : "POST", 
                     dataType : "json", 
                     data : {"mId" :mId,"rCid":rCid,"rId":rId},
                     success : function(data) {
                        alert(mId+"주문이 접수되었습니다.");
                          if (data != null) {
                             $('#relist').html("");
                             $(data).each(function(index,item) {
                                 var tag = ""; 
                                 tag += "<tr><td class='reserveTd' value='"+this.mId+"' style='font-size: 13px; text-align: center;'>"+this.mId+"</td><td style='font-size: 13px; text-align: center;'>"+this.rMpwp+"</td><td style='font-size: 13px; text-align: center;'>"+this.rDate+"</td><td style='font-size: 13px; text-align: center;'>"+this.rPnum+"</td><td style='font-size: 13px; text-align: center;'>"+this.rTnum+"</td><td style='font-size: 13px; text-align: center;'><c:if test='${fn:contains('"+this.rYn+"', 'RW')}'>예약대기</c:if></td><td style='font-size: 13px; text-align: center;'><button class='btn btn-primary btn-lg active reserveOk' style='font-size: 13px; padding: 5px;' name='"+this.rId+"'>O</button><button class='btn btn-primary btn-lg active reserveNo' style='font-size: 13px; padding: 5px;'>X</button></td></tr>";
                                  $('#relist').append(tag); 

                             });
                             }
                          $('#modifymenu').css('display', 'none');   //메뉴 수정 화면
                            $('#addmenu').css('display', 'none');      //메뉴 등록 화면
                            $('#managere').css('display', 'block');      //예약 관리 화면
                            $('#detail').css('display', 'none');      //메뉴 상세 화면
                            $('#storedelete').css('display','none');   //메장 삭제 화면
                            $('#storemodify').css('display','none');   //메장 수정 화면
                            $('#list').css('display', 'none');      // 메뉴 관리 화면
                       
                       },
                       error : function(error) {
                          alert("error" + error); //에러 던지기
                       }
                    }); //ajax end
                 
         });


    
	 
	 
});