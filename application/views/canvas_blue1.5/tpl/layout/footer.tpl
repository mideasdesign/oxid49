[{*block name="footer_main"}]  
  [{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
    [{oxscript add="$(function(){oxEqualizer.equalHeight($( '#panel dl' ));});"}]
<div id="grad_top" class="footer">
    <div id="padding_grad_top">
           <div id="footer1"> 
             <div id="panel" class="corners">
               <div class="left">
                 <ul>
                 <li class="active"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">
                 <span>[{oxmultilang ident="WIDGET_SERVICES_ACCOUNT"}]</span></a></li>
                  [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                  <li><a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
                  [{/oxifcontent}] 
                 <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]">[{ oxmultilang ident="CONTACT" }]</a></li>
                   [{oxifcontent ident="oximpressum" object="_cont"}]

                  <li><a href="[{ $_cont->getLink() }]">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
                  [{/oxifcontent}]
                  [{oxifcontent ident="oxagb" object="_cont"}]
                  <li><a href="[{ $_cont->getLink() }]" rel="nofollow">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
                  [{/oxifcontent}
                 </ul>
                </div>
                     <div align="right" class="right paypal-icon">* All prices incl. VAT <br><br><img alt="paypal" src="images/paypal.jpg"></div>
              </div>
                    <div class="clear">&nbsp;</div>
                    <p>COPYRIGHT 2012 ANGELOUS GMBH. ALLE RECHTE VORBEHALTEN</p>
           </div>

    </div>
</div>
[{/block*}]

[{block name="footer_main"}]

    [{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
    [{oxscript add="$(function(){oxEqualizer.equalHeight($( '#panel dl' ));});"}]

           <div id="footer1"> 
             <div id="panel" class="corners">
               <div class="left">
               [{block name="footer_fblike"}]


               [{/block}]
               [{block name="footer_deliveryinfo"}]
               [{/block}]
                 <ul>
                 <li class="active"><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">
                 <span>[{oxmultilang ident="WIDGET_SERVICES_ACCOUNT"}]</span></a></li>
                  [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                  <li><a href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
                  [{/oxifcontent}] 
                 <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]">[{ oxmultilang ident="CONTACT" }]</a></li>
                   [{oxifcontent ident="oximpressum" object="_cont"}]

                  <li><a href="[{ $_cont->getLink() }]">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
                  [{/oxifcontent}]
                   [{oxifcontent ident="oxagb" object="_cont"}]
                  <li><a href="[{ $_cont->getLink() }]" rel="nofollow">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
                 [{/oxifcontent}]
                  [{oxifcontent ident="oxrightofwithdrawal" object="_cont"}]
                  <li><a href="[{ $_cont->getLink() }]" rel="nofollow">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
                 [{/oxifcontent}]
                 [{oxifcontent ident="oxsecurityinfo" object="_cont"}]
                  <li><a href="[{ $_cont->getLink() }]" rel="nofollow">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
                 [{/oxifcontent}]
                 </ul>
                </div>
       <div align="right" class="right paypal-icon"></div>
              </div>
                    <div class="clear">&nbsp;</div>

      </div>
[{/block}]
[{if $oView->isRootCatChanged()}]
    [{oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
    [{oxscript add="$( '#scRootCatChanged' ).oxModalPopup({ target: '#scRootCatChanged', openDialog: true});"}]
    <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow">
        [{include file="form/privatesales/basketexcl.tpl"}]
    </div>
[{/if}]

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27249238-4']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
