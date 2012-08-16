text = "RegPrice                               3.89\r\n\r\nCard Savings                          .90-\r\n\r\nWT      NECTARINES\r\n\t\r\n\t+ .\r\n\r\nRegPrice\r\n\t4\r\n\t.67\r\n\r\nCard Savings\r\n\t1\r\n\t.13-\r\n\r\nO ORG BABY CARROT+\r\n\t\r\n\t.\r\n\r\nRegPrice\r\n\t2,\r\n\t.49\r\n\r\nCard Savings\r\n\t\r\n\t.70-\r\n\r\nREFRIG/FROZEN\r\n\r\n182.69 1UCERNE MILK 1% + 2.69 F\r\n187.19 SFWY STRAWBERRIES+ 7.19 F\r\n2 QTY  BOCA PATTIES CHIKN     9.38 F\r\n\r\nPRODUCE\r\n\r\n1.02 lb 8 .89 /lb MAN WT\r\nWT      BANANAS                    +               .90 F\r\n\r\n0.40 lb 8 2.19 /lb MAN WT\r\nWT      GALA APPLES      +       .87 F\r\n\r\n1.42 lb 8 2.49/lb MAN WT\r\n\r\n3.54 F\r\n\r\n1.79 F\r\n\r\nDELI\r\n\r\nEATING RT HUMMUS S                  .    2.50 F\r\n\r\nRegPrice                             3.29\r\n\r\nCard Savings                        .79-\r\n\r\n**** TAX       .00  BAL    48.30\r\nVF VS XXXXXXXXXXXX9150        48.30\r\n\r\nCHANGE                                     .00\r\n\r\n8/08/12 08:26 1490 99 0017 8899\r\n\r\nYOUR CASHIER TODAY WAS VIRTUAL\r\n\r\nWelcome Club Member!                            0608\r\n\r\nYour Savings\r\n\r\nCard Savings                                    6*92\r\n\r\nTotal                                                 6-92\r\n\r\nTotal Savings Value                        13%\r\n\r\n**************************************\f"

Fabricator(:image) do
  translation { text }
  user_id { Fabricate(:user) }
  stored_at {"we don't care right now"}
end



# t.text     "translation"
# t.integer  "user_id"
# t.string   "stored_at"
# t.datetime "created_at",        :null => false
# t.datetime "updated_at",        :null => false
# t.string   "file_file_name"
# t.string   "file_content_type"
# t.integer  "file_file_size"
# t.datetime "file_updated_at"