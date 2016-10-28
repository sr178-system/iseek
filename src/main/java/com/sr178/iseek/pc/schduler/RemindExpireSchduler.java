package com.sr178.iseek.pc.schduler;

import java.util.Map;
import java.util.Map.Entry;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.scheduler.SchedulerEntry;
import com.sr178.iseek.common.session.IseekSession;
import com.sr178.iseek.pc.service.PcService;

public class RemindExpireSchduler extends SchedulerEntry {

	@Override
	public void executeJob(JobExecutionContext arg0) throws JobExecutionException {
		PcService pcService = ServiceCacheFactory.getService(PcService.class);
        Map<String,IseekSession>  map = pcService.getAllOnlineUserMap();
        for(Entry<String,IseekSession> entry:map.entrySet()){
        	 //会员过期提醒
        	pcService.sendMemberExpiryNotice(Long.valueOf(entry.getKey()), null);
        }

	}

}
