var tp = []; 
var tpl = []; 

function tpSet(i, c) { 
if (document.createElement) { 
var e = document.getElementById(i); 
var l = document.createElement('ul'); 
var p = document.createElement('div'); 
e.className = l.className = p.className = c; 

var a, j; 
for (j = 2; j < arguments.length; j++) { 
c = document.getElementById(arguments[j]); 
tp[arguments[j]] = c.parentNode.removeChild(c); 

a = l.appendChild(document.createElement('li')); 
a.className = c.className; 
tpl[arguments[j]] = a = a.appendChild(document.createElement('a')); 
a.setAttribute('href', 'javascript:tpShow(\''+i+'\', \''+arguments[j]+'\');'); 
a.appendChild(document.createTextNode(c.getAttribute('title'))); 
} 

p.appendChild(tp[arguments[2]]); 
tpl[arguments[2]].className = 'active'; 

while (e.firstChild) e.removeChild(e.firstChild); 
e.appendChild(l); 
e.appendChild(p); 
}} 


function tpShow(e, p) { 
e = document.getElementById(e).lastChild; 
tpl[e.replaceChild(tp[p], e.firstChild).getAttribute('id')].className = null; 
tpl[p].className = 'active'; 
} 
