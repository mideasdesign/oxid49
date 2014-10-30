<div id="header" class="clear">
  [{*include file="widget/header/languages.tpl"*}]
  [{*include file="widget/header/currencies.tpl"*}]
  [{*oxid_include_dynamic file="widget/header/servicebox.tpl"*}]
  <ul id="topMenu">
    <li class="login flyout[{if $oxcmp_user->oxuser__oxpassword->value}] logged[{/if}]">
       [{include file="widget/header/loginbox.tpl"}]
    </li>
    <li><a href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]" rel="nofollow"><span>[{oxmultilang ident="LAYOUT_HEADER_ACCOUNT_LINK"}]</span></a></li>
       [{oxifcontent ident="oximpressum" object="_cont"}]
  <li><a href="[{ $_cont->getLink() }]">[{ $_cont->oxcontents__oxtitle->value }]</a></li>
        [{/oxifcontent}]
  <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]">[{ oxmultilang ident="CONTACT" }]</a></li>
    [{*if !$oxcmp_user}]
        <li><a id="registerLink" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" title="[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_REGISTER"}]">[{oxmultilang ident="PAGE_ACCOUNT_REGISTER_REGISTER"}]</a></li>
    [{/if*}]
   
    [{oxid_include_widget cl="oxwLanguageList" lang=$oViewConf->getActLanguageId() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
    
    [{oxid_include_widget cl="oxwCurrencyList" cur=$oViewConf->getActCurrency() _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() anid=$oViewConf->getActArticleId()}]
  </ul>

<div class="clear">
<div class="left">
  [{assign var="slogoImg" value="logo.png"}]
  <!--<a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>-->
  <a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($slogoImg)}]"></a>
	  <div class="free-ship-info"> [{oxifcontent ident="eb_helplinenum" object="oCont"}]
										[{$oCont->oxcontents__oxcontent->value}]
								   [{/oxifcontent}]
	  </div>
</div>

<div class="cart">
    [{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
    [{oxid_include_dynamic file="widget/minibasket/minibasketmodal.tpl"}]
	[{include file="widget/header/search.tpl"}]
</div>

</div>
</div>

