$(function() {
	$('#pwdCheck').click(function() {
		$.ajax({
			url : 'bossPwdCheck.do',
			type : 'post',
			data : {
				bossId : $('#bossId').val(),
				bossPwd : $('#bossPwd').val(),
				rCid: $('#rCid').val()
			},
			success : function(cid) {
				var url = '';
				if (cid=='') {
					alert("비밀번호를 일치하지 않습니다.");
					return false;
				}
				url += '/pos/posMain.do?rCid='+cid;
				location.href = url;
			},
			error : function(){
				alert('error:');
			}
		
			
		});
	});
	$('#pwdCheck2').click(function() {
		$.ajax({
			url : 'bossPwdCheck.do',
			type : 'post',
			data : {
				bossId : $('#bossId2').val(),
				bossPwd : $('#bossPwd2').val(),
				rCid: $('#rCid2').val()
			},
			success : function(cid) {
				var url = '';
				if (cid=='') {
					alert("비밀번호를 일치하지 않습니다.");
					return false;
				}
				url += 'storeSetting.do?rCid='+cid;
				location.href = url;
			}
		});
	});
	$(".btnSetting").click(function(){
		$("#rCid2").val($(this).attr("id"));
		
	});
	$(".btnPos").click(function(){
		$("#rCid").val($(this).attr("id"));
	});
})