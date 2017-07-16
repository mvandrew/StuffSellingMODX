<input type="hidden" name="item" value="[[$sellingItem]]">
<input type="hidden" name="qty" value="1">
<input type="hidden" name="price" value="[[$sellingItemPrice]]">
<input type="hidden" name="product_id" value="[[getResourceField
                                                    ?id=`[[$sellingItem]]`
                                                    &field=`m1_product`
                                                    &processTV=`1`
                                                ]]">
<input type="hidden" name="ref" value="[[++stuffselling.m1_ref]]">
<input type="hidden" name="lnk" value="[[getResourceField
                                            ?id=`[[$sellingItem]]`
                                            &field=`m1_link`
                                            &processTV=`1`
                                        ]]">
<input type="hidden" name="m1enabled" value="[[getResourceField
                                            ?id=`[[$sellingItem]]`
                                            &field=`m1_enabled`
                                            &processTV=`1`
                                        ]]">