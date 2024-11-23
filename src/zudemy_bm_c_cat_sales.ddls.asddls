@AbapCatalog.sqlViewName: 'ZCATSALES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Category sales per region'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_BM_C_CAT_SALES
  as select from ZUDEMY_BM_I_SALES( p_reg: 'APJ')
{
  key ProductCategory,
  key Currency,
      sum(Amount) as TotalSales
}
group by
  ProductCategory,
  Currency
