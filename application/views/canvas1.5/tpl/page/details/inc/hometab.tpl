
<link href="tabs.css" rel="stylesheet" type="text/css" /><!-- Stylesheet for Tabs -->
<script src="js/jquery.js"></script>

  
                       
                <div>
                	<!--<img src="images/tab.jpg" />-->
                   
                    <ul class="tabs">
                        <li><a class="" href="#">Welcome to Our Store</a></li>
                        <li><a class="" href="#">What We Are ?</a></li>
                        <li><a class="current" href="#">What We Do ?</a></li>
                    </ul>
                    <!-- tab "panes" -->
                    <div class="panes">
                        <div class="hide">
                        	<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
                               .</p>
                        
                        </div>
                        <div class="hide">
                        	<p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
                               .</p>
                        	
                        </div>
                        <div class="hide">
                       		 <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
                               </p>
                        
                        
                        </div>
                    </div>
                    <script>
                    // perform JavaScript after the document is scriptable.
                    $(function() {
                        // setup ul.tabs to work as tabs for each div directly under div.panes
                        $("ul.tabs").tabs("div.panes > div");
                    });
                    </script>
                    
                </div>
                


