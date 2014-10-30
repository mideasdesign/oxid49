

    [{*if $_sHeaderIdent}]
        <h3 class="clear [{if $_sHeaderCssClass}] [{$_sHeaderCssClass}][{/if}]">
            [{ oxmultilang ident=$_sHeaderIdent }]
            [{assign var='rsslinks' value=$oView->getRssLinks() }]
            [{if $rsslinks.topArticles}]
                <a class="rss js-external" id="rssTopProducts" href="[{$rsslinks.topArticles.link}]" title="[{$rsslinks.topArticles.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.topArticles.title}]"><span class="FXgradOrange corners glowShadow">[{$rsslinks.topArticles.title}]</span></a>
            [{/if }]
        </h3>
    [{/if*}]
 <div class="clear"><br></div>
  <div class="products">

   [{assign var=count value=1}]
    [{foreach from=$_oBoxProducts item=_oBoxProduct name=_sProdList}]
         [{if $count lte 4}]

            [{ assign var="_sTitle" value="`$_oBoxProduct->oxarticles__oxtitle->value` `$_oBoxProduct->oxarticles__oxvarselect->value`"|strip_tags}]
           
              <div class="left img-block[{if !$smarty.foreach._sProdList.first}] block" [{/if}]>
              
                    <a href="[{ $_oBoxProduct->getMainLink() }]">
        
                        <img src="[{$_oBoxProduct->getIconUrl()}]" alt="[{$_sTitle}]" width="97" height="91">
      
                    </a>
               
              </div>
           
             
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                [{ assign var="currency" value=$oView->getActCurrency()}]
                <div class="details">
                    <a href="[{ $_oBoxProduct->getMainLink() }]">
                        [{ $_sTitle }]<br></a>
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{if $_oBoxProduct->getFPrice()}]
                              <strong><span class="eb_margin_10">[{ $_oBoxProduct->getFPrice() }] [{ $currency->sign}]</span></strong>
                            [{/if}]
                        [{/oxhasrights}]
         
                    
                </div>
      
    [{/if}]
             
    
[{assign var=count value=$count+1}]
 <div class="clear"><br></div>
   
    [{/foreach}]
   
</div>


