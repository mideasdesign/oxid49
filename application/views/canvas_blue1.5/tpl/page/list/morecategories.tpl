[{oxscript include="js/widgets/oxarticlebox.js" priority=10 }]
[{oxscript add="$( '#content' ).oxArticleBox();"}]
[{capture append="oxidBlock_content"}]
    <h1 class="pageHead">[{ oxmultilang ident="PAGE_PRODUCT_MORECATEGORIES" }]</h1>

    [{assign var="_navcategorytree" value=$oView->getCategoryTree()}]
    [{assign var="iSubCategoriesCount" value=0}]
    [{if $_navcategorytree|count}]
        [{oxscript include="js/widgets/oxequalizer.js" priority=10 }]
        [{oxscript add="$(function(){oxEqualizer.equalHeight($( '.subcatList li .content' ));});"}]
        

    [{/if}]
    [{insert name="oxid_tracker"}]
[{/capture}]


[{include file="layout/page.tpl" sidebar="Left"}]
