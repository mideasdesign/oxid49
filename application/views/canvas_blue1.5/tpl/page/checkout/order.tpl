[{oxscript include="js/widgets/oxagbcheck.js" priority=10 }]
[{oxscript add="$('#checkAgbTop, #checkAgbBottom').oxAGBCheck();"}]

[{capture append="oxidBlock_content"}]

    [{block name="checkout_order_errors"}]
        [{ if $oView->isConfirmAGBActive() && $oView->isConfirmAGBError() == 1 }]
            [{include file="message/error.tpl" statusMessage="READ_AND_CONFIRM_TERMS"|oxmultilangassign }]
        [{/if}]
        [{assign var="iError" value=$oView->getAddressError() }]
        [{ if $iError == 1}]
           [{include file="message/error.tpl" statusMessage="ERROR_DELIVERY_ADDRESS_WAS_CHANGED_DURING_CHECKOUT"|oxmultilangassign }]
        [{ /if}]
    [{/block}]

    [{* ordering steps *}]
<div class="cart_steps">
    [{include file="page/checkout/inc/steps.tpl" active=4 }]
</div>
		[{ if !$oxcmp_basket->getProductsCount()  }]
                <div>[{ oxmultilang ident="BASKET_EMPTY" }]</div>
            [{else}]
                [{assign var="currency" value=$oView->getActCurrency() }]

                [{if $oView->isLowOrderPrice()}]
                    [{block name="checkout_order_loworderprice_top"}]
                        <div>[{ oxmultilang ident="MIN_ORDER_PRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
                    [{/block}]
                [{elseif $oView->showOrderButtonOnTop()}]
                    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post" id="orderConfirmAgbTop">
                        [{ $oViewConf->getHiddenSid() }]
                        [{ $oViewConf->getNavFormParams() }]
                        <input type="hidden" name="cl" value="order">
                        <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                        <input type="hidden" name="challenge" value="[{$challenge}]">
                        <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
                        <div class="agb">
                            [{if $oView->isActive('PsLogin') }]
                                <input type="hidden" name="ord_agb" value="1">
                            [{else}]
                                [{if $oView->isConfirmAGBActive()}]
                                    [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                                        <h3 class="section">
                                            <strong>[{ $oContent->oxcontents__oxtitle->value }]</strong>
                                        </h3>
                                        
                                        <input type="hidden" name="ord_agb" value="0">
                                        <input id="checkAgbTop" class="checkbox" type="checkbox" name="ord_agb" value="1">
                             [{ $oContent->oxcontents__oxcontent->value }]
                                    [{/oxifcontent}]
                                    <p class="errorMsg eb_errorMsg_padding1" name="agbError">[{ oxmultilang ident="READ_AND_CONFIRM_TERMS" }]</p>
                                [{else}]
                                    [{oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                                        <h3 class="section">
                                            <strong>[{ $oContent->oxcontents__oxtitle->value }]</strong>
                                       
                                            
                                        </h3>
                                       
                                        <input type="hidden" name="ord_agb" value="1">
                                        [{ $oContent->oxcontents__oxcontent->value }]
                                    [{/oxifcontent}]
                                [{/if}]
                            [{/if}]
                        </div>
                        <div class="lineBox clear">
                            <a href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]" class="prevStep submitButton largeButton">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_BACKSTEP" }]</a>
                            <button type="submit" class="submitButton nextStep largeButton">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_SUBMITORDER" }]</button>
                        </div>
                    </form>
     [{/if}]


<div class="eb_order_div">

	<div class="eb_order_div1">
	[{block name="checkout_order_address"}]
		<div id="orderAddress" >
	   
			<form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
				<h3 class="section">
					  
				<strong>[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_ADDRESSES" }]</strong>
				<button type="submit" class="eb_changebutton">[{ oxmultilang ident="EDIT" }]</button>
				<div class="eb_order_div2">&nbsp;</div>
				[{ $oViewConf->getHiddenSid() }]
				<input type="hidden" name="cl" value="user">
				<input type="hidden" name="fnc" value="">
			  

				</h3>

			</form>
			
			
			<dl>
				<div class="eb_order_div3">
				<dt class="eb_order_div3_dt">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_BILLINGADDRESS" }]</dt>
				<dd>
					[{include file="widget/address/billing_address.tpl"}]
				</dd>
				</div>
				
				<div class="eb_order_div4">
				[{assign var="oDelAdress" value=$oView->getDelAddress() }]
				[{if $oDelAdress }]
					<dt class="eb_order_div4_dt">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_SHIPPINGADDRESS" }]</dt>
					<dd>
						[{include file="widget/address/shipping_address.tpl" delivadr=$oDelAdress}]
					</dd>
				[{/if}]
				</div>
			</dl>

			

		</div>
	[{/block}]
	</div>
	
	<div class="eb_order_shipping">
	[{block name="shippingAndPayment"}]
		<div id="orderShipping" class="eb_order_shipping1">
		<form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
			<h3 class="section">
				<strong>[{ oxmultilang ident="SHIPPING_CARRIER" }]</strong>
				<button type="submit" class="eb_changebutton">[{ oxmultilang ident="EDIT" }]</button>
				<div class="eb_order_div2">&nbsp;</div>
				[{ $oViewConf->getHiddenSid() }]
				<input type="hidden" name="cl" value="payment">
				<input type="hidden" name="fnc" value="">
			   
		   
			</h3>
		</form>
		[{assign var="oShipSet" value=$oView->getShipSet() }]
		[{ $oShipSet->oxdeliveryset__oxtitle->value }]
		</div>

		<div id="orderPayment" class="eb_order_shipping1">
			<form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
				<h3 class="section">
					<strong>[{ oxmultilang ident="PAYMENT_METHOD" }]</strong>
					<button type="submit" class="eb_changebutton">[{ oxmultilang ident="EDIT" }]</button>
					<div class="eb_order_div2">&nbsp;</div>
					[{ $oViewConf->getHiddenSid() }]
					<input type="hidden" name="cl" value="payment">
					<input type="hidden" name="fnc" value="">
				   
				</h3>
			</form>
			[{assign var="payment" value=$oView->getPayment() }]
			[{ $payment->oxpayments__oxdesc->value }]
		</div>
		
		[{if $oView->getOrderRemark() }]
			<div id="orderPayment" class="eb_order_shipping1">
			
			<h3 class="section">
				<form>
				<strong>[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_WHATIWANTEDTOSAY" }]</strong>
				<div class="eb_order_div2">&nbsp;</div>
				</form>
			</h3>
			[{ $oView->getOrderRemark() }]
			
			
			</div>
		[{/if}]
		
		
	[{/block}]
	</div>
	
</div>





    [{block name="checkout_order_main"}]
    
        [{*if !$oView->showOrderButtonOnTop()}]
            <div class="lineBox clear">
                <span>&nbsp;</span>
                <span class="title">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_TITLE2" }]</span>
            </div>
        [{/if*}]
        <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
            <h3 class="section">
                <strong>Cart</strong>
				<button type="submit" class="eb_changebutton">[{ oxmultilang ident="EDIT" }]</button>
				<div class="eb_order_div2">&nbsp;</div>
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="basket">
                <input type="hidden" name="fnc" value="">
                
            </h3>
        </form>
        [{block name="checkout_order_details"}]
            

                [{block name="order_basket"}]
                    [{include file="page/checkout/inc/basketcontents.tpl" editable=false eb_from="order"}]
                [{/block}]

                [{block name="checkout_order_vouchers"}]
                    [{ if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
                        [{ oxmultilang ident="PAGE_CHECKOUT_ORDER_USEDCOUPONS" }]
                        <div>
                            [{foreach from=$Errors.basket item=oEr key=key }]
                                [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                                    [{ oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED1" }] [{ $oEr->getValue('voucherNr') }] [{ oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED2" }]<br>
                                    [{ oxmultilang ident="PAGE_CHECKOUT_ORDER_REASON" }]
                                    [{ $oEr->getOxMessage() }]<br>
                                [{/if}]
                            [{/foreach}]
                            [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
                                [{ $sVoucher->sVoucherNr }]<br>
                            [{/foreach }]
                        </div>
                    [{/if}]
                [{/block}]
[{if $oView->isLowOrderPrice() }]
                    [{block name="checkout_order_loworderprice_bottom"}]
                        <div class="lineBox clear">
                            <div>[{ oxmultilang ident="MIN_ORDER_PRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
                        </div>
                    [{/block}]
                [{else}]
                    [{block name="checkout_order_btn_confirm_bottom"}]
                        <form action="[{ $oViewConf->getSslSelfLink() }]" method="post" id="orderConfirmAgbBottom">
                            [{ $oViewConf->getHiddenSid() }]
                            [{ $oViewConf->getNavFormParams() }]
                            <input type="hidden" name="cl" value="order">
                            <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                            <input type="hidden" name="challenge" value="[{$challenge}]">
                            <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
                            <div class="agb">
                            
                                [{if $oView->isActive('PsLogin') }]
                                    <input type="hidden" name="ord_agb" value="1">
                                [{else}]
                                    [{if $oView->isConfirmAGBActive()}]
                                        [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                                            <h3 class="section">
                                                <strong>[{ $oContent->oxcontents__oxtitle->value }]</strong>
                                            </h3>
                                             <div class="eb_order_div2" >
                                            <input type="hidden" name="ord_agb" value="0">
                                            <input id="checkAgbBottom" class="checkbox" type="checkbox" name="ord_agb" value="1">
                                         <span class="eb_order_div2_span"> [{ $oContent->oxcontents__oxcontent->value }]</span>
                                             </div>
                                        [{/oxifcontent}]
                                        <p class="errorMsg eb_errorMsg_padding1" name="agbError">[{ oxmultilang ident="READ_AND_CONFIRM_TERMS" }]</p>
                                    [{else}]
                                        [{*oxifcontent ident="oxrighttocancellegend2" object="oContent"}]
                                            <h3 class="section">
                                                <strong>[{ $oContent->oxcontents__oxtitle->value }]</strong>
                                            </h3>
                                           
                                            <input type="hidden" name="ord_agb" value="1">
                                            <input type="checkbox" value="1" name="ord_agb" class="checkbox" id="checkAgbBottom">
                                            [{ $oContent->oxcontents__oxcontent->value }]
                                           
                                        [{/oxifcontent*}]
                                    [{/if}]
                                [{/if}]
                               
                            </div>
                            <div class="lineBox clear">
                                <a href="[{ oxgetseourl ident=$oViewConf->getPaymentLink() }]" class="prevStep submitButton largeButton">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_BACKSTEP" }]</a>
                                <button type="submit" class="submitButton nextStep largeButton">[{ oxmultilang ident="PAGE_CHECKOUT_ORDER_SUBMITORDER" }]</button>
                            </div>
                        </form>
                    [{/block}]
                [{/if}]


                


                 [{/if}]
        [{/block}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{assign var="template_title" value="PAGE_CHECKOUT_ORDER_TITLE"|oxmultilangassign}]
[{include file="layout/page.tpl" title=$template_title location=$template_title}]
