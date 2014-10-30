[{capture append="oxidBlock_content"}]
    [{if $oView->getContactSendStatus() }]
        [{assign var="_statusMessage" value="PAGE_INFO_CONTACT_THANKYOU1"|oxmultilangassign|cat:" "|cat:$oxcmp_shop->oxshops__oxname->value}]
        [{assign var="_statusMessageSuffix" value="PAGE_INFO_CONTACT_THANKYOU2"|oxmultilangassign}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage|cat:$_statusMessageSuffix}]
    [{/if }]
    <h1 class="pageHead">[{ $oxcmp_shop->oxshops__oxcompany->value }]</h1>
  <div  class="eb_info_contact_width">
    <ul class="eb_info_contact_ul_width">
        <li>[{ $oxcmp_shop->oxshops__oxstreet->value }]</li></br>
        <li>[{ $oxcmp_shop->oxshops__oxzip->value }]&nbsp;[{ $oxcmp_shop->oxshops__oxcity->value }]</li></br>
        <li>[{ $oxcmp_shop->oxshops__oxcountry->value }]</li></br>
        [{ if $oxcmp_shop->oxshops__oxtelefon->value}]
            <li>[{ oxmultilang ident="PHONE" }] [{ $oxcmp_shop->oxshops__oxtelefon->value }]</li></br>
        [{/if}]
        [{ if $oxcmp_shop->oxshops__oxtelefax->value}]
            <li>[{ oxmultilang ident="PAGE_INFO_CONTACT_FAX" }] [{ $oxcmp_shop->oxshops__oxtelefax->value }]</li></br>
        [{/if}]
        [{ if $oxcmp_shop->oxshops__oxinfoemail->value}]
            <li>[{ oxmultilang ident="EMAIL" }] [{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value encode="javascript"}]</li></br>
        [{/if}]
<br></br>
   [{oxifcontent ident="eb_openhours" object="oCont"}]
          <li><h1>[{ $oCont->oxcontents__oxtitle->value }]</h1></li>
      [{/oxifcontent}]<br>
[{oxifcontent ident="eb_openhours" object="oCont"}]
                 [{ $oCont->oxcontents__oxcontent->value }]
            [{/oxifcontent}]
    </ul>
  <div class="eb_contact_div">
    [{include file="form/contact.tpl"}]
   </div>
   </div>
    [{ insert name="oxid_tracker" title=$template_title }]

[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
