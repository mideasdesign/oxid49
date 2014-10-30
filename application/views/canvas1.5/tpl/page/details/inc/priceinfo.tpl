[{oxscript add="$( 'a.js-amountPriceSelector' ).oxAmountPriceSelect();"}]
<a class="selector corners FXgradBlueDark js-amountPriceSelector" href="#priceinfo" id="amountPrice" rel="nofollow"><img src="[{$oViewConf->getImageUrl('selectbutton.png')}]" alt="Select"></a>
[{assign var="currency" value=$oView->getActCurrency()}]
<ul class="pricePopup corners shadow" id="priceinfo">
<h4>[{oxmultilang ident="DETAILS_MOREYOUBUYMOREYOUSAVE"}]</h4>
<table width="100%">
    <thead>
        <th align="center"><strong>[{oxmultilang ident="DETAILS_FROM"}]</strong></th>
        <th align="center"><strong>[{oxmultilang ident="DETAILS_PCS"}]</strong></th>
    </thead>
    <tbody>
        [{foreach from=$oDetailsProduct->loadAmountPriceInfo() item=priceItem name=amountPrice}]
            <tr>
            <td><span>[{$priceItem->oxprice2article__oxamount->value}]</span></td>  
            <td><span>
                [{if $priceItem->oxprice2article__oxaddperc->value}]
                    [{$priceItem->oxprice2article__oxaddperc->value}] [{oxmultilang ident="DETAILS_DISCOUNT"}]
                [{else}]
                    [{$priceItem->fbrutprice}] [{$currency->sign}]
                [{/if}]
            </span></td>                  
            </tr>
        [{/foreach}]        
    </tbody>
</table>
</ul>
