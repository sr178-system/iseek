package iseek.test;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.testcore.DaoTest;
import com.sr178.iseek.pc.service.PcService;
import com.sr178.module.utils.MD5Security;

public class PcServiceTest extends DaoTest {

	public void testReg() throws Exception{
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		
		String mobile = "15919820372";
		
		String password = "111111";
		
		String md5Str = MD5Security.md5_32_Big("5X#6423D79C74b6b"+password+"AB8471%VAED8A76E");
		
		String tranferPassword = PcService.encrypt(md5Str, "CEEF0B3D241F4f3798FF89384BE7ACA1");
		if(tranferPassword==null){
			
		}
		
		//发送验证码
		String code = pcService.sendMobileVerify(mobile,1);
		//验证验证码
		pcService.verifyMobileCode(mobile, code);
		
		String loginName = "dogdog7788";
		String nickName = "潮哥";
		int sex = 1;
		String email = "dogdog7788@qq.com";
		
		pcService.reg(loginName, tranferPassword, nickName, sex, email, mobile);
		
	}
}
