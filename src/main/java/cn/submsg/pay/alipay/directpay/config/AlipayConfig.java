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
	public static String partner = "2088701891650135";
	// 收款支付宝账号，以2088开头由16位纯数字组成的字符串，一般情况下收款账号就是签约账号
	public static String seller_id = partner;
	//商户的私钥,需要PKCS8格式，RSA公私钥生成：https://doc.open.alipay.com/doc2/detail.htm?spm=a219a.7629140.0.0.nBDxfy&treeId=58&articleId=103242&docType=1
	public static String private_key = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANUK3/aqx9mc/+OWGBZzqCbuWw8/MYPb0rTGmwPYCuBma8lAAE9GLg27nZf7FtipRVykTXcUaXJNHsU37Rs54fNLLEEtqDPKi3jb/BxaVnGMGrxhBfHWGKxT0eGwwD+PdKwunCtmRx94oiJLu6KMeMYNu4/g8qHDra3P+4bVgUX/AgMBAAECgYB3h2x1Fwid/cpMRJArOKTlguIwQcJkOteTecLLe1FO6egbt/70e2mnZtZayRPeZ8p02fJkl106Ni7HdENh/S3Zrvewz8E5cdyJR4xcUq+0xJVIzWb21eJ2SK7450B9krBfg+lzNGLRpToFOEC0E7xz/7zaSUDsdVqrTKwAttcRYQJBAO8vbQbv1RTuzBZmqc1uo6eB7tIqZ22526iIlzWmhNtih1nG1SML52P26mwQtY6U1XBrCQ8vZ8PVh5TEXXqa6AcCQQDkBPZMN+Un48BAXyEZbiaPvcM4qs256qD4VcxEwf/4E/dvlRUACDMqRJQUQroqJwBq2LwimWZRnUzgR7U/YwRJAkEAzHdmZH+xT+uzW5L3pT3neNKCLfdB43L2a+QYHyzydfiMbBqlKQiMDdCOJUNDcVeZ/jgBzpFfyvFGrc4PezfhEQJBAIB9E1VLwgPCYRllAb/UxEIHirSp+xei0WZe4qZ0M4tVpP7poVXNSReuYUsxdro+FAwhaZKNooym+SUBA29empECQQCjj5jfXrTMre5+NlCVQs/Qaf6gwpStXDiM/WX223F2X7wbX3VqQSEACV1gkBxtIRag2L30xnN7US6W47j0yzbp";
	// 支付宝的公钥,查看地址：https://b.alipay.com/order/pidAndKey.htm
	public static String alipay_public_key  = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://www.seekdj.com/aliPaynotify";
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://www.seekdj.com/aliPayReturn";
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

