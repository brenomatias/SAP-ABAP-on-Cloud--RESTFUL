@AbapCatalog.sqlViewName: 'ZIBP_BM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Master Data of BP'
@Metadata.ignorePropagatedAnnotations: true
define view ZUDEMY_BM_I_BP as select from ztable_bp_bm
{
    key bp_id as BpID,
    bp_role as BpRole,
    company_name as ComapanyName,
    street as Street,
    city as City,
    country as Country,
    region as Region
}
