<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>

<div id="wrap">



<form id="join_form" method="post" action="/user/Join?m=end">
    <input type="hidden" id="token_sjoin" name="token_sjoin" value="ER0JbsPMApzwM5F0">
    <input type="hidden" id="encPswd" name="encPswd" value="">
    <input type="hidden" id="encKey" name="encKey" value="">
    <input type="hidden" id="birthday" name="birthday" value="">
    <input type="hidden" id="joinMode" name="joinMode" value="unreal">
    <input type="hidden" id="pbirthday" name="pbirthday" value="">
    <input type="hidden" id="nid_kb2" name="nid_kb2" value="">

    <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
            <h2 class="blind">ȸ������</h2>
            <div class="join_content">
                <!-- ���̵�, ��й�ȣ �Է� -->
                <div class="row_group">
                    
                    <div class="join_row">
                        <h3 class="join_title"><label for="id">���̵�</label></h3>
                        <span class="ps_box int_id">
							<input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                           </span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title"><label for="pswd1">��й�ȣ</label></h3>
                        <span class="ps_box int_pass_step1" id="pswd1Img">
							<input type="password" id="pswd1" name="pswd1" class="int" title="��й�ȣ �Է�" aria-describedby="pswd1Msg" maxlength="20" aria-autocomplete="list">
                            <span class="lbl"><span id="pswd1Span" class="step_txt txt_red">���Ұ�</span></span>
						</span>
                        <span class="error_next_box" id="pswd1Msg" style="display: block;" aria-live="assertive">�ʼ� �����Դϴ�.</span>

                        <h3 class="join_title"><label for="pswd2">��й�ȣ ��Ȯ��</label></h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="pswd2" class="int" title="��й�ȣ ��Ȯ�� �Է�" aria-describedby="pswd2Blind" maxlength="20">
							<span id="pswd2Blind" class="wa_blind">�����Ϸ��� ��й�ȣ�� �´��� Ȯ���ϱ� ���� �ٽ� �Է� ���ּ���.</span>
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                    </div>
                </div>
                <!-- // ���̵�, ��й�ȣ �Է� -->

                <!-- �̸�, ������� �Է� -->
                <div class="row_group">

                    <!-- lang = ko_KR -->
                    <div class="join_row">
                        <h3 class="join_title"><label for="name">�̸�</label></h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" title="�̸�" class="int" maxlength="40">
						</span>
                        <span class="error_next_box" id="nameMsg" style="" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                    </div>
                    <!-- lang = ko_KR -->

                    <div class="join_row join_birthday">
                        <h3 class="join_title"><label for="yy">�������</label></h3>
                        <div class="bir_wrap">
                            <div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" placeholder="�������" aria-label="�������" class="int" maxlength="8">
								</span>
                            </div>
                            
                           
                        </div>
                        <span class="error_next_box" id="birthdayMsg" style="display:none" aria-live="assertive"></span>
                    </div>
                <!-- // �̸�, ������� �Է� -->

                <!-- �޴���ȭ ��ȣ, ������ȣ �Է� -->
                <div class="join_row join_mobile" id="mobDiv">
                    <h3 class="join_title"><label for="phoneNo">�޴���ȭ</label></h3>
                                                           
                    </div>
                    <div class="int_mobile_area">
						<span class="ps_box int_mobile">
							<input type="tel" id="phoneNo" name="phoneNo" placeholder="��ȭ��ȣ �Է�" aria-label="��ȭ��ȣ �Է�" class="int" maxlength="16">
							<label for="phoneNo" class="lbl"></label>
						</span>
                        <a href="#" class="btn_verify btn_primary" id="btnSend" role="button">
                            <span class="">������ȣ �ޱ�</span>
                        </a>
                    </div>
                    <div class="ps_box_disable box_right_space" id="authNoBox">
                        <input type="tel" id="authNo" name="authNo" placeholder="������ȣ �Է��ϼ���" aria-label="������ȣ �Է��ϼ���" aria-describedby="wa_verify" class="int" disabled="" maxlength="4">
                        <label id="wa_verify" for="authNo" class="lbl">
                            <span class="wa_blind">�������� �� ������ȣ�� �Է��ؾ� �մϴ�.</span>
                            <span class="input_code" id="authNoCode" style="display:none;"></span>
                        </label>
                    </div>

                    <span class="error_next_box" id="phoneNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="authNoMsg" style="display:none" aria-live="assertive"></span>
                    <span class="error_next_box" id="joinMsg" style="display:none" aria-live="assertive"></span>
                </div>
                <!-- // �޴���ȭ ��ȣ, ������ȣ �Է� -->

                <!-- tg-display=>{"��ȣ�� ����� ����": [], "���� �޽���": []} -->
                <div class="join_minor tab" id="pmobDiv" style="display:none">
                    <ul class="tab_m" role="tablist">
                        <li class="m1" role="presentation"><a href="#" onclick="return false;" class="on" role="tab" aria-selected="true" aria-controls="wa_tab_phone">�޴���ȭ����</a></li>
                    </ul>
                    <div id="wa_tab_phone" role="tabpanel">
                        <div class="agree_check_wrap">
                            
                            <span class="error_next_box" id="pagreeMsg" style="display:none" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                        </div>
                        <div class="row_group">
                            <div class="join_row">
                                <h3 class="join_title"><label for="pname">��ȣ�� �̸�</label></h3>
                                <span class="ps_box box_right_space">
                                    <input type="text" id="pname" name="pname" title="��ȣ�� �̸�" class="int" maxlength="40">
                                </span>
                                <span class="error_next_box" id="pnameMsg" style="display:none" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                            </div>
                           
                        </div>
                       
                        <div class="join_row join_mobile">
                            <h3 class="join_title"><label for="pphoneNo">�޴���ȭ</label></h3>
                            <div class="int_mobile_area">
                                <span class="ps_box int_mobile">
                                    <input type="tel" id="pphoneNo" name="pphoneNo" placeholder="��ȭ��ȣ �Է�" aria-label="��ȭ��ȣ �Է�" class="int" maxlength="16">
                                </span>
                                <a href="#" class="btn_verify btn_primary" id="btnPrtsSend" role="button">
                                    <span class="">������ȣ �ޱ�</span>
                                </a>
                            </div>
                            <div class="ps_box_disable box_right_space" id="pauthNoBox">
                                <input type="tel" id="pauthNo" name="pauthNo" placeholder="������ȣ �Է��ϼ���" aria-label="������ȣ �Է��ϼ���" aria-describedby="pwa_verify" class="int" disabled="" maxlength="6">
                                <label id="pwa_verify" for="pauthNo" class="lbl">
                                    <span class="wa_blind">�������� �� ������ȣ�� �Է��ؾ� �մϴ�.</span>
                                    <span class="input_code" id="pauthNoCode" style="display:none;"></span>
                                </label>
                            </div>
                            <span class="error_next_box" id="pphoneNoMsg" style="display:none" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                            <span class="error_next_box" id="pauthNoMsg" style="display:none" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                            <span class="error_next_box" id="pjoinMsg" style="display:none" aria-live="assertive">�ʼ� �����Դϴ�.</span>
                        </div>
                    </div>
                </div>
                <!-- tg-display -->

    

                <div class="btn_area">
                    <button type="button" id="btnJoin" class="btn_type btn_primary"><span>�����ϱ�</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script type="text/JavaScript">

function checkDuplication(){
         
		idFlag = false;
         $.ajax({
            url:'/user/json/checkDuplication',
            type:'post',
            data:{id:$('#userId').val()},
            success:function(cnt){ 
               if(cnt == 0) { 
                  $('.id_ok').css("display","inline-block");
                  $('.id_already').css("display", "none");
                  if (event == "first") {
                      showSuccessMsg(oMsg, "���� ���̵�׿�!");
                  } else {
                      hideMsg(oMsg);
                  }
                  idFlag = true;
               }else{
                  $('.id_ok').css("display","none");
                  $('.id_already').css("display", "inline-block");
                  showErrorMsg(oMsg, "�̹� ������� ���̵��Դϴ�.");
                  setFocusToInputObject(oInput);
               }
            },
            error:function(){
               alert("�����Դϴ�");
            }
         });
         return true;
      };
      
      function checkPswd1() {
          if(pwFlag) return true;

          var id = $("#id").val();
          var pw = $("#pswd1").val();
          var oImg = $("#pswd1Img");
          var oSpan = $("#pswd1Span");
          var oMsg = $("#pswd1Msg");
          var oInput = $("#pswd1");

          if (pw == "") {
              showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
              setFocusToInputObject(oInput);
              return false;
          }
          if (isValidPasswd(pw) != true) {
              showPasswd1ImgByStep(oImg, oSpan, 1);
              showErrorMsg(oMsg,"8~16�� ���� �� �ҹ���, ����, Ư�����ڸ� ����ϼ���.");
              setFocusToInputObject(oInput);
              return false;
          }

          pwFlag = false;
          $.ajax({
              type:"GET",
              url: "/user2/joinAjax?m=checkPswd&id=" + escape(encodeURIComponent(id)) + "&pw=" + escape(encodeURIComponent(pw)) ,
              success : function(data) {
                  var result = data.substr(4);
                  if (result == 1) {
                      showPasswd1ImgByStep(oImg, oSpan, 1);
                      showErrorMsg(oMsg,"8~16�� ���� �� �ҹ���, ����, Ư�����ڸ� ����ϼ���.");
                      setFocusToInputObject(oInput);
                      return false;
                  } else if (result == 2) {
                      showPasswd1ImgByStep(oImg, oSpan, 2);
                      showErrorMsg(oMsg,"8~16�� ���� �� �ҹ���, ����, Ư�����ڸ� ����ϼ���.");
                      setFocusToInputObject(oInput);
                  } else if (result == 3) {
                      showPasswd1ImgByStep(oImg, oSpan, 3);
                      oMsg.hide();
                  } else if (result == 4) {
                      showPasswd1ImgByStep(oImg, oSpan, 4);
                      oMsg.hide();
                  } else {
                      showPasswd1ImgByStep(oImg, oSpan, 0);
                      oMsg.hide();
                  }
                  pwFlag = true;
                  createRsaKey();
              }
          });
          return true;
      }

      function checkPswd2() {
          var pswd1 = $("#pswd1");
          var pswd2 = $("#pswd2");
          var oMsg = $("#pswd2Msg");
          var oImg = $("#pswd2Img");
          var oBlind = $("#pswd2Blind");
          var oInput = $("#pswd2");

          if (pswd2.val() == "") {
              showPasswd2ImgByDiff(oImg, false);
              showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
              oBlind.html("�����Ϸ��� ��й�ȣ�� �´��� Ȯ���ϱ� ���� �ٽ� �Է� ���ּ���.");
              setFocusToInputObject(oInput);
              return false;
          }
          if (pswd1.val() != pswd2.val()) {
              showPasswd2ImgByDiff(oImg, false);
              showErrorMsg(oMsg,"��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
              oBlind.html("�����Ϸ��� ��й�ȣ�� �´��� Ȯ���ϱ� ���� �ٽ� �Է� ���ּ���.");
              setFocusToInputObject(oInput);
              return false;
          } else {
              showPasswd2ImgByDiff(oImg, true);
              oBlind.html("��ġ�մϴ�");
              hideMsg(oMsg);
              return true;
          }

          return true;
      }
      
      function checkBirthday() {
          var birthday;
          var yy = $("#yy").val();
          var mm = $("#mm option:selected").val();
          var dd = $("#dd").val();
          var oMsg = $("#birthdayMsg");
          var lang = "ko_KR";

          var oyy = $("#yy");
          var omm = $("#mm");
          var odd = $("#dd");

          if (yy == "" && mm == "" && dd == "") {
              showErrorMsg(oMsg,"�¾ �⵵ 4�ڸ��� ��Ȯ�ϰ� �Է��ϼ���.");
              setFocusToInputObject(oyy);
              return false;
          }

          if (mm.length == 1) {
              mm = "0" + mm;
          }
          if (dd.length == 1) {
              dd = "0" + dd;
          }

          if(yy == "") {
              showErrorMsg(oMsg,"�¾ �⵵ 4�ڸ��� ��Ȯ�ϰ� �Է��ϼ���.");
              setFocusToInputObject(oyy);
              return false;
          }
          if(yy.length != 4 || yy.indexOf('e') != -1 || yy.indexOf('E') != -1) {
              showErrorMsg(oMsg,"�¾ �⵵ 4�ڸ��� ��Ȯ�ϰ� �Է��ϼ���.");
              setFocusToInputObject(oyy);
              return false;
          }
          if(mm == "") {
              showErrorMsg(oMsg,"�¾ ���� �����ϼ���.");
              setFocusToInputObject(omm);
              return false;
          }
          if(dd == "") {
              showErrorMsg(oMsg,"�¾ ��(��¥) 2�ڸ��� ��Ȯ�ϰ� �Է��ϼ���.");
              setFocusToInputObject(odd);
              return false;
          }
          if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
              showErrorMsg(oMsg,"�¾ ��(��¥) 2�ڸ��� ��Ȯ�ϰ� �Է��ϼ���.");
              setFocusToInputObject(odd);
              return false;
          }

          birthday = yy + mm + dd;
          if (!isValidDate(birthday)) {
              showErrorMsg(oMsg,"��������� �ٽ� Ȯ�����ּ���.");
              setFocusToInputObject(oyy);
              return false;
          }
          $("#birthday").val(birthday);

          var age = calcAge(birthday);
          if (age < 0) {
              showErrorMsg(oMsg,"�̷����� ���̱���. ^^");
              setFocusToInputObject(oyy);
              return false;
          } else if (age >= 100) {
              showErrorMsg(oMsg,"�����̼���?");
              setFocusToInputObject(oyy);
              return false;
          } else if (age < 14) {
              showErrorMsg(oMsg,"�� 14�� �̸��� ��̴� ��ȣ�� ���ǰ� �ʿ��մϴ�.");
              if(lang == "ko_KR") {
                  if ($("#joinMode").val() == "unreal") {
                      showJuniverMobileTab();
                  }
                  return true;
              } else {
                  hideJuniverTab();
                  return false;
              }
          } else {
              hideMsg(oMsg);
              hideJuniverTab();
              return true;
          }
          return true;
      }
      
      function checkPhoneNo() {
          var phoneNo = $("#phoneNo").val();
          var oMsg = $("#phoneNoMsg");
          var oInput = $("#phoneNo");

          if (phoneNo == "") {
              showErrorMsg(oMsg,"�ʼ� �����Դϴ�.");
              setFocusToInputObject(oInput);
              return false;
          }

          hideMsg(oMsg);
          return true;
      }

      function sendSmsButton() {
          
          var phoneNo = $("#phoneNo").val();
          var key = $("#token_sjoin").val();
          var oMsg = $("#phoneNoMsg");
          var lang = "ko_KR";
          var id = $("#id").val();

          phoneNo = phoneNo.replace(/ /gi, "").replace(/-/gi, "");
          $("#phoneNo").val(phoneNo);
          authFlag = false;

          $("#authNoMsg").hide();
          if(!isCellPhone(phoneNo)) {
              showErrorMsg(oMsg,"���Ŀ� ���� �ʴ� ��ȣ�Դϴ�.");
              return false;
          }
          $.ajax({
              type:"GET",
              url: "" + "&mobno=" + phoneNo  + "&key=" + key + "&id=" + id,
              success : function(data) {
                  var result = data.substr(4);
                  if (result == "S") {
                      showSuccessMsg(oMsg,"������ȣ�� �߼��߽��ϴ�.(��ȿ�ð� 30��)<br>������ȣ�� ���� ������ �Է��Ͻ� ������ ��Ȯ���� Ȯ���Ͽ� �ּ���.<br>�̹� ���Ե� ��ȣ�̰ų�, ������ȭ��ȣ�� ������ȣ�� ���� �� �����ϴ�.");
                      $("#authNo").attr("disabled", false);
                      var oBox = $("#authNoBox");
                      var oCode = $("#authNoCode");
                      showAuthDefaultBox(oBox, oCode);
                  } else {
                      showErrorMsg(oMsg,"��ȭ��ȣ�� �ٽ� Ȯ�����ּ���.");
                  }
              }
          });
          return false;
      }

      function checkAuthNo() {
          var authNo = $("#authNo").val();
          var oMsg = $("#authNoMsg");
          var oBox = $("#authNoBox");
          var oCode = $("#authNoCode");
          var oInput = $("#authNo");

          if (authNo == "") {
              showErrorMsg(oMsg,"������ �ʿ��մϴ�.");
              setFocusToInputObject(oInput);
              return false;
          }

          if(authFlag) {
              showSuccessMsg(oMsg,"������ �����߽��ϴ�.");
              showAuthSuccessBox(oBox, oCode, "��ġ");
              $("#phoneNoMsg").hide();
              return true;
          } else {
              checkAuthnoByAjax();
          }
          return true;
      }

      function checkAuthnoByAjax() {
          var authNo = $("#authNo").val();
          var key = $("#token_sjoin").val();
          var oMsg = $("#authNoMsg");
          var oBox = $("#authNoBox");
          var oCode = $("#authNoCode");
          var oInput = $("#authNo");

          $.ajax({
              type:"GET",
              url: "/user2/joinAjax?m=checkAuthno&authno=" + authNo + "&key=" + key ,
              success : function(data) {
                  var result = data.substr(4);
                  if (result == "S") {
                      showSuccessMsg(oMsg,"������ �����߽��ϴ�.");
                      showAuthSuccessBox(oBox, oCode, "��ġ");
                      $("#phoneNoMsg").hide();
                      authFlag = true;
                  } else if (result == "Cnt") {
                      showErrorMsg(oMsg,"������ �ٽ� �������ּ���.");
                      showAuthErrorBox(oBox, oCode, "����ġ");
                      setFocusToInputObject(oInput);
                  } else {
                      showErrorMsg(oMsg,"������ȣ�� �ٽ� Ȯ�����ּ���.");
                      showAuthErrorBox(oBox, oCode, "����ġ");
                      setFocusToInputObject(oInput);
                  }
              }
          });
          return true;
      }
      
      $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
      
    


</script>


</div>
</body>
</html>