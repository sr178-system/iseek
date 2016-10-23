package com.sr178.iseek.pc.plugin;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.plugin.IAppPlugin;
import com.sr178.iseek.pc.service.PcService;

public class LoadMaxNoticeKeyPlugin implements IAppPlugin{

	@Override
	public void startup() throws Exception {
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
		pcService.loadMaxNoticeKey();
		
	}

	@Override
	public void shutdown() throws Exception {
		
	}

	@Override
	public int cpOrder() {
		return 0;
	}

}
