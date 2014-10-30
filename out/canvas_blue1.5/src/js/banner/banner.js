
//if(!window.slider) var slider={};slider.data=[{"id":"slide-img-1"},{"id":"slide-img-2"},{"id":"slide-img-3"},{"id":"slide-img-4"}];
if(!window.slider) var slider={};
var data = [];
for (var j=1;j<=promocount;j++){
var tmp = {};
tmp['id'] = "slide-img-"+j ;
data.push(tmp);
}
slider.data = data;



