[{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
[{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]
[{block name="user_checkout_change"}]
    <form class="js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
    [{block name="user_checkout_change_form"}]
        [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="cl" value="user">
        <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
        <input type="hidden" name="fnc" value="changeuser">
        <input type="hidden" name="lgn_cook" value="0">
        <input type="hidden" name="blshowshipaddress" value="1">

        [{*<div class="lineBox clear">
            <a href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" class="prevStep submitButton largeButton" id="userBackStepTop">[{ oxmultilang ident="FORM_USER_CHECKOUT_CHANGE_BACKSTEP" }]</a>
            <button id="userNextStepTop" class="submitButton largeButton nextStep" name="userform" type="submit">[{ oxmultilang ident="FORM_USER_CHECKOUT_CHANGE_NEXTSTEP" }]</button>
        </div>*}]

        <div class="checkoutCollumns clear">
            <div class="collumn">
                [{block name="user_checkout_billing"}]
                    [{block name="user_checkout_billing_head"}]
                        <h3 class="blockHead">
                            [{oxmultilang ident="FORM_REGISTER_BILLINGADDRESS" }]
                            <!--<button id="userChangeAddress" class="submitButton largeButton" name="changeBillAddress" type="submit">[{oxmultilang ident="PAGE_CHECKOUT_BASKET_CHANGE" }]</button>-->
							<button id="userChangeAddress" class="eb_changebutton" name="changeBillAddress" type="submit">[{oxmultilang ident="PAGE_CHECKOUT_BASKET_CHANGE" }]</button>
                        </h3>
                        [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm').show();$('#addressText').hide();$('#userChangeAddress').hide();return false;});"}]
                    [{/block}]
                    [{block name="user_checkout_billing_form"}]
                        <ul class="form hide"  id="addressForm">
                            [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                        </ul>
                    [{/block}]
                    [{block name="user_checkout_billing_feedback"}]
                        <ul class="form" id="addressText">
                            <li>
                                [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                            </li>
                        </ul>
                    [{/block}]
                [{/block}]
            </div>
            <div class="collumn">
                [{block name="user_checkout_shipping"}]
                    [{block name="user_checkout_shipping_head"}]
                        <h3 class="blockHead">[{ oxmultilang ident="FORM_REGISTER_SHIPPINGADDRESS" }]
                            [{if $oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}]
								<button id="userChangeShippingAddress"  name="changeShippingAddress" type="submit" class="eb_changebutton [{if !$oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}] hide" [{/if}]>[{ oxmultilang ident="PAGE_CHECKOUT_BASKET_CHANGE" }]</button>
                            [{/if}]
                        </h3>
                        [{oxscript add="$('#userChangeShippingAddress').toggle($(this).is(':not(:checked)'));"}]
                    [{/block}]
                    [{block name="user_checkout_shipping_change"}]
                        <p><input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0"><label for="showShipAddress">[{ oxmultilang ident="FORM_REGISTER_USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS" }]</label></p>
                        [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
                    [{/block}]
                    [{block name="user_checkout_shipping_form"}]
                        <ul id="shippingAddress" class="form [{if !$oView->showShipAddress()}]hide"[{/if}]>
                            [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true onChangeClass='user'}]
                        </ul>
                    [{/block}]
                    [{block name="user_checkout_shipping_feedback"}]
                        <ul class="form">
                            <li>
                                [{include file="form/fieldset/order_newsletter.tpl" blSubscribeNews=true}]
                                [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                            </li>
                        </ul>
                    [{/block}]
                [{/block}]
            </div>
        </div>
  <div>&nbsp;</div>
        <div class="lineBox clear">
            <a href="[{ oxgetseourl ident=$oViewConf->getBasketLink() }]" class="prevStep submitButton largeButton" id="userBackStepBottom">[{ oxmultilang ident="FORM_USER_CHECKOUT_CHANGE_BACKSTEP" }]</a>
            <button id="userNextStepBottom" class="submitButton largeButton nextStep" name="userform" type="submit">[{ oxmultilang ident="FORM_USER_CHECKOUT_CHANGE_NEXTSTEP" }]</button>
        </div>
    [{/block}]
    </form>
[{/block}]
