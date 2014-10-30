
[{oxscript include="js/tabs.js"}]
[{oxstyle include="css/tabs1.css"}]
      

<div id="container">
  <div id="hometabs">              
        
    <ul>
      [{oxifcontent ident="oxwelcomstore" object="oCont"}]
          <li><a href="#tab-1" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
      [{/oxifcontent}]

      [{oxifcontent ident="oxwhatwe" object="oCont"}]
          <li><a href="#tab-2" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
      [{/oxifcontent}]
                     
      [{oxifcontent ident="oxwhatwedo" object="oCont"}]
          <li><a href="#tab-3" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
      [{/oxifcontent}]    
                                            
     </ul>

     
                   
<!-- tab "panes" -->
     <div id="tab-1">
   
            [{oxifcontent ident="oxwelcomstore" object="oCont"}]
                 [{ $oCont->oxcontents__oxcontent->value }]
            [{/oxifcontent}]    
                        
          </div>
          <div id="tab-2">
            [{oxifcontent ident="oxwhatwe" object="oCont"}]
                 [{ $oCont->oxcontents__oxcontent->value }]
            [{/oxifcontent}]    	
          </div>
          <div id="tab-3">
            [{oxifcontent ident="oxwhatwedo" object="oCont"}]
                 [{ $oCont->oxcontents__oxcontent->value }]
            [{/oxifcontent}]
                     
                        
          </div>
      </div>
</div>
         
    
                


