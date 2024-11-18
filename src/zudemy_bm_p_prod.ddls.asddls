@AbapCatalog.sqlViewName: 'ZPPROD_BM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Private view for product'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_BM_P_PROD as select from zproduct_table
{
     key product_id as ProductId,
     name as Name,
     category as Category,
     price as Price,
     currency as Currency
}
