{{ dbt_utils.union_relations(
    relations=[ref('int__d2d_ebook_sales')
              ,ref('int__d2d_print_sales')
              ,ref('int__kdp_ebook_sales')
              ,ref('int__kdp_kenp_days') ]
) }}