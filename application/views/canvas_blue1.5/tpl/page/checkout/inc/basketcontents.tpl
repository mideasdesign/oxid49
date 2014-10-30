[{* basket contents *}]
[{oxscript include="js/widgets/oxbasketchecks.js" priority=10 }]
[{oxscript add="$('#checkAll, #basketRemoveAll').oxBasketChecks();"}]
[{assign var="currency" value=$oView->getActCurrency()}]
<form name="basket[{ $basketindex }]" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="basket">
    <input type="hidden" name="fnc" value="changebasket">
    <input type="hidden" name="CustomError" value='basket'>
    <table id="basket" class="basketitems[{if $oViewConf->getActiveClassName() == 'order' }] orderBasketItems[{/if}]">
        [{*<colgroup>
            [{if $editable }]<col class="editCol">[{/if}]
            <col class="thumbCol">
            <col>
            [{if $oView->isWrapping() }]<col class="wrappingCol">[{/if}]
            <col class="coutCol">
            <col class="priceCol">
            <col class="vatCol">
            <col class="totalCol">
        </colgroup>*}]
        [{* basket header *}]
        [{*<thead>
            <tr class="leftrows">
                [{if $editable }]<th></th>[{/if}]
                <th width="152px"></th>
                <th width="361px">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PRODUCT" }]</th>
          
                <th width="93px">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_QUANTITY" }]</th>
                <th width="93px">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_UNITPRICE" }]</th>
                <th width="152px">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX" }]</th>
                <th width="118px">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTAL" }]</th>
            </tr>
        </thead>*}]
		
		
		[{ if $eb_from ne "order" }]
		
			<div id="row">
				<div id="left"><div class="left-header1 checkbox_width">&nbsp;</div></div>
				 <div id="left"><div class="left-header1 image_width">Image</div></div>
				 <div id="left"><div class="left-header1 max_width">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PRODUCT" }]</div></div>
				 <div id="left"><div class="left-header1">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_QUANTITY" }]</div></div>
				 <div id="left"><div class="left-header1">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_UNITPRICE" }]</div></div>
				 <div id="left"><div class="left-header1">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX" }]</div></div>
				 <div id="left"><div class="left-header1 eb_total_width">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTAL" }]</div></div>
			</div>
		
		[{else}]
			
			<div id="row">
				<!--<div id="left"><div class="left-header1 checkbox_width">&nbsp;</div></div>-->
				 <div id="left"><div class="left-header2 image_width">Image</div></div>
				 <div id="left"><div class="left-header2 max_width">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PRODUCT" }]</div></div>
				 <div id="left"><div class="left-header2">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_QUANTITY" }]</div></div>
				 <div id="left"><div class="left-header2">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_UNITPRICE" }]</div></div>
				 <div id="left"><div class="left-header2">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX" }]</div></div>
				 <div id="left"><div class="left-header2 eb_total_width">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTAL" }]</div></div>
			</div>
			
		[{/if}]
                    <div id="row" class="clear">

        [{* basket items *}]
       <tbody>
        [{assign var="basketitemlist" value=$oView->getBasketArticles() }]
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
            [{block name="checkout_basketcontents_basketitem"}]
                [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
                <tr id="cartItem_[{$smarty.foreach.basketContents.iteration}]" class="clear eb_basketitemlist_width" >
					[{ if $eb_from ne "order" }]
                    [{block name="checkout_basketcontents_basketitem_removecheckbox"}]                        
					   <td class="checkbox cartbox1">
						<!--<td class="checkbox">-->
						   [{if $editable }]
								<input type="checkbox" name="aproducts[[{ $basketindex }]][remove]" value="1">
						   [{/if}]
                       </td>
                    [{/block}]
					[{/if}]
					
					
                    [{block name="checkout_basketcontents_basketitem_image"}]
                        [{* product image *}]			 		
                        <td class="cartbox2">
			 [{* <td class="basketImage"> *}]			
			<div id="cart_no_img_border" [{if !$editable }]class="eb_cart_img_margin"[{/if}]></div>	
                            <a href="[{$basketitem->getLink()}]" rel="nofollow">
                                <img src="[{$basketitem->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]"style="[{if !$editable }]margin-left:0px;[{/if}]" width="78">
                            </a>		
                        </td>			                       
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                        [{* product title & number *}]
                        <td class="cartbox3 cart_textname">			
                            <div>
                                <a rel="nofollow" href="[{$basketitem->getLink()}]" class="submitButton2_color">[{$basketitem->getTitle()}]</a>[{if $basketitem->isSkipDiscount() }] <sup><a rel="nofollow" href="#SkipDiscounts_link" >**</a></sup>[{/if}]
                            </div>
                            
							<div>
                                [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_ARTNOMBER" }] [{ $basketproduct->oxarticles__oxartnum->value }]
                            </div>
			
                            [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                [{if $oViewConf->showSelectListsInList()}]
                                    [{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
                                    [{if $oSelections}]
                                        <div class="selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
                                            [{foreach from=$oSelections item=oList name=selections}]
                                                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="aproducts[`$basketindex`][sel]" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                                            [{/foreach}]
                                        </div>
                                    [{/if}]
                                [{/if}]
                            [{/if }]

                            [{if !$editable }]
                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam }]
                                    <p class="persparamBox"><strong>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PERSPARAM" }]</strong> [{ $aParam }]</p>
                                [{/foreach}]
                            [{/if}]
                        </td>
                    [{/block}]

		    [{* product wrapping *}]
                  [{*  [{block name="checkout_basketcontents_basketitem_wrapping"}]                      
                        [{if $oView->isWrapping() }]
                        <td>
                                [{ if !$basketitem->getWrappingId() }]
                                    [{if $editable }]
                                        <a class="wrappingTrigger" rel="nofollow" href="#" title="[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_ADDWRAPPING" }]">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_ADDWRAPPING" }]</a>
                                    [{else}]
                                        [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_NONE" }]
                                    [{/if}]
                                [{else}]
                                    [{assign var="oWrap" value=$basketitem->getWrapping() }]
                                    [{if $editable }]
                                        <a class="wrappingTrigger" rel="nofollow" href="#" title="[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_ADDWRAPPING" }]">[{$oWrap->oxwrapping__oxname->value}]</a>
                                    [{else}]
                                        [{$oWrap->oxwrapping__oxname->value}]
                                    [{/if}]
                                [{/if}]
                        </td>
                        [{/if}]
                    [{/block}] *}]

                    [{block name="checkout_basketcontents_basketitem_quantity"}]
                        [{* product quantity manager *}]
						[{if $editable }]
						<td class="cartbox44">
						[{else}]
                        <td class="cartbox4">
						[{/if}]
                            [{if $editable }]
                                <input type="hidden" name="aproducts[[{ $basketindex }]][aid]" value="[{ $basketitem->getProductId() }]">
                                <input type="hidden" name="aproducts[[{ $basketindex }]][basketitemid]" value="[{ $basketindex }]">
                                <input type="hidden" name="aproducts[[{ $basketindex }]][override]" value="1">
                                [{if $basketitem->isBundle() }]
                                    <input type="hidden" name="aproducts[[{ $basketindex }]][bundle]" value="1">
                                [{/if}]

                               [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]

                                [{*     [{if $basketproduct->oxarticles__oxisconfigurable->value}]
                                        [{if $basketitem->getPersParams()}]
                                            [{foreach key=sVar from=$basketitem->getPersParams() item=aParam }]
                                                <p><strong>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PERSPARAM" }]</strong> <input class="textbox persParam" type="text" name="aproducts[[{ $basketindex }]][persparam][[{ $sVar }]]" value="[{ $aParam }]"></p>
                                            [{/foreach }]
                                        [{ else }]
                                            <p><strong>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PERSPARAM" }]</strong> <input class="textbox persParam" type="text" name="aproducts[[{ $basketindex }]][persparam][details]" value=""></p>
                                        [{/if}]
                                    [{/if}]  *}]
                                    <p>
                                        <input id="am_[{$smarty.foreach.basketContents.iteration}]" type="text" class="cartquantity_inputbg" name="aproducts[[{ $basketindex }]][am]" value="[{ $basketitem->getAmount() }]" size="2">
                                    </p>
                                [{/if}]
                            [{else}]
                                [{ $basketitem->getAmount() }]
                            [{/if}]
                            [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle()) }]
                                +[{ $basketitem->getdBundledAmount() }]
                            [{/if}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_unitprice"}]
                        [{* product price *}]
						[{if $editable }]
						<td class="cartbox55 cart_textamount">
						[{else}]
						<td class="cartbox5 cart_textamount">
						[{/if}]
                        
                            [{if $basketitem->getFUnitPrice() }][{ $basketitem->getFUnitPrice() }]&nbsp;[{ $currency->sign}][{/if}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_vat"}]
                        [{* product VAT percent *}]
                        <td class="cartbox6 cart_textamount">
                            [{ $basketitem->getVatPercent() }]%
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_totalprice"}]
                        [{* product quantity * price *}]
                        <td class="cartbox7 cart_textamount" align="right">
                            [{ $basketitem->getFTotalPrice() }]&nbsp;[{ $currency->sign }]
                        </td>
                    [{/block}]
                </tr>
            [{/block}]

            [{* packing unit *}]

            [{block name="checkout_basketcontents_itemerror"}]
                [{foreach from=$Errors.basket item=oEr key=key }]
                    [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
                        [{* display only the exceptions for the current article *}]
                        [{if $basketindex == $oEr->getValue('basketIndex') }]
                            <tr class="basketError">
                                [{if $editable }]<td></td>[{/if}]
                                    <td colspan="5">
                                        <span class="inlineError">[{ $oEr->getOxMessage() }] <strong>[{ $oEr->getValue('remainingAmount') }]</strong></span>
                                    </td>
                                [{if $oView->isWrapping() }]<td></td>[{/if}]
                                <td></td>
                            </tr>
                        [{/if}]
                    [{/if}]
                    [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
                        [{if $basketitem->getProductId() == $oEr->getValue('productId') }]
                            <tr class="basketError">
                                [{if $editable }]<td></td>[{/if}]
                                <td colspan="5">
                                    <span class="inlineError">[{ $oEr->getOxMessage() }]</span>
                                </td>
                                [{if $oView->isWrapping() }]<td></td>[{/if}]
                                <td></td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/foreach}]
            [{/block}]
        [{*  basket items end  *}]
        [{/foreach }]

         [{block name="checkout_basketcontents_giftwrapping"}]
             [{if $oViewConf->getShowGiftWrapping() }]
                  [{assign var="oCard" value=$oxcmp_basket->getCard() }]
                  [{ if $oCard }]
                    <tr>
                      [{if $editable }]<td></td>[{/if}]
                      <td></td>
                      <td id="orderCardTitle" colspan="3">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_GREETINGCARD" }] "[{ $oCard->oxwrapping__oxname->value }]"
                          <br>
                          <b>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_YOURMESSAGE" }]</b>
                          <br>
                          <div id="orderCardText">[{ $oxcmp_basket->getCardMessage()|nl2br }]</div>
                      </td>
                      <td id="orderCardPrice">[{ $oCard->getFPrice() }]&nbsp;[{ $currency->sign }]</td>
                      <td>[{if $oxcmp_basket->getWrappCostVat() }][{ $oxcmp_basket->getWrappCostVatPercent() }]%[{/if}]</td>
                      <td id="orderCardTotalPrice" align="right">[{ $oCard->getFPrice() }]&nbsp;[{ $currency->sign }]</td>
                    </tr>
                  [{/if}]
              [{/if}]
          [{/block}]
        </tbody>
    </table>

<div class="eb_order_div2">&nbsp;</div>

    <div class="clear">

        [{block name="checkout_basketcontents_basketfunctions"}]
            [{if $editable }]
                <div id="basketFn" class="margin-left7">
                    [{*  basket update/delete buttons  *}]
                    <input type="checkbox" name="checkAll" id="checkAll" class="left" title="[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_SELECT_ALL" }]">
                    [{*<button id="basketRemoveAll" name="removeAllBtn"><span>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_SELECT_ALL" }]</span></button>*}]
                    <button id="basketRemove" class="btn" type="submit" name="removeBtn"><span>[{ oxmultilang ident="REMOVE" }]</span></button>
				<div class="eb_basket_button_div1 left">&nbsp;</div>

                    <button id="basketUpdate" class="btn" type="submit" name="updateBtn"><span>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_UPDATE" }]</span></button>
                </div>
            [{/if}]
        [{/block}]
</div>
[{block name="checkout_basketcontents_summary"}]
<div id="basketSummary" class=" right summary[{if $oViewConf->getActiveClassName() == 'order' }] orderSummary[{/if}]">
                [{*  basket summary  *}]
                <table>
                    [{if !$oxcmp_basket->getDiscounts() }]

                        [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                            <tr>
                                <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALNET" }]</th>
                                <td>[{ $oxcmp_basket->getProductsNetPrice() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                        [{/block}]

                        [{block name="checkout_basketcontents_productvats"}]
                            [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key }]
                                <tr>
                                    <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key }]</th>
                                    <td>[{oxprice price=$VATitem currency=$currency }]</td>
                                </tr>
                            [{/foreach}]
                        [{/block}]

						
                    [{/if }]

                    [{block name="checkout_basketcontents_totalgross"}]
                        <tr>
                            <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALGROSS" }]</th>
                            <td>[{ $oxcmp_basket->getFProductsPrice() }]&nbsp;[{ $currency->sign }]</td>
                        </tr>
                    [{/block}]

                    [{if $oxcmp_basket->getDiscounts() }]
                        [{block name="checkout_basketcontents_discounts"}]
                            [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                                <tr>
                                    <th>
                                        <b>[{if $oDiscount->dDiscount < 0 }][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_CHARGE" }][{else}][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNT2" }][{/if}]&nbsp;</b>
                                        [{ $oDiscount->sDiscount }]
                                    </th>
                                    <td>
                                        [{if $oDiscount->dDiscount < 0 }][{ $oDiscount->fDiscount|replace:"-":"" }][{else}]-[{ $oDiscount->fDiscount }][{/if}]&nbsp;[{ $currency->sign }]
                                    </td>
                                </tr>
                            [{/foreach }]
                        [{/block}]

                        [{block name="checkout_basketcontents_totalnet"}]
                            <tr>
                                <th>
                                    [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALNET" }]
                                </th>
                                <td>
                                    [{ $oxcmp_basket->getProductsNetPrice() }]&nbsp;[{ $currency->sign }]
                                </td>
                            </tr>
                        [{/block}]

                        [{block name="checkout_basketcontents_productvats"}] 
                            [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX1" }] [{ $key }][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX2" }]</th>
                                    <td>[{ $VATitem }]&nbsp;[{ $currency->sign }]</td>
                                </tr>
                            [{/foreach }]
                        [{/block}]
                    [{/if }]

                    [{block name="checkout_basketcontents_voucherdiscount"}]
                        [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue() }]
                            [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
                                <tr class="couponData">
                                    <th><span><strong>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_COUPON" }]</strong>&nbsp;([{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_NOMBER" }] [{ $sVoucher->sVoucherNr }])</span>
                                    [{if $editable }]
                                        <a href="[{ $oViewConf->getSelfLink() }]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{ $sVoucher->sVoucherId }]&amp;CustomError=basket" class="removeFn" rel="nofollow">[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_REMOVE2" }]</a>
                                    [{/if}]
                                    </th>
                                    <td>-<strong>[{ $sVoucher->fVoucherdiscount }]&nbsp;[{ $currency->sign }]</strong></td>
                                </tr>
                            [{/foreach }]
                        [{/if }]
                    [{/block}]

                    [{block name="checkout_basketcontents_delcosts"}]
                        [{if $oxcmp_basket->getDelCostNet() }]
                            <tr>
                                <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_SHIPPINGNET" }]</th>
                                <td>[{ $oxcmp_basket->getDelCostNet() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                            [{if $oxcmp_basket->getDelCostVat() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PLUSTAX1" }] [{ $oxcmp_basket->getDelCostVatPercent() }][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PLUSTAX2" }]</th>
                                    <td>[{ $oxcmp_basket->getDelCostVat() }]&nbsp;[{ $currency->sign }]</td>
                                </tr>
                            [{/if }]
                        [{elseif $oxcmp_basket->getFDeliveryCosts() }]
                            <tr>
                                <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_SHIPPING" }]</th>
                                <td>[{ $oxcmp_basket->getFDeliveryCosts() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                        [{/if }]
                    [{/block}]

                    [{block name="checkout_basketcontents_paymentcosts"}]
                        [{if $oxcmp_basket->getPayCostNet() }]
                            <tr>
                                <th>[{if $oxcmp_basket->getPaymentCosts() >= 0}][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENT" }][{else}][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_CHARGE2" }][{/if}] [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNT3" }]</th>
                                <td>[{ $oxcmp_basket->getPayCostNet() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                            [{if $oxcmp_basket->getPayCostVat() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENTTAX1" }] [{ $oxcmp_basket->getPayCostVatPercent() }] [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENTTAX2" }]</th>
                                    <td>[{ $oxcmp_basket->getPayCostVat() }]&nbsp;[{ $currency->sign }]</td>
                                </tr>
                            [{/if }]
                        [{elseif $oxcmp_basket->getFPaymentCosts() }]
                            <tr>
                                <th>[{if $oxcmp_basket->getPaymentCosts() >= 0}][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENT" }][{else}][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_CHARGE2" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" }]</th>
                                <td>[{ $oxcmp_basket->getFPaymentCosts() }]&nbsp;[{ $currency->sign }]</td>
                            </tr>
                        [{/if }]
                    [{/block}]

                    [{block name="checkout_basketcontents_ts"}]
                        [{if $oxcmp_basket->getTsProtectionCosts()}]
                            [{ if $oxcmp_basket->getTsProtectionNet() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTION" }]</th>
                                    <td>[{ $oxcmp_basket->getTsProtectionNet() }]&nbsp;[{ $currency->sign}]</td>
                                </tr>
                                [{ if $oxcmp_basket->getTsProtectionVat() }]
                                    <tr>
                                        <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTIONCHARGETAX1" }] [{ $oxcmp_basket->getTsProtectionVatPercent()}][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTIONCHARGETAX2" }]</th>
                                        <td>[{ $oxcmp_basket->getTsProtectionVat() }]&nbsp;[{ $currency->sign}]</td>
                                    </tr>
                                [{/if}]
                            [{ elseif $oxcmp_basket->getFTsProtectionCosts() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTION" }]</th>
                                    <td>[{ $oxcmp_basket->getFTsProtectionCosts() }]&nbsp;[{ $currency->sign}]</td>
                                </tr>
                            [{/if}]
                        [{/if}]
                    [{/block}]

                    [{block name="checkout_basketcontents_wrappingcosts"}]
                        [{ if $oViewConf->getShowGiftWrapping() }]
                            [{if $oxcmp_basket->getWrappCostNet() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_WRAPPINGNET" }]</th>
                                    <td>[{ $oxcmp_basket->getWrappCostNet() }] [{ $currency->sign}]</td>
                                </tr>
                            [{elseif $oxcmp_basket->getFWrappingCosts() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_WRAPPINGGROSS1" }]</th>
                                    <td>[{ $oxcmp_basket->getFWrappingCosts() }] [{ $currency->sign}]</td>
                                </tr>
                            [{/if}]
                            [{if $oxcmp_basket->getWrappCostVat() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_WRAPPINGTAX1" }] [{ $oxcmp_basket->getWrappCostVatPercent() }][{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_WRAPPINGTAX2" }]</th>
                                    <td>[{ $oxcmp_basket->getWrappCostVat() }] [{ $currency->sign}]</td>
                                </tr>
                            [{/if}]
                        [{/if}]
                    [{/block}]

                    [{if $oxcmp_basket->hasSkipedDiscount() }]
                        <tr>
      <th><span class="note">**</span> [{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNTS_NOT_APPLIED_FOR_ARTICLES" }]</span></th>
                            <td></td>
                        </tr>
                    [{/if}]
                </table>
               </div>
  [{/block}]          
<div class="clear">&nbsp;</div>

<div class="eb_order_div2">&nbsp;</div>
[{block name="checkout_basketcontents_grandtotal"}]
<div class="cart_main_price">
  <div  class="left totlal_width"><strong>[{ oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_GRANDTOTAL" }]</strong></div>
  <div align="right" class="left"><strong>[{ $oxcmp_basket->getFPrice() }]&nbsp;[{ $currency->sign }]</strong></div>
</div>

[{/block}]
<div class="clear">&nbsp;</div>
 </form>
 
