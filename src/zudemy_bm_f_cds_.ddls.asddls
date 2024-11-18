@EndUserText.label: 'Table function CDS'
define table function ZUDEMY_BM_F_CDS_
with parameters 
@Environment.systemField:#CLIENT
p_clnt : abap.clnt
returns {
  client : abap.clnt;
  order_no : abap.int4;
  gross_amount: abap.int4;
  gross_dis_amount: abap.int4;
}
implemented by method zcl_sql_script=>get_orders;