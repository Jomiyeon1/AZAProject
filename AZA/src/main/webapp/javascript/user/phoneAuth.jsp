<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
// �����ؾ���...............
        $('#sendPhoneNumber').click(function(){
            let phoneNumber = $('#inputPhoneNumber').val();
            Swal.fire('������ȣ �߼� �Ϸ�!')


            $.ajax({
                type: "GET",
                url: "//sendSMS",
                data: {
                    "phone" : phone
                },
                success: function(res){
                    $('#checkBtn').click(function(){
                        if($.trim(res) ==$('#inputCertifiedNumber').val()){
                            Swal.fire(
                                '��������!',
                                '�޴��� ������ ���������� �Ϸ�Ǿ����ϴ�.',
                                'success'
                            )

                            $.ajax({
                                type: "GET",
                                url: "/update/phone",
                                data: {
                                    "phone" : $('#inputPhoneNumber').val()
                                }
                            })
                            document.location.href="/home";
                        }else{
                            Swal.fire({
                                icon: 'error',
                                title: '��������',
                                text: '������ȣ�� �ùٸ��� �ʽ��ϴ�!',
                                footer: '<a href="/home">������ �����ϱ�</a>'
                            })
                        }
                    })


                }
            })
        });
</script>
</body>
</html>