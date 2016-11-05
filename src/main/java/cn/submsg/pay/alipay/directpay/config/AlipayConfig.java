package cn.submsg.pay.alipay.directpay.config;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *版本：3.4
 *修改日期：2016-03-08
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 合作身份者ID，签约账号，以2088开头由16位纯数字组成的字符串，查看地址：https://b.alipay.com/order/pidAndKey.htm
	public static String partner = "2088421673493740";
	// 收款支付宝账号，以2088开头由16位纯数字组成的字符串，一般情况下收款账号就是签约账号
	public static String seller_id = partner;
	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	public static String private_key = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAKrSk45os85x9s2XFARyUMMmJ6YJ1bYxPws3XzFOSMlERNZZJsfrYeeLJq3l4gf5Z+NdmSP3Rb2cQMBmpusPcx8Jx/f0WA8tkA3KlAtcX5q3GvvFOYhESV9efG5MTaM0co34lX53mtrFOuziJC1U/QNBXxriRVYjluYBKnlUHfubAgMBAAECgYBAzY3IspOzt6wnJi8j2LImtizIYma+rUP7X1AvhkE6iTmMD1oU8Yi8rB9KTTFIUSdGK9XSvRWp7sLpuoeMGNpUx1Z04tj76WoS3oAsXBLxPmRApDl6a2grX8PenLdGI50tDMqeOvDugd6B3a/v9mOTVitcfNrX9mecJswA4yfQcQJBANOHMDAzrDFWgYoC4TiS4ZOy0FH313AxSoq1LwmZNEzreDlS9ihBlJDVSnzxutskedb8oFDRhz+agminm7Z4VMcCQQDOvIvIsdY5LqagdgisLZ+b59xIgL3wA1XiI8/SeG9ecU+DQNqWE3ekUC2wXbKPZD9Cpvy3zgADpI0hBmvdcGaNAkAe2XqHrSGR2IHv9NeP/qvzdIK5UaIT9LxgWmhPyA4+oaDZC2ZnHJlkPhcs/bw4tasnVZSz9Lr65bfbN4aYKBiFAkAnngwvjpzd4mm+EECDNk8C4oDdSAaeCxWXO4Ok8r1s3Mv+/BunbN2dmFvZE2uXfP9+d1+wnYJ1MEB3VrKvAc41AkA5raTAlRURf6vW6M2qQmjBdG5tPpeRmzI2Y1WIlyMDdtEBMxyM4BzBU/nBkHsBePWLjiEZUIk9VrCnt7Hsry84";
	// 支付宝的公钥,查看地址：https://b.alipay.com/order/pidAndKey.htm
	public static String alipay_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8083/aliPaynotify";
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8083/aliPayReturn";
	// 签名方式
	public static String sign_type = "RSA";
	
	// 调试用，创建TXT日志文件夹路径，见AlipayCore.java类中的logResult(String sWord)打印方法。
	public static String log_path = "/log/pay/";
		
	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";
		
	// 支付类型 ，无需修改
	public static String payment_type = "1";
		
	// 调用的接口名，无需修改
	public static String service = "create_direct_pay_by_user";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	
//↓↓↓↓↓↓↓↓↓↓ 请在这里配置防钓鱼信息，如果没开通防钓鱼功能，为空即可 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
	
	// 防钓鱼时间戳  若要使用请调用类文件submit中的query_timestamp函数
	public static String anti_phishing_key = "";
	
	// 客户端的IP地址 非局域网的外网IP地址，如：221.0.0.1
	public static String exter_invoke_ip = "";
		
//↑↑↑↑↑↑↑↑↑↑请在这里配置防钓鱼信息，如果没开通防钓鱼功能，为空即可 ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
	
}

