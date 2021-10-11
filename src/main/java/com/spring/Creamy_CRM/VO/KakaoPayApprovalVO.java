package com.spring.Creamy_CRM.VO;

import java.sql.Date;

public class KakaoPayApprovalVO {
	
	 //response
    public String aid, tid, cid, sid;
    public String partner_order_id, partner_user_id, payment_method_type;
    public AmountVO amount;
    public CardVO card_info;
    public String item_name, item_code, payload;
    public Integer quantity, tax_free_amount, vat_amount;
    public Date created_at, approved_at;
    public String total_amount;
    
	
}
