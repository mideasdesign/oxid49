[{capture append="oxidBlock_content"}]
[{assign var="template_title" value="PRODUCT_COMPARISON"|oxmultilangassign}]
<div class="category-right-content">
[{ $oView->setNoPaging() }]

[{assign var="articleList" value=$oView->getCompArtList() }]
[{assign var="atributeList" value=$oView->getAttributeList() }]

<h1 id="productComparisonHeader" class="pageHead">[{$template_title}]</h1>
<div>
[{if $oView->getCompareItemsCnt() > 1 }]
    [{oxscript include="js/libs/scrollpane/jscrollpane.min.js"}]
    [{oxscript include="js/libs/scrollpane/mousewheel.js"}]
    [{oxscript include="js/libs/scrollpane/mwheelIntent.js"}]
    [{oxstyle include="css/libs/jscrollpane.css"}]
    [{oxscript include="js/widgets/oxcompare.js" priority=10 }]
    [{oxscript add="$( '#compareList' ).oxCompare();"}]
    <table id="compareList">
        <tr>
            <td>
                <div id="compareFirstCol">
                    <table>
                        <tr id="firstDataTr">
                            <td class="js-firstCol">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="js-firstCol">[{ oxmultilang ident="PAGE_PRODUCT_COMPARE_PRODUCTATTRIBUTES" }]</td>
                        </tr>
                        [{foreach key=sAttrID from=$atributeList item=oAttrib name=CmpAttr}]
                        <tr>
                            <td class="js-firstCol" id="cmpAttrTitle_[{$smarty.foreach.CmpAttr.iteration}]">[{ $oAttrib->title }]:</td>
                        </tr>
                        [{/foreach}]
                    </table>
                </div>
            </td>
            <td>
                <div id="compareDataDiv" [{if !$oxcmp_user}]class="compareWide"[{/if}]>
                    <table>
                        <tr id="firstTr">
                            [{foreach key=iProdNr from=$articleList item=product name=comparelist}]
                            <td class="alignTop">
                                <div class="lineBox clear">
                                [{if !$product->hidePrev}]
                                    <a id="compareLeft_[{ $product->oxarticles__oxid->value }]" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveleft&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage() }]" class="navigation movePrev">&laquo;</a>
                                [{/if}]
                                [{ oxmultilang ident="PAGE_PRODUCT_COMPARE_MOVE" }]
                                [{if !$product->hideNext}]
                                    <a id="compareRight_[{ $product->oxarticles__oxid->value }]" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveright&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage() }]" class="navigation moveNext">&raquo;</a>
                                [{/if}]
                                </div>
                                  [{include file="page/compare/inc/compareitem.tpl" product=$product testid=$smarty.foreach.comparelist.iteration}]
                            </td>
                            [{/foreach}]
                        </tr>
                        <tr>
                            [{foreach key=iProdNr from=$articleList item=product name=testArt}]
                            <td class="centered">
                            [{*  if $oxcmp_user }]
                                  <a id="tonotice_cmp_[{ $product->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$product->oxarticles__oxnid->value`&amp;anid=`$product->oxarticles__oxnid->value`&amp;fnc=tonoticelist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="PAGE_PRODUCT_COMPARE_NOTICELIST" }]</a>
                                  [{if $oViewConf->getShowWishlist()}]
                                  <a id="towish_cmp_[{ $product->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="aid=`$product->oxarticles__oxnid->value`&anid=`$product->oxarticles__oxnid->value`&amp;fnc=towishlist&amp;am=1"|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow">[{ oxmultilang ident="PAGE_PRODUCT_COMPARE_WISHLIST" }]</a>
                                  [{/if}]
                            [{/if *}]
                                <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
                                  <div>
                                      [{ $oViewConf->getHiddenSid() }]
                                      [{ $oViewConf->getNavFormParams() }]
                                      <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                                      <input type="hidden" name="fnc" value="tocomparelist">
                                      <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
                                      <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
                                      <input type="hidden" name="pgNr" value="0">
                                      <input type="hidden" name="am" value="1">
                                      <input type="hidden" name="removecompare" value="1">
                                      [{oxhasrights ident="TOBASKET"}]
                                         <button class="submitButton" id="remove_cmp_[{ $product->oxarticles__oxid->value }]" type="submit" title="[{ oxmultilang ident="PAGE_PRODUCT_COMPARE_REMOVE" }]" name="send">[{ oxmultilang ident="PAGE_PRODUCT_COMPARE_REMOVE" }]</button>
                                      [{/oxhasrights}]
                                  </div>
                                </form>
                            </td>
                            [{/foreach}]
                        </tr>
                        [{foreach key=sAttrID from=$atributeList item=oAttrib name=CmpAttr}]
                        <tr>
                              [{foreach key=iProdNr from=$articleList item=product}]
                            <td class="alignTop">
                              <div id="cmpAttr_[{$smarty.foreach.CmpAttr.iteration}]_[{ $product->oxarticles__oxid->value }]">
                                [{ if $oAttrib->aProd.$iProdNr && $oAttrib->aProd.$iProdNr->value}]
                                  [{ $oAttrib->aProd.$iProdNr->value }]
                                [{else}]
                                  -
                                [{/if}]
                              </div>
                            </td>
                              [{/foreach}]
                        </tr>
                          [{/foreach}]
                    </table>
                </div>
            </td>
        </tr>
    </table>

[{else}]
  [{ oxmultilang ident="MESSAGE_SELECT_AT_LEAST_ONE_PRODUCT" }]
[{/if}]
</div>
[{ insert name="oxid_tracker" title=$template_title }]
</div>
[{/capture}]

[{if !$oxcmp_user->oxuser__oxpassword->value}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{capture append="oxidBlock_sidebar"}]
        [{include file="page/account/inc/account_menu.tpl" active_link="compare"}]
    [{/capture}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]
