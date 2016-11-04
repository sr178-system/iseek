package com.sr178.iseek.pc.dao;

import com.sr178.common.jdbc.SqlParameter;
import com.sr178.iseek.common.dao.IseekDaoBase;
import com.sr178.iseek.pc.bo.PaymentOrder;

public class PaymentOrderDao extends IseekDaoBase<PaymentOrder> {

	/**
	 * 更新订单至已发货
	 * @param orderId
	 * @param pay_type
	 * @param bank_order_id
	 * @param pay_user_id
	 * @return
	 */
	public boolean updateOrderToSuccess(String orderId,int pay_type,String bank_order_id,long pay_user_id){
		String sql = "update "+super.getTable()+" set status=1,pay_type=?,bank_order_id=?,pay_user_id=? where order_id=? and status=0 limit 1";
		return this.getJdbc().update(sql, SqlParameter.Instance().withInt(pay_type).withString(bank_order_id).withLong(pay_user_id).withString(orderId))>0;
	}
}
