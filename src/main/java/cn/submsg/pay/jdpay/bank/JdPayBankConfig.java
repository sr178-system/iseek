package cn.submsg.pay.jdpay.bank;

public class JdPayBankConfig {

	public static final String V_MID="1001";//商户编号
	public static final String MD5_KEY = "test";//MD5秘钥
	public static final String RECEIVE_URL = "http://localhost:8080/pay/jdPayReturn.sm";//支付完成跳转界面
	public static final String NOTIFY_URL = "[url:=http://localhost:8080/pay/jdPaynotify.sm]";//异步通知地址
}
