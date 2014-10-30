[{oxscript include="js/widgets/oxtopmenu.js" priority=10 }]
[{oxscript add="$('#navigation').oxTopMenu();"}]
[{oxstyle include="css/libs/superfish.css"}]
[{assign var="homeSelected" value="false"}]
[{if $oView->getClassName() == 'start'}]
[{assign var="homeSelected" value="true"}]
[{/if}]

<div id="menu">
 <div id="main_menu">
<ul class="sf-menu">
    <li [{if $homeSelected == 'true' }]class="current"[{/if}]><a [{if $homeSelected == 'true'}]class="current"[{/if}] href="[{$oViewConf->getHomeLink()}]"><img src="[{$oViewConf->getImageUrl('icon_home.png')}]"></a></li>
<!--<li><img src="[{$oViewConf->getImageUrl('menu_splitter.png')}]"></li>-->
[{if  $oView->getClassName() ne "user" && $oView->getClassName() ne "basket" && $oView->getClassName() ne "order" && $oView->getClassName() ne "payment"}]
<!--<li><a href="[{$oViewConf->getSelfLink()|cat:"cl=actionarticles&oxid=oxnewarticles"}]">[{ oxmultilang ident="NEW_CAT_PRODUCTS" }]</a>
 [{*<div class="sale_navigation_link"></div>*}]
</li>-->
[{/if}]

    [{assign var="iAllCatCount" value=$oxcmp_categories|count }]
    [{if $iAllCatCount > $oView->getTopNavigationCatCnt() }]
        [{assign var="bHasMore" value="true"}]
        [{assign var="iCatCnt" value="1"}]
    [{else}]
        [{assign var="bHasMore" value="false"}]
        [{assign var="iCatCnt" value="0"}]
    [{/if}]

    [{foreach from=$oxcmp_categories item=ocat key=catkey name=root}]
      [{if $ocat->getIsVisible() }]
        [{foreach from=$ocat->getContentCats() item=oTopCont name=MoreTopCms}]
            [{assign var="iCatCnt" value=$iCatCnt+1 }]
            [{assign var="iAllCatCount" value=$iAllCatCount+1 }]
            [{if !$bHasMore && ($iCatCnt >= $oView->getTopNavigationCatCnt()) }]
                 [{assign var="bHasMore" value="true"}]
                 [{assign var="iCatCnt" value=$iCatCnt+1}]
            [{/if}]

            [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
                <li><a href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
            [{else}]
                [{capture append="moreLinks"}]
                    <li><a  class="morelinks_a" href="[{$oTopCont->getLink()}]">[{$oTopCont->oxcontents__oxtitle->value}]</a></li>
                [{/capture}]
            [{/if}]
        [{/foreach}]

        [{assign var="iCatCnt" value=$iCatCnt+1 }]
        [{if !$bHasMore && ($iCatCnt >= $oView->getTopNavigationCatCnt()) }]
                 [{assign var="bHasMore" value="true"}]
                 [{assign var="iCatCnt" value=$iCatCnt+1}]
        [{/if}]
        [{if $iCatCnt <= $oView->getTopNavigationCatCnt()}]
        <li><img src="[{$oViewConf->getImageUrl('menu_splitter.png')}]"></li>
            <li [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                <a  [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}] href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0) }] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
                [{if $ocat->getSubCats()}]
                    <ul>
                    [{foreach from=$ocat->getSubCats() item=osubcat key=subcatkey name=SubCat}]
                        [{if $osubcat->getIsVisible() }]
                            [{foreach from=$osubcat->getContentCats() item=ocont name=MoreCms}]
                                <li><a href="[{$ocont->getLink()}]">[{$ocont->oxcontents__oxtitle->value}]</a></li>
                            [{/foreach}]
                            [{if $osubcat->getIsVisible() }]
                                <li [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] ><a [{if $homeSelected == 'false' && $osubcat->expanded}]class="current"[{/if}] href="[{$osubcat->getLink()}]">[{$osubcat->oxcategories__oxtitle->value}] [{ if $oView->showCategoryArticlesCount() && ($osubcat->getNrOfArticles() > 0)}] ([{$osubcat->getNrOfArticles()}])[{/if}]</a></li>
                            [{/if}]
                        [{/if}]
                    [{/foreach}]
                    </ul>
                [{/if}]
            </li>
        [{else}]
            [{capture append="moreLinks"}]
               <li [{if $homeSelected == 'false' && $ocat->expanded}]class="current"[{/if}]>
                    <a href="[{$ocat->getLink()}]">[{$ocat->oxcategories__oxtitle->value}][{ if $oView->showCategoryArticlesCount() && ($ocat->getNrOfArticles() > 0)}] ([{$ocat->getNrOfArticles()}])[{/if}]</a>
               </li>
            [{/capture}]
        [{/if}]
      [{/if}]
    [{/foreach}]
    [{if $iAllCatCount > $oView->getTopNavigationCatCnt()}]
     <li><img src="[{$oViewConf->getImageUrl('menu_splitter.png')}]"></li>
        <li>
            [{assign var="_catMoreUrl" value=$oView->getCatMoreUrl()}]
            <a href="[{ oxgetseourl ident="`$_catMoreUrl`&amp;cl=alist" }]">[{ oxmultilang ident="TOP_CATEGORIES_MORE" }]</a>
            <ul>
                [{foreach from=$moreLinks item=link}]
                   [{$link}]
                [{/foreach}]
            </ul>
        </li>
    [{/if}]
</ul>
</div>
</div>
