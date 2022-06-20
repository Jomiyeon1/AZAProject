package com.aza.web.payment;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aza.common.Search;
import com.aza.service.domain.Payment;
import com.aza.service.payment.PaymentService;


@RestController
@RequestMapping("/payment/rest/*")
public class PaymentRestController {

	@Autowired
	@Qualifier("paymentServiceImpl")
	private PaymentService paymentService;
	
	public PaymentRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "listPayment")
	public Map<String,Object> listPayment
	(HttpServletRequest request) throws Exception{
		
		System.out.println("listPayment RestController Start...");
		
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(3);	
		
		Map<String, Object> map = paymentService.listPayment(search);
		return map;
	}

	@RequestMapping(value = "getPayment/{payCode}", method = RequestMethod.GET)
	public Payment getPayment(@PathVariable int payCode) throws Exception{
		System.out.println("rest/getPayment : GET");
		
		return paymentService.getPayment(payCode);
		
	}

	@RequestMapping("complete/{payCode}")
	public ResponseEntity<String> completePayment
	(@PathVariable int payCode,HttpSession session, Payment payment)throws Exception{
		String token = paymentService.getToken();
		System.out.println("��ū ==> " + token);
		String impUid = payment.getImpUid();
		
		payment = paymentService.getPayment(payCode);
		int amount = paymentService.paymentInfo(impUid, token);
		
		//�ǰ��� �ݾװ� ��ġ�ϴ��� Ȯ��.
		long price = payment.getAmount();
		//��ġ���� ���� �� ���� ���
		try {
			if(price != amount) {
			paymentService.paymentCancle(token, payment.getImpUid(), amount, "���� �ݾ� ����");
			 return new ResponseEntity<String>("���� �ݾ� ����, ���� ���", HttpStatus.BAD_REQUEST);
		}else {
			//���� ������ �����Ϸ�� ���� ����, impUid�� ����
			payment.setCheckPay('Y');
			payment.setImpUid(impUid);
			paymentService.updatePayment(payment);
			System.out.println("���� ����");
			System.out.println("comlete payment => " + payment);
		}
			
		}catch (Exception e) {
			paymentService.paymentCancle(token, payment.getImpUid(), amount, "���� ����");
			 return new ResponseEntity<String>("���� ����", HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
