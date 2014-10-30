[{capture append="oxidBlock_pageBody"}]
    [{if $oView->showRDFa()}]
        [{ include file="rdfa/rdfa.tpl" }]
    [{/if}]


    <div id="page" class="[{if $sidebar}] sidebar[{$sidebar}][{/if}]">
          [{include file="layout/header.tpl"}]

    <div id="grad_top">
    <div id="padding_grad_top">

    [{include file="widget/header/topcategories.tpl"}]
	
	
    [{if $oView->getClassName()=='start' && $oView->getBanners()|@count > 0 }]
	<div class="eb_slider">
		[{include file="widget/promoslider.tpl" }]
	</div>
	[{/if }]

 
         [{if $oView->getClassName() ne "start" && !$blHideBreadcrumb}]
           [{ include file="widget/breadcrumb.tpl"}]
          [{/if}]

          [{if $sidebar && $oView->getClassName() ne "start" && $oView->getClassName() ne "details"}]
            <div id="sidebar">
                [{include file="layout/sidebar.tpl"}]
            </div>
        [{/if}]
       
     
        
        <div id="content">
            [{include file="message/errors.tpl"}]
            [{foreach from=$oxidBlock_content item="_block"}]
                [{$_block}]
            [{/foreach}]
        </div>
         <div class="clear"><br></div>
    

       [{if $oView->getClassName() eq "start"}]
        [{include file="layout/hometab.tpl"}]  
        [{/if}]                

         <div class="clear"><br></div> 
    
    </div>
</div>     
              
    <div class="clear"><br></div>
   <div id="grad_top" class="footer">
   <div id="padding_grad_top">
        [{include file="layout/footer.tpl"}]
   </div>
   </div>
              
</div>
    [{include file="widget/facebook/init.tpl"}]
    [{if $oView->isPriceCalculated() }]
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            <div id="incVatMessage">
                [{if $oView->isVatIncluded()}]
                    * <span class="deliveryInfo">[{ oxmultilang ident="PLUS_SHIPPING" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="PLUS_SHIPPING2" }]</a></span>
                [{else}]
                    * <span class="deliveryInfo">[{ oxmultilang ident="PLUS" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="PLUS_SHIPPING2" }]</a></span>
                [{/if}]
            </div>
        [{/oxifcontent }]
    [{/if}]
[{/capture}]
[{include file="layout/base.tpl"}]
