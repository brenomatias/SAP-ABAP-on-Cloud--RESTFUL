@AbapCatalog.sqlViewName: 'ZISALES_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales composite view'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_BM_I_SALES
  with parameters
    p_reg : abap.char(3)
  as select from zsale_order_item
  association [1] to zproduct_table        as _products    on $projection.Product = _products.product_id
  association [1] to ZUDEMY_BM_I_SALES_HDR as _salesHeader on $projection.OrderId = _salesHeader.OrderId
{
  key zsale_order_item.item_id  as ItemId,
      zsale_order_item.order_id as OrderId,
      zsale_order_item.product  as Product,
      zsale_order_item.qty      as Qty,
      zsale_order_item.uom      as Uom,
      zsale_order_item.amount   as Amount,
      zsale_order_item.currency as Currency,
      _salesHeader._bp.region   as region,
      _products.name            as ProductName,
      _products.category        as ProductCategory,
      _salesHeader
} where _salesHeader._bp.region = $parameters.p_reg
 