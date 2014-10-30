[{assign var=oBanners value=$oView->getBanners() }]
[{assign var="currency" value=$oView->getActCurrency()}]


          
[{if $oBanners|@count}]
[{oxstyle include="css/libs/style.css"}]
[{oxscript include="js/banner/scripts.js"}]
[{oxscript include="js/banner/banner.js"}]

   
    [{*<img src="[{$oViewConf->getImageUrl('promo-shadowleft.png')}]" height="220" width="7" class="promoShadow" alt="">
    <img src="[{$oViewConf->getImageUrl('promo-shadowright.png')}]" height="220" width="7" class="promoShadow shadowRight" alt="">*}]
 
   <div>
     <div class="left">
                    	                       
                         <div id="header1">
                           <div class="wrap">
                           <div id="slide-holder">
                            <div id="slide-runner">

        [{assign var=count1 value=0}]
        <ul id="promotionSlider">
        [{foreach from=$oBanners item=oBanner }]
		[{assign var=count1 value=$count1+1}]
        [{assign var=oArticle value=$oBanner->getBannerArticle() }]
        <li>        
           [{assign var=sBannerLink value=$oBanner->getBannerLink() }]
            [{if $sBannerLink }]
            <a href="[{ $sBannerLink }]">
            [{/if}]
            [{if $oArticle }]
            <span id="slide-img-[{$count1}]" class="promoBox eb_visible">
            
            [{/if }]          
            [{assign var=sBannerPictureUrl value=$oBanner->getBannerPictureUrl() }]
            [{if $sBannerPictureUrl }]
            <img id="slide-img-[{$count1}]" class="slide" src="[{ $sBannerPictureUrl }]" alt="[{$oBanner->oxactions__oxtitle->value}]">
          
            [{/if }]
           </span>
            [{if $sBannerLink }]
            </a>

            [{/if}]
          </li>
        [{/foreach }]
</ul>

<script>
var promocount = [{$count1}];
</script>
[{/if }]
       <div id="slide-controls">
         <!--  <p id="slide-client" class="text"><strong>post: </strong><span></span></p>
           <p id="slide-desc" class="text"></p>-->
           <p id="slide-nav"></p>
           </div>  

                        
          </div>

        </div>                    
       </div>
     </div> 
  </div>

     <div id="special_products">
            <h1>[{ oxmultilang ident="PAGE_SHOP_START_SPECIL_PRODUCT" }]</h1>
             [{if $sidebar}]
      
               [{if $oView->getClassName() eq "start"}]
                [{include file="layout/sidebar.tpl"}]
              [{/if}]
           
        [{/if}]
</div>
</div> 
                 

             
                           
                          

