@AbapCatalog.sqlViewName: 'ZSALESHEADER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales header with BP'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_BM_I_SALES_HDR as select from zsale_order_tab
association[1] to ztable_bp_bm as _bp on
$projection.Buyer  = _bp.bp_id
{
    key zsale_order_tab.order_id as OrderId,
    zsale_order_tab.order_no as OrderNo,
    zsale_order_tab.buyer as Buyer,
    zsale_order_tab.gross_amount as GrossAmount,
    zsale_order_tab.currency as Currency,
    _bp
}
