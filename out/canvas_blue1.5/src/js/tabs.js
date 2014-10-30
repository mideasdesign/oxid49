$(document).ready(function(){
$('#hometabs div').hide();
$('#hometabs div:first').show();
$('#hometabs ul li:first').addClass('active');
$('#hometabs ul li a').click(function(){ 
$('#hometabs ul li').removeClass('active');
$(this).parent().addClass('active'); 
var currentTab = $(this).attr('href'); 
$('#hometabs div').hide();
$(currentTab).show();
return false;
});
});
