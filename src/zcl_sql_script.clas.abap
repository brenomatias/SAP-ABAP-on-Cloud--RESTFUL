CLASS zcl_sql_script DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS get_product_data
      IMPORTING
        VALUE(p_id)         TYPE zdataelement_bm
      EXPORTING
        VALUE(ev_price)     TYPE f
        VALUE(ev_price_dis) TYPE f.
    CLASS-METHODS get_orders FOR TABLE FUNCTION zudemy_bm_f_cds_.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sql_script  IMPLEMENTATION.
  METHOD get_product_data BY DATABASE PROCEDURE FOR HDB
          LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING zproduct_table.
    DECLARE lv_price, lv_discount DOUBLE;
    SELECT price, discount into lv_price, lv_discount
         from zproduct_table where product_id = :p_id;
    ev_price =      lv_price;
    ev_price_dis = ( lv_price * ( 100 - lv_discount ) / 100 );

  ENDMETHOD.

  METHOD get_orders BY DATABASE FUNCTION FOR HDB
          LANGUAGE SQLSCRIPT OPTIONS READ-ONLY USING
          zsale_order_tab zproduct_table zsale_order_item.
    lt_orders = select hdr.client , hdr.order_no, item.amount,
                       ( item.amount * ( 100 - prod.discount ) / 100 ) as amount_dis
                       from     zsale_order_tab as hdr
                       inner join zsale_order_item as item
                        on hdr.order_id = item.order_id
                       inner join zproduct_table as prod
                         on item.product = prod.product_id where hdr.client = :p_clnt;

    RETURN select client, order_no, sum( amount ) as gross_amount,
                         sum( amount_dis ) as gross_dis_amount from  :lt_orders
                         group by  client, order_no;

  ENDMETHOD.

ENDCLASS.


