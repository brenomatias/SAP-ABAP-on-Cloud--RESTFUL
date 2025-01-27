CLASS zfill_data_custom_tables DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS fill_master_data.
    METHODS flush.
    METHODS fill_transaction_data.
ENDCLASS.



CLASS zfill_data_custom_tables IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
        me->flush( ).
        me->fill_master_data( ).
        me->fill_transaction_data(  ).
        out->write( 'Execution completed, check the data in tables' ).
    ENDMETHOD.
    METHOD fill_transaction_data.

        data : o_rand type REF TO cl_abap_random_int,
               n type i,
               seed type i,
               lv_date type timestamp,
               lv_ord_id type zdataelement_bm,
               lt_so type table of zsale_order_tab,
               lt_so_i type table of zsale_order_item.

        seed = cl_abap_random=>seed( ).
        cl_abap_random_int=>create(
          EXPORTING
            seed = seed
            min  = 1
            max  = 7
          RECEIVING
            prng = o_rand
        ).
        get time stamp FIELD lv_date.

        select * from ztable_bp_bm into table @data(lt_bp).
        select * from zproduct_table into table @data(lt_prod).

        do 10 times.
            lv_ord_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  ).
            n = o_rand->get_next( ).
            read table lt_bp into data(ls_bp) INDEX n.
            append value #( order_id = lv_ord_id
                            order_no = sy-index
                            buyer = ls_bp-bp_id
                            gross_amount = n * 100
                            currency = 'INR'
                            created_by = sy-uname
                            created_on = lv_date
                            changed_by = sy-uname
                            changed_on = lv_date
                         )  to lt_so.
            do 2 times.
                read table lt_prod into data(ls_product) INDEX n.
                n = o_rand->get_next( ).
                append value #( order_id = lv_ord_id
                            item_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32(  )
                            product = ls_product-product_id
                            qty = n
                            uom = 'PC'
                            amount = n * ls_product-price
                            currency = 'INR'
                            created_by = sy-uname
                            created_on = lv_date
                            changed_by = sy-uname
                            changed_on = lv_date
                         )  to lt_so_i.
            ENDDO.
        ENDDO.

        insert zsale_order_tab from table @lt_so.
        insert zsale_order_item from table @lt_so_i.

    ENDMETHOD.
    METHOD fill_master_data.

        data: lt_bp type TABLE of ztable_bp_bm,
              lt_prod type table of zproduct_table.

        append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'TACUM'
                    street = 'Victoria Street'
                    city = 'Kolkatta'
                    country = 'IN'
                    region = 'APJ'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'SAP'
                    street = 'Rosvelt Street Road'
                    city = 'Walldorf'
                    country = 'DE'
                    region = 'EMEA'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'Asia High tech'
                    street = '1-7-2 Otemachi'
                    city = 'Tokyo'
                    country = 'JP'
                    region = 'APJ'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'AVANTEL'
                    street = 'Bosque de Duraznos'
                    city = 'Maxico'
                    country = 'MX'
                    region = 'NA'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'Pear Computing Services'
                    street = 'Dunwoody Xing'
                    city = 'Atlanta, Georgia'
                    country = 'US'
                    region = 'NA'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'PicoBit'
                    street = 'Fith Avenue'
                    city = 'New York City'
                    country = 'US'
                    region = 'NA'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'TACUM'
                    street = 'Victoria Street'
                    city = 'Kolkatta'
                    country = 'IN'
                    region = 'APJ'
                    )
                    to lt_bp.
    append value #(
                    bp_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    bp_role = '01'
                    company_name = 'Indian IT Trading Company'
                    street = 'Nariman Point'
                    city = 'Mumbai'
                    country = 'IN'
                    region = 'APJ'
                    )
                    to lt_bp.

   append value #(
                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    name = 'Blaster Extreme'
                    category = 'Speakers'
                    price = 175
                    currency = 'INR'
                    discount = 3
                    )
                    to lt_prod.
    append value #(
                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    name = 'Sound Booster'
                    category = 'Speakers'
                    price = 250
                    currency = 'INR'
                    discount = 2
                    )
                    to lt_prod.
    append value #(
                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    name = 'Smart Office'
                    category = 'Software'
                    price = 154
                    currency = 'INR'
                    discount = 32
                    )
                    to lt_prod.
    append value #(
                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    name = 'Smart Design'
                    category = 'Software'
                    price = 240
                    currency = 'INR'
                    discount = 12
                    )
                    to lt_prod.
    append value #(
                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    name = 'Transcend Carry pocket'
                    category = 'PCs'
                    price = 140
                    currency = 'INR'
                    discount = 7
                    )
                    to lt_prod.
    append value #(
                    product_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_c32( )
                    name = 'Gaming Monster Pro'
                    category = 'PCs'
                    price = 155
                    currency = 'INR'
                    discount = 8
                    )
                    to lt_prod.

        INSERT ztable_bp_bm from table @lt_bp.
        INSERT zproduct_table from table @lt_prod.
    ENDMETHOD.
    METHOD flush.
        delete from: ztable_bp_bm, zproduct_table, zsale_order_tab, zsale_order_item.
    ENDMETHOD.
ENDCLASS.
