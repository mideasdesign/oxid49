[{capture append="oxidBlock_content"}]
  [{assign var="oxid" value=$oView->getactionid()}]
  [{assign var="action_title" value=$oView->getactionname($oxid)}]
  
  <div class="process_borderline">
  <div class="left process_heading eb_action_heading" >[{$action_title}]</div>
	<div class="eb_border_bottom">&nbsp;</div>
  <div class="clear"></div>
  </div> 

  [{if $oxid eq "oxnewarticles"}]
    [{assign var="actionarticles" value=$oView->getSaleArticleList()}]

  [{*	[{elseif $oxid eq "oxaccessories"}]
    [{assign var="actionarticles" value=$oView->getAccessoriesArticleList()}]
  [{elseif $oxid eq "oxhomepromotion1"}]
    [{assign var="actionarticles" value=$oView->getHomePromotion1ArticleList()}]
  [{elseif $oxid eq "oxhomepromotion2"}]
    [{assign var="actionarticles" value=$oView->getHomePromotion2ArticleList()}]
  [{elseif $oxid eq "oxhomepromotion3"}]
    [{assign var="actionarticles" value=$oView->getHomePromotion3ArticleList()}]
  [{elseif $oxid eq "oxshopnow"}]
    [{assign var="actionarticles" value=$oView->getShopNowArticleList()}] 	*}]

  [{/if}] 
  
  [{include file="widget/product/list.tpl" type="infogrid" listId="productList" products=$actionarticles}]


[{/capture}]
[{include file="layout/page.tpl" sidebar="Left" }]
